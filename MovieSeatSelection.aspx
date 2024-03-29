<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="MovieSeatSelection.aspx.cs" Inherits="SianemaCinemaTicketingSystem.MovieSeatSelection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .movie-seat-selection-header {
            display:flex;
            flex-direction:column;
            align-items:center;
            background:#111111;
            padding-top:20px;
        }

        .movie-seat-hall-time {
            display:flex;
            flex-wrap:wrap;
            justify-content:center;
            gap:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <<form class="form1" runat="server">
            <div class="movie-seat-selection-header">
                <h3 id="movieName" runat="server">YOLO</h3>
                <div class="movie-seat-hall-time">
                    <p id="hallNum" runat="server">Hall 1</p>
                    <p id="movieDate" runat="server">27 Mar 2024</p>
                    <p id="movieTime" runat="server">10:00 PM</p>
                </div>
                

            </div>


        </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
