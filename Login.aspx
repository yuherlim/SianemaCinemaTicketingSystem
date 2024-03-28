<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SianemaCinemaTicketingSystem.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sia nema - Login</title>
    <link rel="stylesheet" href="./css/login.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <main class="login">
        <div class="content-wrapper">
            <div class="row">
                <section class="login-block">
                    <span class="login-key"></span>
                    <div class="login-fields">
                        <h4>Welcome back!</h4>
                        <div class="username-field">
                            <label for="email">Email ID<span>*</span></label>
                            <input type="email" name="email" id="email" required>
                            <span class="input-border"></span>
                        </div>

                        <div class="password-field">
                            <label for="password">Password<span>*</span></label>
                            <input type="password" name="password" id="password" required>
                            <i class="show-password"></i>
                            <span class="input-border"></span>
                        </div>

                        <div class="remember-me-field">
                            <input type="checkbox" name="rememberMe" id="rememberMe">
                            <label for="rememberMe"></label>
                        </div>

                        <div class="btn-group">
                            <div class="login-btn-row">
                                <button type="submit" class="login-btn" title="LOGIN">LOGIN</button>
                                <a href="#" class="forget-password" title="Forgot Password?">Forgot Password?</a>
                            </div>
                            <h5 class="new-to-sianema-title">New to <span>Sia Nema?</span></h5>
                            <div class="join-now-btn">
                                <a href="#" class="join-now" title="JOIN NOW">JOIN NOW</a>
                            </div>
                        </div>

                    </div>
                </section>
                <section class="image-block">
                    <div class="testing-image">
                        <img src="./images/login/login-image-sianema.png" alt="placeholder">
                    </div>
                </section>
            </div>
        </div>
    </main>

</asp:Content>
