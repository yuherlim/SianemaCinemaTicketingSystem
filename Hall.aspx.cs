using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace SianemaCinemaTicketingSystem
{
    public partial class Hall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvHall.DataSourceID = "SqlDataSource2";
            // Rebind the GridView to update the data based on the selected value from the dropdown list
            gvHall.DataBind();
        }

        [WebMethod]
        public static string GetHallData(string hallID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "SELECT * FROM Hall WHERE hallName = @HallID"; // Ensure the query is looking for hallID

            // Initialize the JSON serializer
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            try
            {
                // Create a connection to the database
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // Create a command to execute the query
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@HallID", hallID);

                    // Open the connection
                    conn.Open();

                    // Execute the query and read the results
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Read data from the database
                    if (reader.Read())
                    {
                        // Create an object to hold the hall data
                        var hallData = new
                        {
                            hallID = reader["hallID"].ToString(),
                            hallName = reader["hallName"].ToString(),
                            hallType = reader["hallType"].ToString(),
                            numberOfSeats = Convert.ToInt32(reader["numberOfSeats"])
                        };

                        // Serialize the hall data to JSON
                        return serializer.Serialize(hallData);
                    }
                }
            }
            catch (Exception ex)
            {

            }

            // Return an empty JSON object if no data is found
            return serializer.Serialize(new { error = "No data found for the provided hall ID" });
        }

        protected (string hallID, string hallName) GenerateNewHallInfo()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Initialize default hall ID and hall name
            string newHallID = "Hall-01";
            string newHallName = "Hall 01";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                // Query the most recent hallID
                string hallIDQuery = "SELECT TOP 1 hallID FROM Hall ORDER BY hallID DESC";
                SqlCommand hallIDCmd = new SqlCommand(hallIDQuery, conn);
                object hallIDResult = hallIDCmd.ExecuteScalar();

                if (hallIDResult != null)
                {
                    // Increment the last hallID to generate a new hallID
                    string lastHallID = hallIDResult.ToString();
                    int lastNumber = int.Parse(lastHallID.Split('-')[1]);
                    int newNumber = lastNumber + 1;
                    newHallID = $"Hall-{newNumber:D2}";
                }

                // Query the most recent hallName
                string hallNameQuery = "SELECT TOP 1 hallName FROM Hall ORDER BY hallName DESC";
                SqlCommand hallNameCmd = new SqlCommand(hallNameQuery, conn);
                object hallNameResult = hallNameCmd.ExecuteScalar();

                if (hallNameResult != null)
                {
                    // Increment the last hallName to generate a new hallName
                    string lastHallName = hallNameResult.ToString();
                    int lastNumber = int.Parse(lastHallName.Split(' ')[1]);
                    int newNumber = lastNumber + 1;
                    newHallName = $"Hall {newNumber:D2}";
                }
            }

            // Return the new hallID and hallName as a tuple
            return (newHallID, newHallName);
        }

        protected void btnAddHall_Click(object sender, EventArgs e)
        {
            ///Obtain btn ID
            Button button = (Button)sender;
            hallName.Text = button.ID;

            (string newHallID, string newHallName) = GenerateNewHallInfo();

            // Assign the new ID and name to the appropriate controls
            modalId.Text = newHallID;
            hallName.Text = newHallName;


            //Inject javascript for open modal after postback
            //The modal will be opened after the page load 
            //The reason for needing this code, when trigger server control button for fetching data from database, it will postback to server and reload the page, 
            //Therefore by default, the modal will not be opened
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$(document).ready(function () {openModal();});", true);

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            // Retrieve data from the form
            string hallID = modalId.Text;
            string hallName = this.hallName.Text;
            string hallType = Request.Form["hallType"];
            string numberOfSeatsText = this.numberOfSeats.Text;

            // Log the retrieved values for debugging
            System.Diagnostics.Debug.WriteLine($"hallID: {hallID}, hallName: {hallName}, hallType: {hallType}, numberOfSeatsText: {numberOfSeatsText}");

            // Parse the number of seats
            if (!int.TryParse(numberOfSeatsText, out int numberOfSeats))
            {
                // Handle the error if the number of seats is not a valid integer
                Response.Write("<script>alert('Invalid number of seats. Please enter a valid integer.');</script>");
                return;
            }

            // Define the connection string
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


            // Define the SQL insert statement
            string insertQuery = "INSERT INTO Hall (hallID, hallName, hallType, hallStatus, numberOfSeats) " +
                                 "VALUES (@hallID, @hallName, @hallType, 'Active', @numberOfSeats)";


            try
            {
                // Create a new SQL connection
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // Create a new SQL command
                    using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                    {
                        // Add parameters to the SQL command
                        cmd.Parameters.AddWithValue("@hallID", hallID);
                        cmd.Parameters.AddWithValue("@hallName", hallName);
                        cmd.Parameters.AddWithValue("@hallType", hallType);
                        cmd.Parameters.AddWithValue("@numberOfSeats", numberOfSeats);

                        // Open the connection
                        conn.Open();

                        // Execute the SQL insert statement
                        int rowsAffected = cmd.ExecuteNonQuery();

                        // Log the number of rows affected for debugging
                        System.Diagnostics.Debug.WriteLine($"Rows affected: {rowsAffected}");


                        List<string> rows;
                        int numOfSeat;
                        

                        if (hallType == "Large")
                        {
                            rows = new List<string> { "A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L" };
                            numOfSeat = 17;


                        }
                        else
                        {
                            rows = new List<string> { "A", "B", "C", "D", "E", "F", "G" };
                            numOfSeat = 14;

                        }


                        foreach (string row in rows)
                        {
                            for (int seatNo = 1; seatNo < numOfSeat; seatNo++)
                            {
                                string seatID = hallID + "-" + row + seatNo;
                                string seatQuery = $"INSERT INTO Seat (seatID, hallID, row,seatNo) VALUES (@seatID, @hallID,@row,@seatNo)";
                                SqlCommand rowCommand = new SqlCommand(seatQuery, conn);
                                rowCommand.Parameters.AddWithValue("@seatID", seatID);
                                rowCommand.Parameters.AddWithValue("@hallID", hallID);
                                rowCommand.Parameters.AddWithValue("@row", row);
                                rowCommand.Parameters.AddWithValue("@seatNo", seatNo);
                                rowCommand.ExecuteNonQuery();
                            }
                        }



                        // Check if the insert was successful
                        if (rowsAffected > 0)
                        {
                            // Refresh the GridView to show the updated data
                            gvHall.DataBind();

                            // Optionally, refresh the page or redirect to reflect the changes
                            Response.Redirect(Request.RawUrl);
                        }
                        else
                        {
                            // Log the failure for debugging
                            System.Diagnostics.Debug.WriteLine("Insertion failed: No rows affected.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the error for debugging
                System.Diagnostics.Debug.WriteLine($"Error inserting new hall into database: {ex.Message}");
                Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
            }
        }

        [WebMethod]
        public static void RemoveHallData(string hallID)
        {
            // Define the connection string
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Define the SQL DELETE statement
            string deleteQuery = "DELETE FROM Hall WHERE hallName = @hallName";

            try
            {
                // Create a new SQL connection
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // Create a new SQL command
                    using (SqlCommand cmd = new SqlCommand(deleteQuery, conn))
                    {
                        // Add the hallID parameter to the SQL command
                        cmd.Parameters.AddWithValue("@hallName", hallID);

                        // Open the connection
                        conn.Open();

                        // Execute the SQL DELETE statement
                        int rowsAffected = cmd.ExecuteNonQuery();

                        // Log the number of rows affected for debugging
                        System.Diagnostics.Debug.WriteLine($"Rows affected by deletion: {rowsAffected}");
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the error for debugging
                System.Diagnostics.Debug.WriteLine($"Error removing hall data from database: {ex.Message}");
                throw new Exception($"Error removing hall data: {ex.Message}");
            }
        }

    }


}