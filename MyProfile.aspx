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
                <form runat="server">
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
                                    <label for="name">Name<span>*</span></label>
                                    <%--<input type="text" class="form-control" id="name" placeholder="" value="User 1">--%>
                                    <asp:TextBox ID="Username" runat="server" CssClass="form-control" type="text" placeholder="" value="User 1"></asp:TextBox>
                                </div>

                                <div class="col gender-field">
                                    <p class="gender-field-title">Gender<span>*</span></p>
                                    <asp:RadioButtonList ID="GenderRadioButtonList" runat="server">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <%--<div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gender" id="inlineRadioMale" value="male">
                <label class="form-check-label" for="inlineRadioMale">Male</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gender" id="inlineRadioFemale" value="female">
                <label class="form-check-label" for="inlineRadioFemale">Female</label>
            </div>--%>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col address-field">
                                    <label for="address">Address<span>*</span></label>
                                    <%--<input type="text" class="form-control" id="address" placeholder="">--%>
                                    <asp:TextBox ID="Address" runat="server" CssClass="form-control" type="text" placeholder=""></asp:TextBox>
                                </div>
                                <div class="col">
                                    <label for="state">State</label>
                                    <asp:DropDownList ID="StateDropDownList" runat="server" CssClass="form-control">
                                        <asp:ListItem Selected="True">Select the state</asp:ListItem>
                                        <asp:ListItem>...</asp:ListItem>
                                    </asp:DropDownList>
                                    <%--<select id="state" class="form-control">
                <option selected>Select the state</option>
                <option>...</option>
            </select>--%>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col email-field">
                                    <label for="email">Email address<span>*</span></label>
                                    <%--<input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="">--%>
                                    <asp:TextBox ID="Email" runat="server" CssClass="form-control" aria-describedby="emailHelp" type="email" placeholder=""></asp:TextBox>
                                </div>
                                <div class="col mobile-number-field">
                                    <label for="mobileNumber">Mobile Number<span>*</span></label>
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
                        </div>
                    </div>
                    <div class="save-changes">
                        <div class="save-btn-container">
                            <%--<a class="btn btn-primary save-btn" href="#" title="SAVE CHANGES" role="button">SAVE CHANGES</a>--%>
                            <asp:Button ID="SaveChangesButton" runat="server" Text="SAVE CHANGES" CssClass="btn btn-primary save-btn" title="SAVE CHANGES" />
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script type="text/javascript" src="./js/userAccount.js"></script>
    <script type="text/javascript" src="./js/myProfile.js"></script>
</asp:Content>
