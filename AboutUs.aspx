<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="SianemaCinemaTicketingSystem.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .p-aboutus {
            margin: auto;
            width: 80%;
            padding: 10px;
            color: var(--gray);
            font-size: 18px;
            line-height: 1.8;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <form id="form1" runat="server">
        <div>
            <img src="au.png" alt="photo of aboutus" width="100%" height="400">
        </div>
        <div class="content-wrapper">
            <div>
                <br />
                <br />
                <h4 class="heading4">Who Are We ? </h4>
                <p class="p-aboutus">At Sianema Cinemas, the focus extends beyond merely screening movies to providing a complete entertainment experience. Since its inception in 1997, Sianema Cinemas has hosted millions of patrons, offering an extensive array of cinematic encounters in Malaysia.</p>
                <br />
                <p class="p-aboutus">Innovation lies at the heart of our operations. We take pride in pioneering initiatives such as introducing Malaysia's first IMAX with Laser Systems and 12-Channel Sound Technology, delivering an unparalleled moviegoing experience. Meanwhile, our Beanie halls offer a cozy retreat with comfortable beanbag pods. At Sianema, innovation knows no bounds, ensuring endless possibilities for our guests.</p>
                <br />
                <p class="p-aboutus">Sianema Cinemas serves as a hub where friends, families, and communities gather. We are dedicated to crafting joyful moments and unforgettable memories at the movies. Whether you seek family entertainment, a night out, luxurious indulgence, or an immersive cinematic journey, Sianema Cinemas caters to all your needs.</p>
            </div>
        </div>
    </form>

</asp:Content>
