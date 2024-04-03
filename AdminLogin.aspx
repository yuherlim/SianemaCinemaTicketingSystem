<%@ Page Title="" Language="C#" MasterPageFile="~/MPA.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="SianemaCinemaTicketingSystem.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/admin/adminLogin.css">
    <script defer type="text/javascript" src="js/admin/adminLogin.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card card-fluid">
            <div id="row1" class="card-header row">
                <span class="row1Space">Login</span>
            </div>


            <div id="row2" class="row">
                <section class="login-block">
                    <span class="login-key"></span>
                    <div class="login-fields">

                        <form runat="server">
                            <div class="form-group username-field">
                                <label for="email">Username<span>*</span></label>
                                <%--<input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">--%>
                                <asp:TextBox ID="Email" runat="server" CssClass="form-control" aria-describedby="userNameHelp" type="text" placeholder="Enter username"></asp:TextBox>
                            </div>

                            <div class="form-group password-field">
                                <label for="password">Password<span>*</span></label>
                                <div class="input-group">
                                    <%--<input type="password" class="form-control" id="password" placeholder="Password">--%>
                                    <asp:TextBox ID="Password" runat="server" CssClass="form-control" type="password" placeholder="Password"></asp:TextBox>
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <a href="#"><i class="fa fa-eye-slash show-hide-password" aria-hidden="true"></i></a>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-check mb-5">
                                <%--<input type="checkbox" class="form-check-input" id="rememberMe">--%>
                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember Me" />
                                <%--<label class="form-check-label" for="rememberMe">Remember Me</label>--%>
                            </div>


                            <div class="btn-group">
                                <div class="login-btn-row mb-5">
                                    <%--<button type="submit" class="btn btn-primary login-btn" title="LOGIN">LOGIN</button>--%>
                                    <%--<asp:Button ID="LoginButton" runat="server" Text="LOGIN" CssClass="btn btn-primary login-btn" title="LOGIN" href="HallTimeSlot.aspx" />--%>
                                    <a class="btn btn-primary login-btn" href="HallTimeSlot.aspx" >Login</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Js" runat="server">
</asp:Content>
