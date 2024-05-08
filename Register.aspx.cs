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
using System.Data;

namespace SianemaCinemaTicketingSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialize the validation group
            RegisterValidationSummary.ValidationGroup = "RegisterValidationGroup";
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            // Validate the input data
            if (!Page.IsValid)
            {
                return;
            }

            // Check if the email already exists
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Customer WHERE custEmail = @Email", connection))
                {
                    command.Parameters.AddWithValue("@Email", Email.Text);
                    int count = (int)command.ExecuteScalar();
                    if (count > 0)
                    {
                        RegisterValidationSummary.HeaderText = "Error: Email already exists.";
                        return;
                    }
                }
            }

            // Create a new customer object
            string custID = GenerateCustID(); // Generate a unique customer ID
            string custName = string.Empty; // You didn't provide a field for this, so it's empty for now
            string custPhoneNo = MobileNumber.Text;
            string custEmail = Email.Text;
            DateTime custBirthDate = new DateTime(1900, 1, 1); // You didn't provide a field for this, so it's set to minimum value for now
            string username = ExtractUsernameFromEmail(Email.Text);
            string password = HashPassword(Password.Text);

            // Save the customer to the database
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("INSERT INTO Customer (custID, custName, custPhoneNo, custEmail, custBirthDate, username, password, custProfilePic) VALUES (@custID, @custName, @custPhoneNo, @custEmail, @custBirthDate, @username, @password, @custProfilePic)", connection))
                {
                    command.Parameters.AddWithValue("@custID", custID);
                    command.Parameters.AddWithValue("@custName", custName);
                    command.Parameters.AddWithValue("@custPhoneNo", custPhoneNo);
                    command.Parameters.AddWithValue("@custEmail", custEmail);
                    command.Parameters.AddWithValue("@custBirthDate", custBirthDate);
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@password", password);

                    // Explicitly defining the data type of @custProfilePic as VarBinary
                    SqlParameter custProfilePicParam = new SqlParameter("@custProfilePic", SqlDbType.VarBinary);
                    custProfilePicParam.Value = DBNull.Value; // Set value to DBNull.Value for null
                    command.Parameters.Add(custProfilePicParam);



                    command.ExecuteNonQuery();
                }
            }

            // Assign the "Customer" role to the new user
            Roles.AddUserToRole(username, "Customer");

            // Redirect to the login page
            Response.Redirect("Login.aspx");
        }

        private string HashPassword(string password)
        {
            // Use a salted hash algorithm like PBKDF2
            byte[] salt = new byte[16];
            using (RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider())
            {
                rng.GetBytes(salt);
            }

            byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
            byte[] hashedPasswordBytes = new byte[passwordBytes.Length + salt.Length];
            Array.Copy(passwordBytes, 0, hashedPasswordBytes, 0, passwordBytes.Length);
            Array.Copy(salt, 0, hashedPasswordBytes, passwordBytes.Length, salt.Length);

            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedPasswordBytesWithSalt = sha256.ComputeHash(hashedPasswordBytes);
                return Convert.ToBase64String(hashedPasswordBytesWithSalt);
            }
        }

        public class Customer
        {
            public string Email { get; set; }
            public string MobileNumber { get; set; }
            public string Password { get; set; }
            public string SecurityQuestion { get; set; }
            public string SecurityAnswer { get; set; }
        }

        // Helper method to generate custID in the requested format
        private string GenerateCustID()
        {
            string custID = "CUST-" + DateTime.Now.ToString("yyMMdd") + "-";
            int num = 1;
            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                connection.Open();
                using (var command = new SqlCommand("SELECT COUNT(*) FROM Customer WHERE custID LIKE '" + custID + "%'", connection))
                {
                    num += (int)command.ExecuteScalar();
                }
            }
            return custID + num.ToString("D5");
        }

        private string ExtractUsernameFromEmail(string email)
        {
            if (string.IsNullOrEmpty(email))
            {
                throw new ArgumentException("Email cannot be null or empty.");
            }

            int atSignIndex = email.IndexOf('@');
            if (atSignIndex <= 0)
            {
                throw new ArgumentException("Invalid email format.");
            }

            return email.Substring(0, atSignIndex);
        }


    }
}