using System;
using System.Web.Security;

namespace SianemaCinemaTicketingSystem
{
    public partial class MPA : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

            // Sign out the user
            FormsAuthentication.SignOut();

            // Redirect the user to the login page
            Response.Redirect("~/Login.aspx");
        }
    }
}