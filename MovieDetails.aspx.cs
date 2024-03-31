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
            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            conn = new SqlConnection(strCon);
            conn.Open();

            string strToRetrieve = "Select * From Movie";

            SqlCommand cmdToRetrieve;
            cmdToRetrieve = new SqlCommand(strToRetrieve, conn);

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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("MovieSeatSelection.aspx");
        }
    }
}