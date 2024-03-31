<%@ Page Title="" Language="C#" MasterPageFile="~/UserAccount.master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="SianemaCinemaTicketingSystem.MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SIA NEMA - My Profile</title>
    <link rel="stylesheet" href="./css/myProfile.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main class="my-profile">
        <div class="content-wrapper">
            <section class="my-profile-container">
                <h6>My Profile</h6>
                <form>
                    <div class="profile-pic-block">
                        <img src="./images/myProfile/default-profile-pic.png" alt="Profile Picture">
                        <div class="upload-photo-container">
                            <label for="">Upload Photo</label>
                            <div class="upload-photo-btn-container">
                                <input type="file" id="fileUpload">
                            </div>
                        </div>
                    </div>
                    <div class="field-group">
                        <div class="row">
                            <div class="col name-field">
                                <label for="name">Name<span>*</span></label>
                                <input type="text" class="form-control" id="name" placeholder="">
                            </div>

                            <div class="col gender-field">
                                <p class="gender-field-title">Gender<span>*</span></p>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="inlineRadioMale" value="male">
                                    <label class="form-check-label" for="inlineRadioMale">Male</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="inlineRadioFemale" value="female">
                                    <label class="form-check-label" for="inlineRadioFemale">Female</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col address-field">
                                <label for="address">Address<span>*</span></label>
                                <input type="text" class="form-control" id="address" placeholder="">
                            </div>
                            <div class="col">
                                <label for="state">State</label>
                                <select id="state" class="form-control">
                                    <option selected>Select the state</option>
                                    <option>...</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col email-field">
                                <label for="email">Email address<span>*</span></label>
                                <input type="text" class="form-control" id="email" aria-describedby="emailHelp" placeholder="">
                            </div>
                            <div class="col mobile-number-field">
                                <label for="mobileNumber">Mobile Number<span>*</span></label>
                                <input type="tel" class="form-control" id="mobileNumber" placeholder="">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 birthdate-field">
                                <label for="birthdate">Date of Birth<span>*</span></label>
                                <input type="date" class="form-control" id="birthdate" placeholder="">
                            </div>
                        </div>
                    </div>

                </form>
            </section>

            <section class="save-changes">
                <div class="save-btn-container">
                    <a class="btn btn-primary save-btn" href="#" title="SAVE CHANGES" role="button">SAVE CHANGES</a>
                </div>
            </section>
        </div>

    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script type="text/javascript" src="./js/userAccount.js"></script>
</asp:Content>
