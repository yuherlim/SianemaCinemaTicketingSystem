<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="SianemaCinemaTicketingSystem.MovieDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SIA NEMA - Movies Details</title>
    <style>
        .movie-details-container {
            position: relative;
            margin-top: 30px;
            display: flex;
            justify-content: center;
        }

        #ContentPlaceHolder1_movieCoverPhoto {
            width: 100%;
            height: 700px;
            object-fit: cover;
            object-position: center;
            -webkit-mask-image: linear-gradient(to top, transparent 9%, black 80%);
        }

        .movie-details-information-container {
            max-width: 70%;
            position: absolute;
            bottom: 10px;
        }

        .movie-details-info1 {
            display: flex;
            gap: 5%;
        }

        .movie-details-info2 {
            display: flex;
            gap: 40px;
            list-style: none;
            padding-inline-start: 0px;
        }

        .cinema-date-selection-container {
            display: flex;
            justify-content: center;
            background: #141415;
            height: 100px;
        }

        .cinema-date-selection {
            width: 70%;
            height: 100%;
            justify-content: left;
        }

        .date-selection {
            display: flex;
            list-style-type: none; /* Remove bullet points */
            padding-left: 0px;
            padding-right: 50px; /* Remove default padding */
            height: 100%;
            width: 100%;
        }

            .date-selection li {
                width: 10%;
            }

        .date-button {
            background-color: #141415;
            color: white;
            border: none;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
            transition: background-color 0.3s, color 0.3s;
            height: 100%;
            width: 100%;
        }

            .date-button:hover {
                background-color: var(--green);
                color: var(--white);
            }

        .movie-time-selection-container {
            padding: 20px;
            display: flex;
            justify-content: center;
            gap: 2%;
            background: #1a1a19;
        }

        .movie-time-selection {
            width: 70%;
            padding-bottom: 200px;
            background: black;
        }

        .time-button {
            background-color: #1a1a19;
            color: white;
            border: none;
            font-weight: 900;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
            transition: background-color 0.3s, color 0.3s;
            margin: 20px 40px;
            padding: 10px 30px;
        }

            .time-button:hover {
                background-color: white;
                color: black;
            }

        .classic-header {
            font-weight: 1000;
            padding: 40px 0px 30px 40px;
        }

        .chair-image-container {
            padding-left: 50px;
        }

        .chair-image {
            margin-right: 20px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form class="form1" runat="server">
        <section class="movie-details-page">
            <div class="movie-details-container">
                <asp:Image ID="movieCoverPhoto" runat="server" ImageUrl='<%# Eval("movieCoverPhoto") %>' />

                <div class="movie-details-information-container">

                    <h1 id="movieName" runat="server"></h1>

                    <ul class="movie-details-info1">
                        <li id="movieGenre" runat="server"></li>
                        <li id="movieLanguage" runat="server"></li>
                        <li id="movieDuration" runat="server"></li>
                    </ul>


                    <ul class="movie-details-info2">
                        <li>
                            <h4>Subtitle</h4>
                            <p id="movieSubtitle" runat="server" />
                        </li>
                        <li>
                            <h4>Release Date</h4>
                            <p id="releaseDate" runat="server" />
                        </li>
                        <li>
                            <h4>Cast</h4>
                            <p id="movieCast" runat="server" />
                        </li>
                        <li>
                            <h4>Distributor</h4>
                            <p id="movieDistributer" runat="server" />
                        </li>

                    </ul>
                    <h4>Synopsis</h4>
                    <p id="movieSynopsis" runat="server"></p>

                </div>

            </div>

            <div class="cinema-date-selection-container">
                <div class="cinema-date-selection">
                    <ul class="date-selection">
                        <asp:Repeater ID="dateRepeater" runat="server">
                            <ItemTemplate>
                                <li>
                                    <asp:Button ID="dateButton" runat="server" CssClass="date-button" Text='<%# Eval("Date", "{0:ddd\ndd-MMM}").ToUpper() %>' CommandArgument='<%# Eval("Date", "{0:yyyy-MM-dd}") %>' OnClick="DateButton_Click" />
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>



                </div>
            </div>

            <div class="movie-time-selection-container">
                <div class="movie-time-selection">
                    <h2 class="classic-header">Classic</h2>

                    <div class="chair-image-container">
                        <img src="./images/seatIcon/singleseat.png" height="50" width="50" class="chair-image" />
                        <img src="./images/seatIcon/coupleseat.png" height="70" width="70" class="chair-image" />

                    </div>
                    <div class="movie-time">
                        <asp:Repeater ID="movieTimeRepeater" runat="server">
                            <ItemTemplate>
                                <asp:Button ID="TimeButton" runat="server" CssClass="time-button" Text='<%# Eval("hallTimeSlotTime") %>' CommandArgument='<%# Eval("hallTimeSlotID") %>' OnClick="Button_Click" />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>

        </section>
    </form>
</asp:Content>
