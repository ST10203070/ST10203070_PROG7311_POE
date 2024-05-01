<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ST10203070_PROG7311_POE.AddProduct" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            height: 100vh;
            align-items: center;
        }
        .container {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
        }
        .container label {
            display: block;
            margin-bottom: 5px;
            text-align: left;
        }
        .container input[type=text], .container input[type=password], .container input[type=date] {
            width: 94%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .container button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #5cb85c;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }
        .container button:hover {
            background-color: #4cae4c;
        }
        .error-message {
            color: #d9534f;
            text-align: center;
            margin-bottom: 20px;
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
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
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

    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <!-- Only display the following if the user is a farmer -->
            <asp:Panel ID="AddProductPanel" runat="server" Visible="false">
                <h2>Add New Product</h2>

                <asp:Label runat="server" AssociatedControlID="ProductName" Text="Product Name"></asp:Label>
                <asp:TextBox ID="ProductName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ProductName"
                                            ErrorMessage="Product name is required" CssClass="error-message" />

                <asp:Label runat="server" AssociatedControlID="Category" Text="Category"></asp:Label>
                <asp:TextBox ID="Category" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Category"
                                            ErrorMessage="Category is required" CssClass="error-message" />

                <asp:Label runat="server" AssociatedControlID="ProductionDate" Text="Production Date"></asp:Label>
                <asp:TextBox ID="ProductionDate" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ProductionDate"
                                            ErrorMessage="Production date is required" CssClass="error-message" />

                <asp:Button ID="SubmitProduct" runat="server" Text="Add Product" OnClick="SubmitProduct_Click" CssClass="btn-green" />

                <asp:Label ID="ErrorMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>
                <asp:Label ID="SuccessLabel" runat="server" CssClass="success-message" Visible="false"></asp:Label>
                <a href="Default.aspx" class="back-link">Return to Home Page</a>
            </asp:Panel>

            <!-- Message displayed if the user is not a farmer -->
            <asp:Label ID="NotFarmerMessage" runat="server" CssClass="error-message" Visible="false">
                This feature is only available to farmers.
            </asp:Label>
        </form>
    </div>
</body>
</html>