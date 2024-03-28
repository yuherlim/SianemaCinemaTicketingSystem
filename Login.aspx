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
                        <%--<div class="username-field">
                            <label for="email">Email ID</label>
                            <input type="email" name="email" id="email" required>
                            <span class="input-border"></span>
                        </div>--%>

                        <%--<div class="password-field">
                            <label for="password">Password<span>*</span></label>
                            <input type="password" name="password" id="password" required>
                            <i class="show-password"></i>
                            <span class="input-border"></span>
                        </div>--%>

                        <%--<div class="remember-me-field">
                            <input type="checkbox" name="rememberMe" id="rememberMe">
                            <label for="rememberMe"></label>
                        </div>--%>

                        <form>
                            <div class="form-group username-field">
                                <label for="email">Email address<span>*</span></label>
                                <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                            <div class="form-group password-field">
                                <label for="password">Password</label>
                                <div class="input-group">
                                    <input type="password" class="form-control" id="password" placeholder="Password">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <a href="#"><i class="fa fa-eye-slash show-hide-password" aria-hidden="true"></i></a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-check mb-3">
                                <input type="checkbox" class="form-check-input" id="rememberMe">
                                <label class="form-check-label" for="rememberMe">Remember Me</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Login</button>
                        </form>

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

<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script type="text/javascript" src="./js/login.js"></script>
</asp:Content>
