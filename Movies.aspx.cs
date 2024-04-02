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
                movieRepeater.DataSourceID = null;
                movieRepeater.DataSource = movieReader;
                movieRepeater.DataBind();

                conn.Close();
                
            }
        }

        
    }
}