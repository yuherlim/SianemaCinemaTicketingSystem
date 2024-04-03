using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
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
               

             
              
            }
        }

        protected void HallRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the inner ScheduleRepeater within each VenueRepeater item
                Repeater TimeSlotRepeater = (Repeater)e.Item.FindControl("TimeSlotRepeater");

                SqlConnection conn;
                String stringCon = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
                conn = new SqlConnection(stringCon);
                conn.Open();
                DataRowView hall = (DataRowView) e.Item.DataItem;
                string hallID = hall["hallID"].ToString();

                string strRetrieve = "Select * from HallTimeSlot " +
                    "inner join Movie on HallTimeSlot.movieId = Movie.movieId " +
                    "inner join Maintenance on HallTimeSlot.maintenanceID = Maintenance.maintenanceID " +
                    "where hallid ='" + hallID + "'";

                SqlCommand cmdRetrieve;
                cmdRetrieve = new SqlCommand(strRetrieve, conn);
                SqlDataReader reader = cmdRetrieve.ExecuteReader();

                TimeSlotRepeater.DataSource = reader;
                TimeSlotRepeater.DataBind();
                conn.Close();
            }
        }


        protected void btnAddTimeSlot_Click(object sender, EventArgs e)
        {
    
            SqlConnection conn;
            String stringCon = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            conn = new SqlConnection(stringCon);
            conn.Open();
            string hallID = "Hall-01";

            string strRetrieve = "Select * from HallTimeSlot " +
                "inner join Movie on HallTimeSlot.movieId = Movie.movieId " +
                "inner join Maintenance on HallTimeSlot.maintenanceID = Maintenance.maintenanceID " +
                "where hallid ='" + hallID + "'";
        
            SqlCommand cmdRetrieve;
            cmdRetrieve = new SqlCommand(strRetrieve, conn);
            SqlDataReader reader = cmdRetrieve.ExecuteReader();

            rptAddTSMovie.DataSource = reader;
            rptAddTSMovie.DataBind();
            conn.Close();
            lblHallName.Text = "Hall-01";
            lblHallType.Text = "Large";

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$(document).ready(function () {openTimeSlotModal();});", true);




        }

    }
}