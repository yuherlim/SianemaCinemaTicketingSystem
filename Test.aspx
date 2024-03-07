<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="SianemaCinemaTicketingSystem.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtTest" runat="server" AutoPostBack="True" OnTextChanged="txtTest_TextChanged"></asp:TextBox>
        </div>
        <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
