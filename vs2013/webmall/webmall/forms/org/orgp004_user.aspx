<%@ Page Title="" Language="C#" MasterPageFile="~/manager.Master" AutoEventWireup="true" CodeBehind="orgp004_user.aspx.cs" Inherits="webmall.Forms.org.orgp004_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="rpl_master" runat="server" OnInit="rpl_master_Init" Theme="Office2003Olive" Width="100%">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1" runat="server">
                    <dx:ASPxGridView ID="gv_master" runat="server" AutoGenerateColumns="False" EnableTheming="True" OnInit="gv_master_Init" Theme="Office2003Olive" Width="100%" DataSourceID="sds_z_org_user" KeyFieldName="rowid" OnInitNewRow="gv_master_InitNewRow" OnRowValidating="gv_master_RowValidating">
                        <SettingsDetail ShowDetailRow="True" />
                        <Templates>
                            <DetailRow>
                                <dx:ASPxGridView ID="gv_detail" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_org_user_group" EnableTheming="True" KeyFieldName="rowid" OnBeforePerformDataSelect="gv_detail_BeforePerformDataSelect" OnInit="gv_detail_Init" Theme="Office2003Olive" Width="100%">
                                    <Settings ShowFilterRow="True" />
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                                            <HeaderStyle Wrap="False" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn Caption="群組代號" FieldName="group_no" VisibleIndex="1">
                                            <EditItemTemplate>
                                                <dx:ASPxGridLookup ID="glu_group_no" runat="server" AutoGenerateColumns="False" DataSourceID="sds_ddlb_z_sys_group" EnableTheming="True" KeyFieldName="no_group" OnInit="glu_group_no_Init" TextFormatString="{0} {1}" Theme="BlackGlass" Value='<%# Bind("group_no") %>' Width="100%">
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
                                        <dx:GridViewDataTextColumn Caption="群組名稱" FieldName="group_name" VisibleIndex="2">
                                            <EditFormSettings Visible="False" />
                                            <HeaderStyle Wrap="False" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" VisibleIndex="3" Width="100%">
                                            <EditFormSettings ColumnSpan="2" />
                                            <HeaderStyle Wrap="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" Visible="False" VisibleIndex="4">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="user_no" Visible="False" VisibleIndex="5">
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
                            <dx:GridViewDataCheckColumn Caption="啟用" FieldName="isenabled" ShowInCustomizationForm="True" VisibleIndex="1">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="權限" FieldName="issecurity" ShowInCustomizationForm="True" VisibleIndex="2">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataTextColumn Caption="角色" FieldName="role_name" ShowInCustomizationForm="True" VisibleIndex="3">
                                <EditItemTemplate>
                                    <dx:ASPxGridLookup ID="glu_role_no" runat="server" AutoGenerateColumns="False" DataSourceID="sds_ddlb_z_org_user_role" EnableTheming="True" KeyFieldName="no_role" OnInit="glu_role_no_Init" TextFormatString="{0} {1}" Theme="BlackGlass" Value='<%# Bind("role_no") %>' Width="100%">
                                        <GridViewProperties>
                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        </GridViewProperties>
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="代號" FieldName="no_role" VisibleIndex="0">
                                                <HeaderStyle Wrap="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_role" VisibleIndex="1" Width="100%">
                                                <HeaderStyle Wrap="False" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:ASPxGridLookup>
                                </EditItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="代號" FieldName="no_user" ShowInCustomizationForm="True" VisibleIndex="4">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_user" ShowInCustomizationForm="True" VisibleIndex="5">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="密碼" FieldName="pass_user" ShowInCustomizationForm="True" VisibleIndex="6">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="電子信箱" FieldName="email_user" ShowInCustomizationForm="True" VisibleIndex="7">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="連絡電話" FieldName="tel_user" ShowInCustomizationForm="True" VisibleIndex="8">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="行動電話" FieldName="phone_user" ShowInCustomizationForm="True" VisibleIndex="9">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="身份證字號" FieldName="id_user" ShowInCustomizationForm="True" VisibleIndex="10">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="加入日期" FieldName="date_join" ShowInCustomizationForm="True" VisibleIndex="11">
                                <PropertiesDateEdit DisplayFormatInEditMode="True" DisplayFormatString="yyyy/MM/dd" EditFormat="Custom" EditFormatString="yyyy/MM/dd">
                                </PropertiesDateEdit>
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" ShowInCustomizationForm="True" VisibleIndex="12" Width="100%">
                                <EditFormSettings ColumnSpan="2" />
                                <HeaderStyle Wrap="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="role_no" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                            </dx:GridViewDataTextColumn>
                        </Columns>

<Styles AdaptiveDetailButtonWidth="22"></Styles>
                    </dx:ASPxGridView>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <div>
        <asp:SqlDataSource ID="sds_z_org_user" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_org_user] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO z_org_user(isenabled, issecurity, role_no, no_user, name_user, pass_user, email_user, tel_user, phone_user, id_user, date_join, remark) VALUES (@isenabled, @issecurity, @role_no, @no_user, @name_user, @pass_user, @email_user, @tel_user, @phone_user, @id_user, @date_join, @remark)" SelectCommand="SELECT z_org_user.isenabled, z_org_user.issecurity, z_org_user.role_no, z_org_user.no_user, z_org_user.name_user, z_org_user.pass_user, z_org_user.email_user, z_org_user.tel_user, z_org_user.phone_user, z_org_user.id_user, z_org_user.date_join, z_org_user.remark, z_org_user.rowid, z_org_user_role.name_role AS role_name FROM z_org_user LEFT OUTER JOIN z_org_user_role ON z_org_user.role_no = z_org_user_role.no_role ORDER BY z_org_user.no_user" UpdateCommand="UPDATE z_org_user SET isenabled = @isenabled, issecurity = @issecurity, role_no = @role_no, no_user = @no_user, name_user = @name_user, pass_user = @pass_user, email_user = @email_user, tel_user = @tel_user, phone_user = @phone_user, id_user = @id_user, date_join = @date_join, remark = @remark WHERE (rowid = @rowid)" OnInit="sds_z_org_user_Init">
            <DeleteParameters>
                <asp:Parameter Name="rowid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="isenabled" />
                <asp:Parameter Name="issecurity" />
                <asp:Parameter Name="role_no" Type="String" />
                <asp:Parameter Name="no_user" Type="String" />
                <asp:Parameter Name="name_user" Type="String" />
                <asp:Parameter Name="pass_user" Type="String" />
                <asp:Parameter Name="email_user" Type="String" />
                <asp:Parameter Name="tel_user" Type="String" />
                <asp:Parameter Name="phone_user" Type="String" />
                <asp:Parameter Name="id_user" Type="String" />
                <asp:Parameter DbType="Date" Name="date_join" />
                <asp:Parameter Name="remark" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="isenabled" />
                <asp:Parameter Name="issecurity" />
                <asp:Parameter Name="role_no" Type="String" />
                <asp:Parameter Name="no_user" Type="String" />
                <asp:Parameter Name="name_user" Type="String" />
                <asp:Parameter Name="pass_user" Type="String" />
                <asp:Parameter Name="email_user" Type="String" />
                <asp:Parameter Name="tel_user" Type="String" />
                <asp:Parameter Name="phone_user" Type="String" />
                <asp:Parameter Name="id_user" Type="String" />
                <asp:Parameter DbType="Date" Name="date_join" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter Name="rowid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_z_org_user_group" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT z_org_user_group.group_no, z_sys_group.name_group AS group_name, z_org_user_group.remark, z_org_user_group.rowid, z_org_user_group.role_no, z_org_user_group.user_no FROM z_org_user_group LEFT OUTER JOIN z_sys_group ON z_org_user_group.group_no = z_sys_group.no_group WHERE (z_org_user_group.user_no = @user_no) AND (z_org_user_group.role_no = @role_no) ORDER BY z_org_user_group.group_no">
            <SelectParameters>
                <asp:SessionParameter Name="user_no" SessionField="parm1" Type="String" />
                <asp:SessionParameter Name="role_no" SessionField="parm2" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_ddlb_z_org_user_role" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT [no_role], [name_role] FROM [z_org_user_role] WHERE ([isenabled] = @isenabled) ORDER BY [sort_role], [no_role]">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="isenabled" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_ddlb_z_sys_group" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT [no_group], [name_group] FROM [z_sys_group] WHERE ([isenabled] = @isenabled) ORDER BY [no_group]">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="isenabled" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
