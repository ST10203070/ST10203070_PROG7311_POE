<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ST10203070_PROG7311_POE.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
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

        <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />
        <asp:Label ID="ErrorMessage" runat="server" ForeColor="Red" />
    </div>
    </form>
</body>
</html>
