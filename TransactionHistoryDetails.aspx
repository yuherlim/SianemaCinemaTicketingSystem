<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="TransactionHistoryDetails.aspx.cs" Inherits="SianemaCinemaTicketingSystem.TransactionHistoryDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SIA NEMA - Transaction History Details</title>
    <link rel="stylesheet" href="./css/transactionHistoryDetails.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="transaction-history-details">
        <section class="movie-cover-photo">
            <img src="./images/movieCoverPhoto/violetEvergardenCover.png" alt="Movie Cover Photo" />
        </section>
        <section class="movie-details">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">
                        <h5 class="movie-name">Violet Evergarden: The Movie</h5>
                        <p class="movie-classification">R-13</p>
                        <p class="movie-genre">Animation, Drama, Fantasy</p>
                        <p class="divider">-</p>
                        <p class="movie-duration">140 Minutes</p>
                        <p class="divider">-</p>
                        <p class="movie-language">Japanese</p>
                    </div>
                    <div class="card-text">
                        <div class="movie-hall-type">
                            <p><span>Hall Type: </span>Big</p>
                        </div>
                        <div class="movie-hall-number with-icon">
                            <img src="./images/cinemaIcon/hall.png" alt="Hall" width="16" height="16" />
                            <p>1</p>
                        </div>
                        <div class="movie-date with-icon">
                            <img src="./images/cinemaIcon/date.png" alt="Movie Date" width="16" height="16" />
                            <p>02-Apr-2021</p>
                        </div>
                        <div class="movie-time with-icon">
                            <img src="./images/cinemaIcon/time.png" alt="Movie Time" width="16" height="16" />
                            <p>3:15 pm</p>
                        </div>
                        <div class="number-of-seats with-icon">
                            <img src="./images/cinemaIcon/seat.png" alt="Number of Seats" width="16" height="16" />
                            <p>1<span> Seat(s)</span></p>
                        </div>
                        <div class="booked-seats">
                            <p>H12</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="transaction-details">
            <div class="credit-debit-card-container">
                <div class="credit-debit-card-details">
                    <h3 id="Purchase-Details">Purchase Details</h3>
                    <p class="ticket-header">TICKETS</p>
                    <table class="payment-table">
                        <tr>
                            <td class="auto-style1" runat="server">SINGLE</td>
                            <td class="auto-style2" id="SingleSeatPrice" runat="server">(RM 19.00 x 1)</td>
                            <td class="auto-style3" id="SingleSeatAmount" runat="server">RM 19.00</td>
                        </tr>
                        <tr>
                            <td class="auto-style1" runat="server">COUPLE</td>
                            <td class="auto-style2" id="CoupleSeatPrice" runat="server">&nbsp;</td>
                            <td class="auto-style3" id="CoupleSeatAmount" runat="server">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1" runat="server">Sub Total</td>
                            <td class="auto-style2" runat="server">&nbsp;</td>
                            <td class="auto-style3" id="SubTotal" runat="server">RM 19.00</td>
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
                            <td class="auto-style3" id="Total">RM 20.00</td>
                        </tr>
                    </table>

                </div>

            </div>
        </section>

    </main>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
