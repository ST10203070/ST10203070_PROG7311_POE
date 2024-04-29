<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ST10203070_PROG7311_POE._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">Agri-Energy Connect</h1>
            <p class="lead">Agri-Energy Connect is a web platform that bridges the gap between the agricultural sector and green energy technology providers.</p>
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="farmingHubTitle">
                <h2 id="farmingHubTitle">Sustainable Farming Hub</h2>
                <p>
                    A resource centre for sharing best practices in sustainable farming, including organic farming techniques, water conservation methods, and soil health maintenance.
                    Interactive forums and discussion boards for farmers to seek advice, share experiences, and collaborate on sustainable farming initiatives.
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="greenEnergyTitle">
                <h2 id="greenEnergyTitle">Green Energy Marketplace</h2>
                <p>
                   A marketplace for green energy solutions tailored to agricultural needs, such as solar-powered irrigation systems, wind turbines for farms, and biogas energy solutions.
                   Features for comparing products, reviewing technologies, and connecting with green tech providers.
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="educationTitle">
                <h2 id="educationTitle">Educational and Training Resources</h2>
                <p>
                    Online courses, webinars, and workshops on integrating green energy technologies in agriculture.
                    Material focusing on the benefits and practicalities of adopting renewable energy sources on farms.                
                </p>
            </section>
        </div>
    </main>

</asp:Content>
