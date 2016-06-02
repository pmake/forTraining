<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zzzp001_customer.aspx.cs" Inherits="webapp.Forms.zzz.zzzp001_customer" %>

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
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btn_excel" runat="server" Font-Size="Small" OnClick="btn_excel_Click" Text="轉出 Excel" Theme="BlackGlass">
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btn_pdf" runat="server" Font-Size="Small" OnClick="btn_pdf_Click" Text="轉出 PDF" Theme="BlackGlass">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr />
                        <div>
                            <dx:ASPxGridView ID="gv_master" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_bas_customer" EnableTheming="True" KeyFieldName="rowid" OnInit="gv_master_Init" OnRowValidating="gv_master_RowValidating" Theme="BlackGlass" Width="100%">
                                <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                                <Columns>
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="代號" FieldName="mno" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="名稱" FieldName="mname" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="簡稱" FieldName="msname" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="類別" FieldName="type_name" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <EditItemTemplate>
                                            <dx:ASPxGridLookup ID="glu_type_no" runat="server" AutoGenerateColumns="False" DataSourceID="sds_ddlb_z_bas_custtype" EnableTheming="True" KeyFieldName="mno" OnInit="glu_type_no_Init" TextFormatString="{0} {1}" Theme="BlackGlass" Value='<%# Bind("type_no") %>' Width="100%">
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
                                        </EditItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="統一編號" FieldName="id_no" ShowInCustomizationForm="True" VisibleIndex="5">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="負責人" FieldName="boss_name" ShowInCustomizationForm="True" VisibleIndex="6">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="連絡人" FieldName="contractor" ShowInCustomizationForm="True" VisibleIndex="7">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="公司電話" FieldName="mtel" ShowInCustomizationForm="True" VisibleIndex="8">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="傳真電話" FieldName="mfax" ShowInCustomizationForm="True" VisibleIndex="9">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="電子信箱" FieldName="memail" ShowInCustomizationForm="True" VisibleIndex="10">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="公司地址" FieldName="maddr" ShowInCustomizationForm="True" VisibleIndex="11">
                                        <HeaderStyle Wrap="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" ShowInCustomizationForm="True" VisibleIndex="12" Width="100%">
                                        <HeaderStyle Wrap="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="type_no" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </div>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </div>
        <div>
            <asp:SqlDataSource ID="sds_z_bas_customer" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_bas_customer] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [z_bas_customer] ([mno], [mname], [msname], [type_no], [id_no], [boss_name], [contractor], [mtel], [mfax], [memail], [maddr], [remark]) VALUES (@mno, @mname, @msname, @type_no, @id_no, @boss_name, @contractor, @mtel, @mfax, @memail, @maddr, @remark)" OnInit="sds_z_bas_customer_Init" SelectCommand="SELECT z_bas_customer.mno, z_bas_customer.mname, z_bas_customer.msname, z_bas_custtype.mname AS type_name, z_bas_customer.id_no, z_bas_customer.boss_name, z_bas_customer.contractor, z_bas_customer.mtel, z_bas_customer.mfax, z_bas_customer.memail, z_bas_customer.maddr, z_bas_customer.remark, z_bas_customer.rowid, z_bas_customer.type_no FROM z_bas_customer LEFT OUTER JOIN z_bas_custtype ON z_bas_customer.type_no = z_bas_custtype.mno ORDER BY z_bas_customer.mno" UpdateCommand="UPDATE [z_bas_customer] SET [mno] = @mno, [mname] = @mname, [msname] = @msname, [type_no] = @type_no, [id_no] = @id_no, [boss_name] = @boss_name, [contractor] = @contractor, [mtel] = @mtel, [mfax] = @mfax, [memail] = @memail, [maddr] = @maddr, [remark] = @remark WHERE [rowid] = @rowid">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="mno" Type="String" />
                    <asp:Parameter Name="mname" Type="String" />
                    <asp:Parameter Name="msname" Type="String" />
                    <asp:Parameter Name="type_no" Type="String" />
                    <asp:Parameter Name="id_no" Type="String" />
                    <asp:Parameter Name="boss_name" Type="String" />
                    <asp:Parameter Name="contractor" Type="String" />
                    <asp:Parameter Name="mtel" Type="String" />
                    <asp:Parameter Name="mfax" Type="String" />
                    <asp:Parameter Name="memail" Type="String" />
                    <asp:Parameter Name="maddr" Type="String" />
                    <asp:Parameter Name="remark" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="mno" Type="String" />
                    <asp:Parameter Name="mname" Type="String" />
                    <asp:Parameter Name="msname" Type="String" />
                    <asp:Parameter Name="type_no" Type="String" />
                    <asp:Parameter Name="id_no" Type="String" />
                    <asp:Parameter Name="boss_name" Type="String" />
                    <asp:Parameter Name="contractor" Type="String" />
                    <asp:Parameter Name="mtel" Type="String" />
                    <asp:Parameter Name="mfax" Type="String" />
                    <asp:Parameter Name="memail" Type="String" />
                    <asp:Parameter Name="maddr" Type="String" />
                    <asp:Parameter Name="remark" Type="String" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_ddlb_z_bas_custtype" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT [mno], [mname] FROM [z_bas_custtype] ORDER BY [mno]"></asp:SqlDataSource>
            <dx:ASPxGridViewExporter ID="gve_master" runat="server" GridViewID="gv_master">
                <Styles>
                    <Default Font-Names="標楷體">
                    </Default>
                </Styles>
            </dx:ASPxGridViewExporter>
        </div>
    </form>
</body>
</html>
