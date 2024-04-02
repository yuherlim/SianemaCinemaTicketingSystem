<%@ Page Title="" Language="C#" MasterPageFile="~/MPA.Master" AutoEventWireup="true" CodeBehind="HallTimeSlot.aspx.cs" Inherits="SianemaCinemaTicketingSystem.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/admin/hallTimeSlot.css" />
    <script defer src="js/admin/hallTimeSlot.js"></script>
    <style>
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <div class="container">
            <div class="card card-fluid">
                <div id="row1" class="card-header row">
                    <span class="row1Space">Manage Hall TimeSlot</span>
                    <div class="mb-3 selectDate" id="selectDate">
                        <div class="input-group selectDate-input">
                            <input id="tpSelectDate" type="text" class="form-control" placeholder="23-03-2024" />
                            <span class="input-group-text"><i class="ri-time-line"></i></span>
                        </div>
                    </div>
                </div>


                <div id="row2" class="row">
                    <asp:Repeater ID="HallRepeater" runat="server" OnItemDataBound="HallRepeater_ItemDataBound" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <div class="parentRptContainer">
                                <div class="hallName">
                                    <%# Eval("HallName") %>
                                </div>
                                <div class="hallType">
                                    <%# Eval("HallType") %>
                                </div>
                                <div class="addTimeSlot">
                                    <asp:Button ID="btnAddTimeSlot" runat="server" ClientIDMode="static" CssClass="btn btn-primary btn-sm btnAdd" Text="Add TimeSlot" OnClick="btnAddTimeSlot_Click" />
                                </div>


                            </div>
                            <div class="childRptContainer">
                                <div class="childRptHeader">
                                    <div class="timeSlotHeader">10:00am</div>
                                    <div class="timeSlotHeader">11:00am</div>
                                    <div class="timeSlotHeader">12:00pm</div>
                                    <div class="timeSlotHeader">01:00pm</div>
                                    <div class="timeSlotHeader">02:00pm</div>
                                    <div class="timeSlotHeader">03:00pm</div>
                                    <div class="timeSlotHeader">04:00pm</div>
                                    <div class="timeSlotHeader">05:00pm</div>
                                    <div class="timeSlotHeader">06:00pm</div>
                                    <div class="timeSlotHeader">07:00pm</div>
                                    <div class="timeSlotHeader">08:00pm</div>
                                    <div class="timeSlotHeader">09:00pm</div>
                                    <div class="timeSlotHeader">10:00pm</div>
                                    <div class="timeSlotHeader">11:00pm</div>
                                    <div class="timeSlotHeader">12:00am</div>
                                    <div class="timeSlotHeader">01:00am</div>
                                    <div class="timeSlotHeader">02:00am</div>
                                </div>
                                <div class="childRptBody">
                                    <asp:Repeater ID="TimeSlotRepeater" runat="server">
                                        <ItemTemplate>
                                            <div class="timeSlot">
                                                <span class="timeSlotMovieName"><%# Eval("movieName") %></span>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Hall]"></asp:SqlDataSource>

                </div>

                <!-- Movie Modal -->
                <div class="modal fade" id="modalMovie" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="modalTitle">View Movie</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div id="modalRowID" class="modalRow1 modalRow">
                                    <div class="modalText">Movie ID</div>
                                    <div class="modalColon">: </div>
                                    <div id="modalID">
                                        MOV-310324-0001
                                    </div>
                                </div>

                                <div class="modalRow2 modalRow">
                                    <section class="row2Section1">
                                        <div class="mb-3 movName">
                                            <label for="txtName" class="form-label">Name</label>
                                            <asp:TextBox ID="txtName" CssClass="form-control modalInputField" runat="server" ClientIDMode="Static"></asp:TextBox>
                                        </div>

                                        <div class="mb-3 movGenre">
                                            <label for="sltGenre" class="form-label">Movie Genre</label><br />
                                            <select id="sltGenre" class="select2 form-control select2-multiple sltGenre modalInputField" data-toggle="select2" multiple="multiple" data-placeholder="Choose ..." tabindex="-1" aria-hidden="true">
                                                <optgroup label="Genre">
                                                    <option value="Action">Action</option>
                                                    <option value="Adventure">Adventure</option>
                                                    <option value="Comedy">Comedy</option>
                                                    <option value="Fantasy">Fantasy</option>
                                                    <option value="Horror">Horror</option>
                                                    <option value="Romance">Romance</option>
                                                </optgroup>
                                            </select>
                                        </div>

                                        <div class="mb-3 movLanguage">
                                            <label for="sltLanguage" class="form-label">Movie Language</label><br />
                                            <select id="sltLanguage" class="select2 form-control select2-multiple modalInputField" data-toggle="select2" multiple="multiple" data-placeholder="Choose ..." tabindex="-1" aria-hidden="true">
                                                <optgroup label="Genre">
                                                    <option value="Chinese">Chinese</option>
                                                    <option value="English">English</option>
                                                    <option value="Korean">Korean</option>
                                                    <option value="Japanese">Japanese</option>
                                                    <option value="Malay">Malay</option>
                                                </optgroup>
                                            </select>
                                        </div>

                                        <div class="mb-3 movSubtitle">
                                            <label for="sltSubtitle" class="form-label">Movie Subtitle</label><br />
                                            <select id="sltSubtitle" class="select2 form-control select2-multiple modalInputField" data-toggle="select2" multiple="multiple" data-placeholder="Choose ..." tabindex="-1" aria-hidden="true">
                                                <optgroup label="Subtitle">
                                                    <option value="Chinese">Chinese</option>
                                                    <option value="English">English</option>
                                                    <option value="Korean">Korean</option>
                                                    <option value="Japanese">Japanese</option>
                                                    <option value="Malay">Malay</option>
                                                </optgroup>
                                            </select>
                                        </div>

                                        <div class="mb-3 movDuration">
                                            <label class="form-label">Movie Duration</label>
                                            <div class="input-group">
                                                <input id="tpDuration" type="text" class="form-control modalInputField" placeholder="01:30">
                                                <span class="input-group-text"><i class="ri-time-line"></i></span>
                                            </div>
                                        </div>
                                    </section>

                                    <section class="row2Section2">
                                        <section class="row2Section2-1">
                                            <div class="mb-3 movPoster">
                                                <label for="fuPoster" class="form-label">Movie Poster</label>
                                                <asp:FileUpload ID="fuPoster" class="form-control modalInputField" runat="server" ClientIDMode="static" />

                                            </div>

                                            <div class="movImage">
                                                <asp:Image ID="movPosterImage" runat="server" ClientIDMode="Static" />
                                            </div>
                                        </section>

                                        <section class="row2Section2-2">
                                            <div class="mb-3 movCoverPhoto">
                                                <label for="fuCoverPhoto" class="form-label">Movie CoverPhoto</label>
                                                <asp:FileUpload ID="fuCoverPhoto" class="form-control modalInputField" runat="server" ClientIDMode="static" />
                                            </div>

                                            <div class="movImage">
                                                <asp:Image ID="movCoverPhotoImage" runat="server" ClientIDMode="Static" />
                                            </div>
                                        </section>
                                    </section>

                                </div>

                                <div class="modalRow3 modalRow">

                                    <div class="mb-3 movDistributor">
                                        <label for="txtDistributor" class="form-label">Distributor</label>
                                        <asp:TextBox ID="txtDistributor" CssClass="form-control modalInputField" runat="server" ClientIDMode="static"></asp:TextBox>
                                    </div>


                                    <div class="mb-3 movReleaseDate">
                                        <label class="form-label">Movie Release Date</label>
                                        <div class="input-group">
                                            <input id="tpReleaseDate" type="text" class="form-control modalInputField" placeholder="23-03-2024" />
                                            <span class="input-group-text"><i class="ri-time-line"></i></span>
                                        </div>
                                    </div>

                                </div>

                                <div class="modalRow4 modalRow">

                                    <div class="mb-3 movCast">
                                        <label for="sltCast" class="form-label">Movie Cast</label><br />
                                        <select id="sltCast" class="select2 form-control select2-multiple modalInputField" data-toggle="select2" multiple="multiple" data-placeholder="Choose ..." tabindex="-1" aria-hidden="true">
                                            <optgroup label="Cast">
                                                <option value="Jackie Chan">Jackie Chan</option>
                                                <option value="Jason Statham">Jason Statham</option>
                                                <option value="Vin Diesel">Vin Diesel</option>
                                                <option value="Dwayne Johnson">Dwayne Johnson</option>
                                            </optgroup>
                                        </select>
                                    </div>

                                    <div class="mb-3 movSypnosis">
                                        <label for="txtSypnosis" class="form-label">Movie Sypnosis</label>
                                        <textarea class="form-control modalInputField" id="txtSypnosis" rows="5" runat="server" clientidmode="static"></textarea>
                                    </div>

                                </div>

                                <div class="modalRow5 modalRow">

                                    <div class="mb-3 movScreenFrom">
                                        <label class="form-label">Movie Screen From</label>
                                        <div class="input-group">
                                            <input id="tpScreenFrom" type="text" class="form-control modalInputField" placeholder="23-03-2024" />
                                            <span class="input-group-text"><i class="ri-time-line"></i></span>
                                        </div>
                                    </div>

                                    <div class="mb-3 movScreenUntil">
                                        <label class="form-label">Movie Screen Until</label>
                                        <div class="input-group">
                                            <input id="tpScreenUntil" type="text" class="form-control modalInputField" placeholder="23-03-2024" />
                                            <span class="input-group-text"><i class="ri-time-line"></i></span>
                                        </div>
                                    </div>

                                </div>

                                <div class="modal-footer">
                                    <button type="button" id="btnClose" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" id="btnConfirm" class="btn btn-secondary" data-bs-dismiss="modal">Confirm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--Add TimeSlot Modal--%>
                <div id="modalTimeSlot" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header row d-flex justify-content-between mx-1 mx-sm-3 mb-0 pb-0 border-0 addTimeSlotModalHeader">
                <div class="tabs active" id="tab01">
                    <h6 class="font-weight-bold ">Movie</h6>
                </div>
                <div class="tabs" id="tab02">
                    <h6 class="text-muted">Maintenance</h6>
                </div>

            </div>
            <div class="line"></div>
            <div class="modal-body p-0">
                <fieldset class="show" id="tab011" class="field1">
                    <div class="modal-body">
                        <div class="modalRow2 modalRow">
                            <section class="row2Section1">

                                <div class="mb-3 movSelect">
                                    <label for="sltMovie" class="form-label">Movie</label><br />
                                    <select id="sltMovie" class="select2 form-control select2-multiple sltGenre modalInputField" data-toggle="select2" data-placeholder="Choose ..." tabindex="-1" aria-hidden="true">
                                        <option value="U">Gorilla</option>
                                        <option value="P12">P12</option>
                                        <option value="13">13</option>
                                        <option value="16">16</option>
                                        <option value="18">18</option>

                                    </select>
                                </div>

                                <div class="mb-3 movStartTime">
                                    <label class="form-label">Movie Start Time</label>
                                    <div class="input-group">
                                        <input id="tpMovStartTime" type="text" class="form-control modalInputField" placeholder="01:30 PM">
                                        <span class="input-group-text"><i class="ri-time-line"></i></span>
                                    </div>
                                </div>

                                <div class="mb-3 movDuration">
                                    <label class="form-label">Movie Duration</label>
                                    <div class="input-group">
                                        <input id="tpMovDuration" type="text" class="form-control modalInputField" placeholder="01:30">
                                        <span class="input-group-text"><i class="ri-time-line"></i></span>
                                    </div>
                                </div>

                                <div class="mb-3 movEndTime">
                                    <label class="form-label">Movie End Time</label>
                                    <div class="input-group">
                                        <input id="tpMovEndTime" type="text" class="form-control modalInputField" placeholder="01:30 PM">
                                        <span class="input-group-text"><i class="ri-time-line"></i></span>
                                    </div>
                                </div>
                            </section>

                            <section class="row2Section2">
                                <section class="row2Section2-1" id="hallTimeSlotMovPoster">
                                    <div class="movImage">
                                        <asp:Image ID="movTimeSlotPosterImage" runat="server" ClientIDMode="Static" />
                                    </div>
                                </section>
                            </section>

                        </div>

                        <div class="modal-footer">
                            <button type="button" id="btnClose" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                            <asp:Button ID="btnAssignMovie" runat="server" ClientIDMode="static" CssClass="btn btn-secondary"
                                Text="Confirm" />
                        </div>
                    </div>


                </fieldset>
                <fieldset id="tab021">
                    <div class="modal-body">
                        <div class="modalRow1 modalRow">
                            <div class="modalText">Maintenance ID</div>
                            <div class="modalColon">: </div>
                            <div id="maintenanceID">
                                MOV-310324-0001
                            </div>
                        </div>


                        <div class="modalRow2 modalRow">
                            <section class="row2Section1">

                                <div class="mb-3 movStaffSelect">
                                    <label for="sltStaff" class="form-label">Staff In Charge</label><br />
                                    <select id="sltStaff" class="select2 form-control select2-multiple sltGenre modalInputField" data-toggle="select2" data-placeholder="Choose ..." tabindex="-1" aria-hidden="true">
                                        <option value="U">Gorilla</option>
                                        <option value="P12">P12</option>
                                        <option value="13">13</option>
                                        <option value="16">16</option>
                                        <option value="18">18</option>

                                    </select>
                                </div>

                                <div class="mb-3 movMaintenanceTime">
                                    <label class="form-label">Maintenance Start Time</label>
                                    <div class="input-group">
                                        <input id="tpMtnStartTime" type="text" class="form-control modalInputField" placeholder="01:30 PM">
                                        <span class="input-group-text"><i class="ri-time-line"></i></span>
                                    </div>
                                </div>

                                <div class="mb-3 movDuration">
                                    <label class="form-label">Maintenance Duration</label>
                                    <div class="input-group">
                                        <input id="tpMtnDuration" type="text" class="form-control modalInputField" placeholder="01:30">
                                        <span class="input-group-text"><i class="ri-time-line"></i></span>
                                    </div>
                                </div>

                                <div class="mb-3 movEndTime">
                                    <label class="form-label">Maintenance End Time</label>
                                    <div class="input-group">
                                        <input id="tpMtnEndTime" type="text" class="form-control modalInputField" placeholder="01:30 PM">
                                        <span class="input-group-text"><i class="ri-time-line"></i></span>
                                    </div>
                                </div>
                            </section>

                            <section class="row2Section2">
                                <section class="row2Section2-1" id="hallTimeSlotMovPoster">
                                    <div class="mb-3 mtnDescription">
                                        <label for="txtMtnDescriptiion" class="form-label">Maintenance Description</label>
                                        <textarea class="form-control modalInputField" id="Textarea1" rows="5" runat="server" clientidmode="static"></textarea>
                                    </div>
                                </section>
                            </section>

                        </div>

                        <div class="modal-footer">
                            <button type="button" id="btnClose" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                            <asp:Button ID="btnAddMtn" runat="server" ClientIDMode="static" CssClass="btn btn-secondary"
                                Text="Confirm" />
                        </div>

                    </div>
                </fieldset>

            </div>

        </div>
    </div>
</div>


            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [moviePoster], [movieName], [screenToDate], [screenFromDate], [movieDuration], [movieDistributor], [movieGenre] FROM [Movie]"></asp:SqlDataSource>
    </form>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Js" runat="server">
</asp:Content>
