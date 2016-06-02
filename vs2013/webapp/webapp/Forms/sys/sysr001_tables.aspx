<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sysr001_tables.aspx.cs" Inherits="webapp.Forms.sys.sysr001_tables" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxRoundPanel ID="rpl_master" runat="server" OnInit="rpl_master_Init" ShowCollapseButton="true" Theme="BlackGlass" Width="100%">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" ReportTypeName="webapp.Forms.sys.sysr001_master" Theme="BlackGlass">
                        </dx:ASPxDocumentViewer>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </div>
    </form>
</body>
</html>
