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
                <form runat="server">
                    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                                <ContentTemplate>
                                    <div class="field-group">
                                        <div class="row">

                                            <td align="right"></td>
                                            <td></td>

                                            <div class="col username-field">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name<span>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." Display="Dynamic" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </span></asp:Label>

                                                <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="Enter email"></asp:TextBox>

                                            </div>

                                            <div class="col email-field">
                                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Email address<span>
                                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." Display="Dynamic" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </span></asp:Label>
                                                <%--<label for="email">Email address<span>*</span></label>--%>
                                                <%--<input type="text" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">--%>

                                                <asp:TextBox ID="Email" runat="server" CssClass="form-control" aria-describedby="emailHelp" type="email" placeholder="Enter email"></asp:TextBox>
                                            </div>
                                            <div class="col mobile-number-field">
                                                <%--<label for="mobileNumber">Mobile Number<span>*</span></label>--%>
                                                <asp:Label ID="MobileNumberLabel" runat="server" AssociatedControlID="MobileNumber">Mobile Number<span>
                                                    <asp:RequiredFieldValidator ID="MobileNumberRequired" runat="server" ControlToValidate="MobileNumber" ErrorMessage="Mobile number is required." ToolTip="Mobile number is required." Display="Dynamic" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </span></asp:Label>
                                                <%--<input type="tel" class="form-control" id="mobileNumber" placeholder="Enter mobile number">--%>
                                                <asp:TextBox ID="MobileNumber" runat="server" CssClass="form-control" type="tel" placeholder="Enter mobile number"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col password-field">
                                                <%--<label for="password"></label>--%>
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password<span>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." Display="Dynamic" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </span></asp:Label>
                                                <div class="input-group">
                                                    <%--<input type="password" class="form-control" id="password" placeholder="Password">--%>
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control" type="password" placeholder="Password"></asp:TextBox>

                                                    <%--<asp:TextBox ID="Password" runat="server" CssClass="form-control" type="password" placeholder="Password"></asp:TextBox>--%>
                                                    <div class="input-group-append">
                                                        <span class="input-group-text">
                                                            <a href="#"><i class="fa fa-eye-slash show-hide-password" aria-hidden="true"></i></a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col confirm-password-field">
                                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Retype Password<span>
                                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." Display="Dynamic" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </span></asp:Label>
                                                <%--<label for="retypePassword">Retype Password<span>*</span></label>--%>
                                                <div class="input-group">
                                                    <%--<input type="password" class="form-control" id="retypePassword" placeholder="Retype password">--%>
                                                    <%--<asp:TextBox ID="RetypePassword" runat="server" CssClass="form-control" type="password" placeholder="Retype password"></asp:TextBox>--%>
                                                    <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="form-control" type="password" placeholder="Retype password" TextMode="Password"></asp:TextBox>

                                                    <div class="input-group-append">
                                                        <span class="input-group-text">
                                                            <a href="#"><i class="fa fa-eye-slash show-hide-password" aria-hidden="true"></i></a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col security-question-field">
                                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question<span>
                                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." Display="Dynamic" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </span></asp:Label>
                                                <%--<label for="email">Email address<span>*</span></label>--%>
                                                <%--<input type="text" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">--%>
                                                <asp:TextBox ID="Question" runat="server" CssClass="form-control" placeholder="Enter security question"></asp:TextBox>
                                            </div>
                                            <div class="col security-answer-field">
                                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer<span>
                                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." Display="Dynamic" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </span></asp:Label>
                                                <%--<label for="email">Email address<span>*</span></label>--%>
                                                <%--<input type="text" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">--%>
                                                <asp:TextBox ID="Answer" runat="server" CssClass="form-control" placeholder="Enter security answer"></asp:TextBox>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="password-info-block">
                                        <h3 class="password-info-title">Password Must:</h3>
                                        <ul class="password-info">
                                            <li>Contain minimum 8 characters.</li>
                                            <li>Include at least one number and symbol.</li>
                                            <li>Include both lower and upper case letters.</li>
                                            <li>
                                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator></li>
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="CreateUserWizard1" />
                                        </ul>
                                    </div>

                                    <div class="btn-group">
                                        <div class="register-btn-container">
                                            <%--<button type="submit" class="btn btn-primary register-btn" title="REGISTER">REGISTER</button>--%>
                                            <%--<asp:Button ID="RegisterButton" runat="server" Text="REGISTER" CssClass="btn btn-primary register-btn" title="REGISTER" ValidationGroup="CreateUserWizard1" />--%>
                                            <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="REGISTER" CssClass="btn btn-primary register-btn" title="REGISTER" ValidationGroup="CreateUserWizard1" />
                                        </div>
                                        <p>Already Member?</p>
                                        <div class="login-btn-container">
                                            <a class="btn btn-outline-primary login-btn" href="Login.aspx" title="LOGIN" role="button">LOGIN</a>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>

                </form>
            </section>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script type="text/javascript" src="./js/register.js"></script>
</asp:Content>
