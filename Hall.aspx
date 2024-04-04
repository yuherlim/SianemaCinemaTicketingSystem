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

    <link rel="stylesheet" href="css/admin/hall.css" />
    <script defer src="js/admin/hall.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="container">
            <div class="card card-fluid">
                <div id="row1" class="card-header row">
                    <span class="row1Space">Manage Hall</span>
                    <asp:DropDownList ID="ddlFilter" class="ddlFilter" runat="server">
                        <asp:ListItem Value="All Hall"></asp:ListItem>
                        <asp:ListItem Value="Large Hall"></asp:ListItem>
                        <asp:ListItem Value="Small Hall"></asp:ListItem>
                    </asp:DropDownList>
                    <%--Add Hall Button--%>
                    <asp:Button ID="btnAddHall" runat="server" ClientIDMode="static" CssClass="btn btn-primary btn-sm btnAdd" OnClick="btnAddHall_Click"
                        Text="Add Hall" />
                </div>


                <div id="row2" class="row">
                    <%--Hall List table--%>
                    <asp:GridView ID="gvHall" CssClass="table" BorderWidth="0px" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" ClientIDMode="Static">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <HeaderTemplate>
                                    <thead class="header">
                                        <tr>
                                            <th class="emptySlot" colspan="1"></th>
                                            <th colspan="1">Hall Name</th>
                                            <th colspan="1">Hall Type</th>
                                            <th colspan="1">Number of Seats</th>
                                            <th colspan="1"></th>
                                            <th colspan="1"></th>
                                        </tr>

                                        <tr class="headerBorder">
                                            <th class="border" colspan="6"></th>
                                        </tr>
                                    </thead>
                                </HeaderTemplate>

                            </asp:TemplateField>


                            <asp:BoundField ItemStyle-CssClass="hallName" DataField="hallName" HeaderText="Genre" ShowHeader="False" />
                            <asp:BoundField ItemStyle-CssClass="hallType" DataField="hallType" HeaderText="Duration" ShowHeader="False" />
                            <asp:BoundField ItemStyle-CssClass="numberOfSeats" DataField="numberOfSeats" HeaderText="Duration" ShowHeader="False" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <button type="button" id="btnView" class="btn btn-primary btn-sm btnViewHall">
                                        View
                                    </button>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>

                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <button type="button" id="btnEdit" class="btn btn-primary btn-sm btnRemoveHall">
                                        Remove
                                    </button>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div align="center">No records found.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Hall]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>

                </div>

                <!-- Hall Modal -->
                <div class="modal fade" id="modalHall" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="modalTitle">Add Hall</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div id="modalRowID" class="modalRow1 modalRow">
                                    <div class="modalText">Hall ID</div>
                                    <div class="modalColon">: </div>
                                    <div id="modalID">
                                        Hall-01
                                    </div>
                                </div>

                                <div class="modalRow2 modalRow">
                                    <section class="row2Section1">
                                        <div class="mb-3 hallName">
                                            <label for="hallName" class="form-label">Hall Name</label>
                                            <asp:TextBox ID="hallName" CssClass="form-control modalInputField hallNameInput" runat="server" ClientIDMode="Static" disabled="true" Text="Hall 01"></asp:TextBox>
                                        </div>
                                        <div class="mb-3 hallName">
                                            <label for="numberOfSeats" class="form-label">Number of Seats</label>
                                            <asp:TextBox ID="numberOfSeats" CssClass="form-control modalInputField numberOfSeatsInput" runat="server" ClientIDMode="Static" disabled="true" Text="190"></asp:TextBox>
                                        </div>
                                    </section>

                                    <section class="row2Section2">
                                        <div class="mb-3 hallType">
                                            <label for="hallType" class="form-label">Hall Type</label>
                                            <div class="radioButtonContainer">
                                                <input type="radio" id="hallType1" name="hallType" class="modalInputField" value="Large" onclick="displayHallImage()" checked="checked">
                                                <label for="hallType1">Large</label><br>
                                                <input type="radio" id="hallType2" name="hallType" class="modalInputField" value="Small" onclick="displayHallImage()">
                                                <label for="hallType2">Small</label><br>
                                            </div>
                                        </div>
                                    </section>

                                </div>

                                <div class="modalRow3 modalRow">
                                    <div class="hallImage">
                                        <asp:Image ID="hallImage" runat="server" ClientIDMode="Static" />
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
        </div>




























    </form>
</asp:Content>

