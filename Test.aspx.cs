using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SianemaCinemaTicketingSystem
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //When page first loads
            {
                lblTest.Text = "Welcome to test site.";
            }
        }

        protected void txtTest_TextChanged(object sender, EventArgs e)
        {
            lblTest.Text = txtTest.Text.Trim();
        }
    }
}