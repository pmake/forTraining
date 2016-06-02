<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zzzp006_imagezoom.aspx.cs" Inherits="webapp.Forms.zzz.zzzp006_imagezoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxRoundPanel ID="rpl_master" runat="server" ShowCollapseButton="true" Theme="BlackGlass" Width="100%">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </div>
    </form>
</body>
</html>
