using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SianemaCinemaTicketingSystem
{
    public partial class CustomerInquire : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvCustInq.DataSourceID = "SqlDataSource2";
            // Rebind the GridView to update the data based on the selected value from the dropdown list
            gvCustInq.DataBind();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            ///Obtain btn ID
            Button button = (Button)sender;
            custInqID.Text = button.ID;



            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$(document).ready(function () {openModal();});", true);

        }


        [WebMethod]
        public static string GetCustInqData(string custInqID)
        {
            // Get the connection string from the configuration
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Define the query to select the desired fields from the CustInq table, including upFile
            string query = "SELECT  * FROM CustInq WHERE custInqID = @custInqID";

            // Initialize the JSON serializer
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            try
            {
                // Create a connection to the database
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // Create a command to execute the query
                    SqlCommand cmd = new SqlCommand(query, conn);
                    // Add the parameter for the custInqID
                    cmd.Parameters.AddWithValue("@custInqID", custInqID);

                    // Open the database connection
                    conn.Open();

                    // Execute the query and obtain a data reader
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Check if there is a record and read the data
                    if (reader.Read())
                    {
                        // Create an object to hold the custInq data
                        var custInqData = new
                        {
                            custInqID = reader["custInqID"].ToString(),
                            category = reader["category"].ToString(),
                            occurDate = reader["occurDate"].ToString(),
                            contactName = reader["contactName"].ToString(),
                            email = reader["email"].ToString(),
                            contactNum = reader["contactNum"].ToString(),
                            desc = reader["desc"].ToString(),
                            status = reader["status"].ToString(),
                            upFile = reader["upFile"].ToString() // Include upFile in the object
                        };

                        // Serialize the data object to JSON and return it
                        return serializer.Serialize(custInqData);
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception if needed (use a proper logging library in production code)
                Console.WriteLine("Error: " + ex.Message);
            }

            // Return an error message if no data is found
            return serializer.Serialize(new { error = "No data found for the provided customer inquiry ID" });
        }


        protected void btnConfirm_Click(Object sender, EventArgs e)
        {

            // Get the values from the modal inputs
            string custInqID = custInqIDField.Value;
            string status = Request.Form["status"]; // Assuming the status radio buttons are part of the form submission


            // Define the connection string and SQL query
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "UPDATE CustInq SET status = @status WHERE custInqID = @custInqID";

            // Execute the query to update the status in the database
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@custInqID", custInqID);

                conn.Open();
                cmd.ExecuteNonQuery();
            }



            // Refresh the page or grid view to reflect the updated data
            gvCustInq.DataBind();
        }
    }
}