using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SianemaCinemaTicketingSystem
{
    public partial class MovieSeatSelection : System.Web.UI.Page
    {
        string hallType = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["hallTimeSlotID"] != null)
                {
                    string hallTimeSlotID = Request.QueryString["hallTimeSlotID"];
                    continueButton.CommandArgument = hallTimeSlotID;

                    SqlConnection conn;
                    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    conn = new SqlConnection(strCon);
                    conn.Open();

                    string strToRetrieve = "SELECT Movie.movieName, " +
                            "Hall.hallName, Hall.hallType, " +
                            "HallTimeSlot.hallTimeSlotDate, HallTimeSlot.hallTimeSlotTime FROM HallTimeSlot " +
                            "INNER JOIN Movie ON HallTimeSlot.movieID = Movie.movieID " +
                            "INNER JOIN Hall ON HallTimeSlot.hallID = Hall.hallID " +
                            "WHERE hallTimeSlotID = @hallTimeSlotID";


                    SqlCommand cmdToRetrieve = new SqlCommand(strToRetrieve, conn);

                    cmdToRetrieve.Parameters.AddWithValue("@hallTimeSlotID", hallTimeSlotID);

                    SqlDataReader hallTimeSlotDetailsReader = cmdToRetrieve.ExecuteReader();

                    if (hallTimeSlotDetailsReader.Read())
                    {
                        movieName.InnerText = hallTimeSlotDetailsReader["movieName"].ToString();
                        hallNum.InnerText = hallTimeSlotDetailsReader["hallName"].ToString();
                        DateTime hallTimeSlotDate = (DateTime)hallTimeSlotDetailsReader["hallTimeSlotDate"];
                        movieDate.InnerText = hallTimeSlotDate.ToString("yyyy/MM/dd");
                        movieTime.InnerText = hallTimeSlotDetailsReader["hallTimeSlotTime"].ToString();
                        hallType = hallTimeSlotDetailsReader["hallType"].ToString();

                    }

                    hallTimeSlotDetailsReader.Close();
                    conn.Close();

                    SqlConnection conn2;
                    string strCon2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    conn2 = new SqlConnection(strCon2);
                    conn2.Open();

                    string strToRetrieve2 = "SELECT MovieSeat.movieSeatID, MovieSeat.movieSeatStatus, " +
                        "Seat.row, Seat.seatNo FROM MovieSeat " +
                        "INNER JOIN Seat ON MovieSeat.seatID = Seat.seatID " +
                        "WHERE hallTimeSlotID = @hallTimeSlotID";

                    SqlCommand cmdToRetrieve2 = new SqlCommand(strToRetrieve2, conn2);
                    cmdToRetrieve2.Parameters.AddWithValue("@hallTimeSlotID", hallTimeSlotID);
                    SqlDataReader seatsReader = cmdToRetrieve2.ExecuteReader();

                    // Create a list to store objects
                    List<object> movieSeatsList = new List<object>();

                    while (seatsReader.Read())
                    {
                        // Create an anonymous object
                        var movieSeat = new
                        {
                            movieSeatID = seatsReader["movieSeatID"],
                            movieSeatStatus = seatsReader["movieSeatStatus"],
                            movieSeatRow = seatsReader["row"],
                            movieSeatNo = seatsReader["seatNo"]
                        };

                        // Add the anonymous object to the list
                        movieSeatsList.Add(movieSeat);
                    }

                    // Bind the list to the repeater
                    SeatRepeater.DataSource = movieSeatsList;
                    SeatRepeater.DataBind();

                    seatsReader.Close();
                    conn2.Close();
                }
            }
        }

        protected void continueButton_Click(object sender, EventArgs e)
        {
            //string userID = Session["UserId"].ToString();

            string hallTimeSlotID = (string)((Button)sender).CommandArgument;
            string transactionID = GenerateTransactionID();
            string custID = (string)Session["custId"];
            DateTime transactionDateTime = DateTime.Now;
            decimal transactionAmount = 0;
            String transactionStatus = "Pending";
            DateTime transactionExpirationTime = transactionDateTime.AddMinutes(5);

            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            conn = new SqlConnection(strCon);
            conn.Open();

            string strToCreate = "INSERT INTO [TicketTransaction] (transactionID, custID, transactionDateTime, transactionAmount, transactionStatus, transactionExpirationTime) " +
                "VALUES (@transactionID, @custID, @transactionDateTime, @transactionAmount, @transactionStatus, @transactionExpirationTime)";

            SqlCommand cmdToInsert = new SqlCommand(strToCreate, conn);
            cmdToInsert.Parameters.AddWithValue("@transactionID", transactionID);
            cmdToInsert.Parameters.AddWithValue("@custID", "CUST-240508-00001");
            cmdToInsert.Parameters.AddWithValue("@transactionDateTime", transactionDateTime);
            cmdToInsert.Parameters.AddWithValue("@transactionAmount", transactionAmount);
            cmdToInsert.Parameters.AddWithValue("@transactionStatus", transactionStatus);
            cmdToInsert.Parameters.AddWithValue("@transactionExpirationTime", transactionExpirationTime);

            // Execute the command to insert the new transaction
            cmdToInsert.ExecuteNonQuery();


            // Redirect to the payment page with the necessary parameters
            string selectedSeatIDList = selectedSeatIDs.Value;
            selectedSeatIDList = selectedSeatIDList.Replace("\r\n", "");
            Response.Redirect("Payment.aspx?selectedSeats=" + selectedSeatIDList + "&hallTimeSlotID=" + hallTimeSlotID + "&transactionID=" + transactionID);
        }



        public static string GenerateTransactionID()
        {
            DateTime currentDate = DateTime.Now.Date;
            string latestTransactionID = GetLatestTransactionIDFromDatabase();
            string transactionID = "";

            if (latestTransactionID == null)
            {
                transactionID = $"TST-{currentDate.ToString("yyMMdd")}-00001";
            }
            else
            {
                // Extract the date part from the latest transaction ID
                string datePart = latestTransactionID.Substring(4, 6);
                DateTime latestTransactionDate = DateTime.ParseExact(datePart, "yyMMdd", null);

                int sequenceNumber;

                if (currentDate == latestTransactionDate)
                {
                    sequenceNumber = GetNextSequenceNumber(latestTransactionID);
                }
                else
                {
                    sequenceNumber = 1;
                }
                // format
                string formattedSequenceNumber = sequenceNumber.ToString("D5");
                transactionID = $"TST-{currentDate.ToString("yyMMdd")}-{formattedSequenceNumber}";
            }

            return transactionID;
        }

        private static string GetLatestTransactionIDFromDatabase()
        {
            string latestTransactionID = null;

            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            conn = new SqlConnection(strCon);
            conn.Open();

            string strToRetrieve = "SELECT TOP 1 transactionID FROM [TicketTransaction] ORDER BY transactionID DESC";

            SqlCommand cmdToRetrieve = new SqlCommand(strToRetrieve, conn);
            latestTransactionID = (string)cmdToRetrieve.ExecuteScalar();

            return latestTransactionID;
        }

        private static int GetNextSequenceNumber(string transactionID)
        {
            // Extract the sequence number from the transaction ID
            string sequencePart = transactionID.Substring(11); // Assuming the sequence part starts at index 11
            int currentSequenceNumber = int.Parse(sequencePart);

            // Increment the sequence number
            return currentSequenceNumber + 1;
        }

        protected void SeatRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the seatWrapper control
                var seatWrapper = e.Item.FindControl("seatWrapper") as HtmlGenericControl;

                if (hallType == "Large")
                {
                    seatWrapper.Attributes["class"] = "seat-wrapper-large";
                }
                else if (hallType == "Small")
                {
                    seatWrapper.Attributes["class"] = "seat-wrapper-small";
                }



            }
        }
    }
}