<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SianemaCinemaTicketingSystem.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SIA NEMA - Login</title>
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

                        <form>
                            <div class="form-group username-field">
                                <label for="email">Email address<span>*</span></label>
                                <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>

                            <div class="form-group password-field">
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

                            <div class="form-check mb-5">
                                <input type="checkbox" class="form-check-input" id="rememberMe">
                                <label class="form-check-label" for="rememberMe">Remember Me</label>
                            </div>

                            <div class="btn-group">
                                <div class="login-btn-row mb-5">
                                    <button type="submit" class="btn btn-primary login-btn" title="LOGIN">LOGIN</button>
                                    <a href="#" class="forget-password" title="Forgot Password?">Forgot Password?</a>
                                </div>
                                <h5 class="new-to-sianema-title mb-3">New to <span>SIA NEMA?</span></h5>
                                <div class="join-now-btn">
                                    <a class="btn btn-outline-primary join-now" href="#" title="JOIN NOW" role="button">JOIN NOW</a>
                                </div>
                            </div>
                        </form>
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
