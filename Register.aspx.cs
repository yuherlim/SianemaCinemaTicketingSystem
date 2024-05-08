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


            // Create a new customer object
            string custID = GenerateCustID(); // Generate a unique customer ID
            string custName = string.Empty; // Name is empty by default
            string custPhoneNo = MobileNumber.Text;
            string custEmail = Email.Text;
            string username = ExtractUsernameFromEmail(Email.Text);
            string securityQuestion = Question.Text; // Get security question from the form
                                                     // Hash the password and security answer
            (string hashedPassword, string passwordSalt) = HashPassword(Password.Text);
            (string hashedAnswer, string answerSalt) = HashSecurityAnswer(Answer.Text);

            // Save the customer to the database
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("INSERT INTO Customer (custID, custName, custPhoneNo, custEmail, custBirthDate, username, password, custProfilePic, custSecurityQuestion, custSecurityAnswer, custPasswordSalt, custSecurityAnswerSalt) VALUES (@custID, @custName, @custPhoneNo, @custEmail, @custBirthDate, @username, @password, @custProfilePic, @custSecurityQuestion, @custSecurityAnswer, @custPasswordSalt, @custSecurityAnswerSalt)", connection))
                {
                    command.Parameters.AddWithValue("@custID", custID);
                    command.Parameters.AddWithValue("@custName", custName);
                    command.Parameters.AddWithValue("@custPhoneNo", custPhoneNo);
                    command.Parameters.AddWithValue("@custEmail", custEmail);
                    command.Parameters.AddWithValue("@custBirthDate", DBNull.Value);
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@password", hashedPassword);

                    // Explicitly defining the data type of @custProfilePic as VarBinary
                    SqlParameter custProfilePicParam = new SqlParameter("@custProfilePic", SqlDbType.VarBinary);
                    custProfilePicParam.Value = DBNull.Value; // Set value to DBNull.Value for null
                    command.Parameters.Add(custProfilePicParam);

                    // Add parameters for security question and answer
                    command.Parameters.AddWithValue("@custSecurityQuestion", Question.Text);
                    command.Parameters.AddWithValue("@custSecurityAnswer", hashedAnswer);
                    command.Parameters.AddWithValue("@custPasswordSalt", passwordSalt);
                    command.Parameters.AddWithValue("@custSecurityAnswerSalt", answerSalt);

                    command.ExecuteNonQuery();
                }
            }

            // Create customer role if it doesn't exist.
            if (!Roles.RoleExists("Customer"))
            {
                Roles.CreateRole("Customer");
                // Role created successfully
            }

            // Assign the "Customer" role to the new user
            Roles.AddUserToRole(custID, "Customer");

            // Update label to indicate successful user creation
            Session["UserCreationSuccessMessage"] = "User created successfully. You can now login!";

            Response.Redirect("Login.aspx");
        }

        private (string hashedPassword, string salt) HashPassword(string password)
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
                string hashedPassword = Convert.ToBase64String(hashedPasswordBytesWithSalt);
                string saltString = Convert.ToBase64String(salt);
                return (hashedPassword, saltString);
            }
        }

        private (string hashedAnswer, string salt) HashSecurityAnswer(string answer)
        {
            // Use a salted hash algorithm like PBKDF2
            byte[] salt = new byte[16];
            using (RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider())
            {
                rng.GetBytes(salt);
            }

            byte[] answerBytes = Encoding.UTF8.GetBytes(answer);
            byte[] hashedAnswerBytes = new byte[answerBytes.Length + salt.Length];
            Array.Copy(answerBytes, 0, hashedAnswerBytes, 0, answerBytes.Length);
            Array.Copy(salt, 0, hashedAnswerBytes, answerBytes.Length, salt.Length);

            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedAnswerBytesWithSalt = sha256.ComputeHash(hashedAnswerBytes);
                string hashedAnswer = Convert.ToBase64String(hashedAnswerBytesWithSalt);
                string saltString = Convert.ToBase64String(salt);
                return (hashedAnswer, saltString);
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