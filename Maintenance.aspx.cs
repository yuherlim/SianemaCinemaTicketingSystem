﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SianemaCinemaTicketingSystem
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddMovie_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$(document).ready(function () {openModal();});", true);
            ClientScript.RegisterStartupScript(this.GetType(), "Test", "console.log('Script D loaded');", true);



        }

        protected void gvMovie_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvMovie_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

       
    }
}