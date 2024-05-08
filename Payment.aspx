<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="SianemaCinemaTicketingSystem.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SIA NEMA - Payment</title>
    <style>
        body {
            padding-top: 0px;
        }

        .navbar {
            display: none;
        }

        .movie-seat-selection-navbar {
            display: flex;
            background: black;
            padding-top: 20px;
            justify-content: center;
            position: relative;
        }

        .top-nav-logo {
            position: absolute;
            left: 10%;
        }

        .movie-seat-selection-container {
            width: 70%;
        }

        .movie-seat-selection-header {
            display: flex;
            flex-direction: column;
            margin: 0;
            justify-content: center;
        }

        .movie-seat-selection-header h3 {
            text-align: center;
            font-weight: 1000;
        }

        .movie-seat-hall-time {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .icon-image {
            margin: 0 5px;
        }

        .payment-container {
            padding: 50px 0px;
            background: #1d1d1d;
        }

        .payment-body, .credit-debit-card-container {
            margin: 0 auto;
            max-width: 60%;
            background: black;
            margin-top: 20px;
            padding: 20px;
        }

        .ticket-header {
            color: var(--green);
            font-weight: 500;
        }

        table, th, td {
            border: 2px solid white;
            border-collapse: collapse;
        }

        table {
            width: 100%;
        }

        .auto-style1, .auto-style2, .auto-style3 {
            padding: 5px 10px;
            width: 30%
        }

        .total-payment-botnav {
            background: black;
            margin-top: 50px;
            padding: 40px 0;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .total-amount {
            text-align: center;
            margin-bottom: 20px;
        }


        .pay-button {
            padding: 10px 20px;
        }

        .card-details-fill-container {
            width: 50%;
            margin: 0 auto;
            padding-top: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
        }

        .form-control:focus {
            border-color: var(--green);
            box-shadow: 0 0 0 0.2rem rgb(0 255 29 / 25%);
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form class="form1" runat="server">
        <div class="movie-seat-selection-navbar">
            <div class="movie-seat-selection-container">
                <img src="logoSianema.png" alt="Logo" width="160" height="60" class="top-nav-logo">
                <div class="movie-seat-selection-header">
                    
                    <h3 id="movieName" runat="server" /> 
                    <div class="movie-seat-hall-time">
                        <img src="./images/cinemaIcon/hall.png" width="20" height="20" class="icon-image" />

                        <p id="hallNum" runat="server" />
                        <img src="./images/cinemaIcon/date.png" width="20" height="20" class="icon-image" />

                        <p id="movieDate" runat="server" />
                        <img src="./images/cinemaIcon/time.png" width="20" height="20" class="icon-image" />

                        <p id="movieTime" runat="server" />
                        <img src="./images/cinemaIcon/seat.png" width="20" height="20" class="icon-image" />

                        <p id="seatsId" runat="server" />
                    </div>
                </div>
            </div>
        </div>


        <section class="payment-container">
            <div class="payment-body">
                <h1 id="Payment-Header">Payment Option</h1>
            </div>


            <div class="credit-debit-card-container">
                <div class="credit-debit-card-details">
                    <h3 id="Purchase-Details">Purchase Details</h3>
                    <p class="ticket-header">TICKETS</p>
                    <table class="payment-table">
                        <tr>
                            <td class="auto-style1" runat="server">SINGLE</td>
                            <td class="auto-style2" id="SingleSeatNumber" runat="server" />
                            <td class="auto-style3" id="SingleSeatPrice">RM 15</td> />
                            <td class="auto-style4" id="SingleSeatAmount" runat="server" />
                        </tr>
                        <tr>
                            <td class="auto-style1" runat="server">Sub Total</td>
                            <td class="auto-style2" runat="server">&nbsp;</td>
                            <td class="auto-style3" runat="server">&nbsp;</td>
                            <td class="auto-style4" id="SubTotal" runat="server" />
                        </tr>
                        <tr>
                            <td class="auto-style1">Processing Fee</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style3">RM 1.00</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Total</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style3" id="Total" runat="server" />
                        </tr>
                    </table>

                </div>

            </div>

            <div class="card-details-fill-container">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server">Name On Card</asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblCardNumber" runat="server">Card Number</asp:Label>
                    <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control" MaxLength="16" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblCVV" runat="server">CVV</asp:Label>
                    <asp:TextBox ID="txtCVV" runat="server" CssClass="form-control" MaxLength="3" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="LabelExpired" runat="server">Expired Date</asp:Label>
                    <asp:DropDownList ID="DropDownListMonth" runat="server">
                        <asp:ListItem Value="1">01</asp:ListItem>
                        <asp:ListItem Value="2">02</asp:ListItem>
                        <asp:ListItem Value="3">03</asp:ListItem>
                        <asp:ListItem Value="4">04</asp:ListItem>
                        <asp:ListItem Value="5">05</asp:ListItem>
                        <asp:ListItem Value="6">06</asp:ListItem>
                        <asp:ListItem Value="7">07</asp:ListItem>
                        <asp:ListItem Value="8">08</asp:ListItem>
                        <asp:ListItem Value="9">09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="DropDownListYear" runat="server">
                        <asp:ListItem>2024</asp:ListItem>
                        <asp:ListItem>2025</asp:ListItem>
                        <asp:ListItem>2026</asp:ListItem>
                        <asp:ListItem>2027</asp:ListItem>
                        <asp:ListItem>2028</asp:ListItem>
                        <asp:ListItem>2029</asp:ListItem>
                        <asp:ListItem>2030</asp:ListItem>
                        <asp:ListItem>2031</asp:ListItem>
                        <asp:ListItem>2032</asp:ListItem>
                        <asp:ListItem>2033</asp:ListItem>
                        <asp:ListItem>2034</asp:ListItem>
                    </asp:DropDownList>
                </div>

            </div>

            <div class="total-payment-botnav">
                <h2 class="total-amount" id="TotalAmount" runat="server">RM 39.00</h2>
                <asp:Button ID="PayButton" runat="server" Text="Pay Now" CssClass="btn btn-outline-primary pay-button" OnClick="PayButton_Click" />
            </div>
        </section>
    </form>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
