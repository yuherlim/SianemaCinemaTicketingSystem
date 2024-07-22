<%@ Page Title="" Language="C#" MasterPageFile="~/MPA.Master" AutoEventWireup="true" CodeBehind="Hall.aspx.cs" Inherits="SianemaCinemaTicketingSystem.Hall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/admin/hall.css" />
    <script defer src="js/admin/hall.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card card-fluid">
            <div id="row1" class="card-header row">
                <span class="row1Space">Manage Hall</span>
                <%-- Can set onChange event, based on different value selected run different query and bind data to repeater --%>
                <asp:DropDownList ID="ddlFilter" class="ddlFilter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                    <asp:ListItem Text="All Hall" Value="All"></asp:ListItem>
                    <asp:ListItem Text="Large Hall" Value="Large"></asp:ListItem>
                    <asp:ListItem Text="Small Hall" Value="Small"></asp:ListItem>
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
                            <%--Table Header--%>
                            <%-- Create own table header instead of using the preset header to make the border bottom wont disappear when scolling the content --%>
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

                            <%-- Table column --%>
                            <%-- Template for each record row--%>
                        </asp:TemplateField>
                        <asp:BoundField ItemStyle-CssClass="hallName" DataField="hallName" HeaderText="Genre" ShowHeader="False" />
                        <asp:BoundField ItemStyle-CssClass="hallType" DataField="hallType" HeaderText="Duration" ShowHeader="False" />
                        <asp:BoundField ItemStyle-CssClass="numberOfSeats" DataField="numberOfSeats" HeaderText="Duration" ShowHeader="False" />
                        <%-- View Button --%>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <button type="button" id="btnView" class="btn btn-primary btn-sm btnViewHall">
                                    View
                                </button>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <%-- Remove Button --%>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <button type="button" id="btnRemoveHall" class="btn btn-primary btn-sm btnRemoveHall">
                                    Remove
                                </button>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>

                    </Columns>
                    <%-- It will be displayed when there is no record found in the database --%>
                    <EmptyDataTemplate>
                        <div align="center">No records found.</div>
                    </EmptyDataTemplate>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Hall]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [Hall] WHERE (@hallType = 'All' OR hallType = @hallType)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlFilter" Name="hallType" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <!-- Hall Modal -->
            <div class="modal fade" id="modalHall" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <%-- Modal Header --%>
                        <%-- Consist of header and close btn --%>
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="modalTitle">Add Hall</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <%-- Modal Body --%>
                        <%-- Consists of Input fields --%>
                        <div class="modal-body">
                            <%-- Display hall ID --%>
                            <%-- Should be replaced to server control label to retrieve data from server --%>
                            <%-- ID are autogenerated when clicked the add hall btn --%>
                            <div id="modalRowID" class="modalRow1 modalRow">
                                <div class="modalText">Hall ID</div>
                                <div class="modalColon"></div>
                                <asp:Label ID="modalId" CssClass="form-control modalInputField hallNameInput" runat="server" ClientIDMode="Static"></asp:Label>


                            </div>
                            <%-- 1st row of input field --%>
                            <%-- Consists of two section that organized side by side left to right--%>
                            <div class="modalRow2 modalRow">
                                <section class="row2Section1">
                                    <div class="mb-3 hallName">
                                        <label for="hallName" class="form-label">Hall Name</label>
                                        <asp:TextBox ID="hallName" CssClass="form-control modalInputField hallNameInput" runat="server" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                    <div class="mb-3 hallName">
                                        <label for="numberOfSeats" class="form-label">Number of Seats</label>
                                        <asp:TextBox ID="numberOfSeats" CssClass="form-control modalInputField numberOfSeatsInput" runat="server" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </section>
                                <%-- Hall type radio button--%>
                                <%-- May need hidden server control label to store the selection --%>
                                <%-- The label can be used for save selection from user or retrieve the halltype selected from server for display when in view hall. The radio btn selection can be modified by using javascript to add "checked" attribute to the radio btn input  --%>
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
                            <%-- Hall Image --%>
                            <div class="modalRow3 modalRow">
                                <div class="hallImage">
                                    <asp:Image ID="hallImage" runat="server" ClientIDMode="Static" />
                                </div>

                            </div>


                            <%-- Close button can add some function to clear the data of each input field--%>
                            <%-- Be aware of the nature of js injecting, the open modal trigger function will remain in the page until another postback is made, means after click add hall btn, the modal will be triggered whenever the page is refreshed--%>
                            <%-- Confirm button as server control to send back the value of input fields back to server for adding record--%>
                            <div class="modal-footer">
                                <button type="button" id="btnClose" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                <asp:Button ID="btnConfirm" runat="server" ClientIDMode="static" CssClass="btn btn-secondary" OnClick="btnConfirm_Click"
                                    Text="Confirm" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>







</asp:Content>
