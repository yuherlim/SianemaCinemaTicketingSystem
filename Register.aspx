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
                    <div class="form-row email-field">
                        <div class="col">
                            <label for="email">Email address<span>*</span></label>
                            <input type="text" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                        </div>
                        <div class="col">
                            <label for="mobileNumber">Mobile Number<span>*</span></label>
                            <input type="text" class="form-control" id="mobileNumber" placeholder="Enter mobile number">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col">
                            <label for="password">Password<span>*</span></label>
                            <input type="text" class="form-control" id="password" placeholder="Password">
                        </div>
                        <div class="col">
                            <label for="retypePassword">Password<span>*</span></label>
                            <input type="text" class="form-control" id="retypePassword" placeholder="Retype password">
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
