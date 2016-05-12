<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orgp004_user.aspx.cs" Inherits="webapp.Forms.org.orgp004_user" %>

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
                        <dx:ASPxGridView ID="gv_master" runat="server" AutoGenerateColumns="False" EnableTheming="True" OnInit="gv_master_Init" Theme="BlackGlass" Width="100%" DataSourceID="sds_z_org_user" KeyFieldName="rowid" OnInitNewRow="gv_master_InitNewRow">
                            <Settings ShowGroupPanel="True" ShowFilterRow="True" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn Caption="代號" FieldName="no_user" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_user" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="密碼" FieldName="pass_user" ShowInCustomizationForm="True" VisibleIndex="5">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="電子信箱" FieldName="email_user" ShowInCustomizationForm="True" VisibleIndex="6">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="連絡電話" FieldName="tel_user" ShowInCustomizationForm="True" VisibleIndex="7">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="行動電話" FieldName="phone_user" ShowInCustomizationForm="True" VisibleIndex="8">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="身份證字號" FieldName="id_user" ShowInCustomizationForm="True" VisibleIndex="9">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn Caption="加入日期" FieldName="date_join" ShowInCustomizationForm="True" VisibleIndex="10">
                                    <PropertiesDateEdit DisplayFormatInEditMode="True" DisplayFormatString="yyyy/MM/dd" EditFormat="Custom" EditFormatString="yyyy/MM/dd">
                                    </PropertiesDateEdit>
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" ShowInCustomizationForm="True" VisibleIndex="11" Width="100%">
                                    <EditFormSettings ColumnSpan="2" />
                                    <HeaderStyle Wrap="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataComboBoxColumn Caption="類別" FieldName="code_user" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <PropertiesComboBox>
                                        <Items>
                                            <dx:ListEditItem Selected="True" Text="使用者" Value="U" />
                                            <dx:ListEditItem Text="管理者" Value="A" />
                                        </Items>
                                    </PropertiesComboBox>
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataComboBoxColumn>
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
            <asp:SqlDataSource ID="sds_z_org_user" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_org_user] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO z_org_user(isenabled, code_user, no_user, name_user, pass_user, email_user, tel_user, phone_user, id_user, date_join, remark) VALUES (@isenabled, @code_user, @no_user, @name_user, @pass_user, @email_user, @tel_user, @phone_user, @id_user, @date_join, @remark)" SelectCommand="SELECT isenabled, code_user, no_user, name_user, pass_user, email_user, tel_user, phone_user, id_user, date_join, remark, rowid FROM z_org_user ORDER BY no_user" UpdateCommand="UPDATE z_org_user SET isenabled = @isenabled, code_user = @code_user, no_user = @no_user, name_user = @name_user, pass_user = @pass_user, email_user = @email_user, tel_user = @tel_user, phone_user = @phone_user, id_user = @id_user, date_join = @date_join, remark = @remark WHERE (rowid = @rowid)" OnInit="sds_z_org_user_Init">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="isenabled" />
                    <asp:Parameter Name="code_user" Type="String" />
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
                    <asp:Parameter Name="code_user" Type="String" />
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
        </div>
    </form>
</body>
</html>
