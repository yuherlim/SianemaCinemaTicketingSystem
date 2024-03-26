<%@ Page Title="" Language="C#" MasterPageFile="~/MPA.Master" AutoEventWireup="true" CodeBehind="Hall.aspx.cs" Inherits="SianemaCinemaTicketingSystem.Hall" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function displayHallImage() {
            var hallType = document.querySelector('input[name="hallType"]:checked').value;
            var imgElement = document.getElementById("hallImage");
            if (hallType === "Large") {
                imgElement.src = "largehall.png";
            } else if (hallType === "Small") {
                imgElement.src = "smallhall.png";
            }
        }
    </script>
    <style>
        #collapse1 {
            overflow-y: scroll;
            height: 200px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <!-- add hall button -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    Add Hall
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Add Hall</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="form1" runat="server">
                                    <div class="row">
                                        <div class="col">Hall ID :</div>
                                        <div class="col">
                                            <asp:Label ID="lblHallid" runat="server" Text="test"></asp:Label>
                                        </div>
                                        <div class="col"></div>
                                    </div>
                                    <br />
                                    <div class="row border border-dark"></div>
                                    <br />
                                    <label class="label" for="datepicker">Select Hall Type:</label>
                                    <div class="row p-2">
                                        <div class="col">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="hallType" id="largeHall" value="Large" onclick="displayHallImage()" checked>
                                                <label class="form-check-label" for="largeHall">
                                                    Large Hall
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="hallType" id="smallHall" value="Small" onclick="displayHallImage()">
                                                <label class="form-check-label" for="smallHall">
                                                    Small Hall
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <img id="hallImage" src="largehall.png" alt="Hall Image" width="470px" height="300px">
                                    <br />
                                    <br />


                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" data-dismiss="modal">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- view large hall modal -->
    <div class="modal fade" id="viewLargeHallModal" tabindex="-1" role="dialog" aria-labelledby="viewLargeHallModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewLargeHallModalLabel">Hall Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">Hall ID :</div>
                        <div class="col">
                            <asp:Label ID="viewHallId" runat="server" Text="hall id"></asp:Label>
                        </div>
                    </div>
                    <br />
                    <div class="row border border-dark"></div>
                    <br />

                    <label class="label" for="datepicker">Hall Type:</label>
                    <div class="row p-2">
                        <div class="col">
                            Large Hall
                        </div>
                    </div>
                    <br />
                    <img id="viewLargeHallImage" src="largehall.png" alt="Hall Image" width="470px" height="300px">
                    <br />
                    <br />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- view small hall modal -->
    <div class="modal fade" id="viewSmallHallModal" tabindex="-1" role="dialog" aria-labelledby="viewSmallHallModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewSmallHallModalLabel">Hall Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">Hall ID :</div>
                        <div class="col">
                            <asp:Label ID="viewHallId2" runat="server" Text="hall id"></asp:Label>
                        </div>
                    </div>
                    <br />
                    <div class="row border border-dark"></div>
                    <br />

                    <label class="label" for="datepicker">Hall Type:</label>
                    <div class="row p-2">
                        <div class="col">
                            Small Hall
                        </div>
                    </div>
                    <br />
                    <img id="viewSmallHallImage" src="smallhall.png" alt="Hall Image" width="470px" height="300px">
                    <br />
                    <br />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <!-- table -->
    <div class="container">

        <div class="row justify-content-center">
            <div class="col-md-8">

                <div class="form-row align-items-center">
                    <table class="table table-bordered table-striped mb-0">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Hall</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Hall 1</td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewLargeHallModal">
                                        View
                                    </button>

                                    <button type="button" class="btn btn-secondary">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Hall 2</td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewSmallHallModal">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-secondary">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Hall 3</td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewSmallHallModal">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-secondary">
                                        Delete
                                    </button>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row">4</th>
                                <td>Hall 4</td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewLargeHallModal">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-secondary">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">5</th>
                                <td>Hall 5</td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewSmallHallModal">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-secondary">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">6</th>
                                <td>Hall 6</td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewSmallHallModal">
                                        View
                                    </button>
                                    <button type="button" class="btn btn-secondary">
                                        Delete
                                    </button>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

