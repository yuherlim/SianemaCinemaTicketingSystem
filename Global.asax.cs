using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace SianemaCinemaTicketingSystem
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            InitializeApplication();
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
        private void InitializeApplication()
        {
            // Check if the "Admin" role exists
            if (!Roles.RoleExists("Admin"))
            {
                // If the "Admin" role does not exist, create it
                Roles.CreateRole("Admin");
            }

            // Check if the admin's username has been added to the "Admin" role before
            string adminID = "STAFF-0001"; // Change this to the actual admin username
            if (!Roles.IsUserInRole(adminID, "Admin"))
            {
                // If the admin's username has not been added to the "Admin" role before, add it
                Roles.AddUserToRole(adminID, "Admin");
            }
        }
    }
}