<%@ Page Title="" Language="C#" MasterPageFile="~/MPA.Master" AutoEventWireup="true" CodeBehind="CustomerInquire.aspx.cs" Inherits="SianemaCinemaTicketingSystem.CustomerInquire" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/admin/custInq.css" />
    <script defer src="js/admin/custInq.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="container">
            <div class="card card-fluid">
                <div id="row1" class="card-header row">
                    <span class="row1Space">Customer Inquiries</span>
                    <asp:DropDownList ID="ddlFilter" class="ddlFilter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                        <asp:ListItem Text="All Customer Inquiries" Value="All"></asp:ListItem>
                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                        <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div id="row2" class="row">
                    <asp:GridView ID="gvCustInq" CssClass="table" BorderWidth="0px" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" ClientIDMode="Static" Width="100%" ShowHeader="True" >
                        <Columns>
                            <asp:BoundField DataField="custInqID" HeaderText="Customer Inquiry ID" ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                            <asp:BoundField DataField="contactName" HeaderText="Contact Name" ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                            <asp:BoundField DataField="category" HeaderText="Category" ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                            <asp:BoundField DataField="status" HeaderText="Status" ItemStyle-Width="20%" HeaderStyle-Width="20%" />

                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <button type="button" id="btnView" class="btn btn-primary btn-sm btnViewCustInq">
                                        View
                                    </button>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Columns>



                        <%-- Empty data template for when no records are found --%>
                        <EmptyDataTemplate>
                            <div align="center">No records found.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>


                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CustInq]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CustInq] WHERE (@status = 'All' OR status = @status)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlFilter" Name="status" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>



                <%--modal--%>

                <div class="modal fade" id="modalCustInq" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <%-- Modal Header --%>
                            <%-- Consist of header and close btn --%>
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="modalTitle">View Customer Inquires</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <%-- Modal Body --%>
                            <%-- Consists of Input fields --%>
                            <div class="modal-body">
                                <%-- Display CustInq ID --%>
                                <%-- Should be replaced to server control label to retrieve data from server --%>
                                <div id="modalRowID" class="modalRow1 modalRow">
                                    <div class="modalText">Customer Inquire ID</div>
                                    <div class="modalColon">
                                        <asp:Label ID="custInqID" CssClass="form-control modalInputField custInqInput" runat="server" ClientIDMode="Static"></asp:Label>
                                        <asp:HiddenField ID="custInqIDField" runat="server" ClientIDMode="Static"></asp:HiddenField>
                                    </div>
                                </div>
                                <%-- 1st row of input field --%>


                                <div class="modalRow2 modalRow">
                                    <section class="row2Section1">
                                        <div class="mb-3">
                                            <label for="ContactName" class="form-label">Contact Name</label>
                                            <asp:Label ID="contactName" CssClass="form-control modalInputField custInqInput" runat="server" ClientIDMode="Static"></asp:Label>
                                        </div>

                                    </section>

                                    <section class="row2Section1">
                                        <div class="mb-3">
                                            <label for="status" class="form-label">Status</label>
                                            <div class="radioButtonContainer">
                                                <input type="radio" id="statusPending" name="status" class="modalInputField" value="Pending">
                                                <label for="statusPending">Pending</label><br>
                                                <input type="radio" id="statusCompleted" name="status" class="modalInputField" value="Completed">
                                                <label for="statusCompleted">Completed</label><br>
                                            </div>
                                        </div>
                                    </section>
                                </div>



                                <div class="modalRow2 modalRow">
                                    <section class="row2Section1">
                                        <div class="mb-3">
                                            <label for="ContactNum" class="form-label">Contact Number</label>
                                            <asp:Label ID="contactNum" CssClass="form-control modalInputField custInqInput" runat="server" ClientIDMode="Static"></asp:Label>
                                        </div>

                                    </section>

                                    <section class="row2Section2">
                                        <div class="mb-3">
                                            <label for="email" class="form-label">Email</label>
                                            <a id="email" class="form-control modalInputField custInqInput" runat="server" clientidmode="Static"></a>
                                        </div>

                                    </section>
                                </div>


                                <div class="modalRow2 modalRow">
                                    <section class="row2Section1">
                                        <div class="mb-3">
                                            <label for="category" class="form-label">Category</label>
                                            <asp:Label ID="category" CssClass="form-control modalInputField custInqInput" runat="server" ClientIDMode="Static"></asp:Label>
                                        </div>

                                    </section>

                                    <section class="row2Section2">
                                        <div class="mb-3">
                                            <label for="occurDate" class="form-label">Occur Date</label>
                                            <asp:Label ID="occurDate" CssClass="form-control modalInputField custInqInput" runat="server" ClientIDMode="Static"></asp:Label>
                                        </div>
                                    </section>
                                </div>


                                <div class="modalDesc">
                                    <div class="mb-3">
                                        <label for="desc" class="form-label">Description</label>
                                        <asp:Label ID="desc" CssClass="form-control modalInputField custInqIDInput" runat="server" ClientIDMode="Static"></asp:Label>
                                    </div>
                                </div>

                                <%--to show photo--%>
                                <div class="modalRow2">

                                    <div class="upFile">
                                        <label for="desc" class="form-label">Uploaded by client (Maybe be nothing)</label><br />
                                        <asp:Image ID="upFile" runat="server" ClientIDMode="Static" />
                                    </div>

                                </div>




                                <%-- Close button can add some function to clear the data of each input field--%>
                                <%-- Be aware of the nature of js injecting, the open modal trigger function will remain in the page until another postback is made, means after click add hall btn, the modal will be triggered whenever the page is refreshed--%>
                                <%-- Confirm button as server control to send back the value of input fields back to server for adding record--%>
                                <div class="modal-footer">
                                    <button type="button" id="btnClose" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                    <asp:Button ID="btnConfirm" runat="server" ClientIDMode="static" CssClass="btn btn-secondary" Text="Confirm" OnClick="btnConfirm_Click" />
                                </div>
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
