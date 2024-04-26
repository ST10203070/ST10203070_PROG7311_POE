<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ST10203070_PROG7311_POE.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-top:50px; text-align:center;">
            <h2>Register</h2>
            <asp:Label runat="server" AssociatedControlID="Username" Text="Username" />
            <asp:TextBox ID="Username" runat="server" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                                        ErrorMessage="Username is required" ForeColor="Red" /><br />
        <br />

        <asp:Label runat="server" AssociatedControlID="Password" Text="Password" />
        <asp:TextBox ID="Password" runat="server" TextMode="Password" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                    ErrorMessage="Password is required" ForeColor="Red" />
        <br />

        <asp:Label runat="server" Text="Role" />
        <asp:DropDownList ID="Role" runat="server">
            <asp:ListItem Text="Farmer" Value="Farmer" />
            <asp:ListItem Text="Employee" Value="Employee" />
        </asp:DropDownList>
        <br />

        <asp:Button ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click" />
        <asp:Label ID="ErrorMessage" runat="server" ForeColor="Red" />
    </div>
</form>
</body>
</html>