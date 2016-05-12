<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sysp004_tables.aspx.cs" Inherits="webapp.Forms.sys.sysp004_tables" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxRoundPanel ID="rpl_master" runat="server" ShowCollapseButton="true" Width="100%" OnInit="rpl_master_Init" Theme="BlackGlass">
                <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGridView ID="gv_master" runat="server" AutoGenerateColumns="False" DataSourceID="sds_table_layout" EnableTheming="True" OnInit="gv_master_Init" Theme="BlackGlass" Width="100%">
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="表格名稱" FieldName="table_name" ShowInCustomizationForm="True" VisibleIndex="0">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="欄位ID" FieldName="column_id" ShowInCustomizationForm="True" VisibleIndex="1">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="欄位名稱" FieldName="column_name" ShowInCustomizationForm="True" VisibleIndex="2">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="資料型態" FieldName="column_type" ShowInCustomizationForm="True" VisibleIndex="3">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="精準度" FieldName="column_prec" ShowInCustomizationForm="True" VisibleIndex="4">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="比例" FieldName="column_scale" ShowInCustomizationForm="True" VisibleIndex="5">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="長度" FieldName="column_len" ShowInCustomizationForm="True" VisibleIndex="6">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="預設值" FieldName="column_default" ShowInCustomizationForm="True" VisibleIndex="7">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="允許Null" FieldName="allow_null" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="自動編號" FieldName="column_autono" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="描述" FieldName="column_desc" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10" Width="100%">
                <HeaderStyle Wrap="False" />
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
                    </dx:PanelContent>
</PanelCollection>
            </dx:ASPxRoundPanel>
        </div>
        <div>
            <asp:SqlDataSource ID="sds_table_layout" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" OnInit="sds_table_layout_Init" SelectCommand="SELECT tab.name  as table_name, 
       col.colid as column_id, 
       col.name  as column_name, 
       typ.name  as column_type, 
       col.prec  as column_prec, 
       col.scale  as column_scale, 
       col.length as column_len, 
       com.TEXT as column_default, 
       CASE 
         WHEN col.isnullable = 1 THEN 'Y' 
         ELSE 'N' 
       END as allow_null, 
       CASE 
         WHEN col.status &amp; 0X80 = 0X80 THEN 'Y' 
         ELSE 'N' 
       END column_autono, 
       CAST((SELECT VALUE 
        FROM   Fn_listextendedproperty (NULL, 'schema', 'dbo', 'table', 
               tab.name, 
               'column', 
                       col.name)) AS nvarchar(250)) as column_desc  
FROM   sysobjects tab, 
       syscolumns col 
       LEFT OUTER JOIN syscomments com 
                       INNER JOIN sysobjects obj 
                         ON com.id = obj.id 
         ON col.cdefault = com.id 
            AND com.colid = 1, 
       systypes typ 
WHERE  tab.id = col.id 
       AND tab.xtype = 'U' 
       AND col.xusertype = typ.xusertype  "></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
