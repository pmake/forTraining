<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orgp003_role.aspx.cs" Inherits="webapp.Forms.org.orgp003_role" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxRoundPanel ID="rpl_master" runat="server" OnInit="rpl_master_Init" Theme="BlackGlass" Width="100%">
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server">
                        <dx:ASPxGridView ID="gv_master" runat="server" AutoGenerateColumns="False" EnableTheming="True" OnInit="gv_master_Init" Theme="BlackGlass" Width="100%" DataSourceID="sds_z_org_role" KeyFieldName="rowid" OnInitNewRow="gv_master_InitNewRow">
                            <SettingsDetail ShowDetailRow="True" />
                            <Templates>
                                <DetailRow>
                                    <dx:ASPxGridView ID="gv_detail" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_org_role_user" EnableTheming="True" KeyFieldName="rowid" OnBeforePerformDataSelect="gv_detail_BeforePerformDataSelect" OnInit="gv_detail_Init" OnInitNewRow="gv_detail_InitNewRow" Theme="BlackGlass" Width="100%">
                                        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                <HeaderStyle Wrap="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataCheckColumn Caption="啟用" FieldName="isenabled" VisibleIndex="1">
                                                <HeaderStyle Wrap="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataTextColumn Caption="使用者" FieldName="user_name" VisibleIndex="2">
                                                <EditItemTemplate>
                                                    <dx:ASPxGridLookup ID="glu_user_no" runat="server" AutoGenerateColumns="False" DataSourceID="sds_ddlb_z_org_user" EnableTheming="True" KeyFieldName="no_user" OnInit="glu_user_no_Init" TextFormatString="{0} {1}" Theme="BlackGlass" Value='<%# Bind("user_no") %>' Width="100%">
                                                        <GridViewProperties>
                                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                        </GridViewProperties>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="代號" FieldName="no_user" VisibleIndex="0">
                                                                <HeaderStyle Wrap="False" />
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_user" VisibleIndex="1" Width="100%">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:ASPxGridLookup>
                                                </EditItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" VisibleIndex="3" Width="100%">
                                                <HeaderStyle Wrap="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" Visible="False" VisibleIndex="4">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="user_no" Visible="False" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="role_no" Visible="False" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:ASPxGridView>
                                </DetailRow>
                            </Templates>
                            <Settings ShowGroupPanel="True" ShowFilterRow="True" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn Caption="排序" FieldName="sort_role" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="代號" FieldName="no_role" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_role" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" ShowInCustomizationForm="True" VisibleIndex="5" Width="100%">
                                    <EditFormSettings ColumnSpan="2" />
                                    <HeaderStyle Wrap="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataCheckColumn Caption="啟用" FieldName="isenabled" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataCheckColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </div>
        <div>
            <asp:SqlDataSource ID="sds_z_org_role" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_org_role] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [z_org_role] ([isenabled], [sort_role], [no_role], [name_role], [remark]) VALUES (@isenabled, @sort_role, @no_role, @name_role, @remark)" SelectCommand="SELECT isenabled, sort_role, no_role, name_role, remark, rowid FROM z_org_role ORDER BY sort_role, no_role" UpdateCommand="UPDATE [z_org_role] SET [isenabled] = @isenabled, [sort_role] = @sort_role, [no_role] = @no_role, [name_role] = @name_role, [remark] = @remark WHERE [rowid] = @rowid" OnInit="sds_z_org_role_Init">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="isenabled" Type="Int32" />
                    <asp:Parameter Name="sort_role" Type="String" />
                    <asp:Parameter Name="no_role" Type="String" />
                    <asp:Parameter Name="name_role" Type="String" />
                    <asp:Parameter Name="remark" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="isenabled" Type="Int32" />
                    <asp:Parameter Name="sort_role" Type="String" />
                    <asp:Parameter Name="no_role" Type="String" />
                    <asp:Parameter Name="name_role" Type="String" />
                    <asp:Parameter Name="remark" Type="String" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_z_org_role_user" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_org_role_user] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [z_org_role_user] ([isenabled], [role_no], [user_no], [remark]) VALUES (@isenabled, @role_no, @user_no, @remark)" SelectCommand="SELECT z_org_role_user.isenabled, z_org_user.name_user AS user_name, z_org_role_user.remark, z_org_role_user.rowid, z_org_role_user.user_no, z_org_role_user.role_no FROM z_org_role_user LEFT OUTER JOIN z_org_user ON z_org_role_user.user_no = z_org_user.no_user WHERE (z_org_role_user.role_no = @role_no) ORDER BY z_org_role_user.user_no" UpdateCommand="UPDATE z_org_role_user SET isenabled = @isenabled, user_no = @user_no, remark = @remark WHERE (rowid = @rowid)" OnInit="sds_z_org_role_user_Init">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="isenabled" Type="Int32" />
                    <asp:SessionParameter Name="role_no" SessionField="parm1" Type="String" />
                    <asp:Parameter Name="user_no" Type="String" />
                    <asp:Parameter Name="remark" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="role_no" SessionField="parm1" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="isenabled" Type="Int32" />
                    <asp:Parameter Name="user_no" Type="String" />
                    <asp:Parameter Name="remark" Type="String" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_ddlb_z_org_user" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT [no_user], [name_user] FROM [z_org_user] WHERE ([code_user] = @code_user) ORDER BY [no_user]" OnInit="sds_ddlb_z_org_user_Init">
                <SelectParameters>
                    <asp:Parameter DefaultValue="U" Name="code_user" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
