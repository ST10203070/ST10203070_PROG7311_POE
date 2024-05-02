<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ST10203070_PROG7311_POE.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
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
            width: 300px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .container h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .container label {
            display: block;
            margin-bottom: 5px;
        }
        .container input[type=text], 
        .container input[type=password], 
        .container select {
            width: 90%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .container input[type=submit] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #5cb85c;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .container input[type=submit]:hover {
            background-color: #4cae4c;
        }
        .error-message {
            color: #d9534f;
            text-align: center;
            margin-bottom: 20px;
        }
        
        .login-link {
            display: block;
            margin-top: 15px;
            color: #0077CC;
            text-decoration: none;
            text-align: center;
        }

        .login-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Register</h2>
            <asp:Label runat="server" AssociatedControlID="Username" Text="Username" />
            <asp:TextBox ID="Username" runat="server" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                                        ErrorMessage="Username is required" CssClass="error-message" />
            <br />

            <asp:Label runat="server" AssociatedControlID="Password" Text="Password" />
            <asp:TextBox ID="Password" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                        ErrorMessage="Password is required" CssClass="error-message" />
            <br />

            <asp:Label runat="server" Text="Role" />
            <asp:DropDownList ID="Role" runat="server">
                <asp:ListItem Text="Farmer" Value="Farmer" />
                <asp:ListItem Text="Employee" Value="Employee" />
            </asp:DropDownList>
            <br />

            <asp:Button ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click" />
            <asp:Label ID="ErrorMessage" runat="server" CssClass="error-message" />
            <asp:HyperLink ID="LoginHyperLink" runat="server" NavigateUrl="~/Login.aspx" Text="Already have an account? Login here." CssClass="login-link" />

        </div>
    </form>
</body>
</html>
