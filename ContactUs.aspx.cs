using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SianemaCinemaTicketingSystem
{
	public partial class ContactUs : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            dateValidator2.MinimumValue = DateTime.Now.AddYears(-5).ToShortDateString();
            dateValidator2.MaximumValue = DateTime.Now.ToShortDateString();
        }

        protected void FileValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Check if a file has been uploaded
            if (FileUpload.HasFile)
            {
                // Get the file size (in bytes)
                int fileSize = FileUpload.PostedFile.ContentLength;

                // Check if the file size is less than or equal to 5MB
                if (fileSize > 5 * 1024 * 1024)
                {
                    // File size exceeds 5MB
                    args.IsValid = false;
                    return;
                }

                // Get the file extension
                string fileExtension = System.IO.Path.GetExtension(FileUpload.PostedFile.FileName).ToLower();

                // Check if the file extension is one of the allowed types
                if (fileExtension != ".png" && fileExtension != ".jpg")
                {
                    // Invalid file type
                    args.IsValid = false;
                    return;
                }

                // File size and type are valid
                args.IsValid = true;
            }
            else
            {
                // No file uploaded
                args.IsValid = false;
            }
        }

        protected static string GenerateNewCustInqId()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


            string newCustInqID = "CI-0001";


            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                // Query the most recent custInqID
                string custInqIDQuery = "SELECT TOP 1 custInqID FROM CustInq ORDER BY custInqID DESC";
                SqlCommand custInqIDCmd = new SqlCommand(custInqIDQuery, conn);
                object custInqIDResult = custInqIDCmd.ExecuteScalar();

                if (custInqIDResult != null)
                {
                    // Increment the last hallID to generate a new hallID
                    string lastCustInqID = custInqIDResult.ToString();
                    int lastNumber = int.Parse(lastCustInqID.Split('-')[1]);
                    int newNumber = lastNumber + 1;
                    newCustInqID = $"CI-{newNumber:D4}";
                }



            }


            return newCustInqID;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Check if all the validators pass
            if (Page.IsValid)
            {
                // Get the submitted data
                string custInqID = GenerateNewCustInqId();
                string category = ddlCategory.SelectedItem.Text;
                DateTime occurDate = DateTime.Parse(txtDate.Text);
                string contactName = txtName.Text;
                string email = txtEmail.Text;
                string contactNum = txtContactNum.Text;
                string desc = txtDesc.Text;
                string upFilePath = null;


                // Save the file if there is one uploaded and it passed validation
                if (FileUpload.HasFile)
                {
                    // Generate a unique file name to avoid conflicts
                    string fileName = Guid.NewGuid().ToString() + Path.GetExtension(FileUpload.FileName);

                    // Define the file path to save the file
                    string savePath = Server.MapPath("~/images/custInq/") + fileName;

                    // Save the file
                    FileUpload.SaveAs(savePath);

                    // Store the relative path in the database
                    upFilePath = "./images/custInq/" + fileName;
                }

                string status = "Pending";

                // Insert data into the CustInq table
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string query = "INSERT INTO CustInq (custInqID, category, occurDate, contactName, email, contactNum, [desc], upFile, status) " +
                               "VALUES (@custInqID, @category, @occurDate, @contactName, @email, @contactNum, @desc, @upFile, @status)";



                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {


                        // Add parameters
                        command.Parameters.AddWithValue("@custInqID", custInqID);
                        command.Parameters.AddWithValue("@category", category);
                        command.Parameters.AddWithValue("@occurDate", occurDate);
                        command.Parameters.AddWithValue("@contactName", contactName);
                        command.Parameters.AddWithValue("@email", email);
                        command.Parameters.AddWithValue("@contactNum", contactNum);
                        command.Parameters.AddWithValue("@desc", desc);
                        command.Parameters.AddWithValue("@upFile", upFilePath ?? (object)DBNull.Value);
                        command.Parameters.AddWithValue("@status", status);
                        // Execute the query
                        command.ExecuteNonQuery();
                    }
                }

                // Provide feedback to the user (e.g., confirmation message)
                Response.Write("<script>alert('Data submitted successfully!');</script>");

                ClearForm();
            }
        }

        private void ClearForm()
        {
            // Clear all the text boxes and set their values to empty
            txtDate.Text = "";
            txtName.Text = "";
            txtEmail.Text = "";
            txtContactNum.Text = "";
            txtDesc.Text = "";

            // Reset the file upload control
            FileUpload.Attributes.Clear();

            // Reset the drop-down list to the default value
            ddlCategory.SelectedIndex = 0;

            // Reset validation summary
            ValidationSummary1.DataBind();
        }

    }
}