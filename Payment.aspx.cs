using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Util;

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

                    // get the selected seat details
                    if (Request.QueryString["selectedSeats"] != null)
                    {
                        // Get the value of the selectedSeats query parameter
                        string selectedSeatsParam = Request.QueryString["selectedSeats"];

                        // Split the string into an array of selected seat IDs
                        string[] selectedSeatIDs = selectedSeatsParam.Split(',');

                        int numberOfTicket = selectedSeatIDs.Length;
                        SingleSeatNumber.InnerText = numberOfTicket.ToString();
                        double totalAmount = numberOfTicket * 15.00;
                        SingleSeatAmount.InnerText = "RM" + totalAmount.ToString();
                        double total = totalAmount + 1;
                        Total.InnerText = "RM" + total.ToString();

                        TotalAmountHiddenField.Value = total.ToString();

                        List<string> seatRows = new List<string>();
                        // Loop through each seatsID
                        for (int i = 0; i < selectedSeatIDs.Length; i++)
                        {
                            string strToRetrieve2 = "SELECT Seat.row, Seat.seatNo FROM MovieSeat " +
                                "INNER JOIN Seat ON MovieSeat.seatID = Seat.seatID " +
                                "WHERE movieSeatID = @movieSeatID";
                            SqlCommand cmdToRetrieve2 = new SqlCommand(strToRetrieve2, conn);
                            cmdToRetrieve2.Parameters.AddWithValue("@movieSeatID", selectedSeatIDs[i]);
                            SqlDataReader seatsReader = cmdToRetrieve2.ExecuteReader();
                            while (seatsReader.Read())
                            {
                                seatRows.Add(string.Format("{0}{1}", seatsReader["row"], seatsReader["seatNo"]));
                            }
                            seatsReader.Close();
                        }
                        seatsId.InnerText = String.Join(", ", seatRows);
                        conn.Close();
                    }
                }
            }
        }


        protected void PayButton_Click(object sender, EventArgs e)
        {
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

                    // Loop through each query
                    for (int i = 0; i < selectedSeatIDs.Length; i++)
                    {
                        string ticketID = $"TIC-{selectedSeatIDs[i]}";

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
                        cmdToInsert.ExecuteNonQuery();

                        string strToUpdate = "UPDATE [MovieSeat] SET movieSeatStatus = 'Sold' WHERE movieSeatID = @movieSeatID";
                        SqlCommand cmdToUpdate = new SqlCommand(strToUpdate, conn2);
                        cmdToUpdate.Parameters.AddWithValue("@movieSeatID", selectedSeatIDs[i]);
                        cmdToUpdate.ExecuteNonQuery();

                        conn2.Close();
                    }

                    SqlConnection conn3;
                    string strCon3 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    // Retrieve the total amount from the hidden field
                    decimal total = Convert.ToDecimal(TotalAmountHiddenField.Value);

                    conn3 = new SqlConnection(strCon3);
                    conn3.Open();
                    string strToUpdate2 = "UPDATE [TicketTransaction] SET transactionStatus = 'Completed', transactionAmount = @total WHERE transactionID = @transactionID";
                    SqlCommand cmdToUpdate2 = new SqlCommand(strToUpdate2, conn3);
                    cmdToUpdate2.Parameters.AddWithValue("@transactionID", transactionID);
                    cmdToUpdate2.Parameters.AddWithValue("@total", total);
                    cmdToUpdate2.ExecuteNonQuery();

                    string paymentID = $"PYM-{transactionID}";
                    DateTime now = DateTime.Now;
                    string paymentMethod = "Card";
                    string strToInsert2 = "INSERT INTO [Payment] (paymentID , transactionID, paymentDateTime, paymentMethod) VALUES (@paymentID, @transactionID, @paymentDateTime, @paymentMethod)";
                    SqlCommand cmdToInsert2;
                    cmdToInsert2 = new SqlCommand(strToInsert2, conn3);
                    cmdToInsert2.Parameters.AddWithValue("@paymentID", paymentID);
                    cmdToInsert2.Parameters.AddWithValue("@transactionID", transactionID);
                    cmdToInsert2.Parameters.AddWithValue("@paymentDateTime", now);
                    cmdToInsert2.Parameters.AddWithValue("@paymentMethod", paymentMethod);
                    cmdToInsert2.ExecuteNonQuery();

                    conn3.Close();
                }
            }
            Response.Redirect("PaymentSuccess.aspx");
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["transactionID"] != null)
            {
                string transactionID = Request.QueryString["transactionID"];
                SqlConnection conn;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                conn = new SqlConnection(strCon);
                conn.Open();

                string strToUpdate = "UPDATE [TicketTransaction] SET transactionStatus = 'Cancelled' WHERE transactionID = @transactionID";
                SqlCommand cmdToUpdate = new SqlCommand(strToUpdate, conn);
                cmdToUpdate.Parameters.AddWithValue("@transactionID", transactionID);
                cmdToUpdate.ExecuteNonQuery();

                Response.Redirect("Movies.aspx");
            }
        }
    }
}