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
    public partial class TransactionHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // Check if there is a logged-in user
            if (User.Identity.IsAuthenticated)
            {
                // Check the user type stored in session variable
                string userType = (string)Session["UserType"];

                if (userType != "Customer")
                {
                    // Redirect the user to the login page if not a customer
                    Response.Redirect("~/Login.aspx");
                }
                else
                {

                }
            }

            string userID = Session["UserId"].ToString();

            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            conn = new SqlConnection(strCon);
            conn.Open();

            string strToRetrieve = "SELECT transactionID, transactionDateTime, transactionAmount FROM TicketTransaction WHERE custID = @userID AND transactionStatus = @transactionStatus";
            SqlCommand cmdToRetrieve = new SqlCommand(strToRetrieve, conn);
            cmdToRetrieve.Parameters.AddWithValue("@userID", userID);
            cmdToRetrieve.Parameters.AddWithValue("@transactionStatus", "Completed");
            SqlDataReader transactionReader = cmdToRetrieve.ExecuteReader();

            LastSeenRepeater.DataSourceID = null;
            LastSeenRepeater.DataSource = transactionReader;
            LastSeenRepeater.DataBind();

            transactionReader.Close();
            conn.Close();

            //if (!IsPostBack)
            //{
                
            //}

        }


    }

}