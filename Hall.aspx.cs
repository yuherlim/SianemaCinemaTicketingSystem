using System;
using System.Web.UI.WebControls;
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
            ///Obtain btn ID
            Button button = (Button)sender;
            hallName.Text = button.ID;

            //Inject javascript for open modal after postback
            //The modal will be opened after the page load 
            //The reason for needing this code, when trigger server control button for fetching data from database, it will postback to server and reload the page, 
            //Therefore by default, the modal will not be opened
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$(document).ready(function () {openModal();});", true);
            



        }


        //For the data fetch for view hall purpose, you can assign hall-ID for remove btn and view btn of repeater in itemDataBound function
        //For each view btn are assign with the id of Hall-xx-btnView
        //When the user click the view btn, it will trigger viewBtn onclick function
        //You can obtain the id of hall by extract it from the button ID 
        //Then run the query based on the Hall-ID, bind the data to the relavent input field for display or to delete the record
    
    }

    
}