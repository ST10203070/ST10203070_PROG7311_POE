<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="ST10203070_PROG7311_POE.ViewProducts" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Products</title>
    <style>
         body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 20px;
        }
        .container {
            margin: auto;
            width: 80%;
            padding: 10px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center; 
        }
        .filter-group {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            justify-content: center; 
        }
        label {
            margin-right: 10px;
        }
        select, input[type=date], input[type=text], button {
            padding: 5px;
            margin-right: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        button {
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
        }
        button:hover {
            background-color: #45a049;
        }
        .error-message {
            color: #d9534f;
            text-align: center;
            margin-bottom: 20px;
            width: 100%; 
        }
        .back-link {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #337ab7;
            transition: color 0.3s ease;
        }
        .back-link:hover {
            color: #23527c;
        }
         /* Button Styles */
        .btn-green {
            width: 5%;
            padding: 10px;
            margin-bottom: 2.5px;
            background-color: #5cb85c; 
            color: white; 
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            display: block; 
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .btn-green:hover {
            background-color: #4cae4c; 
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <asp:UpdatePanel runat="server" id="updatePanel">
            <ContentTemplate>
                <div class="container">
                    <h2>View Products</h2>
                    <div class="filter-group">
                        <label for="FarmerDropdown">Select Farmer:</label>
                        <asp:DropDownList ID="FarmerDropdown" runat="server" AutoPostBack="true" OnSelectedIndexChanged="FarmerDropdown_SelectedIndexChanged">
                        </asp:DropDownList>

                        <label for="StartDate">Start Date:</label>
                        <asp:TextBox ID="StartDate" runat="server" TextMode="Date" />
                        
                        <label for="EndDate">End Date:</label>
                        <asp:TextBox ID="EndDate" runat="server" TextMode="Date" />

                        <label for="ProductTypeDropdown">Product Type:</label>
                        <asp:DropDownList ID="ProductTypeDropdown" runat="server">
                        </asp:DropDownList>

                        <asp:Button ID="FilterProductsButton" runat="server" Text="Filter" OnClick="FilterProducts_Click" CssClass="btn-green"/>
                    </div>

                    <asp:GridView ID="ProductsGridView" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="ProductId" HeaderText="Product ID" />
                            <asp:BoundField DataField="Name" HeaderText="Product Name" />
                            <asp:BoundField DataField="Category" HeaderText="Category" />
                            <asp:BoundField DataField="ProductionDate" HeaderText="Production Date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="FarmerId" HeaderText="Farmer ID" />
                        </Columns>
                    </asp:GridView>
                    <asp:HyperLink ID="HomeLink" runat="server" NavigateUrl="~/Default.aspx" CssClass="back-link">Return to Home Page</asp:HyperLink>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <!-- Message displayed if the user is not an employee -->
        <div class="container">
            <asp:Label ID="NotEmployeeMessage" runat="server" CssClass="error-message" Visible="false">
                This feature is only available to employees.
            </asp:Label>
        </div>
    </form>
</body>
</html>
