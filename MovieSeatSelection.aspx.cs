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

            /*
            SqlConnection conn;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            conn = new SqlConnection(strCon);
            conn.Open();

            string strToRetrieve = "Select * From Movie";

            SqlCommand cmdToRetrieve;
            cmdToRetrieve = new SqlCommand(strToRetrieve, conn);

            SqlDataReader seatDetailsReader = cmdToRetrieve.ExecuteReader();

            if (seatDetailsReader.Read())
            {


            }
            */



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

            for (int row = 1; row <= numRows; row++)
            {
                for (int col = 1; col <= numColumns; col++)
                {
                    // Generate a dynamic seat object with row and column numbers
                    var seat = new { RowNumber = row, ColumnNumber = col, SeatNumber = $"Seat {row}-{col}" };
                    seats.Add(seat);
                }
            }

            return seats;
        }


    }
}