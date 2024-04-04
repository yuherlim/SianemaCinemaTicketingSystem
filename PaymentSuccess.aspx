<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="PaymentSuccess.aspx.cs" Inherits="SianemaCinemaTicketingSystem.PaymentSucess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SIA NEMA - Payment Success</title>
    <style>
        .payment-success-notification {
            margin-top: 40px;
        }

            .payment-success-notification img {
                display: block;
                margin: 0 auto;
            }


        #paymentSuccessText {
            text-align: center;
        }

        .credit-debit-card-details {
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

        .view-ticket-div {
            margin-top: 30px;
            display: flex;
            justify-content: center;
        }

        .view-ticker {
            padding: 10px 20px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form class="form1" runat="server">
        <section class="payment-success-container">

            <div class="payment-success-notification">
                <img src="./images/payment/paymentSuccess.png" width="40" height="40" class="payment-success" />
                <h5 id="paymentSuccessText">Payment Success</h5>
            </div>
            <div class="credit-debit-card-details">
                <h3 id="Purchase-Details">Purchase Details</h3>
                <p class="ticket-header">TICKETS</p>
                <table class="payment-table">
                    <tr>
                        <td class="auto-style1" runat="server">SINGLE</td>
                        <td class="auto-style2" id="SingleSeatPrice" runat="server">(RM 19.00 x 2)</td>
                        <td class="auto-style3" id="SingleSeatAmount" runat="server">RM 38.00</td>
                    </tr>
                    <tr>
                        <td class="auto-style1" runat="server">COUPLE</td>
                        <td class="auto-style2" id="CoupleSeatPrice" runat="server">&nbsp;</td>
                        <td class="auto-style3" id="CoupleSeatAmount" runat="server">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1" runat="server">Sub Total</td>
                        <td class="auto-style2" runat="server">&nbsp;</td>
                        <td class="auto-style3" id="SubTotal" runat="server">RM 38.00</td>
                    </tr>
                    <tr>
                        <td class="auto-style1" runat="server">Processing Fee</td>
                        <td class="auto-style2" runat="server">&nbsp;</td>
                        <td class="auto-style3" runat="server">RM 1.00</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Total</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3" id="Total">RM 39.00</td>
                    </tr>
                </table>
            </div>

            <div class="view-ticket-div">
                <asp:Button ID="viewTicketButton" runat="server" Text="View Ticket Details" CssClass="btn btn-outline-primary view-ticker" OnClick="viewTicketButton_Click" />
            </div>

        </section>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
