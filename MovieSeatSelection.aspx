﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="MovieSeatSelection.aspx.cs" Inherits="SianemaCinemaTicketingSystem.MovieSeatSelection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SIA NEMA - Booking - Seats</title>
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
            display:flex;
            flex-direction:row;
            justify-content: center;
        }

        .icon-image {
            margin:0 5px;
        }
        .selected-seat-display {
            text-align: center;
        }

        .seat-selection-body {
            padding-top: 40px;
            background: #1d1d1d;
            padding-bottom: 100px;
        }

        .seat-select-part {
            max-width: 70%;
            display: flex;
            padding-top: 30px;
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
            max-width: 40%;
            display: flex;
            flex-wrap: wrap;
            gap: 10px; /* Add gap between seats */
            margin: 0 auto;
            padding-top: 30px;
        }

        .seat-wrapper {
            width: calc((100% - 13 * 10px) / 14); /* Calculate the width of each seat */
            display: flex;
            flex-direction: column;
            margin-bottom: 10px;
        }

        .seat-number {
            bottom: -20px;
            left: 50%;
            text-align: center;
            font-size: 12px;
            color: white;
        }

        .continueButton {
            background-color: var(--white);
            color: var(--black);
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: block;
            font-size: 16px;
            transition: background-color 0.3s, color 0.3s;
            margin: 30px auto;
            border-radius: 3px;
        }

        .continueButton:hover {
            background-color: var(--green);
            color: var(--white);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form class="form1" runat="server">
        <div class="movie-seat-selection-navbar">
            <div class="movie-seat-selection-container">
                <img src="logoSianema.png" alt="Logo" width="160" height="60" class="top-nav-logo">
                <div class="movie-seat-selection-header">
                    <h3 id="movieName" runat="server">YOLO</h3>
                    <div class="movie-seat-hall-time">
                        <img src="./images/cinemaIcon/hall.png" width="20" height="20" class="icon-image"/>
                        <p id="hallNum" runat="server">Hall 1</p>
                        <img src="./images/cinemaIcon/date.png" width="20" height="20" class="icon-image"/>
                        <p id="movieDate" runat="server">27 Mar 2024</p>
                        <img src="./images/cinemaIcon/time.png" width="20" height="20" class="icon-image"/>
                        <p id="movieTime" runat="server">10:00 PM</p>
                    </div>
                </div>
            </div>
        </div>


        <section class="seat-selection-body">

            <div class="selected-seat-display">
                <h4 id="selectedSeat"></h4>
            </div>


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
                        <div class="seat-wrapper">
                            <img class="seat" src="./images/seatIcon/singleseat.png" alt="<%# Eval("SeatNumber") %>"/>
                            <span class="seat-number"><%# Eval("SeatNumber") %></span>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>



            <asp:Button ID="continueButton" runat="server" Text="Continue" CssClass="continueButton" OnClick="continueButton_Click"/>




        </section>
    </form>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script>
        $(document).ready(function () {
            $(".seat").click(function () {
                var image = $(this).attr("src")
                if (image == "./images/seatIcon/singleseat.png") {
                    // Change src attribute of image
                    $(this).attr("src", "./images/seatIcon/selectedseat.png");
                    $(this).addClass("selected-seat-id")
                }
                else {
                    // Change src attribute of image
                    $(this).attr("src", "./images/seatIcon/singleseat.png");
                    $(this).removeClass("selected-seat-id")
                }

                var selectedSeats = [];
                $(".selected-seat-id").each(function () {
                    selectedSeats.push($(this).attr("alt"));
                });
                $("#selectedSeat").text(selectedSeats.join(", "));

            });
        });
    </script>
</asp:Content>
