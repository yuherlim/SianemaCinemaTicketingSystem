using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SianemaCinemaTicketingSystem
{
    public partial class MovieSeatSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
                // Assume you have already retrieved the number of rows and columns from the database
                int numRows = 7;
                int numColumns = 14;

                // Generate seat data based on the number of rows and columns
                List<object> seats = GenerateSeatData(numRows, numColumns);

                // Bind seat data to repeater
                SeatRepeater.DataSource = seats;
                SeatRepeater.DataBind();

                
        }

        private List<object> GenerateSeatData(int numRows, int numColumns)
        {
            List<object> seats = new List<object>();

            // Define an array of letters to use for row labels
            string[] rowLetters = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J" };

            for (int row = 0; row < numRows; row++)
            {
                // Get the row letter from the array based on the current row index
                string rowLetter = rowLetters[row];

                for (int col = 1; col <= numColumns; col++)
                {
                    // Generate a dynamic seat object with row letter and column number
                    var seat = new { RowLetter = rowLetter, ColumnNumber = col, SeatNumber = $"{rowLetter}-{col}" };
                    seats.Add(seat);
                }
            }

            return seats;
        }

        protected void continueButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }
    }
}