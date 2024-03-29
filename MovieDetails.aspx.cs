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

            conn.Close();

            DateTime currentDate = DateTime.Today;

            for (int i = 0; i < 7; i++)
            {
                DateTime nextDate = currentDate.AddDays(i);

                Button btnDate = (Button)FindControl("date" + (i + 1)); // Find the button control
                if (btnDate != null)
                {
                    btnDate.Text = "<h3>" + nextDate.ToString("dddd") + "</h3><p>" + nextDate.ToString("dd/MM") + "</p>"; // Set HTML content for the button
                }
            }

             date1.Text = currentDate.ToString("dd/MM");
             date2.Text = currentDate.AddDays(1).ToString("dd/MM");
             date3.Text = currentDate.AddDays(2).ToString("dd/MM");
             date4.Text = currentDate.AddDays(3).ToString("dd/MM");
             date5.Text = currentDate.AddDays(4).ToString("dd/MM");
             date6.Text = currentDate.AddDays(5).ToString("dd/MM");
             date7.Text = currentDate.AddDays(6).ToString("dd/MM");

            
        }   
    }
}