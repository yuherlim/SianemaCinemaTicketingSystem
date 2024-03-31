<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SianemaCinemaTicketingSystem.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SIA NEMA - Register</title>
    <link rel="stylesheet" href="./css/register.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="register">
        <div class="content-wrapper">
            <section class="title-row">
                <div class="register-title-block">
                    <span class="register-key"></span>
                    <h2>Register</h2>
                </div>
            </section>
            <section class="register-fields-row">
                <form>
                    <div class="field-group">
                        <div class="row">
                            <div class="col email-field">
                                <label for="email">Email address<span>*</span></label>
                                <input type="text" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                            <div class="col mobile-number-field">
                                <label for="mobileNumber">Mobile Number<span>*</span></label>
                                <input type="tel" class="form-control" id="mobileNumber" placeholder="Enter mobile number">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col password-field">
                                <label for="password">Password<span>*</span></label>
                                <div class="input-group">
                                    <input type="password" class="form-control" id="password" placeholder="Password">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <a href="#"><i class="fa fa-eye-slash show-hide-password" aria-hidden="true"></i></a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col confirm-password-field">
                                <label for="retypePassword">Retype Password<span>*</span></label>
                                <div class="input-group">
                                    <input type="password" class="form-control" id="retypePassword" placeholder="Retype password">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <a href="#"><i class="fa fa-eye-slash show-hide-password" aria-hidden="true"></i></a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="password-info-block">
                        <h3 class="password-info-title">Password Must:</h3>
                        <ul class="password-info">
                            <li>Contain minimum 8 characters.</li>
                            <li>Include at least one number and symbol.</li>
                            <li>Include both lower and upper case letters.</li>
                        </ul>
                    </div>

                    <div class="btn-group">
                        <div class="register-btn-container">
                            <button type="submit" class="btn btn-primary register-btn" title="REGISTER">REGISTER</button>
                        </div>
                        <p>Already Member?</p>
                        <div class="login-btn-container">
                            <a class="btn btn-outline-primary login-btn" href="Login.aspx" title="LOGIN" role="button">LOGIN</a>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script type="text/javascript" src="./js/register.js"></script>
</asp:Content>
