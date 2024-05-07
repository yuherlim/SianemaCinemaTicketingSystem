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
                        <form runat="server">
                            <asp:Login ID="Login" runat="server">
                                <LayoutTemplate>
                                    <div class="form-group username-field">
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="UserName">Email address<span>
                                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Email is required." ToolTip="Email is required." Display="Dynamic" ValidationGroup="Login">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server" ControlToValidate="UserName" ErrorMessage="Invalid email format." ToolTip="Invalid email format." Display="Dynamic" ValidationGroup="Login" ValidationExpression="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$">*</asp:RegularExpressionValidator>
                                        </span></asp:Label>
                                        <%--<asp:Label ID="EmailLabel" runat="server" AssociatedControlID="UserName">Email address<span>*</span></asp:Label>--%>
                                        <%--<label for="email">Email address<span>*</span></label>--%>
                                        <%--<input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">--%>

                                        <%--TextBox ID had to remain "UserName" in order to use the asp.net membership service provider login control.--%>
                                        <asp:TextBox ID="UserName" runat="server" CssClass="form-control" aria-describedby="emailHelp" type="email" placeholder="Enter email"></asp:TextBox>

                                        <%--<asp:TextBox ID="UserName" runat="server"></asp:TextBox>--%>
                                    </div>

                                    <div class="form-group password-field">
                                        <%--<label for="password">Password<span>*</span></label>--%>
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password<span>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." Display="Dynamic" ValidationGroup="Login">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="PasswordRegularExpression" runat="server" ControlToValidate="Password" ErrorMessage="Password must be at least 8 characters" ValidationExpression=".{8,}" ValidationGroup="Login">*</asp:RegularExpressionValidator>
                                        </span></asp:Label>
                                        <%--<asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password<span>*</span></asp:Label>--%>
                                        <div class="input-group">
                                            <%--<input type="password" class="form-control" id="password" placeholder="Password">--%>
                                            <%--<asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>--%>
                                            <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" type="password" placeholder="Password"></asp:TextBox>
                                            <div class="input-group-append">
                                                <span class="input-group-text">
                                                    <a href="#"><i class="fa fa-eye-slash show-hide-password" aria-hidden="true"></i></a>
                                                </span>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-check mb-2">
                                        <%--<input type="checkbox" class="form-check-input" id="rememberMe">--%>
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember Me" />
                                        <%--<label class="form-check-label" for="rememberMe">Remember Me</label>--%>
                                    </div>

                                    <div class="login-validation-msg">
                                        <asp:ValidationSummary ID="ValidationSummary" runat="server" ValidationGroup="Login" />
                                    </div>

                                    <div class="btn-group">
                                        <div class="login-btn-row mb-5">
                                            <%--<button type="submit" class="btn btn-primary login-btn" title="LOGIN">LOGIN</button>--%>
                                            <%--<asp:Button ID="LoginButton" runat="server" Text="LOGIN" CssClass="btn btn-primary login-btn" title="LOGIN" />--%>
                                            <asp:Button ID="LoginButton" runat="server" Text="LOGIN" CssClass="btn btn-primary login-btn" title="LOGIN" CommandName="Login" ValidationGroup="Login" />
                                            <a href="./ForgotPassword.aspx" class="forget-password" title="Forgot Password?">Forgot Password?</a>
                                        </div>

                                        <h5 class="new-to-sianema-title mb-3">New to <span>SIA NEMA?</span></h5>
                                        <div class="join-now-btn">
                                            <a class="btn btn-outline-primary join-now" href="Register.aspx" title="JOIN NOW" role="button">JOIN NOW</a>
                                        </div>
                                    </div>
                                </LayoutTemplate>
                            </asp:Login>
                        </form>
                    </div>
                </section>
                <section class="image-block">
                    <div class="testing-image">
                        <img src="./images/login/login-image-sianema.png" alt="Welcome to Sia Nema">
                    </div>
                </section>
            </div>
        </div>
    </main>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script type="text/javascript" src="./js/login.js"></script>
</asp:Content>
