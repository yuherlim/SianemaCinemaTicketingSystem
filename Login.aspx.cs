using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SianemaCinemaTicketingSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
    }
}