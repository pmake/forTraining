<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css_login.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div id="loginframe">
        <div id="top">
            <asp:Label ID="Label1" runat="server" Text="登入進銷存管理系統"></asp:Label>
        </div>
        <div id="mid">
            <table>
                <tr>
                    <td class="firstd">
                        <asp:Label ID="Label2" runat="server" Text="登入帳號："></asp:Label></td>
                    <td class="secondd">
                        <asp:TextBox ID="txt_userid" runat="server"></asp:TextBox></td>
                    <td class="thirdd">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_userid" ErrorMessage="*" ForeColor="#FF3300" ToolTip="帳號為必填欄位"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="firstd">
                        <asp:Label ID="Label3" runat="server" Text="登入密碼："></asp:Label></td>
                    <td class="secondd">
                        <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox></td>
                    <td class="thirdd">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_password" ErrorMessage="*" ForeColor="Red" ToolTip="密碼為必填欄位"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </div>
        <div id="bot">
            <asp:Button ID="Button1" runat="server" Text="登入" OnClick="Button1_Click" />
        </div>
        <div id="message"><asp:Label ID="lbl_message" runat="server" Text=""></asp:Label></div>
    </div>
    </form>
</body>
</html>
