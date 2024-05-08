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
                }

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
                    Total.InnerText = totalAmountOfTicket+1.ToString();

                    SqlConnection conn2;
                    string strCon2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    conn2 = new SqlConnection(strCon2);
                    conn2.Open();

                    string strToRetrieve2 = "SELECT * FROM HallTimeSlot WHERE movieID = @MovieID AND hallTimeSlotDate = @MovieDate AND hallTimeSlotPurpose = @hallPurpose";

                    SqlCommand cmdToRetrieve2;
                    cmdToRetrieve2 = new SqlCommand(strToRetrieve2, conn2);
                    cmdToRetrieve2.Parameters.AddWithValue("@hallPurpose", "Movie");

                    SqlDataReader movieTimeReader = cmdToRetrieve2.ExecuteReader();


                }

            }

        }

        protected void PayButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentSuccess.aspx");
        }
    }
}