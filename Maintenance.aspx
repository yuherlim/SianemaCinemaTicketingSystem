<%@ Page Title="" Language="C#" MasterPageFile="~/MPA.Master" AutoEventWireup="true" CodeBehind="Maintenance.aspx.cs" Inherits="SianemaCinemaTicketingSystem.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/admin/maintenance.css" />
    <script defer src="js/admin/maintenance.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container">
            <div class="card card-fluid">
                <div id="row1" class="card-header row">
                    <span class="row1Space">Maintenance</span>
                    <asp:DropDownList ID="ddlFilter" class="ddlFilter" runat="server" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                        <asp:ListItem Value="All Maintenance"></asp:ListItem>
                        <asp:ListItem Value="Ongoing Maintenance"></asp:ListItem>
                        <asp:ListItem Value="Complete Maintenance"></asp:ListItem>
                    </asp:DropDownList>

                </div>


                <div id="row2" class="row">
                    <%--Maintenance List table--%>
                    <asp:GridView ID="gvMaintenance" CssClass="table" BorderWidth="0px" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" ClientIDMode="Static">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <HeaderTemplate>
                                    <thead class="header">
                                        <tr>
                                            <th class="emptySlot" colspan="1"></th>
                                            <th colspan="1">Maintenance ID</th>
                                            <th colspan="1">Staff In Charge</th>
                                            <th colspan="1">Date Time</th>
                                            <th colspan="1">Duration</th>
                                            <th colspan="1"></th>
                                        </tr>
                                        <tr class="headerBorder">
                                            <th class="border" colspan="6"></th>
                                        </tr>
                                    </thead>
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="" DataField="maintenanceID" ShowHeader="False" />
                            <asp:BoundField DataField="staffName" HeaderText="" ShowHeader="False" />
                            <asp:BoundField DataField="maintenanceDateTime" HeaderText="" ShowHeader="False" />
                            <asp:BoundField DataField="maintenanceDuration" HeaderText="" ShowHeader="False" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <button type="button" id="btnView" class="btn btn-primary btn-sm btnViewMaintenance">
                                        View
                                    </button>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div align="center">No records found.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Maintenance.maintenanceID, Maintenance.staffID, Maintenance.maintenanceDateTime, Maintenance.maintenanceDuration, Staff.staffName FROM Maintenance INNER JOIN Staff ON Maintenance.staffID = Staff.staffID"></asp:SqlDataSource>

                </div>
            </div>

            <!-- Maintenance Modal -->
            <div class="modal fade" id="modalMaintenance" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="modalTitle">View Maintenance</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div id="modalRowID" class="modalRow1 modalRow">
                                <div class="modalText">Maintenance ID</div>
                                <div class="modalColon">: </div>
                                <div id="modalID">
                                    MOV-310324-0001
                                </div>
                            </div>

                            <div class="modalRow2 modalRow">
                                <section class="row2Section1">

                                    <div class="mb-3 Staff">
                                        <label for="sltStaff" class="form-label">Staff In Charge</label><br />
                                        <select id="sltStaff" class="select2 form-control select2-multiple sltGenre modalInputField" data-toggle="select2" data-placeholder="Choose ..." tabindex="-1" aria-hidden="true">
                                            <option value="Sia Yeong Sheng">Sia Yeong Sheng</option>                

                                        </select>
                                    </div>

                                    <div class="mb-3 MaintenanceDateTime">
                                        <label class="form-label">Maintenance Date Time</label>
                                        <div class="input-group">
                                            <input id="tpMtnDateTime" type="text" class="form-control modalInputField" placeholder="01:30 PM">
                                            <span class="input-group-text"><i class="ri-time-line"></i></span>
                                        </div>
                                    </div>

                                    <div class="mb-3 Duration">
                                        <label class="form-label">Maintenance Duration</label>
                                        <div class="input-group">
                                            <input id="tpMtnDuration" type="text" class="form-control modalInputField" placeholder="01:30">
                                            <span class="input-group-text"><i class="ri-time-line"></i></span>
                                        </div>
                                    </div>
                                </section>

                                <section class="row2Section2">
                                    <section class="row2Section2-1">
                                        <div class="mb-3 mtnDescription">
                                            <label for="txtMtnDescriptiion" class="form-label">Maintenance Description</label>
                                            <textarea class="form-control modalInputField" id="Textarea1" rows="5" runat="server" clientidmode="static"></textarea>
                                        </div>
                                    </section>
                                </section>

                            </div>

                            <div class="modal-footer">
                                <button type="button" id="btnClose" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Js" runat="server">
</asp:Content>
