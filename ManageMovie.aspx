<%@ Page Title="" Language="C#" MasterPageFile="~/MPA.Master" AutoEventWireup="true" CodeBehind="ManageMovie.aspx.cs" Inherits="SianemaCinemaTicketingSystem.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <asp:Button ID="btnAddMovie" class="btn btn-primary btn-sm btnAddAdmin" runat="server" Text="Add Movie" OnClick="btnAddMovie_Click" />
            </div>
            <asp:GridView ID="gvMovie" class="table table-bordered table-striped mb-0" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="gvMovie_SelectedIndexChanged">
                <Columns>
                    
                    <asp:ImageField DataImageUrlField="moviePoster" HeaderText="Image">
                        <ControlStyle Height="150px" Width="100px" />
                    </asp:ImageField>
                    <asp:BoundField HeaderText = "movieName" DataField="movieName" SortExpression="movieName" />
                    <asp:BoundField DataField="screenToDate" HeaderText="screenToDate" SortExpression="screenToDate" />
                    <asp:BoundField DataField="screenFromDate" HeaderText="screenFromDate" SortExpression="screenFromDate" />
                    <asp:BoundField DataField="movieDuration" HeaderText="movieDuration" SortExpression="movieDuration" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [moviePoster], [movieName], [screenToDate], [screenFromDate], [movieDuration], [movieDistributor] FROM [Movie]"></asp:SqlDataSource>
    </form>

</asp:Content>
