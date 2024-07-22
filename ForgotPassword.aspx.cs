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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SecurityQuestion.Visible = false;
        }
        protected void ResetButton_Click(object sender, EventArgs e)
        {
            // Validate the input data
            if (!Page.IsValid)
            {
                return;
            }
            SecurityQuestion.Visible = true;
        }

        protected void ResetPasswordButton_Click(object sender, EventArgs e)
        {
            // Validate the input data
            if (!Page.IsValid)
            {
                return;
            }
        }

        protected void EmailValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Check if the email typed by the user matches the email in the database
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT custEmail FROM Customer WHERE custEmail = @Email", connection))
                {
                    command.Parameters.AddWithValue("@Email", Email.Text);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // If any records are returned, it means the email exists in the database
                        args.IsValid = reader.HasRows;
                    }
                }
            }
        }
    }

    
}