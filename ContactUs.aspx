<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="SianemaCinemaTicketingSystem.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/contactUs.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <img src="cu.png" alt="photo of contactus" width="100%" height="400">
    </div>

    <div class="container">

        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="form-row align-items-center">

                    <div class="row p-3">
                        <h4 class="heading4">Submit a Ticket</h4>
                    </div>
                    <div class="row p-1">

                        <label class="cu-label" for="category">
                            <asp:RequiredFieldValidator ID="categoryValidator" runat="server" ControlToValidate="ddlCategory" Display="Dynamic" ErrorMessage="Please select a cateory" ForeColor="Red" InitialValue="Select Category">*</asp:RequiredFieldValidator>
                            Select a Category :</label>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control mb-2" Width="100%">
                            <asp:ListItem>Select Category</asp:ListItem>
                            <asp:ListItem>Movies/ Ticket Price/ Hall Type</asp:ListItem>
                            <asp:ListItem>Movie Promotion</asp:ListItem>
                            <asp:ListItem>General Enquires</asp:ListItem>
                            <asp:ListItem>Cinema Feedback/ Complaint</asp:ListItem>
                            <asp:ListItem>Lost and Found</asp:ListItem>
                            <asp:ListItem>Private Hall Booking and Event</asp:ListItem>
                            <asp:ListItem>Feedback/ Complaint</asp:ListItem>
                            <asp:ListItem>Recruitment</asp:ListItem>
                            <asp:ListItem>Booking</asp:ListItem>
                        </asp:DropDownList>

                        <label class="cu-label" for="datepicker">
                            <asp:RequiredFieldValidator ID="dateValidator1" runat="server" ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="Please select a date" ForeColor="Red">*</asp:RequiredFieldValidator>
                            Occur Date :    
                            <asp:RangeValidator ID="dateValidator2" runat="server" ErrorMessage="Invalid date format. Only accept past 5 years" ControlToValidate="txtDate" Display="Dynamic" ForeColor="Red" Type="Date"></asp:RangeValidator>
                        </label>
                        &nbsp;<asp:TextBox ID="txtDate" runat="server" class="form-control mb-2" placeholder="YYYY-MM-DD"></asp:TextBox>

                        <label class="cu-label" for="inlineFormInput">
                            <asp:RequiredFieldValidator ID="nameValidator" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Please enter your name" ForeColor="Red">*</asp:RequiredFieldValidator>
                            Contact Name :</label>
                        <asp:TextBox ID="txtName" runat="server" class="form-control mb-2" placeholder="Sia Yeong Sheng"></asp:TextBox>

                        <label for="inputEmail" class="cu-label">
                            <asp:RequiredFieldValidator ID="emailValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter your email" ForeColor="Red">*</asp:RequiredFieldValidator>
                            Email :    
                        <asp:RegularExpressionValidator ID="emailValidator2" runat="server" ErrorMessage="Invalid email format" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </label>
                        <asp:TextBox ID="txtEmail" runat="server" class="form-control mb-2" placeholder="siasia@gmail.com"></asp:TextBox>

                        <label class="cu-label" for="typePhone">
                            <asp:RequiredFieldValidator ID="contactNumValidator1" runat="server" ControlToValidate="txtContactNum" Display="Dynamic" ErrorMessage="Please enter your contact number" ForeColor="Red">*</asp:RequiredFieldValidator>
                            Contact Number :     
                        <asp:RegularExpressionValidator ID="contactNumValidator2" runat="server" ControlToValidate="txtContactNum" Display="Dynamic" ErrorMessage="Invalid format" ForeColor="Red" ValidationExpression="^\d{10,11}$">Invalid format. Contact Number digit must in 10 or 11 digit only.</asp:RegularExpressionValidator>
                        </label>
                        <asp:TextBox ID="txtContactNum" runat="server" class="form-control mb-2" placeholder="01313131313"></asp:TextBox>

                        <label for="comment" class="cu-label">
                            <asp:RequiredFieldValidator ID="descValidator" runat="server" ControlToValidate="txtDesc" Display="Dynamic" ErrorMessage="Please fill in the description box" ForeColor="Red">*</asp:RequiredFieldValidator>
                            Description :
                        </label>
                        <asp:TextBox ID="txtDesc" runat="server" class="form-control" Rows="4" TextMode="MultiLine" placeholder="Character do not exceed 500 characters" />
                        <asp:RegularExpressionValidator ID="lengthValidator" runat="server" ControlToValidate="txtDesc" ErrorMessage="Description cannot exceed 500 characters." ValidationExpression="^.{0,500}$" Display="Dynamic" ForeColor="Red" />


                    </div>

                </div>

                <div class="row border border-danger file-upload-row">
                    <asp:FileUpload ID="FileUpload" runat="server" />
                    <asp:CustomValidator ID="FileValidator" runat="server" ControlToValidate="FileUpload" ErrorMessage="Please select a file type (png, jpg) not exceeding 5MB." OnServerValidate="FileValidator_ServerValidate" Display="Dynamic" ForeColor="Red" />
                </div>

                <div class="row p-1">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                </div>
                <asp:Button ID="btnSubmit" runat="server" ClientIDMode="static" CssClass="btn btn-primary mt-3" OnClick="btnSubmit_Click"
                    Text="Submit" />
            </div>
        </div>
    </div>
    <br />

    <br />
</asp:Content>
