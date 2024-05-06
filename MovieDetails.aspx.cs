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
                if (Request.QueryString["movieID"] != null)
                {
                    string movieID = Request.QueryString["movieID"];
                    
                    SqlConnection conn;
                    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    conn = new SqlConnection(strCon);
                    conn.Open();

                    string strToRetrieve = "SELECT * FROM Movie WHERE MovieID = @MovieID";
                    
                    SqlCommand cmdToRetrieve;
                    cmdToRetrieve = new SqlCommand(strToRetrieve, conn);
                    cmdToRetrieve.Parameters.AddWithValue("@MovieID", movieID);

                    SqlDataReader movieDetailsReader = cmdToRetrieve.ExecuteReader();

                    if (movieDetailsReader.Read())
                    {
                        string imageUrl = movieDetailsReader["movieCoverPhoto"].ToString();
                        movieCoverPhoto.ImageUrl = imageUrl;

                        movieName.InnerText = movieDetailsReader["movieName"].ToString();
                        movieGenre.InnerText = movieDetailsReader["movieGenre"].ToString();
                        movieLanguage.InnerText = movieDetailsReader["movieLanguage"].ToString();
                        movieSubtitle.InnerText = movieDetailsReader["movieSubtitle"].ToString();
                        movieCast.InnerText = movieDetailsReader["movieCast"].ToString();
                        movieDistributer.InnerText = movieDetailsReader["movieDistributor"].ToString();
                        movieSynopsis.InnerText = movieDetailsReader["movieSynopsis"].ToString();

                    }

                    DateTime currentDate = DateTime.Today;

                    date1.Text = "Today\n" + currentDate.ToString("dd-MMM").ToUpper();
                    date2.Text = currentDate.AddDays(1).ToString("ddd\ndd-MMM").ToUpper();
                    date3.Text = currentDate.AddDays(2).ToString("ddd\ndd-MMM").ToUpper();
                    date4.Text = currentDate.AddDays(3).ToString("ddd\ndd-MMM").ToUpper();
                    date5.Text = currentDate.AddDays(4).ToString("ddd\ndd-MMM").ToUpper();
                    date6.Text = currentDate.AddDays(5).ToString("ddd\ndd-MMM").ToUpper();
                    date7.Text = currentDate.AddDays(6).ToString("ddd\ndd-MMM").ToUpper();

                    conn.Close();

                    // Check if the date query parameter exists
                    if (Request.QueryString["date"] != null)
                    {
                        string selectedDate = Request.QueryString["date"];

                        SqlConnection conn2;
                        string strCon2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                        conn2 = new SqlConnection(strCon2);
                        conn2.Open();

                        string strToRetrieve2 = "SELECT * FROM HallTimeSlot WHERE MovieID = @MovieID AND CONVERT(date, hallTimeSlotDateTime) = CONVERT(date, @MovieTime)";

                        SqlCommand cmdToRetrieve2;
                        cmdToRetrieve2 = new SqlCommand(strToRetrieve2, conn2);
                        cmdToRetrieve2.Parameters.AddWithValue("@MovieID", movieID);
                        cmdToRetrieve2.Parameters.AddWithValue("@MovieTime", selectedDate); // Assuming selectedDate contains the time slot

                        SqlDataReader movieTimeReader = cmdToRetrieve2.ExecuteReader();
                        movieTimeRepeater.DataSourceID = null;
                        movieTimeRepeater.DataSource = movieTimeReader;

                        //string movieDate = movieTimeReader["hallTimeSlotDateTime"].ToString(); // Replace "ColumnName" with the actual column name
                        //Console.WriteLine($"Movie Date: {movieDate}");

                        movieTimeRepeater.DataBind();
                    }
                    else
                    {
                        // If date query parameter is not present, set the default date to the current date
                        string defaultDate = currentDate.ToString("dd/MM/yyyy");
                        string redirectUrl = $"MovieDetails.aspx?movieID={movieID}&date={defaultDate}";
                        Response.Redirect(redirectUrl);
                    }

                }


            }
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            Response.Redirect("MovieSeatSelection.aspx");
        }
    }
}