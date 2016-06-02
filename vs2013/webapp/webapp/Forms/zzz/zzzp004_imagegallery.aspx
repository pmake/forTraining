<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zzzp004_imagegallery.aspx.cs" Inherits="webapp.Forms.zzz.zzzp004_imagegallery" %>

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
    <dx:ASPxImageGallery ID="igr_master" runat="server" EnableTheming="True" Layout="Flow" Theme="BlackGlass">
        <SettingsFolder ImageCacheFolder="~/Thumb/" ImageSourceFolder="~/photos" />
        <SettingsFullscreenViewer SlideShowInterval="3000" />
        <SettingsTableLayout ColumnCount="3" />
    </dx:ASPxImageGallery>
                    </dx:PanelContent>
</PanelCollection>
            </dx:ASPxRoundPanel>
        </div>
    </form>
</body>
</html>
