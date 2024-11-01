﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MPA.Master" AutoEventWireup="true" CodeBehind="HallTimeSlot.aspx.cs" Inherits="SianemaCinemaTicketingSystem.HallTimeSlot" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/admin/hallTimeSlot.css" />
    <script defer src="js/admin/hallTimeSlot.js"></script>
    <style>
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="card card-fluid">
            <div id="row1" class="card-header row">
                <span class="row1Space">Manage Hall TimeSlot</span>
                <div class="mb-3 selectDate" id="selectDate">
                    <div class="input-group selectDate-input">
                        <input id="tpSelectDate" type="text" class="form-control" placeholder="23-03-2024" />
                        <span class="input-group-text"><i class="ri-time-line"></i></span>
                        <asp:HiddenField runat="server" ID="TimeSlotDateValue" ClientIDMode="Static"></asp:HiddenField>
                        <asp:Button runat="server" ClientIDMode="Static" ID="btnSearchDate" CssClass="btn btn-primary btn-sm btnAdd" OnClick="btnSearchDate_Click"
                            Text="Search" />
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
                                <asp:Repeater ID="TimeSlotRepeater" OnItemDataBound="TimeSlotRepeater_ItemDataBound" runat="server">
                                    <ItemTemplate>
                                        <div class="timeSlot">
                                            <span class="timeSlotMovieName">
                                                <asp:Button ID="timeSlotButtonID" CssClass="timeSlotButton" ClientIDMode="Static" runat="server" OnClick="timeSlotButtonID_Click" /><asp:HiddenField runat="server" ID="timeSlotButtonFieldValue" ClientIDMode="Static" />
                                            </span>
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
                                    <asp:Label runat="server" ClientIDMode="Static" ID="movID"></asp:Label>
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
                                        <asp:HiddenField runat="server" ClientIDMode="Static" ID="movGenreValue"></asp:HiddenField>
                                    </div>

                                    <div class="mb-3 movClassification">
                                        <label for="sltClass" class="form-label">Movie Classification</label><br />
                                        <select id="sltClass" class="select2 form-control select2-multiple sltGenre modalInputField" data-toggle="select2" data-placeholder="Choose ..." tabindex="-1" aria-hidden="true">
                                            <option value="U">U</option>
                                            <option value="P12">P12</option>
                                            <option value="13">13</option>
                                            <option value="16">16</option>
                                            <option value="18">18</option>
                                        </select>
                                        <asp:HiddenField runat="server" ClientIDMode="Static" ID="movClassificationValue"></asp:HiddenField>
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
                                        <asp:HiddenField runat="server" ClientIDMode="Static" ID="movLanguageValue"></asp:HiddenField>
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
                                        <asp:HiddenField runat="server" ClientIDMode="Static" ID="movSubtitleValue"></asp:HiddenField>
                                    </div>

                                    <div class="mb-3 movDuration">
                                        <label class="form-label">Movie Duration</label>
                                        <div class="input-group">
                                            <input id="tpDuration" type="text" class="form-control modalInputField" placeholder="01:30">
                                            <span class="input-group-text"><i class="ri-time-line"></i></span>
                                            <asp:HiddenField runat="server" ClientIDMode="Static" ID="movDurationValue"></asp:HiddenField>
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
                                            <asp:HiddenField runat="server" ClientIDMode="Static" ID="movPosterImageValue"></asp:HiddenField>
                                        </div>
                                    </section>

                                    <section class="row2Section2-2">
                                        <div class="mb-3 movCoverPhoto">
                                            <label for="fuCoverPhoto" class="form-label">Movie CoverPhoto</label>
                                            <asp:FileUpload ID="fuCoverPhoto" class="form-control modalInputField" runat="server" ClientIDMode="static" />
                                        </div>

                                        <div class="movImage">
                                            <asp:Image ID="movCoverPhotoImage" runat="server" ClientIDMode="Static" />
                                            <asp:HiddenField runat="server" ClientIDMode="Static" ID="movCoverPhotoImageValue"></asp:HiddenField>
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
                                        <asp:HiddenField runat="server" ClientIDMode="Static" ID="movReleaseDateValue"></asp:HiddenField>
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
                                    <asp:HiddenField runat="server" ClientIDMode="Static" ID="movCastValue"></asp:HiddenField>
                                </div>

                                <div class="mb-3 movSypnosis">
                                    <label for="txtSypnosis" class="form-label">Movie Sypnosis</label>
                                    <textarea class="form-control modalInputField" id="txtSypnosis" rows="5" runat="server" clientidmode="static"></textarea>
                                    <asp:HiddenField runat="server" ClientIDMode="Static" ID="movSynopsisValue"></asp:HiddenField>
                                </div>

                            </div>

                            <div class="modalRow5 modalRow">

                                <div class="mb-3 movScreenFrom">
                                    <label class="form-label">Movie Screen From</label>
                                    <div class="input-group">
                                        <input id="tpScreenFrom" type="text" class="form-control modalInputField" placeholder="23-03-2024" />
                                        <span class="input-group-text"><i class="ri-time-line"></i></span>
                                        <asp:HiddenField runat="server" ClientIDMode="Static" ID="movScreenFromValue"></asp:HiddenField>
                                    </div>
                                </div>

                                <div class="mb-3 movScreenUntil">
                                    <label class="form-label">Movie Screen Until</label>
                                    <div class="input-group">
                                        <input id="tpScreenUntil" type="text" class="form-control modalInputField" placeholder="23-03-2024" />
                                        <span class="input-group-text"><i class="ri-time-line"></i></span>
                                        <asp:HiddenField runat="server" ClientIDMode="Static" ID="movScreenUntilValue"></asp:HiddenField>
                                    </div>
                                </div>

                            </div>

                            <div class="modal-footer">
                                <button type="button" id="btnCloseMovieModal" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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
                        </div>
                        <div class="line"></div>
                        <div class="modal-body p-0">
                            <div class="modal-header modalTSTitle">
                                <h1 class="modal-title fs-5" id="modalTSTitle">Assign Movie</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="hallTimeSlotRow">
                                <div class="hallDetailContainer">
                                    <div class="hallName">
                                        <asp:Label ID="lblHallName" runat="server" ClientIDMode="Static" Text="Label"></asp:Label>
                                    </div>
                                    <div class="hallType">
                                        <asp:Label ID="lblHallType" runat="server" ClientIDMode="Static" Text="Label"></asp:Label>
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
                                        <asp:Repeater ID="rptAddTSMovie" runat="server" OnItemDataBound="rptAddTSMovie_ItemDataBound">
                                            <ItemTemplate>
                                                <div class="hallTimeSlot">
                                                    <span class="timeSlotMovieName">
                                                        <asp:Button ID="AddTimeSlotButtonID" CssClass="timeSlotButton disabled-darker" ClientIDMode="Static" runat="server" disabled="true" /><asp:HiddenField runat="server" ID="AddTimeSlotButtonFieldValue" ClientIDMode="Static" />
                                                    </span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:HiddenField runat="server" ID="onScreenMovieListValue" ClientIDMode="Static"></asp:HiddenField>
                                    </div>
                                </div>
                            </div>
                            <fieldset class="show" id="tab011" class="field1">
                                <div class="modal-body">

                                    <div class="modalRow2 modalRow">
                                        <section class="row2Section1">

                                            <div class="mb-3 movSelect">
                                                <label for="sltMovie" class="form-label">Movie</label><br />
                                                <select id="sltMovie" class="select2 form-control select2-multiple sltGenre modalInputField" data-toggle="select2" data-placeholder="Choose ..." tabindex="-1" aria-hidden="true">
                                                </select>
                                                <asp:HiddenField ClientIDMode="Static" ID="selectedMovieValue" runat="server" />
                                            </div>

                                            <div class="mb-3 movStartTime">
                                                <div class="MovieStartTimeLabel">
                                                    <label class="form-label">Movie Start Time</label>
                                                    <span id="movieStartTimeIsvalid" class="MovieStartTimeValidityLabel">Valid</span>
                                                </div>
                                                <div class="input-group">
                                                    <input id="tpMovStartTime" type="text" class="form-control modalInputField" placeholder="01:30 PM">
                                                    <span class="input-group-text"><i class="ri-time-line"></i></span>
                                                </div>
                                                <asp:HiddenField ClientIDMode="Static" ID="starTimeValue" runat="server" />
                                                <asp:HiddenField ClientIDMode="Static" ID="starTimeValidity" runat="server" />
                                            </div>

                                            <div class="mb-3 movDuration">
                                                <label class="form-label">Movie Duration</label>
                                                <div class="input-group">
                                                    <input id="tpMovDuration" type="text" class="form-control modalInputField" placeholder="01:30">
                                                    <span class="input-group-text"><i class="ri-time-line"></i></span>
                                                </div>
                                                <asp:HiddenField ClientIDMode="Static" ID="durationTimeValue" runat="server" />
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
                                        <button type="button" id="btnCloseTSModalAssignMov" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <asp:Button ID="btnAssignMovie" runat="server" ClientIDMode="static" CssClass="btn btn-secondary"
                                            Text="Confirm" OnClick="btnAssignMovie_Click" />
                                    </div>
                                    <asp:HiddenField ClientIDMode="Static" ID="confirmBtnMode" runat="server" />
                                </div>                  

                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [moviePoster], [movieName], [screenToDate], [screenFromDate], [movieDuration], [movieDistributor], [movieGenre] FROM [Movie]"></asp:SqlDataSource>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Js" runat="server">
</asp:Content>
