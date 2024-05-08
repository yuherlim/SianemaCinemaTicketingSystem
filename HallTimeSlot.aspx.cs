using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace SianemaCinemaTicketingSystem
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                DateTime today = DateTime.Today;
                string todayStr = today.ToString("dd-MM-yyyy");
                TimeSlotDateValue.Value = todayStr;
                ViewState["SelectedDate"] = todayStr;
                HallRepeater.DataBind();
            }
            HallRepeater.DataBind();
        }

        protected void HallRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Button button = e.Item.FindControl("btnAddTimeSlot") as Button;
                // Find the inner ScheduleRepeater within each VenueRepeater item
                Repeater TimeSlotRepeater = (Repeater)e.Item.FindControl("TimeSlotRepeater");

                SqlConnection conn;
                String stringCon = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
                conn = new SqlConnection(stringCon);
                conn.Open();
                DataRowView hall = (DataRowView)e.Item.DataItem;
                string hallID = hall["hallID"].ToString();
                string hallType = hall["hallType"].ToString();
                button.ID = hallID + "," + hallType;
                string strRetrieve = "Select * from HallTimeSlot " +
                    "inner join Movie on HallTimeSlot.movieId = Movie.movieId " +
                    "inner join Maintenance on HallTimeSlot.maintenanceID = Maintenance.maintenanceID " +
                    "where hallid ='" + hallID + "'";

                if (ViewState["SelectedDate"] != null)
                {
                    DateTime dateTime;
                    string selectedDate = ViewState["SelectedDate"].ToString();
                    DateTime.TryParseExact(selectedDate, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture, DateTimeStyles.None, out dateTime);
                    selectedDate = dateTime.ToString("yyyy-MM-dd");
                    strRetrieve += " and HallTimeSlot.hallTimeSlotDate = '" + selectedDate + "'";
                }

                SqlCommand cmdRetrieve;
                cmdRetrieve = new SqlCommand(strRetrieve, conn);
                SqlDataReader reader = cmdRetrieve.ExecuteReader();

                TimeSlotRepeater.DataSource = reader;
                TimeSlotRepeater.DataBind();
                conn.Close();
            }
        }

        protected void TimeSlotRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button button = e.Item.FindControl("timeSlotButtonID") as Button;
                HiddenField hiddenField = e.Item.FindControl("timeSlotButtonFieldValue") as HiddenField;

                if (button != null)
                {
                    string purpose = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "hallTimeSlotPurpose"));

                    if (purpose == "Movie")
                    {
                        string buttonId = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "hallTimeSlotID"));
                        button.ID = "btnMovie." + buttonId;

                        string movieName = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "movieName"));
                        button.Text = movieName;

                        string movieID = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "movieID"));

                        hiddenField.Value += movieID + ",NA";
                    }
                    else
                    {
                        string buttonId = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "hallTimeSlotID"));
                        button.ID = "btnMtn." + buttonId;

                        button.Text = "Maintenance";

                        string maintenanceID = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "maintenanceID"));

                        hiddenField.Value += "NA," + maintenanceID;
                    }

                    hiddenField.ID = button.ID + ".value";


                    string timeSlotStartTime = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "hallTimeSlotTime"));

                    string timeSlotDuration = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "hallTimeSlotDuration"));

                    hiddenField.Value += "," + timeSlotStartTime + ',' + timeSlotDuration;

                }
            }
        }

        protected void btnAddTimeSlot_Click(object sender, EventArgs e)
        {
            Button buttonClicked = (Button)sender;
            SqlConnection conn;
            String stringCon = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            conn = new SqlConnection(stringCon);
            conn.Open();
            string hallID = buttonClicked.ID.Split(',')[0];
            string hallType = buttonClicked.ID.Split(',')[1];
            string strRetrieve = "Select * from HallTimeSlot " +
                    "inner join Movie on HallTimeSlot.movieId = Movie.movieId " +
                    "inner join Maintenance on HallTimeSlot.maintenanceID = Maintenance.maintenanceID " +
                    "where hallid ='" + hallID + "'";


            DateTime dateTime;
            string selectedDate = ViewState["SelectedDate"].ToString();
            DateTime.TryParseExact(selectedDate, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture, DateTimeStyles.None, out dateTime);
            selectedDate = dateTime.ToString("yyyy-MM-dd");
            strRetrieve += " and HallTimeSlot.hallTimeSlotDate = '" + selectedDate + "'";


            SqlCommand cmdRetrieve;
            cmdRetrieve = new SqlCommand(strRetrieve, conn);
            SqlDataReader reader = cmdRetrieve.ExecuteReader();


            rptAddTSMovie.DataSource = reader;
            rptAddTSMovie.DataBind();
            conn.Close();

            conn.Open();
            strRetrieve = "SELECT moviePoster, movieName, movieDuration, movieID FROM Movie WHERE movieID<> 'NA' AND screenUntilDate >= '" + selectedDate+ "'";
            cmdRetrieve = new SqlCommand(strRetrieve, conn);
            SqlDataReader newReader1 = cmdRetrieve.ExecuteReader();

            while (newReader1.Read())
            {
                string movID = newReader1["movieID"].ToString();
                string movName = newReader1["movieName"].ToString();
                string duration = newReader1["movieDuration"].ToString();
                onScreenMovieListValue.Value += movID + '.' + movName + '.' + duration+',';
            }

            conn.Close();

            conn.Open();
            strRetrieve = "SELECT moviePoster, movieName, movieDuration, movieID FROM Movie WHERE movieID<> 'NA' AND screenUntilDate >= '" + selectedDate + "'";
            cmdRetrieve = new SqlCommand(strRetrieve, conn);
            SqlDataReader newReader = cmdRetrieve.ExecuteReader();

            while (newReader.Read())
            {
                string movID = newReader["movieID"].ToString();
                string movName = newReader["movieName"].ToString();
                string duration = newReader["movieDuration"].ToString();
                onScreenMovieListValue.Value += movID + '.' + movName + '.' + duration + ',';
            }

            conn.Close();


            lblHallName.Text = hallID;
            lblHallType.Text = hallType;
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$(document).ready(function () {openTimeSlotModal();});", true);




        }

        protected void btnSearchDate_Click(object sender, EventArgs e)
        {
            if (TimeSlotDateValue.Value == "")
            {
                DateTime today = DateTime.Today;
                string todayStr = today.ToString("dd-MM-yyyy");
                TimeSlotDateValue.Value = todayStr;
            }

            string selectedDate = TimeSlotDateValue.Value;
            ViewState["SelectedDate"] = selectedDate;
            HallRepeater.DataBind();

        }

        protected void timeSlotButtonID_Click(object sender, EventArgs e)
        {
            Button buttonClicked = (Button)sender;
            string buttonClickedID = buttonClicked.ID;
            string[] buttonString = buttonClickedID.Split('.');
            if (buttonString[0] == "btnMovie")
            {
                dataBindMovie(buttonClickedID);
                ClientScript.RegisterStartupScript(this.GetType(), "ViewTimeSlotMovie", "$(document).ready(function () {viewMovie();});", true);

            }


        }

        protected void dataBindMovie(string buttonID)
        {
            HiddenField hiddenField = FindControl(buttonID + ".value") as HiddenField;
            foreach (RepeaterItem item in HallRepeater.Items)
            {
                hiddenField = FindControlRecursive(item, buttonID + ".value") as HiddenField;
                if (hiddenField != null)
                {
                    break;
                }

            }
            var movieID = hiddenField.Value.Split(',')[0];
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

        private Control FindControlRecursive(Control root, string id)
        {
            if (root.ID == id)
            {
                return root;
            }

            foreach (Control control in root.Controls)
            {
                Control foundControl = FindControlRecursive(control, id);
                if (foundControl != null)
                {
                    return foundControl;
                }
            }

            return null;
        }

        protected void rptAddTSMovie_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button button = e.Item.FindControl("AddTimeSlotButtonID") as Button;
                HiddenField hiddenField = e.Item.FindControl("AddTimeSlotButtonFieldValue") as HiddenField;

                if (button != null)
                {
                    string purpose = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "hallTimeSlotPurpose"));

                    if (purpose == "Movie")
                    {
                        string buttonId = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "hallTimeSlotID"));
                        button.ID = "btnMovie." + buttonId;

                        string movieName = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "movieName"));
                        button.Text = movieName;

                        string movieID = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "movieID"));

                        hiddenField.Value += movieID + ",NA";
                    }
                    else
                    {
                        string buttonId = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "hallTimeSlotID"));
                        button.ID = "btnMtn." + buttonId;

                        button.Text = "Maintenance";

                        string maintenanceID = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "maintenanceID"));

                        hiddenField.Value += "NA," + maintenanceID;
                    }

                    hiddenField.ID = button.ID + ".value";


                    string timeSlotStartTime = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "hallTimeSlotTime"));

                    string timeSlotDuration = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "hallTimeSlotDuration"));

                    hiddenField.Value += "," + timeSlotStartTime + ',' + timeSlotDuration;

                }
            }
        }
    }
}