<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hall.aspx.cs" Inherits="SianemaCinemaTicketingSystem.Hall" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .heading4 {
            font-size: 18px;
            font-weight: bold;
            color: var(--white); /* You can adjust the color as needed */
            text-transform: uppercase;
            margin-bottom: 10px;
        }

        :root {
            --green: #6ae500;
            --white: #ffffff;
            --black: #000000;
            --black-transparent: rgba(0, 0, 0, 0.7); /* Transparent black color */
        }

        body {
            background-color: var(--black);
            color: var(--white); /* Set text color to white for better contrast */
            padding-top: 70px; /* Add padding to the top of the body to accommodate the fixed navbar */
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="row">
                    <div class="col">
                        <form id="form1" runat="server">

                            <h4 class="heading4">Manage Hall</h4>
                            <br />
                            <label class="label" for="datepicker">Select Hall Type : </label>
                            <div class="row" p-1>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="dc1">
                                    <label class="form-check-label" for="dc1">
                                        Large Hall
                                    </label>
                                </div>

                            </div>

                            <div class="row" p-1>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="dc2">
                                    <label class="form-check-label" for="dc2">
                                        Small Hall
                                    </label>
                                </div>
                            </div>

                            <br />
                            <label class="label">Seat Types :</label>
                            <div class="row" p-1>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="dc3">
                                    <label class="form-check-label" for="dc3">
                                        Normal
                                    </label>
                                </div>

                            </div>

                            <div class="row" p-1>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="dc4">
                                    <label class="form-check-label" for="dc4">
                                        Couple
                                    </label>
                                </div>
                            </div>

                            <br />
                            <div class="row p-3">
                                <label class="label" for="numSeat">Seat Number : </label>
                                <input type="seatnum" id="numSeat" class="form-control" />
                            </div>

                            <div class="row p-3">
                                <label class="label" for="numSeat">Row Number : </label>
                                <input type="seatnum" id="numSeat" class="form-control" />
                            </div>

                            <button type="submit" class="btn btn-primary mt-3">Submit</button>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>
</html>
