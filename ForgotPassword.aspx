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
                    <div class="forgot-password-fields">
                        <div class="description">
                            <h2>Password Reset</h2>
                            <p>Please enter your registered email address and we will ask you your security question.</p>
                        </div>
                        <div class="form-group email-field">
                            <label for="email">
                                Email address<span>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="Email is required." ToolTip="Email is required." Display="Dynamic" ValidationGroup="ResetPassword">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server" ControlToValidate="Email" ErrorMessage="Invalid email format." ToolTip="Invalid email format." Display="Dynamic" ValidationGroup="ResetPassword" ValidationExpression="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$">*</asp:RegularExpressionValidator>
                                    <asp:CustomValidator ID="EmailValidator" runat="server" OnServerValidate="EmailValidator_ServerValidate" ErrorMessage="Error: Email does not exist. Try registering a new account." Display="Dynamic" ValidationGroup="ResetPassword">*</asp:CustomValidator>
                                </span>
                            </label>
                            <asp:TextBox ID="Email" runat="server" CssClass="form-control" aria-describedby="emailHelp" type="email" placeholder="Enter email"></asp:TextBox>
                        </div>
                        <asp:ValidationSummary ID="ValidationSummary" runat="server" ValidationGroup="ResetPassword" />
                        <div class="send-reset-btn mb-5">
                            <asp:Button ID="RequestResetButton" runat="server" Text="REQUEST RESET PASSWORD" CssClass="btn btn-primary send-reset-btn" title="REQUEST RESET PASSWORD" ValidationGroup="ResetPassword" OnClick="ResetButton_Click" />
                        </div>

                        <div id="SecurityQuestion" class="form-group security-field" runat="server">
                            <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer<span>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." Display="Dynamic" ValidationGroup="Answer">*</asp:RequiredFieldValidator>
                            </span></asp:Label>
                            <%--<label for="email">Email address<span>*</span></label>--%>
                            <%--<input type="text" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">--%>
                            <asp:TextBox ID="Answer" runat="server" CssClass="form-control" placeholder="Enter security answer"></asp:TextBox>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Answer" />
                            <div class="send-reset-btn mb-5 mt-2">
                                <asp:Button ID="ResetButton" runat="server" Text="RESET PASSWORD" CssClass="btn btn-primary send-reset-btn" title="RESET PASSWORD" ValidationGroup="Answer" OnClick="ResetPasswordButton_Click" />
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
