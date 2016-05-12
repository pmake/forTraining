<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sysp002_security.aspx.cs" Inherits="webapp.Forms.sys.sysp002_security" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxRoundPanel ID="rpl_master" runat="server" Width="100%" OnInit="rpl_master_Init" Theme="BlackGlass">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btn_add" runat="server" Font-Size="Medium" Text="加入程式" Theme="BlackGlass" OnClick="btn_add_Click">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr />
                        <div>
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 240px; vertical-align: top; text-align: left;">
                                        <dx:ASPxGridView ID="gv_master" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_org_user" EnableTheming="True" KeyFieldName="no_user" OnInit="gv_master_Init" Theme="BlackGlass" Width="100%" EnableCallBacks="False" OnSelectionChanged="gv_master_SelectionChanged">
                                            <Settings ShowFilterRow="True" />
                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                            <Columns>
                                                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="代號" FieldName="no_user" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_user" ShowInCustomizationForm="True" VisibleIndex="2" Width="100%">
                                                    <HeaderStyle Wrap="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                    </td>
                                    <td style="vertical-align: top; text-align: left;">
                                        <dx:ASPxGridView ID="gv_detail" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_sys_security" EnableTheming="True" KeyFieldName="rowid" Theme="BlackGlass" OnInit="gv_detail_Init" Width="100%">
                                            <Settings ShowFilterRow="True" />
                                            <SettingsDataSecurity AllowInsert="False" />
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="模組名稱" FieldName="name_module" ShowInCustomizationForm="True" VisibleIndex="1" ReadOnly="True">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="程式代號" FieldName="prg_no" ShowInCustomizationForm="True" VisibleIndex="2" ReadOnly="True">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="程式名稱" FieldName="name_prg" ShowInCustomizationForm="True" VisibleIndex="3" ReadOnly="True">
                                                    <EditFormSettings ColumnSpan="2" />
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataCheckColumn Caption="新增" FieldName="isadd" ShowInCustomizationForm="True" VisibleIndex="4">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn Caption="修改" FieldName="isedit" ShowInCustomizationForm="True" VisibleIndex="5">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn Caption="刪除" FieldName="isdelete" ShowInCustomizationForm="True" VisibleIndex="6">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn Caption="審核" FieldName="isconfirm" ShowInCustomizationForm="True" VisibleIndex="7">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn Caption="作廢" FieldName="isabolish" ShowInCustomizationForm="True" VisibleIndex="8">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn Caption="單價" FieldName="isprice" ShowInCustomizationForm="True" VisibleIndex="9">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn Caption="列印" FieldName="isprint" ShowInCustomizationForm="True" VisibleIndex="10">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn Caption="下載" FieldName="isdownload" ShowInCustomizationForm="True" VisibleIndex="11">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" ShowInCustomizationForm="True" VisibleIndex="12" Width="100%">
                                                    <EditFormSettings ColumnSpan="2" />
                                                    <HeaderStyle Wrap="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="user_no" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </div>
        <div>
            <dx:ASPxPopupControl ID="puc_add" runat="server" HeaderText="未加入程式清單" OnInit="puc_add_Init" Theme="BlackGlass" Width="600px">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btn_add_confirm" runat="server" Text="確定加入" Theme="BlackGlass" Font-Size="Medium" OnClick="btn_add_confirm_Click">
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btn_add_cancel" runat="server" Font-Size="Medium" OnClick="btn_add_cancel_Click" Text="取消關閉" Theme="BlackGlass">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr />
                        <div>
                            <dx:ASPxGridView ID="gv_add" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_sys_prg" EnableTheming="True" KeyFieldName="no_prg" OnInit="gv_add_Init" Theme="BlackGlass" Width="100%">
                                <Settings ShowFilterRow="True" />
                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                <Columns>
                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowClearFilterButton="True" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="模組名稱" FieldName="name_module" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="程式代號" FieldName="no_prg" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="程式名稱" FieldName="name_prg" ShowInCustomizationForm="True" VisibleIndex="3" Width="100%">
                                        <HeaderStyle Wrap="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
        <div>
            <asp:SqlDataSource ID="sds_z_org_user" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT [no_user], [name_user] FROM [z_org_user] WHERE (([isenabled] = @isenabled) AND ([code_user] = @code_user)) ORDER BY [no_user]" OnInit="sds_z_org_user_Init">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="isenabled" Type="Int32" />
                    <asp:Parameter DefaultValue="U" Name="code_user" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_z_sys_security" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_sys_security] WHERE [rowid] = @rowid" SelectCommand="SELECT z_sys_module.name_module, z_sys_security.prg_no, z_sys_prg.name_prg, z_sys_security.isadd, z_sys_security.isedit, z_sys_security.isdelete, z_sys_security.isconfirm, z_sys_security.isabolish, z_sys_security.isprice, z_sys_security.isprint, z_sys_security.isdownload, z_sys_security.remark, z_sys_security.rowid, z_sys_security.user_no FROM z_sys_prg INNER JOIN z_sys_module ON z_sys_prg.module_no = z_sys_module.no_module INNER JOIN z_sys_security ON z_sys_prg.no_prg = z_sys_security.prg_no WHERE (z_sys_security.user_no = @user_no) ORDER BY z_sys_module.sort_module, z_sys_module.no_module, z_sys_prg.sort_prg, z_sys_security.prg_no" UpdateCommand="UPDATE z_sys_security SET isadd = @isadd, isedit = @isedit, isdelete = @isdelete, isconfirm = @isconfirm, isabolish = @isabolish, isprice = @isprice, isprint = @isprint, isdownload = @isdownload, remark = @remark WHERE (rowid = @rowid)" OnInit="sds_z_sys_security_Init">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="user_no" SessionField="parm1" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="isadd" Type="Int32" />
                    <asp:Parameter Name="isedit" Type="Int32" />
                    <asp:Parameter Name="isdelete" Type="Int32" />
                    <asp:Parameter Name="isconfirm" Type="Int32" />
                    <asp:Parameter Name="isabolish" Type="Int32" />
                    <asp:Parameter Name="isprice" Type="Int32" />
                    <asp:Parameter Name="isprint" Type="Int32" />
                    <asp:Parameter Name="isdownload" Type="Int32" />
                    <asp:Parameter Name="remark" Type="String" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_z_sys_prg" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT z_sys_module.name_module, z_sys_prg.no_prg, z_sys_prg.name_prg FROM z_sys_prg INNER JOIN z_sys_module ON z_sys_prg.module_no = z_sys_module.no_module WHERE (z_sys_prg.isenabled = @isenabled) AND (z_sys_module.isenabled = @isenabled) AND (z_sys_module.code_module = @code_module) AND (z_sys_prg.no_prg NOT IN (SELECT prg_no FROM z_sys_security WHERE (user_no = @user_no))) ORDER BY z_sys_module.sort_module, z_sys_prg.module_no, z_sys_prg.sort_prg, z_sys_prg.no_prg" OnInit="sds_z_sys_prg_Init">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="isenabled" Type="Int32" />
                    <asp:Parameter DefaultValue="F" Name="code_module" />
                    <asp:SessionParameter DefaultValue="" Name="user_no" SessionField="parm1" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
