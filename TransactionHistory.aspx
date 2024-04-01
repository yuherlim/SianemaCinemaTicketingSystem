<%@ Page Title="" Language="C#" MasterPageFile="~/UserAccount.master" AutoEventWireup="true" CodeBehind="TransactionHistory.aspx.cs" Inherits="SianemaCinemaTicketingSystem.TransactionHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SIA NEMA - Transaction History</title>
    <link rel="stylesheet" href="./css/transactionHistory.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main class="transaction-history">
        <div class="content-wrapper">
            <div class="tab-container">
                <nav class="transaction-history-nav">
                    <div class="nav" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link active" id="nav-upcoming-movie-tab" data-toggle="tab" href="#nav-upcoming-movie" role="tab" aria-controls="nav-upcoming-movie" aria-selected="true">Upcoming Movie</a>
                        <a class="nav-item nav-link" id="nav-last-seen-tab" data-toggle="tab" href="#nav-last-seen" role="tab" aria-controls="nav-last-seen" aria-selected="false">Last Seen</a>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-upcoming-movie" role="tabpanel" aria-labelledby="nav-upcoming-movie-tab">
                        <asp:Repeater ID="UpcomingMovieRepeater" runat="server">
                            <ItemTemplate>
                                <div class="card">
                                    <div class="card-body">
                                        <div class="card-title">
                                            <h5 class="movie-name"><%# Eval("MovieName")%></h5>
                                            <p class="movie-classification"><%# Eval("MovieClassification")%></p>
                                            <p class="movie-genre"><%# Eval("MovieGenre")%></p>
                                            <p class="divider">-</p>
                                            <p class="movie-duration"><%# Eval("MovieDuration")%></p>
                                            <p class="divider">-</p>
                                            <p class="movie-language"><%# Eval("MovieLanguage")%></p>
                                        </div>
                                        <div class="card-text">
                                            <div class="movie-hall-type">
                                                <p><span>Hall Type: </span><%# Eval("MovieHallType")%></p>
                                            </div>
                                            <div class="movie-date with-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
                                                    <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z" />
                                                </svg>
                                                <p><%# Eval("MovieDate")%></p>
                                            </div>
                                            <div class="movie-time with-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                                    <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                                                    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                                                </svg>
                                                <p><%# Eval("MovieTime")%></p>
                                            </div>
                                            <div class="number-of-seats with-icon">
                                                <img src="./images/seatIcon/unavailableseat.png" alt="Alternate Text" width="16" height="16" />
                                                <p><%# Eval("NumberOfSeats")%><span> Seat(s)</span></p>
                                            </div>
                                            <div class="booked-seats">
                                                <p><%# Eval("BookedSeats")%></p>
                                            </div>
                                        </div>
                                        <div class="more-info-btn-container">
                                            <a href="TransactionHistoryDetails.aspx" class="btn btn-primary more-info-btn">More info</a>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <%--<div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h5 class="movie-name">Violet Evergarden: The Movie</h5>
                                    <p class="movie-classification">R-13</p>
                                    <p class="movie-genre">Animation, Drama, Fantasy</p>
                                    <p class="divider">- </p>
                                    <p class="movie-duration">140 Minutes</p>
                                    <p class="divider">- </p>
                                    <p class="movie-language">Japanese</p>
                                </div>
                                <div class="card-text">
                                    <div class="movie-hall-type">
                                        <p><span>Hall Type: </span>Big</p>
                                    </div>
                                    <div class="movie-date with-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
                                            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z" />
                                        </svg>
                                        <p>02-Apr-2021</p>
                                    </div>
                                    <div class="movie-time with-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                            <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                                            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                                        </svg>
                                        <p>3:15 pm</p>
                                    </div>
                                    <div class="number-of-seats with-icon">
                                        <img src="./images/seatIcon/unavailableseat.png" alt="Alternate Text" width="16" height="16" />
                                        <p>1<span> Seat(s)</span></p>
                                    </div>
                                    <div class="booked-seats">
                                        <p>H12</p>
                                    </div>
                                </div>
                                <div class="more-info-btn-container">
                                    <a href="TransactionHistoryDetails.aspx" class="btn btn-primary more-info-btn">More info</a>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    </div>
                    <div class="tab-pane fade" id="nav-last-seen" role="tabpanel" aria-labelledby="nav-last-seen-tab">
                        <asp:Repeater ID="LastSeenRepeater" runat="server">
                            <ItemTemplate>
                                <div class="card">
                                    <div class="card-body">
                                        <div class="card-title">
                                            <h5 class="movie-name"><%# Eval("MovieName")%></h5>
                                            <p class="movie-classification"><%# Eval("MovieClassification")%></p>
                                            <p class="movie-genre"><%# Eval("MovieGenre")%></p>
                                            <p class="divider">-</p>
                                            <p class="movie-duration"><%# Eval("MovieDuration")%></p>
                                            <p class="divider">-</p>
                                            <p class="movie-language"><%# Eval("MovieLanguage")%></p>
                                        </div>
                                        <div class="card-text">
                                            <div class="movie-hall-type">
                                                <p><span>Hall Type: </span><%# Eval("MovieHallType")%></p>
                                            </div>
                                            <div class="movie-date with-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
                                                    <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z" />
                                                </svg>
                                                <p><%# Eval("MovieDate")%></p>
                                            </div>
                                            <div class="movie-time with-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                                    <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                                                    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                                                </svg>
                                                <p><%# Eval("MovieTime")%></p>
                                            </div>
                                            <div class="number-of-seats with-icon">
                                                <img src="./images/seatIcon/unavailableseat.png" alt="Alternate Text" width="16" height="16" />
                                                <p><%# Eval("NumberOfSeats")%><span> Seat(s)</span></p>
                                            </div>
                                            <div class="booked-seats">
                                                <p><%# Eval("BookedSeats")%></p>
                                            </div>
                                        </div>
                                        <div class="more-info-btn-container">
                                            <a href="TransactionHistoryDetails.aspx" class="btn btn-primary more-info-btn">More info</a>
                                        </div>

                                    </div>
                                    <div class="card-footer text-muted text-right duration-since-movie-date">
                                        <%# Eval("DurationSinceMovieDate")%> ago
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <%--<div class="card">
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
            <div class="movie-date with-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
                    <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z" />
                </svg>
                <p>02-Apr-2021</p>
            </div>
            <div class="movie-time with-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                    <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                </svg>
                <p>3:15 pm</p>
            </div>
            <div class="number-of-seats with-icon">
                <img src="./images/seatIcon/unavailableseat.png" alt="Alternate Text" width="16" height="16" />
                <p>1<span> Seat(s)</span></p>
            </div>
            <div class="booked-seats">
                <p>H12</p>
            </div>
        </div>
        <div class="more-info-btn-container">
            <a href="TransactionHistoryDetails.aspx" class="btn btn-primary more-info-btn">More info</a>
        </div>
    </div>
    <div class="card-footer text-muted text-right duration-since-movie-date">
        3 years ago
    </div>
</div>--%>
                    </div>
                </div>
            </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
