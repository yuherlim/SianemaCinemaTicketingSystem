<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="SianemaCinemaTicketingSystem.MovieDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            max-width: 1500px;
            position: absolute;
            top: 300px;
        }

        .movie-details-info1 {
            display: flex;
            gap: 40px;
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
            background:#141415;
            height: 110px;
        }

        .cinema-date-selection {
            max-width: 1500px;
        }

        .date-selection {
            display: flex; /* Use flexbox */
            list-style-type: none; /* Remove bullet points */
            padding: 0; /* Remove default padding */
        }

        .date-button {
            background-color:#141415;
            color: white;
            border:none;
            padding:40px 60px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
            transition: background-color 0.3s, color 0.3s;
        }

            .date-button:hover {
                background-color: var(--green);
                color: var(--white);
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
                        <li>
                            <asp:Button ID="date1" runat="server" CssClass="date-button" />
                        </li>
                        <li>
                            <asp:Button ID="date2" runat="server" CssClass="date-button"  />
                        </li>
                        <li>
                            <asp:Button ID="date3" runat="server" CssClass="date-button"  />
                        </li>
                        <li>
                            <asp:Button ID="date4" runat="server" CssClass="date-button"  />
                        </li>
                        <li>
                            <asp:Button ID="date5" runat="server" CssClass="date-button"  />
                        </li>
                        <li>
                            <asp:Button ID="date6" runat="server" CssClass="date-button"  />
                        </li>
                        <li>
                            <asp:Button ID="date7" runat="server" CssClass="date-button" />
                        </li>
                    </ul>

                </div>
            </div>

            <div class="movie-time-selection-container">



            </div>

        </section>
    </form>
</asp:Content>
