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
    public partial class MyProfile : System.Web.UI.Page
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
                    // Retrieve and display user data
                    PopulateUserData();
                }
            }
        }
        private void PopulateUserData()
        {
            string userId = (string)Session["UserId"];
            if (!string.IsNullOrEmpty(userId))
            {
                // Query to retrieve user data based on userId
                string query = "SELECT username, custPhoneNo, custEmail, custBirthDate FROM Customer WHERE custID = @UserId";

                // Connect to the database and execute the query
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@UserId", userId);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    // Check if data is retrieved
                    if (reader.Read())
                    {
                        // Populate textboxes with user data
                        Username.Text = reader["username"].ToString();
                        Email.Text = reader["custEmail"].ToString();
                        MobileNumber.Text = reader["custPhoneNo"].ToString();
                        object birthDateObj = reader["custBirthDate"];
                        if (birthDateObj != DBNull.Value)
                        {
                            DateTime birthDate = (DateTime)birthDateObj;
                            BirthDate.Text = birthDate.ToString("yyyy-MM-dd");
                        }
                        else
                        {
                            BirthDate.Text = ""; // Assign empty string if birth date is null
                        }
                    }
                    else
                    {
                        // Handle case where user data is not found
                        // Display an error message or redirect to a different page
                    }

                    reader.Close();
                }
            }
            else
            {
                // Redirect user to login page if userId is null or empty
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void SaveChangesButton_Click(object sender, EventArgs e)
        {
            // Get the user ID from the session
            string userId = (string)Session["UserId"];

            // Check if userId is not null or empty
            if (!string.IsNullOrEmpty(userId))
            {
                // Update the user record in the database
                string query = @"UPDATE Customer 
                         SET custName = @Name, custPhoneNo = @PhoneNo, 
                             custEmail = @Email, custBirthDate = @BirthDate
                         WHERE custID = @UserId";

                // Connect to the database and execute the update query
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Name", Username.Text);
                    command.Parameters.AddWithValue("@PhoneNo", MobileNumber.Text);
                    command.Parameters.AddWithValue("@Email", Email.Text);
                    if (!string.IsNullOrEmpty(BirthDate.Text))
                    {
                        command.Parameters.AddWithValue("@BirthDate", DateTime.Parse(BirthDate.Text));
                    }
                    else
                    {
                        command.Parameters.AddWithValue("@BirthDate", DBNull.Value);
                    }
                    command.Parameters.AddWithValue("@UserId", userId);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    // Check if the update was successful
                    if (rowsAffected > 0)
                    {
                        // Display a success message or perform any other actions
                        // Redirect the user to a confirmation page or reload the current page
                        Response.Redirect(Request.RawUrl); // Reload the current page
                    }
                    else
                    {
                        // Handle the case where the update failed
                        // Display an error message or perform any other actions
                    }
                }
            }
            else
            {
                // Redirect user to login page if userId is null or empty
                Response.Redirect("~/Login.aspx");
            }
        }
        protected void EmailDuplicateValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Check if the email already exists
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Customer WHERE custEmail = @Email", connection))
                {
                    command.Parameters.AddWithValue("@Email", Email.Text);
                    int count = (int)command.ExecuteScalar();
                    args.IsValid = (count == 0); // Set validation result based on email existence
                }
            }
        }

    }
}