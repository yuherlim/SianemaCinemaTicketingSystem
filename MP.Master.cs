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

        }

        //protected void LogoutButton_Click(object sender, EventArgs e)
        //{
        //    // Call the logout method
        //    LogoutUser();
        //}

        protected void LogoutUser()
        {
            // Sign out the user
            FormsAuthentication.SignOut();

            // Redirect the user to the login page
            Response.Redirect("~/Login.aspx");
        }
    }
}