<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ST10203070_PROG7311_POE.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .container input[type=text], 
        .container input[type=password] {
            width: 90%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .container button {
            width: 100%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
        }
        .container button:hover {
            background-color: #4cae4c;
        }
        .error-message {
            color: red;
            text-align: center;
        }

        .btn-green {
            width: 100%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s; 
        }

        .btn-green:hover {
            background-color: #4cae4c;
        }

        .register-link {
        display: block;
        margin-top: 15px; 
        color: #0077CC;
        text-decoration: none; 
        text-align: center; 
        }

        .register-link:hover {
            text-decoration: underline; 
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Login</h2>
            <asp:Label runat="server" AssociatedControlID="Username" Text="Username" />
            <asp:TextBox ID="Username" runat="server" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                                        ErrorMessage="Username is required" ForeColor="Red" />
            <br />

            <asp:Label runat="server" AssociatedControlID="Password" Text="Password" />
            <asp:TextBox ID="Password" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                        ErrorMessage="Password is required" ForeColor="Red" />
            <br />

            <asp:Button ID="LoginButton" runat="server" CssClass="btn-green" Text="Login" OnClick="LoginButton_Click" />
            <asp:Label ID="ErrorMessage" runat="server" CssClass="error-message" />

            <asp:HyperLink ID="RegisterHyperLink" runat="server" NavigateUrl="~/Register.aspx" Text="Don't have an account? Create one here." CssClass="register-link" />

        </div>
    </form>
</body>
</html>
