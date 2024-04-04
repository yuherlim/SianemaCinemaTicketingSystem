using System;
using System.Xml.Linq;

namespace SianemaCinemaTicketingSystem
{
    public partial class Hall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddHall_Click(object sender, EventArgs e)
        {
            hallName.Text = "Hall 01";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$(document).ready(function () {openModal();});", true);
            



        }

        protected void SqlDataSource1_Selecting(object sender, System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs e)
        {

        }
    }

    
}