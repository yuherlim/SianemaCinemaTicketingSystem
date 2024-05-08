<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="TestLogin.aspx.cs" Inherits="SianemaCinemaTicketingSystem.TestLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <asp:Login ID="LoginSianema" runat="server" DestinationPageUrl="~/TestLogin.aspx"></asp:Login>
        <asp:LoginView ID="LoginViewSianema" runat="server"></asp:LoginView>
        <asp:LoginName ID="LoginNameSianema" runat="server" />
        <asp:LoginStatus ID="LoginStatusSianema" runat="server" />
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
