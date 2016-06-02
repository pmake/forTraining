<%@ Page Title="" Language="C#" MasterPageFile="~/manager.Master" AutoEventWireup="true" CodeBehind="sysr001_tables.aspx.cs" Inherits="webmall.Forms.sys.sysr001_tables" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="rpl_master" runat="server" OnInit="rpl_master_Init" ShowCollapseButton="true" Theme="Office2003Olive" Width="100%">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" ReportTypeName="webmall.forms.sys.sysr001_master" Theme="Office2003Olive">
                    </dx:ASPxDocumentViewer>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
</asp:Content>
