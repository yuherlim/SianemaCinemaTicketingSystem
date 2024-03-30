<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="MovieSeatSelection.aspx.cs" Inherits="SianemaCinemaTicketingSystem.MovieSeatSelection" %>

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

        .seat-selection-body {
            background: #1d1d1d;
            padding-bottom: 100px;
        }

        .seat-select-part {
            max-width: 70%;
            display: flex;
            padding-top: 40px;
            justify-content: center;
            margin: 0 auto;
        }

        .seat-description {
            display: flex;
            max-width: 70%;
            flex-wrap: wrap;
        }

            .seat-description p {
                padding: 0px 10px 0px 3px;
            }

        .screen-direction {
            max-width: 70%;
            display: flex;
            flex-direction: column;
            margin: 0 auto;
            padding-top: 30px;
        }

            .screen-direction img, .screen-direction p {
                margin: 5px auto;
            }

        .seat-container {
            max-width: 50%;
            display: flex;
            flex-wrap: wrap;
            gap: 5px; /* Add gap between seats */
            margin: 0 auto;
            padding-top: 30px;
        }

        .seat {
            width: calc((100% - 13 * 5px) / 14); /* Calculate the width of each seat */
            height: 30%; /* Set the height of each seat */
        }

        .continueButton {
            display: block;
            margin: 30px auto;
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
                    </div>
                </div>
            </div>
        </div>

        <section class="seat-selection-body">
            <div class="seat-select-part">
                <div class="seat-description">
                    <img src="./images/seatIcon/selectedseat.png" alt="selectedseat" width="20" height="20" />
                    <p>Selected Seats</p>
                    <img src="./images/seatIcon/soldseat.png" alt="soldseat" width="20" height="20" />
                    <p>Sold</p>
                    <img src="./images/seatIcon/unavailableseat.png" alt="unavailableseat" width="20" height="20" />
                    <p>Unavailable</p>
                    <img src="./images/seatIcon/singleseat.png" alt="singleseat" width="20" height="20" />
                    <p>Single seat</p>
                    <img src="./images/seatIcon/coupleseat.png" alt="coupleseat" width="20" height="20" />
                    <p>Couple seat</p>
                </div>


            </div>

            <div class="screen-direction">
                <img src="./images/screen/screen.png" width="80" height="50" />
                <img src="./images/screen/upArrow.png" width="20" height="20" />
                <p class="direction-text">SCREEN THIS WAY</p>
            </div>


            <div class="seat-container">
                <asp:Repeater ID="SeatRepeater" runat="server">
                    <ItemTemplate>
                        <asp:ImageButton ID="SeatButton" ImageUrl="./images/seatIcon/singleseat.png" runat="server" CssClass="seat" Text='<%# Eval("SeatNumber") %>' />
                    </ItemTemplate>
                </asp:Repeater>

            </div>



            <asp:Button ID="continueButton" runat="server" Text="Continue" CssClass="continueButton" />




        </section>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
