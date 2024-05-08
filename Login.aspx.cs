using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SianemaCinemaTicketingSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if there is a logged-in user
            if (User.Identity.IsAuthenticated)
            {
                // Check the user type stored in session variable
                string userType = (string)Session["UserType"];

                if (userType == "Customer")
                {
                    // Redirect the customer to the home page
                    Response.Redirect("~/Homepage.aspx");
                }
                else if (userType == "Admin")
                {
                    // Redirect the admin to the admin page
                    Response.Redirect("~/HallTimeSlot.aspx");
                }
            }

            if (!IsPostBack)
            {
                // Check if a success message exists in session
                if (Session["UserCreationSuccessMessage"] != null)
                {
                    // Display the success message
                    lblSuccessMsg.Text = Session["UserCreationSuccessMessage"].ToString();

                    // Clear the session variable to prevent displaying the message again
                    Session.Remove("UserCreationSuccessMessage");
                }

            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            // Validate the input data
            if (!Page.IsValid)
            {
                return;
            }

            // Get the user's email and password
            string email = Email.Text;
            string password = Password.Text;

            // Authenticate the user
            if (email.Contains("@sianema.admin"))
            {
                if (AuthenticateAdmin(email, password))
                {
                    // Set authentication cookie for admin user
                    FormsAuthentication.SetAuthCookie(email, false);

                    Session["UserType"] = "Admin";
                    Response.Redirect("~/HallTimeSlot.aspx");
                }
                else
                {
                    lblErrorMessage.Text = "Invalid email or password. Please try again.";
                }
            }
            else
            {
                
                if (AuthenticateUser(email, password))
                {
                    // Authenticate customer user
                    string userId = GetUserIdByEmail(email); // Implement this method to retrieve the user's ID

                    // Set authentication cookie for customer user using user ID
                    FormsAuthentication.SetAuthCookie(userId, false);

                    Session["UserType"] = "Customer";
                    Session["UserId"] = userId;
                    Response.Redirect("~/Homepage.aspx");
                }
                else
                {
                    lblErrorMessage.Text = "Invalid email or password. Please try again.";
                }
            }
        }

        private bool AuthenticateUser(string email, string password)
        {
            bool isAuthenticated = false;

            // Check if the email exists and the password matches the hashed password in the customer table
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                connection.Open();
                string query = "SELECT password, custPasswordSalt FROM Customer WHERE custEmail = @Email";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string storedSalt = reader["custPasswordSalt"].ToString();
                            string storedHashedPassword = reader["password"].ToString();
                            string hashedPassword = HashPassword(password, storedSalt);
                            isAuthenticated = (hashedPassword == storedHashedPassword);
                        }
                    }
                }
            }

            return isAuthenticated;
        }

        private bool AuthenticateAdmin(string email, string password)
        {
            bool isAuthenticated = false;

            // Check if the email exists and the password matches the hashed password in the staff table
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                connection.Open();
                string query = "SELECT password, staffSalt FROM Staff WHERE staffEmail = @Email";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string storedSalt = reader["staffSalt"].ToString();
                            string storedHashedPassword = reader["password"].ToString();
                            string hashedPassword = HashPassword(password, storedSalt);
                            isAuthenticated = (hashedPassword == storedHashedPassword);
                        }
                    }
                }
            }

            return isAuthenticated;
        }

        private string HashPassword(string password, string salt)
        {
            // Use the stored salt to hash the password
            byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
            byte[] saltBytes = Convert.FromBase64String(salt);

            byte[] hashedPasswordBytes = new byte[passwordBytes.Length + saltBytes.Length];
            Array.Copy(passwordBytes, 0, hashedPasswordBytes, 0, passwordBytes.Length);
            Array.Copy(saltBytes, 0, hashedPasswordBytes, passwordBytes.Length, saltBytes.Length);

            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedPasswordBytesWithSalt = sha256.ComputeHash(hashedPasswordBytes);
                return Convert.ToBase64String(hashedPasswordBytesWithSalt);
            }
        }

        private string GetUserIdByEmail(string email)
        {
            string userId = "";
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                connection.Open();
                string query = "SELECT custID FROM Customer WHERE custEmail = @Email";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    userId = (string)command.ExecuteScalar();
                }
            }
            return userId;
        }
    }
}