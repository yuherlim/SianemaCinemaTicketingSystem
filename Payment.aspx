<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="SianemaCinemaTicketingSystem.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

            .movie-seat-selection-navbar img {
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
            gap: 10px;
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

        table, th, td {
            border: 2px solid white;
            border-collapse: collapse;
        }

        table {
            width:100%;
        }

        .auto-style1, .auto-style2, .auto-style3{
            padding:5px 10px;
            width:30%
        }


    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form class="form1" runat="server">
        <div class="movie-seat-selection-navbar">
            <div class="movie-seat-selection-container">
                <img src="logoSianema.png" alt="Logo" width="160" height="60">
                <div class="movie-seat-selection-header">
                    <h3 id="movieName" runat="server">YOLO</h3>
                    <div class="movie-seat-hall-time">
                        <p id="hallNum" runat="server">Hall 1</p>
                        <p id="movieDate" runat="server">27 Mar 2024</p>
                        <p id="movieTime" runat="server">10:00 PM</p>
                        <p id="seatsId" runat="server">A3 A4</p>
                    </div>
                </div>
            </div>
        </div>


        <section class="payment-container">
            <div class="payment-body">
                <h1 id="Payment-Header">Payment Option</h1>
                <div class="credit-debit-card-payment">
                    <asp:RadioButton ID="creditDebitPay" runat="server" Text="Credit/Debit Card" />
                </div>
            </div>


            <div class="credit-debit-card-container">
                <div class="credit-debit-card-details">
                    <h3 id="Purchase-Details">Purchase Details</h3>
                    <p class="ticket-header">TICKETS</p>
                    <table class="payment-table">
                        <tr>
                            <td class="auto-style1">SINGLE</td>
                            <td class="auto-style2">(RM 19.00 x 2)</td>
                            <td class="auto-style3">RM 38.00</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">COUPLE</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Sub Total</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style3">RM 38.00</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Processing Fee</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style3">RM 1.00</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Total</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style3">RM 39.00</td>
                        </tr>
                    </table>

                </div>

            </div>
        </section>
    </form>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
