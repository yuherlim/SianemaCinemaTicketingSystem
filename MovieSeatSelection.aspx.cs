using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace SianemaCinemaTicketingSystem
{
    public partial class MovieSeatSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["hallTimeSlotID"] != null)
                {
                    string hallTimeSlotID = Request.QueryString["hallTimeSlotID"];

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
                        string hallType = hallTimeSlotDetailsReader["hallType"].ToString();

                        if(hallType == "Large")
                        {
                            //seatWrapper.Attributes.Add("width", "calc((100% - 13 * 10px) / 14)");

                        }

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

                    // Inside the while loop where you're reading data from the SqlDataReader
                    while (seatsReader.Read())
                    {
                        // Create an anonymous object with properties for movieSeatID and movieSeatStatus
                        var movieSeat = new
                        {
                            movieSeatID = seatsReader["movieSeatID"], // Assuming movieSeatID is the first column
                            movieSeatStatus = seatsReader["movieSeatStatus"], // Assuming movieSeatStatus is the second column
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
            Response.Redirect("Payment.aspx");
        }
    }
}