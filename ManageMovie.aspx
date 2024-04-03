<%@ Page Title="" Language="C#" MasterPageFile="~/MPA.Master" AutoEventWireup="true" CodeBehind="ManageMovie.aspx.cs" Inherits="SianemaCinemaTicketingSystem.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/admin/manageMovie.css" />
    <script defer src="js/admin/manage-movie.js"></script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <form id="form1" runat="server">
        <div class="container">
            <div class="card card-fluid">
                <div id="row1" class="card-header row">
                    <span class="row1Space">Manage Movie</span>
                    <asp:DropDownList ID="ddlFilter" class="ddlFilter" runat="server" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                        <asp:ListItem Value="All Movie"></asp:ListItem>
                        <asp:ListItem Value="Onscreen Movie"></asp:ListItem>
                        <asp:ListItem Value="Offscreen movie"></asp:ListItem>
                    </asp:DropDownList>
                    <%--Add Movie Button--%>
                    <asp:Button ID="btnAddMovie" runat="server" ClientIDMode="static" CssClass="btn btn-primary btn-sm btnAdd" OnClick="btnAddMovie_Click"
                        Text="Add Movie" />
                </div>


                <div id="row2" class="row">
                    <%--Movies List table--%>
                    <asp:GridView ID="gvMovie" CssClass="table" BorderWidth="0px" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" ClientIDMode="Static" OnSelectedIndexChanged="gvMovie_SelectedIndexChanged1">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <HeaderTemplate>
                                    <thead class="header">
                                        <tr>
                                            <th class="emptySlot" colspan="1"></th>
                                            <th colspan="1">Image</th>
                                            <th colspan="1">Name</th>
                                            <th colspan="1">Genre</th>
                                            <th colspan="1">Duration</th>
                                            <th colspan="1">Distributor</th>
                                            <th colspan="1">Screen From</th>
                                            <th colspan="1">Screen Until</th>
                                            <th colspan="1"></th>
                                            <th colspan="1"></th>
                                        </tr>
                                        <tr class="headerBorder">
                                            <th class="border" colspan="10"></th>
                                        </tr>
                                    </thead>
                                </HeaderTemplate>

                            </asp:TemplateField>

                            <asp:ImageField DataImageUrlField="moviePoster" HeaderText="Image">
                                <ControlStyle Height="150px" Width="100px" />
                            </asp:ImageField>
                            <asp:BoundField HeaderText="Name" DataField="movieName" ShowHeader="False" />
                            <asp:BoundField DataField="movieGenre" HeaderText="Genre" ShowHeader="False" />
                            <asp:BoundField DataField="movieDuration" HeaderText="Duration" ShowHeader="False" />
                            <asp:BoundField DataField="movieDistributor" HeaderText="Distributor" ShowHeader="False" />
                            <asp:BoundField DataField="screenFromDate" HeaderText="Screen From" ShowHeader="False" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="screenUntilDate" HeaderText="Screen Until" ShowHeader="False" DataFormatString="{0:d}" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <button type="button" id="btnView" class="btn btn-primary btn-sm btnViewMovie">
                                        View
                                    </button>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>

                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <button type="button" id="btnEdit" class="btn btn-primary btn-sm btnEditMovie">
                                        Edit
                                    </button>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div align="center">No records found.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [moviePoster], [movieName], [movieSynopsis], [screenFromDate], [movieDuration], [screenUntilDate], [movieDistributor], [movieGenre] FROM [Movie] WHERE movieID <> 'NA'"></asp:SqlDataSource>
                 
                </div>
            </div>

            <!-- Movie Modal -->
            <div class="modal fade" id="modalMovie" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="modalTitle">Add Movie</h1>
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
                                            <option value="Action">Action</option>
                                            <option value="Adventure">Adventure</option>
                                            <option value="Comedy">Comedy</option>
                                            <option value="Fantasy">Fantasy</option>
                                            <option value="Horror">Horror</option>
                                            <option value="Romance">Romance</option>
                                        </select>
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

                                <asp:Button ID="btnConfirm" runat="server" ClientIDMode="static" CssClass="btn btn-secondary"
                                    Text="Confirm" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


    </form>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Js" runat="server">
</asp:Content>
