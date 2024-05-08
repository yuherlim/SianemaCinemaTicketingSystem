using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Security.Cryptography;

namespace SianemaCinemaTicketingSystem
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            gvMovie.DataBind();
        }


        protected void btnAddMovie_Click(object sender, EventArgs e)
        {
            string newId = "";
            SqlConnection conn;
            String stringCon = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            conn = new SqlConnection(stringCon);
            conn.Open();
            string query = "SELECT TOP 1 movieID FROM Movie WHERE movieID <> 'NA' ORDER BY CONVERT(datetime, SUBSTRING(movieID, 5, 4) + '/' + SUBSTRING(movieID, 10, 2) + '/' + SUBSTRING(movieID, 13, 2), 120) DESC," +
                "CONVERT(int, RIGHT(movieID, 5)) DESC";

            SqlCommand command = new SqlCommand(query, conn);

            string latestId = (string)command.ExecuteScalar();

            DateTime latestDate;
            string date = latestId.Substring(4, 10);
            if (DateTime.TryParseExact(latestId.Substring(4, 10), "yyyy-MM-dd", null, System.Globalization.DateTimeStyles.None, out latestDate))
            {
                DateTime today = DateTime.Today;
                int lastFiveDigits;
                if (int.TryParse(latestId.Substring(16), out lastFiveDigits))
                {
                    if (latestDate.Date == today.Date)
                    {
                        lastFiveDigits++;
                    }
                    else
                    {
                        lastFiveDigits = 1;
                    }

                    newId = $"MOV-{today:yyyy-MM-dd}-{lastFiveDigits:D5}";
                    Console.WriteLine(newId);
                }
            }
            conn.Close();

            movID.Text = newId;
            ClientScript.RegisterStartupScript(this.GetType(), "AddMovie", "$(document).ready(function () {addMovie();});", true);
        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList dropDownList = (DropDownList)sender;
            string selectedValue = dropDownList.SelectedValue;

            if (selectedValue == "Onscreen Movie")
            {
                gvMovie.DataSourceID = "onScreenDataSource";
            }
            else if (selectedValue == "Offscreen Movie")
            {
                gvMovie.DataSourceID = "offScreenDataSource";
            }
            else if (selectedValue == "All Movie")
            {
                gvMovie.DataSourceID = "allMovieDataSource";
            }





        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            String stringCon = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            conn = new SqlConnection(stringCon);
            conn.Open();

            byte[] moviePoster = Convert.FromBase64String(movPosterImageValue.Value);
            byte[] movieCoverPhoto = Convert.FromBase64String(movCoverPhotoImageValue.Value);
            string movieID = movID.Text;
            string movieName = txtName.Text;
            string movieSynopsis = movSynopsisValue.Value;
            string movieGenre = movGenreValue.Value;
            string movieSubtitle = movSubtitleValue.Value;
            string movieLanguage = movLanguageValue.Value;
            DateTime movieDuration;
            DateTime.TryParse(movDurationValue.Value, out movieDuration);
            string movieDistributor = txtDistributor.Text;
            string movieCast = movCastValue.Value;
            DateTime releaseDate;
            DateTime.TryParse(movReleaseDateValue.Value, out releaseDate);
            DateTime screenFromDate;
            DateTime.TryParse(movScreenFromValue.Value, out screenFromDate);
            string movieClassification = movClassificationValue.Value;
            DateTime screenUntilDate;
            DateTime.TryParse(movScreenUntilValue.Value, out screenUntilDate);

            var btnConfirmModeStr = btnConfirmMode.Value;
            if (btnConfirmModeStr == "AddMovie")
            {
                string strAdd = "Insert Into Movie (movieID,movieName,movieSynopsis,movieGenre,movieSubtitle,movieLanguage,movieDuration,movieDistributor," +
                    "movieCast,releaseDate,screenFromDate,movieClassification,moviePoster,movieCoverPhoto,screenUntilDate) Values (@movieID,@movieName,@movieSynopsis,@movieGenre,@movieSubtitle,@movieLanguage,@movieDuration,@movieDistributor," +
                    "@movieCast,@releaseDate,@screenFromDate,@movieClassification,@moviePoster,@movieCoverPhoto,@screenUntilDate) ";
                using (SqlCommand command = new SqlCommand(strAdd, conn))
                {
                    command.Parameters.AddWithValue("@movieID", movieID);
                    command.Parameters.AddWithValue("@movieName", movieName);
                    command.Parameters.AddWithValue("@movieSynopsis", movieSynopsis);
                    command.Parameters.AddWithValue("@movieGenre", movieGenre);
                    command.Parameters.AddWithValue("@movieSubtitle", movieSubtitle);
                    command.Parameters.AddWithValue("@movieLanguage", movieLanguage);
                    command.Parameters.AddWithValue("@movieDuration", movieDuration);
                    command.Parameters.AddWithValue("@movieDistributor", movieDistributor);
                    command.Parameters.AddWithValue("@movieCast", movieCast);
                    command.Parameters.AddWithValue("@releaseDate", releaseDate);
                    command.Parameters.AddWithValue("@screenFromDate", screenFromDate);
                    command.Parameters.AddWithValue("@movieClassification", movieClassification);
                    command.Parameters.AddWithValue("@moviePoster", SqlDbType.VarBinary).Value = new System.Data.SqlTypes.SqlBinary(moviePoster);
                    command.Parameters.AddWithValue("@movieCoverPhoto", SqlDbType.VarBinary).Value = new System.Data.SqlTypes.SqlBinary(movieCoverPhoto);
                    command.Parameters.AddWithValue("@screenUntilDate", screenUntilDate);
                    command.ExecuteNonQuery();
                }

            }
            else
            {
                string strUpdate = "Update Movie Set movieName = @movieName, movieSynopsis = @movieSynopsis, movieGenre = @movieGenre, movieSubtitle = @movieSubtitle, movieLanguage = @movieLanguage, movieDuration = @movieDuration, movieDistributor = @movieDistributor," +
                                 "movieCast = @movieCast, releaseDate = @releaseDate,screenFromDate = @screenFromDate, movieClassification = @movieClassification, moviePoster = @moviePoster,movieCoverPhoto = @movieCoverPhoto ,screenUntilDate = @screenUntilDate Where movieID = @movieID";
                using (SqlCommand command = new SqlCommand(strUpdate, conn))
                {
                    command.Parameters.AddWithValue("@movieID", movieID);
                    command.Parameters.AddWithValue("@movieName", movieName);
                    command.Parameters.AddWithValue("@movieSynopsis", movieSynopsis);
                    command.Parameters.AddWithValue("@movieGenre", movieGenre);
                    command.Parameters.AddWithValue("@movieSubtitle", movieSubtitle);
                    command.Parameters.AddWithValue("@movieLanguage", movieLanguage);
                    command.Parameters.AddWithValue("@movieDuration", movieDuration);
                    command.Parameters.AddWithValue("@movieDistributor", movieDistributor);
                    command.Parameters.AddWithValue("@movieCast", movieCast);
                    command.Parameters.AddWithValue("@releaseDate", releaseDate);
                    command.Parameters.AddWithValue("@screenFromDate", screenFromDate);
                    command.Parameters.AddWithValue("@movieClassification", movieClassification);
                    command.Parameters.AddWithValue("@moviePoster", SqlDbType.VarBinary).Value = new System.Data.SqlTypes.SqlBinary(moviePoster);
                    command.Parameters.AddWithValue("@movieCoverPhoto", SqlDbType.VarBinary).Value = new System.Data.SqlTypes.SqlBinary(movieCoverPhoto);
                    command.Parameters.AddWithValue("@screenUntilDate", screenUntilDate);
                    command.ExecuteNonQuery();
                }
            }

            conn.Close();
            gvMovie.DataBind();
        }

        protected void gvMovie_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            var viewButton = e.Row.FindControl("btnView");
            var editButton = e.Row.FindControl("btnEdit");
            if (viewButton != null)
            {
                var movieIDLabel = (Label)e.Row.FindControl("movieID");
                if (movieIDLabel != null)
                {
                    viewButton.ID = "btnView." + movieIDLabel.Text;
                    editButton.ID = "btnEdit." + movieIDLabel.Text;
                }

                Image image = (Image)e.Row.FindControl("moviePoster");
                byte[] imageData = (byte[])DataBinder.Eval(e.Row.DataItem, "moviePoster");
                string base64String = Convert.ToBase64String(imageData);
                image.ImageUrl = $"data:image/jpeg;base64,{base64String}";


            }
         
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Button buttonClicked = (Button)sender;
            string buttonClickedID = buttonClicked.ID;

            dataBind(buttonClickedID);

            ClientScript.RegisterStartupScript(this.GetType(), "ViewMovie", "$(document).ready(function () {viewMovie();});", true);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button buttonClicked = (Button)sender;
            string buttonClickedID = buttonClicked.ID;

            dataBind(buttonClickedID);

            ClientScript.RegisterStartupScript(this.GetType(), "EditMovie", "$(document).ready(function () {editMovie();});", true);

        }


        protected void dataBind(string buttonID)
        {
            var movieID = buttonID.Split('.')[1];
            SqlConnection conn;
            String stringCon = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            conn = new SqlConnection(stringCon);
            conn.Open();

            string strRetrieve = "Select * from Movie " +
                "where movieID ='" + movieID + "'";

            SqlCommand cmdRetrieve;
            cmdRetrieve = new SqlCommand(strRetrieve, conn);
            SqlDataReader reader = cmdRetrieve.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();
                movID.Text = reader["movieID"].ToString();
                txtName.Text = reader["movieName"].ToString();
                movGenreValue.Value = reader["movieGenre"].ToString();
                movClassificationValue.Value = reader["movieClassification"].ToString();
                movLanguageValue.Value = reader["movieLanguage"].ToString();
                movSubtitleValue.Value = reader["movieSubtitle"].ToString();
                movDurationValue.Value = reader["movieDuration"].ToString();
                txtDistributor.Text = reader["movieDistributor"].ToString();
                movReleaseDateValue.Value = reader["releaseDate"].ToString();
                byte[] moviePoster = (byte[])reader["moviePoster"];
                movPosterImageValue.Value = Convert.ToBase64String(moviePoster);
                byte[] movieCoverPhoto = (byte[])reader["movieCoverPhoto"];
                movCoverPhotoImageValue.Value = Convert.ToBase64String(movieCoverPhoto);
                movCastValue.Value = reader["movieCast"].ToString();
                movSynopsisValue.Value = reader["movieSynopsis"].ToString();
                movScreenFromValue.Value = reader["screenFromDate"].ToString();
                movScreenUntilValue.Value = reader["screenUntilDate"].ToString();
                Console.WriteLine(strRetrieve);
            }

            conn.Close();
        }
    }
}