<%@ Page Title="" Language="C#" MasterPageFile="~/UserAccount.master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="SianemaCinemaTicketingSystem.MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SIA NEMA - My Profile</title>
    <link rel="stylesheet" href="./css/myProfile.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main class="my-profile">
        <div class="content-wrapper">
            <section class="my-profile-container">
                <h4>My Profile</h4>

                <div class="my-profile-fields">
                    <div class="profile-pic-block">
                        <img src="./images/myProfile/default-profile-pic.png" alt="Profile Picture">
                        <div class="upload-photo-container">
                            <label for="">Upload Photo</label>
                            <div class="upload-photo-btn-container">
                                <%--<input type="file" id="fileUpload">--%>
                                <asp:FileUpload ID="ProfilePhotoUpload" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="field-group">
                        <div class="row">
                            <div class="col name-field">
                                <label for="name">
                                    Name<span>
                                        <asp:RequiredFieldValidator ID="UserNameRequiredField" runat="server" ControlToValidate="Username" ErrorMessage="Username is required." ToolTip="Username is required." Display="Dynamic" ValidationGroup="MyProfile" SetFocusOnError="False">*</asp:RequiredFieldValidator>
                                    </span>
                                </label>
                                <%--<input type="text" class="form-control" id="name" placeholder="" value="User 1">--%>
                                <asp:TextBox ID="Username" runat="server" CssClass="form-control" type="text" placeholder=""></asp:TextBox>
                            </div>

                            <%--<div class="col gender-field">
                                <p class="gender-field-title">Gender<span>*</span></p>
                                <asp:RadioButtonList ID="GenderRadioButtonList" runat="server">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>--%>
                            <%--<div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gender" id="inlineRadioMale" value="male">
                <label class="form-check-label" for="inlineRadioMale">Male</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gender" id="inlineRadioFemale" value="female">
                <label class="form-check-label" for="inlineRadioFemale">Female</label>
            </div>--%>
                        </div>
                        <%--<input type="text" class="form-control" id="address" placeholder="">--%>
                        <%--<div class="row">
                            <div class="col address-field">
                                <label for="address">Address<span>*</span></label>
                                <asp:TextBox ID="Address" runat="server" CssClass="form-control" type="text" placeholder=""></asp:TextBox>
                            </div>
                            <div class="col">
                                <label for="state">State</label>
                                <asp:DropDownList ID="StateDropDownList" runat="server" CssClass="form-control">
                                    <asp:ListItem Selected="True">Select the state</asp:ListItem>
                                    <asp:ListItem>...</asp:ListItem>
                                </asp:DropDownList>
                               
                            </div>
                        </div>--%>
                        <%--<select id="state" class="form-control">
    <option selected>Select the state</option>
    <option>...</option>
</select>--%>
                        <div class="row">
                            <div class="col email-field">
                                <label for="email">
                                    Email address<span>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." Display="Dynamic" ValidationGroup="MyProfile" SetFocusOnError="False">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server" ControlToValidate="Email" ErrorMessage="Invalid email format." ToolTip="Invalid email format." Display="Dynamic" ValidationGroup="MyProfile" ValidationExpression="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$">*</asp:RegularExpressionValidator>
                                        <asp:CustomValidator ID="EmailDuplicateValidator" runat="server" OnServerValidate="EmailDuplicateValidator_ServerValidate" ErrorMessage="Error: Email already exists." Display="Dynamic" ValidationGroup="MyProfile">*</asp:CustomValidator>
                                    </span>
                                </label>
                                <%--<input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="">--%>
                                <asp:TextBox ID="Email" runat="server" CssClass="form-control" aria-describedby="emailHelp" type="email" placeholder=""></asp:TextBox>
                            </div>
                            <div class="col mobile-number-field">
                                <label for="mobileNumber">
                                    Mobile Number<span>
                                        <asp:RequiredFieldValidator ID="MobileNumberRequired" runat="server" ControlToValidate="MobileNumber" ErrorMessage="Mobile number is required." ToolTip="Mobile number is required." Display="Dynamic" ValidationGroup="MyProfile">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="PhoneNumberValidator" runat="server" ControlToValidate="MobileNumber"
                                            ErrorMessage="Please enter a valid phone number in the format 01XXXXXXXX or 01XXXXXXXXX."
                                            ValidationExpression="^01\d{8,9}$" Display="Dynamic" ValidationGroup="MyProfile">*</asp:RegularExpressionValidator>
                                    </span>
                                </label>
                                <%--<input type="tel" class="form-control" id="mobileNumber" placeholder="">--%>
                                <asp:TextBox ID="MobileNumber" runat="server" CssClass="form-control" type="tel" placeholder=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 birthdate-field">
                                <label for="birthdate">Date of Birth<span>*</span></label>
                                <%--<input type="date" class="form-control" id="birthdate" placeholder="">--%>
                                <asp:TextBox ID="BirthDate" runat="server" CssClass="form-control" TextMode="Date" placeholder=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="myProfile-validation-msg">
                            <asp:ValidationSummary ID="MyProfileValidationSummary" runat="server" ValidationGroup="MyProfile" HeaderText="Note: " />
                        </div>
                    </div>
                </div>
                <div class="save-changes">
                    <div class="save-btn-container">
                        <%--<a class="btn btn-primary save-btn" href="#" title="SAVE CHANGES" role="button">SAVE CHANGES</a>--%>
                        <asp:Button ID="SaveChangesButton" runat="server" Text="SAVE CHANGES" CssClass="btn btn-primary save-btn" title="SAVE CHANGES" ValidationGroup="MyProfile" OnClick="SaveChangesButton_Click" />
                    </div>
                </div>

            </section>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script type="text/javascript" src="./js/userAccount.js"></script>
    <script type="text/javascript" src="./js/myProfile.js"></script>
</asp:Content>
