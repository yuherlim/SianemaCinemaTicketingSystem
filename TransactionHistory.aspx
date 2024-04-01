<%@ Page Title="" Language="C#" MasterPageFile="~/UserAccount.master" AutoEventWireup="true" CodeBehind="TransactionHistory.aspx.cs" Inherits="SianemaCinemaTicketingSystem.TransactionHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SIA NEMA - Transaction History</title>
    <link rel="stylesheet" href="./css/transactionHistory.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main class="transaction-history">
        <div class="content-wrapper">
            <div class="tab-container">
                <nav class="transaction-history-nav">
                    <div class="nav" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link active" id="nav-upcoming-movie-tab" data-toggle="tab" href="#nav-upcoming-movie" role="tab" aria-controls="nav-upcoming-movie" aria-selected="true">Upcoming Movie</a>
                        <a class="nav-item nav-link" id="nav-last-seen-tab" data-toggle="tab" href="#nav-last-seen" role="tab" aria-controls="nav-last-seen" aria-selected="false">Last Seen</a>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-upcoming-movie" role="tabpanel" aria-labelledby="nav-upcoming-movie-tab">
                        <div class="card">
                            <div class="card-header">
                                Yolo
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Special title treatment</h5>
                                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                            <div class="card-footer text-muted text-right">
                                2 days ago
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-last-seen" role="tabpanel" aria-labelledby="nav-last-seen-tab">
                        <div class="card">
                            <div class="card-header">
                                Violet Evergarden
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Special title treatment</h5>
                                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                            <div class="card-footer text-muted text-right">
                                2 days ago
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
