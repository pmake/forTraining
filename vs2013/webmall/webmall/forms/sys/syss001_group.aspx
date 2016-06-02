<%@ Page Title="" Language="C#" MasterPageFile="~/manager.Master" AutoEventWireup="true" CodeBehind="syss001_group.aspx.cs" Inherits="webmall.Forms.sys.syss001_group" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="rpl_master" runat="server" OnInit="rpl_master_Init" ShowCollapseButton="true" Theme="Office2003Olive" Width="100%">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxGridView ID="gv_master" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_sys_group" EnableTheming="True" KeyFieldName="rowid" OnInit="gv_master_Init" OnInitNewRow="gv_master_InitNewRow" OnRowValidating="gv_master_RowValidating" Theme="Office2003Olive" Width="100%">
                        <SettingsDetail ShowDetailRow="True" />
                        <Templates>
                            <DetailRow>
                                <dx:ASPxPageControl ID="pgc_detail" runat="server" ActiveTabIndex="0" OnInit="pgc_detail_Init" Theme="BlackGlass" Width="100%">
                                    <TabPages>
                                        <dx:TabPage Text="使用者">
                                            <ContentCollection>
                                                <dx:ContentControl runat="server">
                                                    <dx:ASPxGridView ID="gv_detail" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_org_user_group" EnableTheming="True" KeyFieldName="rowid" OnBeforePerformDataSelect="gv_detail_BeforePerformDataSelect" OnInit="gv_detail_Init" OnInitNewRow="gv_detail_InitNewRow" OnRowValidating="gv_detail_RowValidating" Theme="BlackGlass" Width="100%">
                                                        <Settings ShowFilterRow="True" />
                                                        <Columns>
                                                            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                                <HeaderStyle Wrap="False" />
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dx:GridViewCommandColumn>
                                                            <dx:GridViewDataCheckColumn Caption="啟用" FieldName="isenabled" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                <HeaderStyle Wrap="False" />
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dx:GridViewDataCheckColumn>
                                                            <dx:GridViewDataTextColumn Caption="使用者代號" FieldName="user_no" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                <HeaderStyle Wrap="False" />
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="使用者名稱" FieldName="user_name" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                <EditFormSettings Visible="False" />
                                                                <HeaderStyle Wrap="False" />
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" ShowInCustomizationForm="True" VisibleIndex="5" Width="100%">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="group_no" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="類別" FieldName="role_name" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                <EditFormSettings Visible="False" />
                                                                <HeaderStyle Wrap="False" />
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                </dx:ContentControl>
                                            </ContentCollection>
                                        </dx:TabPage>
                                        <dx:TabPage Text="群組權限">
                                            <ContentCollection>
                                                <dx:ContentControl runat="server">
                                                    <dx:ASPxGridView ID="gv_security" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_sys_security" EnableTheming="True" KeyFieldName="rowid" OnBeforePerformDataSelect="gv_security_BeforePerformDataSelect" OnInit="gv_security_Init" Theme="BlackGlass" Width="100%">
                                                        <Settings ShowFilterRow="True" />
                                                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                        <Columns>
                                                            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                            </dx:GridViewCommandColumn>
                                                            <dx:GridViewDataTextColumn Caption="模組" FieldName="module_no" ShowInCustomizationForm="True" VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="模組名稱" FieldName="module_name" ShowInCustomizationForm="True" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="程式代號" FieldName="prg_no" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="程式名稱" FieldName="prg_name" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" ShowInCustomizationForm="True" VisibleIndex="13" Width="100%">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="code_no" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="user_no" ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataCheckColumn Caption="增" FieldName="isadd" ShowInCustomizationForm="True" VisibleIndex="5">
                                                            </dx:GridViewDataCheckColumn>
                                                            <dx:GridViewDataCheckColumn Caption="改" FieldName="isedit" ShowInCustomizationForm="True" VisibleIndex="6">
                                                            </dx:GridViewDataCheckColumn>
                                                            <dx:GridViewDataCheckColumn Caption="刪" FieldName="isdelete" ShowInCustomizationForm="True" VisibleIndex="7">
                                                            </dx:GridViewDataCheckColumn>
                                                            <dx:GridViewDataCheckColumn Caption="審" FieldName="isconfirm" ShowInCustomizationForm="True" VisibleIndex="8">
                                                            </dx:GridViewDataCheckColumn>
                                                            <dx:GridViewDataCheckColumn Caption="廢" FieldName="isabolish" ShowInCustomizationForm="True" VisibleIndex="9">
                                                            </dx:GridViewDataCheckColumn>
                                                            <dx:GridViewDataCheckColumn Caption="單" FieldName="isprice" ShowInCustomizationForm="True" VisibleIndex="10">
                                                            </dx:GridViewDataCheckColumn>
                                                            <dx:GridViewDataCheckColumn Caption="印" FieldName="isprint" ShowInCustomizationForm="True" VisibleIndex="11">
                                                            </dx:GridViewDataCheckColumn>
                                                            <dx:GridViewDataCheckColumn Caption="載" FieldName="isdownload" ShowInCustomizationForm="True" VisibleIndex="12">
                                                            </dx:GridViewDataCheckColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                </dx:ContentControl>
                                            </ContentCollection>
                                        </dx:TabPage>
                                    </TabPages>
                                </dx:ASPxPageControl>
                            </DetailRow>
                        </Templates>
                        <Settings ShowFilterRow="True" />
                        <Columns>
                            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="代號" FieldName="no_group" ShowInCustomizationForm="True" VisibleIndex="2">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_group" ShowInCustomizationForm="True" VisibleIndex="3">
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
                            <dx:GridViewDataCheckColumn Caption="啟用" FieldName="isenabled" ShowInCustomizationForm="True" VisibleIndex="1">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataCheckColumn>
                        </Columns>

<Styles AdaptiveDetailButtonWidth="22"></Styles>
                    </dx:ASPxGridView>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <div>
        <asp:SqlDataSource ID="sds_z_sys_group" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_sys_group] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [z_sys_group] ([isenabled], [no_group], [name_group], [remark]) VALUES (@isenabled, @no_group, @name_group, @remark)" OnInit="sds_z_sys_group_Init" SelectCommand="SELECT isenabled, no_group, name_group, remark, rowid FROM z_sys_group ORDER BY no_group" UpdateCommand="UPDATE [z_sys_group] SET [isenabled] = @isenabled, [no_group] = @no_group, [name_group] = @name_group, [remark] = @remark WHERE [rowid] = @rowid">
            <DeleteParameters>
                <asp:Parameter Name="rowid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="isenabled" Type="Int32" />
                <asp:Parameter Name="no_group" Type="String" />
                <asp:Parameter Name="name_group" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="isenabled" Type="Int32" />
                <asp:Parameter Name="no_group" Type="String" />
                <asp:Parameter Name="name_group" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter Name="rowid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_z_org_user_group" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT z_org_user_group.isenabled, z_org_user_role.name_role AS role_name, z_org_user_group.user_no, z_org_user.name_user AS user_name, z_org_user_group.remark, z_org_user_group.rowid, z_org_user_group.group_no FROM z_org_user_group LEFT OUTER JOIN z_org_user ON z_org_user_group.role_no = z_org_user.role_no AND z_org_user_group.user_no = z_org_user.no_user LEFT OUTER JOIN z_org_user_role ON z_org_user.role_no = z_org_user_role.no_role WHERE (z_org_user_group.group_no = @group_no) ORDER BY z_org_user_group.user_no">
            <SelectParameters>
                <asp:SessionParameter Name="group_no" SessionField="parm1" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_ddlb_z_org_user" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT z_org_user_role.name_role AS role_name, z_org_user.no_user, z_org_user.name_user FROM z_org_user LEFT OUTER JOIN z_org_user_role ON z_org_user.role_no = z_org_user_role.no_role WHERE (z_org_user.isenabled = @isenabled) ORDER BY z_org_user_role.sort_role, z_org_user.no_user">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="isenabled" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_z_sys_security" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT z_sys_module.no_module AS module_no, z_sys_module.name_module AS module_name, z_sys_security.prg_no, z_sys_prg.name_prg AS prg_name, z_sys_security.isadd, z_sys_security.isedit, z_sys_security.isdelete, z_sys_security.isconfirm, z_sys_security.isabolish, z_sys_security.isprice, z_sys_security.isprint, z_sys_security.isdownload, z_sys_security.remark, z_sys_security.rowid, z_sys_security.code_no, z_sys_security.user_no FROM z_sys_security INNER JOIN z_sys_prg ON z_sys_security.rowid = z_sys_prg.rowid INNER JOIN z_sys_module ON z_sys_prg.module_no = z_sys_module.no_module WHERE (z_sys_security.code_no = @code_no) AND (z_sys_security.user_no = @user_no) ORDER BY z_sys_module.sort_module, module_no, z_sys_prg.sort_prg, z_sys_security.prg_no">
            <SelectParameters>
                <asp:Parameter DefaultValue="G" Name="code_no" Type="String" />
                <asp:SessionParameter Name="user_no" SessionField="parm1" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
