using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace SianemaCinemaTicketingSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            // Get the newly created user
            MembershipUser newUser = Membership.GetUser();

            if (newUser != null)
            {
                // Extract form data using a more robust approach
                var formData = new
                {
                    CustPhoneNo = GetCustPhoneNoFromForm(),
                    CustEmail = CreateUserWizard1.Email,
                    Username = CreateUserWizard1.UserName,
                    Password = HashPassword(CreateUserWizard1.Password),
                };

                // Create a new customer object in the database
                using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
                {
                    connection.Open();
                    string custID = GenerateCustID();
                    using (var command = new SqlCommand("INSERT INTO Customer (custID, custName, custPhoneNo, custEmail, custBirthDate, username, password, custProfilePic) VALUES (@custID, @custName, @custPhoneNo, @custEmail, @custBirthDate, @username, @password, @custProfilePic)", connection))
                    {
                        command.Parameters.AddWithValue("@custID", custID);
                        command.Parameters.AddWithValue("@custName", string.Empty);
                        command.Parameters.AddWithValue("@custPhoneNo", formData.CustPhoneNo);
                        command.Parameters.AddWithValue("@custEmail", formData.CustEmail);
                        command.Parameters.AddWithValue("@custBirthDate", DBNull.Value);
                        command.Parameters.AddWithValue("@username", formData.Username);
                        command.Parameters.AddWithValue("@password", formData.Password);
                        command.Parameters.AddWithValue("@custProfilePic", DBNull.Value);
                        command.ExecuteNonQuery();
                    }
                }
            }
        }

        // Helper method to generate custID in the requested format
        private string GenerateCustID()
        {
            string custID = "CUST-" + DateTime.Now.ToString("yyMMdd") + "-";
            int num = 1;
            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                connection.Open();
                using (var command = new SqlCommand("SELECT COUNT(*) FROM Customer WHERE custID LIKE '" + custID + "%'", connection))
                {
                    num += (int)command.ExecuteScalar();
                }
            }
            return custID + num.ToString("D5");
        }

        // Helper method to extract custPhoneNo from form
        private string GetCustPhoneNoFromForm()
        {
            var custPhoneNoTextBox = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("MobileNumber");
            return custPhoneNoTextBox?.Text.Trim();
        }

        // Helper method to hash and store password securely
        private string HashPassword(string password)
        {
            // Implement a secure password hashing algorithm, such as bcrypt or PBKDF2
            // For demonstration purposes, a simple SHA256 hash is used
            using (var sha256 = new SHA256CryptoServiceProvider())
            {
                var passwordBytes = Encoding.UTF8.GetBytes(password);
                var hashedBytes = sha256.ComputeHash(passwordBytes);
                return Convert.ToBase64String(hashedBytes);
            }
        }
    }
}