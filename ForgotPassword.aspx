<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="SianemaCinemaTicketingSystem.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SIA NEMA - Forgot Password</title>
    <link rel="stylesheet" href="./css/forgotPassword.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="forgot-password">
        <div class="content-wrapper">
            <div class="row">
                <section class="forgot-password-block">
                    <span class="login-key"></span>
                    <form runat="server">
                        <div class="forgot-password-fields">
                            <div class="description">
                                <h2>Password Reset</h2>
                                <p>Please enter your registered email address and we will send you a link to reset your password.</p>
                            </div>
                            <div class="form-group email-field">
                                <label for="email">Email address<span>*</span></label>
                                <asp:TextBox ID="Email" runat="server" CssClass="form-control" aria-describedby="emailHelp" type="email" placeholder="Enter email"></asp:TextBox>
                            </div>
                            <div class="send-reset-btn mb-5">
                                <asp:Button ID="SendResetButton" runat="server" Text="SEND RESET EMAIL" CssClass="btn btn-primary send-reset-btn" title="SEND RESET EMAIL" />
                            </div>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
