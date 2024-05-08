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
    <section class="payment-success-container">

        <div class="payment-success-notification">
            <img src="./images/payment/paymentSuccess.png" width="40" height="40" class="payment-success" />
            <h5 id="paymentSuccessText">Payment Success</h5>
        </div>

        <div class="view-ticket-div">
            <asp:Button ID="viewTicketButton" runat="server" Text="View Ticket Details" CssClass="btn btn-outline-primary view-ticker" OnClick="viewTicketButton_Click" />
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
