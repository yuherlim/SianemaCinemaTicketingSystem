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
    public partial class MovieDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // Find the movieCoverPhoto control
                Image movieCoverPhoto = (Image)MovieDetailsContainer.FindControl("movieCoverPhoto");
                byte[] imageData;
                List<DateTime> dates = new List<DateTime>();

                DateTime currentDate = DateTime.Today;

                // Add current date and the next six days to the list
                for (int i = 0; i < 7; i++)
                {
                    dates.Add(currentDate.AddDays(i));
                }

                // Bind the list of dates to the repeater
                dateRepeater.DataSource = dates;
                dateRepeater.DataBind();

                if (Request.QueryString["movieID"] != null)
                {
                    string movieID = Request.QueryString["movieID"];
                    
                    SqlConnection conn;
                    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    conn = new SqlConnection(strCon);
                    conn.Open();

                    string strToRetrieve = "SELECT * FROM Movie WHERE movieID = @MovieID";
                    
                    SqlCommand cmdToRetrieve;
                    cmdToRetrieve = new SqlCommand(strToRetrieve, conn);
                    cmdToRetrieve.Parameters.AddWithValue("@MovieID", movieID);

                    SqlDataReader movieDetailsReader = cmdToRetrieve.ExecuteReader();

                    if (movieDetailsReader.Read())
                    {
                        imageData = (byte[])movieDetailsReader["movieCoverPhoto"];
                        string base64String = Convert.ToBase64String(imageData);
                        movieCoverPhoto.ImageUrl = $"data:image/jpeg;base64, {base64String}";

                        movieName.InnerText = movieDetailsReader["movieName"].ToString();
                        movieGenre.InnerText = movieDetailsReader["movieGenre"].ToString();
                        movieLanguage.InnerText = movieDetailsReader["movieLanguage"].ToString();
                        movieSubtitle.InnerText = movieDetailsReader["movieSubtitle"].ToString();
                        movieCast.InnerText = movieDetailsReader["movieCast"].ToString();
                        movieDistributer.InnerText = movieDetailsReader["movieDistributor"].ToString();
                        movieSynopsis.InnerText = movieDetailsReader["movieSynopsis"].ToString();

                    }

                    movieDetailsReader.Close();
                    conn.Close();

                    // Check if the date query parameter exists
                    if (Request.QueryString["date"] != null)
                    {
                        string selectedDate = Request.QueryString["date"];

                        SqlConnection conn2;
                        string strCon2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                        conn2 = new SqlConnection(strCon2);
                        conn2.Open();

                        string strToRetrieve2 = "SELECT * FROM HallTimeSlot WHERE movieID = @MovieID AND hallTimeSlotDate = @MovieDate AND hallTimeSlotPurpose = @hallPurpose";

                        SqlCommand cmdToRetrieve2;
                        cmdToRetrieve2 = new SqlCommand(strToRetrieve2, conn2);
                        cmdToRetrieve2.Parameters.AddWithValue("@MovieID", movieID);
                        cmdToRetrieve2.Parameters.AddWithValue("@hallPurpose", "Movie");
                        cmdToRetrieve2.Parameters.AddWithValue("@MovieDate", selectedDate); // Assuming selectedDate contains the time slot

                        SqlDataReader movieTimeReader = cmdToRetrieve2.ExecuteReader();

                        // Check if the reader has rows
                        if (movieTimeReader.HasRows)
                        {
                            movieTimeRepeater.DataSourceID = null;
                            movieTimeRepeater.DataSource = movieTimeReader;
                            movieTimeRepeater.DataBind();
                            movieTimeReader.Close();
                        }
                    }
                    else
                    {
                        // If date query parameter is not present, set the default date to the current date
                        string defaultDate = currentDate.ToString("yyyy/MM/dd");
                        string redirectUrl = $"MovieDetails.aspx?movieID={movieID}&date={defaultDate}";
                        Response.Redirect(redirectUrl);
                    }

                }


            }
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            // Get the button that triggered the event
            Button button = (Button)sender;

            // Get the hallTimeSlotID from the CommandArgument property of the button
            string hallTimeSlotID = button.CommandArgument;

            // Redirect to MovieSeatSelection.aspx with hallTimeSlotID as a query parameter
            Response.Redirect("MovieSeatSelection.aspx?hallTimeSlotID=" + hallTimeSlotID);
        }



        protected void DateButton_Click(object sender, EventArgs e)
        {
            // Handle button click event
            Button button = (Button)sender;
            string date = button.CommandArgument;

            // Get the movieID from the query string
            string movieID = Request.QueryString["movieID"];

            // Redirect to MovieDetails.aspx with both movieID and date as query parameters
            Response.Redirect($"MovieDetails.aspx?movieID={movieID}&date={date}");
        }
    }
}