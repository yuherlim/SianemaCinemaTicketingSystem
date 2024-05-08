<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="SianemaCinemaTicketingSystem.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/homepage.css" />
    <script src="js/homepage.js"></script>
    <style>
        .cardImg {
            height: 500px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="ad1.png" alt="First slide" height="400">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="ad2.png" alt="Second slide" height="400">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="ad3.png" alt="Third slide" height="400">
            </div>
        </div>

        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <!-- Carousel -->
    <section class="pt-5 pb-5">
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <h3 class="mb-3">Showing Now</h3>
                </div>
                <div class="col-6 text-right">
                    <button class="btn btn-primary mb-3 mr-1" id="prevBtn" href="carouselExampleIndicators2" data-slide="prev">
                        <i class="fa fa-arrow-left"></i>
                    </button>
                    <button class="btn btn-primary mb-3" id="nextBtn" href="carouselExampleIndicators2" data-slide="next">
                        <i class="fa fa-arrow-right"></i>
                    </button>
                </div>
                <div class="col-12">
                    <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">
                        <!-- Repeater for carousel slides -->
                        <asp:Repeater ID="rptMovies" runat="server">
                            <ItemTemplate>
                                <div class="carousel-item<%# Container.ItemIndex == 0 ? " active" : "" %>">
                                    <div class="row">
                                        <!-- Nested repeater for movie posters -->
                                        <asp:Repeater ID="rptSlide" runat="server" DataSource='<%# Container.DataItem %>'>
                                            <ItemTemplate>
                                                <div class="col-md-4 mb-3">
                                                    <div class="card view">
                                                        <img class="cardImg" alt="<%# Eval("movieName") %>" src="<%# Eval("moviePoster") %>" />
                                                        <div class="mask">
                                                            <div class="col">
                                                                <ul class="deco">
                                                                    <li><a href="#" class="btn-book-now">Book Now</a></li>
                                                                    <li>
                                                                        <br />
                                                                    </li>
                                                                    <li><a href="#" class="btn-more-info">More Info</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- SQL Data Source -->
    <asp:SqlDataSource ID="sdsMovies" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT movieName, moviePoster FROM Movie ORDER BY releaseDate DESC"></asp:SqlDataSource>
</asp:Content>