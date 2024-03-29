<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="SianemaCinemaTicketingSystem.Movies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Overlay */
        .mask {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: var(--black);
            opacity: 0; /* Initially hidden */
            transition: opacity 0.3s ease; /* Smooth transition for opacity change */
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }


        /* Hover effect */
        .view:hover .mask {
            opacity: 1; /* Make overlay visible on hover */
        }
        /* Button styles */
        .btn-book-now {
            background-color: var(--white);
            color: var(--black);
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            transition: background-color 0.3s, color 0.3s;
        }

        .btn-more-info {
            background-color: transparent;
            border: 2px solid var(--white);
            color: var(--white);
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            transition: border-color 0.3s, color 0.3s;
        }

        /* Hover effect for book now button */
        .btn-book-now:hover {
            background-color: var(--green);
            color: var(--white);
        }

        /* Hover effect for more info button */
        .btn-more-info:hover {
            border-color: var(--green);
            color: var(--green);
        }

        ul.deco {
            list-style-type: none;
            padding-left:0px;
        }

        .movie-row {
            display:flex;
            flex-wrap:wrap;
            gap:40px;
            justify-content:center;
        }

        .movie-container {
            width:80%;
            padding-top:50px;
            padding-right:15px;
            padding-left:15px;
            margin-right:auto;
            margin-left:auto;
        }

        .movie-name {
            font-size: 30px;
            color:#fff;
            text-transform:capitalize;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="movie-container">
            <h2>Movies in SiaNema</h2>

            <div class="movie-row">
            <asp:Repeater ID="movieRepeater" runat="server" DataSourceID="SqlDataSource1">

                <ItemTemplate>
                    <div class="card view">
                        <asp:Image ID="moviePoster" runat="server" ImageUrl='<%# Eval("moviePoster") %>' Height="600" Width="400" />
                        <div class="mask">
                            <div class="col">
                                <ul class="deco">
                                    <li><p class="movie-name"><%# Eval("movieName") %></></li>
                                    <li><a href="#!" class="btn-book-now">Book Now</a></li>
                                    <li>
                                        <br />
                                    </li>
                                    <li><a href="#!" class="btn-more-info">More Info</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>

            </asp:Repeater>
                </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Movie]"></asp:SqlDataSource>
        </section>
</asp:Content>
