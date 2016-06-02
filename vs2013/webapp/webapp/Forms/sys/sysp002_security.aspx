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
                                    <td>
                                        <dx:ASPxButton ID="btn_copy" runat="server" Font-Size="Medium" Text="權限複製" Theme="BlackGlass" OnClick="btn_copy_Click">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr />
                        <div>
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 300px; vertical-align: top; text-align: left;">
                                        <dx:ASPxPageControl ID="pgc_user" runat="server" ActiveTabIndex="0" OnInit="pgc_user_Init" Width="100%" AutoPostBack="True" OnActiveTabChanged="pgc_user_ActiveTabChanged" Theme="BlackGlass">
                                            <TabPages>
                                                <dx:TabPage Text="使用者">
                                                    <ContentCollection>
                                                        <dx:ContentControl runat="server">
                                                            <dx:ASPxGridView ID="gv_master" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_org_user" EnableCallBacks="False" EnableTheming="True" KeyFieldName="no_user" OnInit="gv_master_Init" OnSelectionChanged="gv_master_SelectionChanged" Theme="BlackGlass" Width="100%">
                                                                <Settings ShowFilterRow="True" />
                                                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                                                                        <HeaderStyle Wrap="False" />
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataTextColumn Caption="代號" FieldName="no_user" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                        <HeaderStyle Wrap="False" />
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_user" ShowInCustomizationForm="True" VisibleIndex="3" Width="100%">
                                                                        <HeaderStyle Wrap="False" />
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="數量" FieldName="counts" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                        <HeaderStyle Wrap="False" />
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="類別" FieldName="role_name" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        <HeaderStyle Wrap="False" />
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="role_no" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:ASPxGridView>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>
                                                <dx:TabPage Text="群組">
                                                    <ContentCollection>
                                                        <dx:ContentControl runat="server">
                                                            <dx:ASPxGridView ID="gv_group" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_sys_group" EnableCallBacks="False" EnableTheming="True" KeyFieldName="no_group" OnInit="gv_group_Init" OnSelectionChanged="gv_group_SelectionChanged" Theme="BlackGlass" Width="100%">
                                                                <Settings ShowFilterRow="True" />
                                                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                                                                        <HeaderStyle Wrap="False" />
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataTextColumn Caption="代號" FieldName="no_group" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        <HeaderStyle Wrap="False" />
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_group" ShowInCustomizationForm="True" VisibleIndex="2" Width="100%">
                                                                        <HeaderStyle Wrap="False" />
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:ASPxGridView>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>
                                            </TabPages>
                                        </dx:ASPxPageControl>
                                    </td>
                                    <td style="vertical-align: top; text-align: left;">
                                        <dx:ASPxPageControl ID="pgc_security" runat="server" ActiveTabIndex="0" EnableTheming="True" OnInit="pgc_security_Init" Theme="BlackGlass" Width="100%">
                                            <TabPages>
                                                <dx:TabPage Text="程式權限">
                                                    <ContentCollection>
                                                        <dx:ContentControl runat="server">
                                                            <dx:ASPxGridView ID="gv_detail" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_sys_security" EnableTheming="True" KeyFieldName="rowid" OnInit="gv_detail_Init" Theme="BlackGlass" Width="100%">
                                                                <Settings ShowFilterRow="True" />
                                                                <SettingsDataSecurity AllowInsert="False" />
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                        <HeaderStyle Wrap="False" />
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataTextColumn Caption="模組名稱" FieldName="name_module" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        <HeaderStyle Wrap="False" />
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="程式代號" FieldName="prg_no" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                        <HeaderStyle Wrap="False" />
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="程式名稱" FieldName="name_prg" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
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
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>
                                                <dx:TabPage Text="權限群組">
                                                    <ContentCollection>
                                                        <dx:ContentControl runat="server">
                                                            <dx:ASPxGridView ID="gv_user_group" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_org_user_group" EnableTheming="True" KeyFieldName="rowid" OnInit="gv_user_group_Init" OnInitNewRow="gv_user_group_InitNewRow" Theme="BlackGlass" Width="100%" OnRowValidating="gv_user_group_RowValidating">
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                                        <HeaderStyle Wrap="False" />
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataCheckColumn Caption="啟用" FieldName="isenabled" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        <HeaderStyle Wrap="False" />
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataCheckColumn>
                                                                    <dx:GridViewDataTextColumn Caption="群組代號" FieldName="group_no" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                        <EditItemTemplate>
                                                                            <dx:ASPxGridLookup ID="glu_group_no" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_sys_group" EnableTheming="True" KeyFieldName="no_group" OnInit="glu_group_no_Init" TextFormatString="{0} {1}" Theme="BlackGlass" Value='<%# Bind("group_no") %>' Width="100%">
                                                                                <GridViewProperties>
                                                                                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                                </GridViewProperties>
                                                                                <Columns>
                                                                                    <dx:GridViewDataTextColumn Caption="代號" FieldName="no_group" VisibleIndex="0">
                                                                                        <HeaderStyle Wrap="False" />
                                                                                        <CellStyle Wrap="False">
                                                                                        </CellStyle>
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_group" VisibleIndex="1" Width="100%">
                                                                                        <HeaderStyle Wrap="False" />
                                                                                    </dx:GridViewDataTextColumn>
                                                                                </Columns>
                                                                            </dx:ASPxGridLookup>
                                                                        </EditItemTemplate>
                                                                        <HeaderStyle Wrap="False" />
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="群組名稱" FieldName="group_name" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                        <EditFormSettings Visible="False" />
                                                                        <HeaderStyle Wrap="False" />
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" ShowInCustomizationForm="True" VisibleIndex="4" Width="100%">
                                                                        <HeaderStyle Wrap="False" />
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                                                        <EditFormSettings Visible="False" />
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="user_no" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:ASPxGridView>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>
                                            </TabPages>
                                        </dx:ASPxPageControl>
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
            <dx:ASPxPopupControl ID="puc_copy" runat="server" HeaderText="權限複製" Theme="BlackGlass" Width="600px" OnInit="puc_copy_Init" Height="600px">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btn_copy_confirm" runat="server" Font-Size="Medium" OnClick="btn_copy_confirm_Click" Text="確定複製" Theme="BlackGlass">
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btn_copy_cancel" runat="server" Font-Size="Medium" OnClick="btn_copy_cancel_Click" Text="關閉視窗" Theme="BlackGlass">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr />
                        <div>
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 80px">
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="Medium" Text="複製來源">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="cbb_source" runat="server" AutoPostBack="True" DataSourceID="sds_z_org_user" EnableTheming="True" Font-Size="Medium" TextField="name_user" TextFormatString="{0} {1}" Theme="BlackGlass" ValueField="rowid" Width="100%">
                                            <Columns>
                                                <dx:ListBoxColumn Caption="類別" FieldName="role_name" Width="80px" />
                                                <dx:ListBoxColumn Caption="代號" FieldName="no_user" Name="no_user" Width="60px" />
                                                <dx:ListBoxColumn Caption="名稱" FieldName="name_user" Name="name_user" Width="100%" />
                                                <dx:ListBoxColumn FieldName="rowid" Visible="False" />
                                            </Columns>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td style="width: 200px">
                                        <dx:ASPxLabel ID="lbl_copy_message" runat="server" Font-Size="Medium" ForeColor="Red">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <dx:ASPxGridView ID="gv_copy" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_org_user_target" EnableTheming="True" KeyFieldName="rowid" OnInit="gv_copy_Init" Theme="BlackGlass" Width="100%">
                                <Settings ShowFilterRow="True" />
                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                <Columns>
                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowClearFilterButton="True" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="代號" FieldName="no_user" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_user" ShowInCustomizationForm="True" VisibleIndex="3" Width="100%">
                                        <HeaderStyle Wrap="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="程式數" FieldName="counts" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="類別" FieldName="role_name" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="role_no" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
        <div>
            <asp:SqlDataSource ID="sds_z_org_user" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT z_org_user_role.name_role AS role_name, z_org_user.no_user, z_org_user.name_user, (SELECT COUNT(*) AS Expr1 FROM z_sys_security WHERE (user_no = z_org_user.no_user)) AS counts, z_org_user.role_no, z_org_user.rowid FROM z_org_user LEFT OUTER JOIN z_org_user_role ON z_org_user.role_no = z_org_user_role.no_role WHERE (z_org_user.isenabled = @isenabled) AND (z_org_user.issecurity = @issecurity) ORDER BY z_org_user.no_user" OnInit="sds_z_org_user_Init">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="isenabled" Type="Int32" />
                    <asp:Parameter DefaultValue="1" Name="issecurity" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_z_sys_security" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_sys_security] WHERE [rowid] = @rowid" SelectCommand="SELECT z_sys_module.name_module, z_sys_security.prg_no, z_sys_prg.name_prg, z_sys_security.isadd, z_sys_security.isedit, z_sys_security.isdelete, z_sys_security.isconfirm, z_sys_security.isabolish, z_sys_security.isprice, z_sys_security.isprint, z_sys_security.isdownload, z_sys_security.remark, z_sys_security.rowid, z_sys_security.user_no, z_sys_security.role_no, z_sys_security.code_no FROM z_sys_prg INNER JOIN z_sys_module ON z_sys_prg.module_no = z_sys_module.no_module INNER JOIN z_sys_security ON z_sys_prg.no_prg = z_sys_security.prg_no WHERE (z_sys_security.user_no = @user_no) AND (z_sys_security.role_no = @role_no) AND (z_sys_security.code_no = @code_no) ORDER BY z_sys_module.sort_module, z_sys_module.no_module, z_sys_prg.sort_prg, z_sys_security.prg_no" UpdateCommand="UPDATE z_sys_security SET isadd = @isadd, isedit = @isedit, isdelete = @isdelete, isconfirm = @isconfirm, isabolish = @isabolish, isprice = @isprice, isprint = @isprint, isdownload = @isdownload, remark = @remark WHERE (rowid = @rowid)" OnInit="sds_z_sys_security_Init">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="user_no" SessionField="parm1" Type="String" DefaultValue="0" />
                    <asp:SessionParameter DefaultValue="0" Name="role_no" SessionField="parm2" />
                    <asp:SessionParameter DefaultValue="U" Name="code_no" SessionField="parm3" />
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
            <asp:SqlDataSource ID="sds_z_sys_prg" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT z_sys_module.name_module, z_sys_prg.no_prg, z_sys_prg.name_prg FROM z_sys_prg INNER JOIN z_sys_module ON z_sys_prg.module_no = z_sys_module.no_module WHERE (z_sys_prg.isenabled = @isenabled) AND (z_sys_module.isenabled = @isenabled) AND (NOT (z_sys_prg.no_prg IN (SELECT prg_no FROM z_sys_security WHERE (code_no = @code_no) AND (role_no = @role_no) AND (user_no = @user_no)))) ORDER BY z_sys_module.sort_module, z_sys_prg.module_no, z_sys_prg.sort_prg, z_sys_prg.no_prg" OnInit="sds_z_sys_prg_Init">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="isenabled" Type="Int32" />
                    <asp:SessionParameter DefaultValue="" Name="code_no" SessionField="parm3" />
                    <asp:SessionParameter DefaultValue="" Name="role_no" SessionField="parm2" />
                    <asp:SessionParameter DefaultValue="" Name="user_no" SessionField="parm1" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_z_org_user_target" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" OnInit="sds_z_org_user_target_Init" SelectCommand="SELECT z_org_user_role.name_role AS role_name, z_org_user.no_user, z_org_user.name_user, (SELECT COUNT(*) AS Expr1 FROM z_sys_security WHERE (user_no = z_org_user.no_user)) AS counts, z_org_user.rowid, z_org_user.role_no FROM z_org_user LEFT OUTER JOIN z_org_user_role ON z_org_user.role_no = z_org_user_role.no_role WHERE (z_org_user.no_user &lt;&gt; @no_user) AND (z_org_user.isenabled = @isenabled) AND (z_org_user.issecurity = @issecurity) ORDER BY z_org_user_role.sort_role, z_org_user.no_user">
                <SelectParameters>
                    <asp:ControlParameter ControlID="puc_copy$cbb_source" Name="no_user" PropertyName="Value" />
                    <asp:Parameter DefaultValue="1" Name="isenabled" />
                    <asp:Parameter DefaultValue="1" Name="issecurity" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_z_org_user_group" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_org_user_group] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO z_org_user_group(isenabled, role_no, user_no, group_no, remark) VALUES (@isenabled, @role_no, @user_no, @group_no, @remark)" SelectCommand="SELECT z_org_user_group.isenabled, z_org_user_group.group_no, z_sys_group.name_group AS group_name, z_org_user_group.remark, z_org_user_group.rowid, z_org_user_group.user_no, z_org_user_group.role_no FROM z_org_user_group LEFT OUTER JOIN z_sys_group ON z_org_user_group.group_no = z_sys_group.no_group WHERE (z_org_user_group.user_no = @user_no) AND (z_org_user_group.role_no = @role_no) ORDER BY z_org_user_group.group_no" UpdateCommand="UPDATE z_org_user_group SET isenabled = @isenabled, group_no = @group_no, remark = @remark WHERE (rowid = @rowid)">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="isenabled" Type="Int32" />
                    <asp:SessionParameter Name="role_no" SessionField="parm2" />
                    <asp:SessionParameter Name="user_no" SessionField="parm1" Type="String" />
                    <asp:Parameter Name="group_no" Type="String" />
                    <asp:Parameter Name="remark" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="user_no" SessionField="parm1" Type="String" />
                    <asp:SessionParameter Name="role_no" SessionField="parm2" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="isenabled" Type="Int32" />
                    <asp:Parameter Name="group_no" Type="String" />
                    <asp:Parameter Name="remark" Type="String" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_z_sys_group" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT [no_group], [name_group] FROM [z_sys_group] WHERE ([isenabled] = @isenabled) ORDER BY [no_group]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="isenabled" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
