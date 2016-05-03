<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="WebApplication1.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btn_man" runat="server" OnClick="btn_man_Click" Text="man" />
            <asp:Label ID="lbl_man" runat="server"></asp:Label>
        </div>
        <div>
            <asp:Button ID="btn_woman" runat="server" OnClick="btn_woman_Click" Text="woman" />
            <asp:Label ID="lbl_woman" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
