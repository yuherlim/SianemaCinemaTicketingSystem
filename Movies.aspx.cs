using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SianemaCinemaTicketingSystem
{
    public partial class Movies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                SqlConnection conn;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                conn = new SqlConnection(strCon);
                conn.Open();

                string strToRetrieve = "Select * From Movie";

                SqlCommand cmdToRetrieve;
                cmdToRetrieve = new SqlCommand(strToRetrieve, conn);

                SqlDataReader movieReader = cmdToRetrieve.ExecuteReader();

                // Create a list to store objects
                List<object> movieList = new List<object>();

                while (movieReader.Read())
                {
                    byte[]  moviePosterByte = (byte[])movieReader["moviePoster"];
                    string moviePosterString = Convert.ToBase64String(moviePosterByte);

                    // Create an anonymous object
                    var movie = new
                    {
                        moviePoster = $"data:image/jpeg;base64, {moviePosterString}",
                        movieName = movieReader["movieName"],
                        movieID = movieReader["movieID"],
                    };

                    // Add the anonymous object to the list
                    movieList.Add(movie);
                }

                movieRepeater.DataSource = movieList;
                movieRepeater.DataBind();
                
                conn.Close();
            }
        }
    }
}