<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zzzp003_filemanager.aspx.cs" Inherits="webapp.Forms.zzz.zzzp003_filemanager" %>

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
                        <dx:ASPxFileManager ID="fmg_master" runat="server" EnableTheming="True" Theme="BlackGlass">
                            <Settings InitialFolder="/Johnson" RootFolder="~/Files/Users" ThumbnailFolder="~/Thumb/" />
                            <SettingsEditing AllowCopy="True" AllowCreate="True" AllowDelete="True" AllowDownload="True" AllowMove="True" AllowRename="True" />
                            <SettingsUpload>
                                <AdvancedModeSettings EnableMultiSelect="True">
                                </AdvancedModeSettings>
                            </SettingsUpload>
                        </dx:ASPxFileManager>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </div>
    </form>
</body>
</html>
