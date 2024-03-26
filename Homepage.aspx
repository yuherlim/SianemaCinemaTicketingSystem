<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="SianemaCinemaTicketingSystem.Homepage" %>

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

    <script>
        $('.carousel').carousel({
            interval: 3000
        });
    </script>


    <section class="pt-5 pb-5">
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <h3 class="mb-3">Showing Now</h3>
                </div>
                <div class="col-6 text-right">
                    <a class="btn btn-primary mb-3 mr-1" href="#carouselExampleIndicators2" role="button" data-slide="prev">
                        <i class="fa fa-arrow-left"></i>
                    </a>
                    <a class="btn btn-primary mb-3 " href="#carouselExampleIndicators2" role="button" data-slide="next">
                        <i class="fa fa-arrow-right"></i>
                    </a>
                </div>
                <div class="col-12">
                    <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">

                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="row">

                                    <div class="col-md-4 mb-3">
                                        <div class="card view">
                                            <img class="img-fluid" alt="showingNow1" src="sn1.jpg" width="360" height="80">
                                            <div class="mask">
                                                <div class="col">
                                                    <ul class="deco">
                                                        <li><a href="#!" class="btn-book-now">Book Now</a></li>
                                                        <li>
                                                            <br />
                                                        </li>
                                                        <li><a href="#!" class="btn-more-info">More Info</a></li>
                                                    </ul>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card view">
                                            <img class="img-fluid" alt="showingNow2" src="sn2.jpg" width="360" height="80">
                                            <div class="mask">
                                                <div class="col">
                                                    <ul class="deco">
                                                        <li><a href="#!" class="btn-book-now">Book Now</a></li>
                                                        <li>
                                                            <br />
                                                        </li>
                                                        <li><a href="#!" class="btn-more-info">More Info</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card view">
                                            <img class="img-fluid" alt="showingNow3" src="sn3.jpg" width="360" height="80">
                                            <div class="mask">
                                                <div class="col">
                                                    <ul class="deco">
                                                        <li><a href="#!" class="btn-book-now">Book Now</a></li>
                                                        <li>
                                                            <br />
                                                        </li>
                                                        <li><a href="#!" class="btn-more-info">More Info</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row">

                                    <div class="col-md-4 mb-3">
                                        <div class="card view">
                                            <img class="img-fluid" alt="showingNow4" src="sn4.jpg" width="360" height="80">
                                            <div class="mask">
                                                <div class="col">
                                                    <ul class="deco">
                                                        <li><a href="#!" class="btn-book-now">Book Now</a></li>
                                                        <li>
                                                            <br />
                                                        </li>
                                                        <li><a href="#!" class="btn-more-info">More Info</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card view">
                                            <img class="img-fluid" alt="showingNow5" src="sn5.jpg" width="360" height="80">
                                            <div class="mask">
                                                <div class="col">
                                                    <ul class="deco">
                                                        <li><a href="#!" class="btn-book-now">Book Now</a></li>
                                                        <li>
                                                            <br />
                                                        </li>
                                                        <li><a href="#!" class="btn-more-info">More Info</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card view">
                                            <img class="img-fluid" alt="showingNow6" src="sn6.jpg" width="360" height="80">
                                            <div class="mask">
                                                <div class="col">
                                                    <ul class="deco">
                                                        <li><a href="#!" class="btn-book-now">Book Now</a></li>
                                                        <li>
                                                            <br />
                                                        </li>
                                                        <li><a href="#!" class="btn-more-info">More Info</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row">

                                    <div class="col-md-4 mb-3">
                                        <div class="card view">
                                            <img class="img-fluid" alt="showingNow7" src="sn7.jpg" width="360" height="80">
                                            <div class="mask">
                                                <div class="col">
                                                    <ul class="deco">
                                                        <li><a href="#!" class="btn-book-now">Book Now</a></li>
                                                        <li>
                                                            <br />
                                                        </li>
                                                        <li><a href="#!" class="btn-more-info">More Info</a></li>
                                                    </ul>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card view">
                                            <img class="img-fluid" alt="showingNow8" src="sn8.jpg" width="360" height="80">
                                            <div class="mask">
                                                <div class="col">
                                                    <ul class="deco">
                                                        <li><a href="#!" class="btn-book-now">Book Now</a></li>
                                                        <li>
                                                            <br />
                                                        </li>
                                                        <li><a href="#!" class="btn-more-info">More Info</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card view">
                                            <img class="img-fluid" alt="showingNow9" src="sn9.jpg" width="360" height="80">
                                            <div class="mask">
                                                <div class="col">
                                                    <ul class="deco">
                                                        <li><a href="#!" class="btn-book-now">Book Now</a></li>
                                                        <li>
                                                            <br />
                                                        </li>
                                                        <li><a href="#!" class="btn-more-info">More Info</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>

</asp:Content>
