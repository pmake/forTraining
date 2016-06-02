<%@ Page Title="" Language="C#" MasterPageFile="~/manager.Master" AutoEventWireup="true" CodeBehind="orgp002_orgnization.aspx.cs" Inherits="webmall.Forms.org.orgp002_orgnization" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        <dx:ASPxRoundPanel ID="rpl_master" runat="server" OnInit="rpl_master_Init" Theme="Office2003Olive" Width="100%">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxGridView ID="gv_master" runat="server" AutoGenerateColumns="False" EnableTheming="True" OnInit="gv_master_Init" Theme="Office2003Olive" Width="100%" DataSourceID="sds_z_org_orgnization1" KeyFieldName="rowid" OnRowValidating="gv_master_RowValidating">
                        <SettingsDetail ShowDetailRow="True" />
                        <Templates>
                            <DetailRow>
                                <dx:ASPxGridView ID="gv_detail2" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_org_orgnization2" EnableTheming="True" KeyFieldName="rowid" OnBeforePerformDataSelect="gv_detail2_BeforePerformDataSelect" OnInit="gv_detail2_Init" Theme="Office2003Olive" Width="100%" OnRowValidating="gv_detail2_RowValidating">
                                    <SettingsDetail ShowDetailRow="True" />
                                    <Templates>
                                        <DetailRow>
                                            <dx:ASPxGridView ID="gv_detail3" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_org_orgnization3" EnableTheming="True" KeyFieldName="rowid" OnBeforePerformDataSelect="gv_detail3_BeforePerformDataSelect" OnInit="gv_detail3_Init" Theme="BlackGlass" Width="100%" OnRowValidating="gv_detail3_RowValidating">
                                                <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                                                <Columns>
                                                    <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                        <HeaderStyle Wrap="False" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn Caption="公司名稱" FieldName="comp_name" VisibleIndex="1">
                                                        <EditItemTemplate>
                                                            <dx:ASPxGridLookup ID="glu_comp_no3" runat="server" AutoGenerateColumns="False" DataSourceID="sds_ddlb_z_org_company" EnableTheming="True" KeyFieldName="no_comp" OnInit="glu_comp_no3_Init" TextFormatString="{0} {1}" Theme="BlackGlass" Value='<%# Bind("comp_no") %>' Width="100%">
                                                                <GridViewProperties>
                                                                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                </GridViewProperties>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="代號" FieldName="no_comp" VisibleIndex="0">
                                                                        <HeaderStyle Wrap="False" />
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_comp" VisibleIndex="1" Width="100%">
                                                                        <HeaderStyle Wrap="False" />
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:ASPxGridLookup>
                                                        </EditItemTemplate>
                                                        <HeaderStyle Wrap="False" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="代號" FieldName="no_org" VisibleIndex="2">
                                                        <HeaderStyle Wrap="False" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_org" VisibleIndex="3">
                                                        <HeaderStyle Wrap="False" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="電話" FieldName="tel_org" VisibleIndex="4">
                                                        <HeaderStyle Wrap="False" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="角色名稱" FieldName="role_name" VisibleIndex="5">
                                                        <EditItemTemplate>
                                                            <dx:ASPxGridLookup ID="glu_role_no3" runat="server" AutoGenerateColumns="False" DataSourceID="sds_ddlb_z_org_role" EnableTheming="True" KeyFieldName="no_role" OnInit="glu_role_no3_Init" TextFormatString="{0} {1}" Theme="BlackGlass" Value='<%# Bind("role_no") %>' Width="100%">
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
                                                    <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" VisibleIndex="6" Width="100%">
                                                        <HeaderStyle Wrap="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" Visible="False" VisibleIndex="7">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="comp_no" Visible="False" VisibleIndex="8">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="role_no" Visible="False" VisibleIndex="9">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="parentid" Visible="False" VisibleIndex="10">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:ASPxGridView>
                                        </DetailRow>
                                    </Templates>
                                    <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                            <HeaderStyle Wrap="False" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn Caption="公司名稱" FieldName="comp_name" VisibleIndex="1">
                                            <EditItemTemplate>
                                                <dx:ASPxGridLookup ID="glu_comp_no2" runat="server" AutoGenerateColumns="False" DataSourceID="sds_ddlb_z_org_company" EnableTheming="True" KeyFieldName="no_comp" OnInit="glu_comp_no2_Init" TextFormatString="{0} {1}" Theme="BlackGlass" Value='<%# Bind("comp_no") %>' Width="100%">
                                                    <GridViewProperties>
                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                    </GridViewProperties>
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="代號" FieldName="no_comp" VisibleIndex="0">
                                                            <HeaderStyle Wrap="False" />
                                                            <CellStyle Wrap="False">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_comp" VisibleIndex="1" Width="100%">
                                                            <HeaderStyle Wrap="False" />
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:ASPxGridLookup>
                                            </EditItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="代號" FieldName="no_org" VisibleIndex="2">
                                            <HeaderStyle Wrap="False" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_org" VisibleIndex="3">
                                            <HeaderStyle Wrap="False" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="電話" FieldName="tel_org" VisibleIndex="4">
                                            <HeaderStyle Wrap="False" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="角色" FieldName="role_name" VisibleIndex="5">
                                            <EditItemTemplate>
                                                <dx:ASPxGridLookup ID="glu_role_no2" runat="server" AutoGenerateColumns="False" DataSourceID="sds_ddlb_z_org_role" EnableTheming="True" KeyFieldName="no_role" OnInit="glu_role_no2_Init" TextFormatString="{0} {1}" Theme="BlackGlass" Value='<%# Bind("role_no") %>' Width="100%">
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
                                        <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" VisibleIndex="6" Width="100%">
                                            <HeaderStyle Wrap="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" Visible="False" VisibleIndex="7">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="parentid" Visible="False" VisibleIndex="8">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="comp_no" Visible="False" VisibleIndex="9">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="role_no" Visible="False" VisibleIndex="10">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                            </DetailRow>
                        </Templates>
                        <Settings ShowGroupPanel="True" />
                        <Columns>
                            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="公司名稱" FieldName="comp_name" ShowInCustomizationForm="True" VisibleIndex="1">
                                <EditItemTemplate>
                                    <dx:ASPxGridLookup ID="glu_comp_no" runat="server" AutoGenerateColumns="False" DataSourceID="sds_ddlb_z_org_company" EnableTheming="True" KeyFieldName="no_comp" OnInit="glu_comp_no_Init" TextFormatString="{0} {1}" Theme="BlackGlass" Value='<%# Bind("comp_no") %>' Width="100%">
                                        <GridViewProperties>
                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        </GridViewProperties>
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="代號" FieldName="no_comp" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <HeaderStyle Wrap="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_comp" ShowInCustomizationForm="True" VisibleIndex="1" Width="100%">
                                                <HeaderStyle Wrap="False" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:ASPxGridLookup>
                                </EditItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="代號" FieldName="no_org" ShowInCustomizationForm="True" VisibleIndex="2">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_org" ShowInCustomizationForm="True" VisibleIndex="3">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="電話" FieldName="tel_org" ShowInCustomizationForm="True" VisibleIndex="4">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="角色名稱" FieldName="role_name" ShowInCustomizationForm="True" VisibleIndex="5">
                                <EditItemTemplate>
                                    <dx:ASPxGridLookup ID="glu_role_no" runat="server" AutoGenerateColumns="False" DataSourceID="sds_ddlb_z_org_role" EnableTheming="True" KeyFieldName="no_role" TextFormatString="{0} {1}" Theme="BlackGlass" Value='<%# Bind("role_no") %>' Width="100%" OnInit="glu_role_no_Init">
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
                            <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" ShowInCustomizationForm="True" VisibleIndex="6" Width="100%">
                                <HeaderStyle Wrap="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="parentid" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="comp_no" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="角色" FieldName="role_no" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                <HeaderStyle Wrap="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>

<Styles AdaptiveDetailButtonWidth="22"></Styles>
                    </dx:ASPxGridView>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <div>
        <asp:SqlDataSource ID="sds_z_org_orgnization1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>"
            DeleteCommand="DELETE FROM [z_org_orgnization] WHERE [rowid] = @rowid"
            InsertCommand="INSERT INTO [z_org_orgnization] ([comp_no], [parentid], [no_org], [name_org], [tel_org], [role_no], [remark]) VALUES (@comp_no, @parentid, @no_org, @name_org, @tel_org, @role_no, @remark)"
            SelectCommand="SELECT z_org_company.name_comp AS comp_name, z_org_orgnization.no_org, z_org_orgnization.name_org, z_org_orgnization.tel_org, z_org_role.name_role AS role_name, z_org_orgnization.remark, z_org_orgnization.rowid, z_org_orgnization.parentid, z_org_orgnization.comp_no, z_org_orgnization.role_no FROM z_org_orgnization LEFT OUTER JOIN z_org_role ON z_org_orgnization.role_no = z_org_role.no_role LEFT OUTER JOIN z_org_company ON z_org_orgnization.comp_no = z_org_company.no_comp WHERE (z_org_orgnization.parentid = @parentid) ORDER BY z_org_orgnization.comp_no, z_org_orgnization.no_org"
            UpdateCommand="UPDATE z_org_orgnization SET comp_no = @comp_no, no_org = @no_org, name_org = @name_org, tel_org = @tel_org, role_no = @role_no, remark = @remark WHERE (rowid = @rowid)" OnInit="sds_z_org_orgnization1_Init">
            <DeleteParameters>
                <asp:Parameter Name="rowid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="comp_no" Type="String" />
                <asp:Parameter Name="parentid" Type="Int32" DefaultValue="0" />
                <asp:Parameter Name="no_org" Type="String" />
                <asp:Parameter Name="name_org" Type="String" />
                <asp:Parameter Name="tel_org" Type="String" />
                <asp:Parameter Name="role_no" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="parentid" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="comp_no" Type="String" />
                <asp:Parameter Name="no_org" Type="String" />
                <asp:Parameter Name="name_org" Type="String" />
                <asp:Parameter Name="tel_org" Type="String" />
                <asp:Parameter Name="role_no" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter Name="rowid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_z_org_orgnization2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_org_orgnization] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [z_org_orgnization] ([comp_no], [parentid], [no_org], [name_org], [tel_org], [role_no], [remark]) VALUES (@comp_no, @parentid, @no_org, @name_org, @tel_org, @role_no, @remark)" SelectCommand="SELECT z_org_company.name_comp AS comp_name, z_org_orgnization.no_org, z_org_orgnization.name_org, z_org_orgnization.tel_org, z_org_role.name_role AS role_name, z_org_orgnization.remark, z_org_orgnization.rowid, z_org_orgnization.parentid, z_org_orgnization.comp_no, z_org_orgnization.role_no FROM z_org_orgnization LEFT OUTER JOIN z_org_role ON z_org_orgnization.role_no = z_org_role.no_role LEFT OUTER JOIN z_org_company ON z_org_orgnization.comp_no = z_org_company.no_comp WHERE (z_org_orgnization.parentid = @parentid)" UpdateCommand="UPDATE z_org_orgnization SET comp_no = @comp_no, no_org = @no_org, name_org = @name_org, tel_org = @tel_org, role_no = @role_no, remark = @remark WHERE (rowid = @rowid)" OnInit="sds_z_org_orgnization2_Init">
            <DeleteParameters>
                <asp:Parameter Name="rowid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="comp_no" Type="String" />
                <asp:SessionParameter Name="parentid" SessionField="parm1" Type="Int32" />
                <asp:Parameter Name="no_org" Type="String" />
                <asp:Parameter Name="name_org" Type="String" />
                <asp:Parameter Name="tel_org" Type="String" />
                <asp:Parameter Name="role_no" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="parentid" SessionField="parm1" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="comp_no" Type="String" />
                <asp:Parameter Name="no_org" Type="String" />
                <asp:Parameter Name="name_org" Type="String" />
                <asp:Parameter Name="tel_org" Type="String" />
                <asp:Parameter Name="role_no" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter Name="rowid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_z_org_orgnization3" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_org_orgnization] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [z_org_orgnization] ([comp_no], [parentid], [no_org], [name_org], [tel_org], [role_no], [remark]) VALUES (@comp_no, @parentid, @no_org, @name_org, @tel_org, @role_no, @remark)" SelectCommand="SELECT z_org_company.name_comp AS comp_name, z_org_orgnization.no_org, z_org_orgnization.name_org, z_org_orgnization.tel_org, z_org_role.name_role AS role_name, z_org_orgnization.remark, z_org_orgnization.rowid, z_org_orgnization.comp_no, z_org_orgnization.role_no, z_org_orgnization.parentid FROM z_org_orgnization LEFT OUTER JOIN z_org_role ON z_org_orgnization.role_no = z_org_role.no_role LEFT OUTER JOIN z_org_company ON z_org_orgnization.comp_no = z_org_company.no_comp WHERE (z_org_orgnization.parentid = @parentid) ORDER BY z_org_orgnization.comp_no, z_org_orgnization.no_org" UpdateCommand="UPDATE z_org_orgnization SET comp_no = @comp_no, no_org = @no_org, name_org = @name_org, tel_org = @tel_org, role_no = @role_no, remark = @remark WHERE (rowid = @rowid)" OnInit="sds_z_org_orgnization3_Init">
            <DeleteParameters>
                <asp:Parameter Name="rowid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="comp_no" Type="String" />
                <asp:SessionParameter Name="parentid" SessionField="parm2" Type="Int32" />
                <asp:Parameter Name="no_org" Type="String" />
                <asp:Parameter Name="name_org" Type="String" />
                <asp:Parameter Name="tel_org" Type="String" />
                <asp:Parameter Name="role_no" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="parentid" SessionField="parm2" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="comp_no" Type="String" />
                <asp:Parameter Name="no_org" Type="String" />
                <asp:Parameter Name="name_org" Type="String" />
                <asp:Parameter Name="tel_org" Type="String" />
                <asp:Parameter Name="role_no" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter Name="rowid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_ddlb_z_org_company" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT [no_comp], [name_comp] FROM [z_org_company] ORDER BY [no_comp]" OnInit="sds_ddlb_z_org_company_Init"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_ddlb_z_org_role" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT [no_role], [name_role] FROM [z_org_role] ORDER BY [sort_role], [no_role]" OnInit="sds_ddlb_z_org_role_Init"></asp:SqlDataSource>
    </div>
</asp:Content>
