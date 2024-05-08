using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SianemaCinemaTicketingSystem
{
    public partial class MP : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if there is a logged-in user
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                // Hide the login and join now buttons
                LoginButton.Visible = false;
                RegisterButton.Visible = false;
                LogoutButton.Visible = true;
                DropDownListForAuthenticatedUsers.Visible = true;
                // Optionally, you can display the user's name or other information
                // Example: UserNameLabel.Text = "Welcome, " + User.Identity.Name;
            }
            else
            {
                // Show the login and join now buttons for non-authenticated users
                LoginButton.Visible = true;
                RegisterButton.Visible = true;
                LogoutButton.Visible = false;
                DropDownListForAuthenticatedUsers.Visible = false;
            }
        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            // Redirect the user to the desired page
            Response.Redirect("~/Login.aspx");
        }
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            // Redirect the user to the desired page
            Response.Redirect("~/Register.aspx");
        }
        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            // Call the logout method
            LogoutUser();
        }

        protected void LogoutUser()
        {
            // Remove the session variable for user type
            Session.Remove("UserType");
            Session.Remove("UserId");

            // Sign out the user
            FormsAuthentication.SignOut();

            // Redirect the user to the login page
            Response.Redirect("~/Login.aspx");
        }
    }
}