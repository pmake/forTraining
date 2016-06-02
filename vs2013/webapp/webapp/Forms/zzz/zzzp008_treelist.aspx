<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zzzp008_treelist.aspx.cs" Inherits="webapp.Forms.zzz.zzzp008_treelist" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

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
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btn_excel" runat="server" Font-Size="Medium" OnClick="btn_excel_Click" Text="轉出 Excel" Theme="BlackGlass">
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btn_pdf" runat="server" Font-Size="Medium" OnClick="btn_pdf_Click" Text="轉出 PDF" Theme="BlackGlass">
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Font-Size="Medium"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr />
                        <div>
                            <dx:ASPxTreeList ID="tl_master" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_zzz_prglist" EnableTheming="True" Font-Size="Medium" KeyFieldName="rowid" ParentFieldName="parentid" Theme="BlackGlass" Width="100%" OnFocusedNodeChanged="tl_master_FocusedNodeChanged" OnInit="tl_master_Init">
                                <Columns>
                                    <dx:TreeListTextColumn Caption="代號" FieldName="mno" ShowInCustomizationForm="True" VisibleIndex="0" Width="140px">
                                        <EditCellTemplate>
                                            <dx:ASPxGridLookup ID="glu_mno" runat="server" AutoGenerateColumns="False" DataSourceID="sds_ddlb_customer" EnableTheming="True" KeyFieldName="mno" OnInit="glu_mno_Init" TextFormatString="{0} {1}" Theme="BlackGlass" Value='<%# Bind("mno") %>' Width="100%">
                                                <GridViewProperties>
                                                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                </GridViewProperties>
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="代號" FieldName="mno" VisibleIndex="0">
                                                        <HeaderStyle Wrap="False" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="名稱" FieldName="mname" VisibleIndex="1" Width="100%">
                                                        <HeaderStyle Wrap="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:ASPxGridLookup>
                                        </EditCellTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:TreeListTextColumn>
                                    <dx:TreeListTextColumn Caption="名稱" FieldName="mname" ShowInCustomizationForm="True" VisibleIndex="1" Width="260px">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:TreeListTextColumn>
                                    <dx:TreeListTextColumn Caption="程式位置" FieldName="murl" ShowInCustomizationForm="True" VisibleIndex="2" Width="100%">
                                        <EditFormSettings ColumnSpan="2" />
                                        <HeaderStyle Wrap="False" />
                                    </dx:TreeListTextColumn>
                                    <dx:TreeListTextColumn FieldName="parentid" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                    </dx:TreeListTextColumn>
                                    <dx:TreeListCommandColumn ShowInCustomizationForm="True" VisibleIndex="4">
                                        <EditButton Visible="True">
                                        </EditButton>
                                        <NewButton Visible="True">
                                        </NewButton>
                                        <DeleteButton Visible="True">
                                        </DeleteButton>
                                    </dx:TreeListCommandColumn>
                                </Columns>
                            </dx:ASPxTreeList>
                        </div>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </div>
        <asp:SqlDataSource ID="sds_z_zzz_prglist" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_zzz_prglist] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [z_zzz_prglist] ([parentid], [mno], [mname], [murl]) VALUES (@parentid, @mno, @mname, @murl)" SelectCommand="SELECT mno, mname, murl, rowid, parentid FROM z_zzz_prglist ORDER BY parentid, mno" UpdateCommand="UPDATE [z_zzz_prglist] SET [parentid] = @parentid, [mno] = @mno, [mname] = @mname, [murl] = @murl WHERE [rowid] = @rowid">
            <DeleteParameters>
                <asp:Parameter Name="rowid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="parentid" Type="Int32" />
                <asp:Parameter Name="mno" Type="String" />
                <asp:Parameter Name="mname" Type="String" />
                <asp:Parameter Name="murl" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="parentid" Type="Int32" />
                <asp:Parameter Name="mno" Type="String" />
                <asp:Parameter Name="mname" Type="String" />
                <asp:Parameter Name="murl" Type="String" />
                <asp:Parameter Name="rowid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_ddlb_customer" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT [mno], [mname] FROM [z_bas_customer] ORDER BY [mno]"></asp:SqlDataSource>
        <dx:ASPxTreeListExporter ID="tle_master" runat="server" TreeListID="tl_master">
            <Settings ExpandAllNodes="True" ExportAllPages="True">
            </Settings>
            <Styles>
                <Default Font-Names="細明體">
                </Default>
            </Styles>
        </dx:ASPxTreeListExporter>
    </form>
</body>
</html>
