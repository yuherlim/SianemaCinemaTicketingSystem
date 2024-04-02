<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="SianemaCinemaTicketingSystem.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
     $(document).ready(function () {
         $('#datepicker').datepicker({
             format: 'yyyy-mm-dd'
         });
     });
    </script>

    <style>
        .cu-label {
            margin: auto;
            padding: 10px;
            color: var(--white);
            font-size: 18px;
        }

        .hr-white {
            border-color: var(--white);
        }

        .custom-file-label::after {
            color: var(--gray); /* Set color of "Choose file" text */
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <img src="cu.png" alt="photo of contactus" width="100%" height="400">
    </div>

    <div class="container">

        <div class="row justify-content-center">
            <div class="col-md-6">

                <form id="form1" runat="server">
                    <div class="form-row align-items-center">

                        <br />
                        <h4 class="heading4">Submit a Ticket</h4>
                        <br />
                        <br />

                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control mb-2" Width="100%">
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

                        <label class="cu-label" for="datepicker">Occur Date :</label>
                        <%--<input type="text" class="form-control mb-2" id="datepicker" placeholder="YYYY-MM-DD">--%>
                        <asp:TextBox ID="OccurDate" runat="server" CssClass="form-control mb-2" TextMode="Date" placeholder="YYYY-MM-DD"></asp:TextBox>

                        <label class="cu-label" for="inlineFormInput">Contact Name :</label>
                        <%--<input type="text" class="form-control mb-2" id="inlineFormInput" placeholder="Sia Yeong Sheng">--%>
                        <asp:TextBox ID="ContactName" runat="server" CssClass="form-control mb-2" type="text" placeholder="Sia Yeong Sheng"></asp:TextBox>

                        <label for="inputEmail3" class="cu-label">Email :</label>
                        <%--<input type="email" class="form-control" id="inputEmail" placeholder="siasia@gmail.com">--%>
                        <asp:TextBox ID="Email" runat="server" CssClass="form-control" type="email" placeholder="siasia@gmail.com"></asp:TextBox>

                        <label class="cu-label" for="typePhone">Contact Number : </label>
                        <%--<input type="tel" id="typePhone" class="form-control" />--%>
                        <asp:TextBox ID="ContactNumber" runat="server" CssClass="form-control" type="tel"></asp:TextBox>

                        <label for="comment" class="cu-label">Description :</label>
                        <%--<textarea class="form-control" id="comment" rows="3"></textarea>--%>
                        <asp:TextBox ID="Comment" runat="server" CssClass="form-control" type="text" TextMode="MultiLine" rows="3"></asp:TextBox>

                        <div class="custom-file">
                            <label class="custom-file-label" for="customFile">Choose file</label>
                            <%--<input type="file" class="custom-file-input" id="customFile">--%>
                            <asp:FileUpload ID="CustomFile" runat="server" CssClass="custom-file-input" />
                        </div>
                    </div>
                    <%--<button type="submit" class="btn btn-primary mt-3">Submit</button>--%>
                    <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="btn btn-primary mt-3"/>
                </form>
            </div>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
