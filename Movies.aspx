<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="SianemaCinemaTicketingSystem.Movies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <section class="container">
            <h2>Movies in SiaNema</h2>

            <asp:Repeater ID="MovieRepeater" runat="server" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <div class ="movie-container">
                </HeaderTemplate>
                <ItemTemplate>

                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("moviePoster") %>' Height="400" Width="300" />

                </ItemTemplate>
               
                <FooterTemplate>
                    </div>
                </FooterTemplate>


            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Movie]"></asp:SqlDataSource>
        </section>
    </form>
</asp:Content>
