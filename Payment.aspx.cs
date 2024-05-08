using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SianemaCinemaTicketingSystem
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // display header information
                if (Request.QueryString["hallTimeSlotID"] != null)
                {
                    string hallTimeSlotID = Request.QueryString["hallTimeSlotID"];

                    SqlConnection conn;
                    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    conn = new SqlConnection(strCon);
                    conn.Open();

                    string strToRetrieve = "SELECT Movie.movieName, " +
                            "Hall.hallName, " +
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

                    }

                    hallTimeSlotDetailsReader.Close();
                    conn.Close();

                    if (Request.QueryString["transactionID"] != null)
                    {
                        string transactionID = Request.QueryString["transactionID"];

                        // get the selected seat details
                        if (Request.QueryString["selectedSeats"] != null)
                        {
                            // Get the value of the selectedSeats query parameter
                            string selectedSeatsParam = Request.QueryString["selectedSeats"];

                            // Split the string into an array of selected seat IDs
                            string[] selectedSeatIDs = selectedSeatsParam.Split(',');

                            int numOfSelectedSeats = selectedSeatIDs.Length;
                            int totalAmountOfTicket = numOfSelectedSeats * 15;
                            SingleSeatNumber.InnerText = numOfSelectedSeats.ToString();
                            SingleSeatAmount.InnerText = totalAmountOfTicket.ToString();
                            Total.InnerText = totalAmountOfTicket + 1.ToString();

                            // Loop through each query
                            for (int i = 0; i < selectedSeatIDs.Length; i++)
                            {
                                string ticketID = $"TST-{selectedSeatIDs[i]}";

                                SqlConnection conn2;
                                string strCon2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                                conn2 = new SqlConnection(strCon2);
                                conn2.Open();

                                string strToInsert = "INSERT INTO [Ticket] (ticketID, movieSeatID, transactionID, ticketPrice) VALUES (@ticketID, @movieSeatID, @transactionID, @ticketPrice)";

                                SqlCommand cmdToInsert;
                                cmdToInsert = new SqlCommand(strToInsert, conn2);
                                cmdToInsert.Parameters.AddWithValue("@ticketID", ticketID);
                                cmdToInsert.Parameters.AddWithValue("@movieSeatID", selectedSeatIDs[i]);
                                cmdToInsert.Parameters.AddWithValue("@transactionID", transactionID);
                                cmdToInsert.Parameters.AddWithValue("@ticketPrice", 15.00);

                                // Execute the command to insert the new transaction
                                cmdToInsert.ExecuteNonQuery();

                            }
                        }
                    }
                }
            }
        }
        protected void PayButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentSuccess.aspx");
        }


        protected void Timer1_Tick(object sender, EventArgs e)
        {
            if (Request.QueryString["transactionID"] != null)
            {
                string transactionID = Request.QueryString["transactionID"];
                DateTime transactionExpirationTime;

                SqlConnection conn3;
                string strCon3 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                conn3 = new SqlConnection(strCon3);
                conn3.Open();

                string strToRetrieve3 = "SELECT transactionExpirationTime FROM Transaction WHERE transactionID = @transactionID";

                SqlCommand cmdToRetrieve3 = new SqlCommand(strToRetrieve3, conn3);

                cmdToRetrieve3.Parameters.AddWithValue("@transactionID", transactionID);

                SqlDataReader transactionDetailsReader = cmdToRetrieve3.ExecuteReader();

                if (transactionDetailsReader.Read())
                {
                    transactionExpirationTime = Convert.ToDateTime(transactionDetailsReader["transactionExpirationTime"]);

                    // Calculate the elapsed time in milliseconds
                    DateTime now = DateTime.Now;
                    TimeSpan elapsedTime = now - transactionExpirationTime;
                    long elapsedTimeInMilliseconds = (long)elapsedTime.TotalMilliseconds;

                    // If the elapsed time exceeds 5 minutes, cancel the reservation in the database
                    if (elapsedTimeInMilliseconds > 5 * 60 * 1000)
                    {
                        string strToCancel = "UPDATE [Transaction] SET transactionStatus = 'Cancelled' WHERE transactionID = @transactionID";
                        SqlCommand cmdToCancel = new SqlCommand(strToCancel, conn3);
                        cmdToCancel.Parameters.AddWithValue("@transactionID", transactionID);
                        cmdToCancel.ExecuteNonQuery();
                    }
                }

                transactionDetailsReader.Close();
                conn3.Close();
            }
        }
    }
}