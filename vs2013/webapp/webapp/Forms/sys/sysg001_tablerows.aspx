<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sysg001_tablerows.aspx.cs" Inherits="webapp.Forms.sys.sysg001_tablerows" %>

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
                        <div>
                            <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" CrosshairEnabled="True" Height="500px" Width="1000px" DataSourceID="sds_tablerows">
                                <DiagramSerializable>
                                    <cc2:XYDiagram>
                                        <axisx visibleinpanesserializable="-1">
                                    <label angle="45">
                                    </label>
                                </axisx>
                                        <axisy visibleinpanesserializable="-1">
                                </axisy>
                                    </cc2:XYDiagram>
                                </DiagramSerializable>
                                <Legend Visibility="True"></Legend>
                                <SeriesSerializable>
                                    <cc2:Series ArgumentDataMember="schema_table" LabelsVisibility="True" Name="記錄數(筆)" ValueDataMembersSerializable="rows">
                                        <labelserializable>
                                    <cc2:SideBySideBarSeriesLabel Position="Top" TextPattern="{V:#,#}">
                                        <border visibility="True" />
                                    </cc2:SideBySideBarSeriesLabel>
                                </labelserializable>
                                    </cc2:Series>
                                    <cc2:Series ArgumentDataMember="schema_table" LabelsVisibility="True" Name="使用大小(kb)" ValueDataMembersSerializable="used_in_kb">
                                    <viewserializable>
                                        <cc2:SplineSeriesView>
                                        </cc2:SplineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc2:PointSeriesLabel LineLength="15" LineVisibility="True" TextPattern="{V:#,#}">
                                            <border visibility="True" />
                                        </cc2:PointSeriesLabel>
                                    </labelserializable>
                                    </cc2:Series>
                                </SeriesSerializable>
                                <SeriesTemplate ValueDataMembersSerializable="rows" />
                                <Titles>
                                    <cc2:ChartTitle Text="表格記錄數前20名圖表" />
                                </Titles>
                            </dxchartsui:WebChartControl>
                        </div>
                        <hr />
                        <div>
                            <table style="width: 1000px">
                                <tr>
                                    <td>
                                        <dx:ASPxGridView ID="gv_master" runat="server" AutoGenerateColumns="False" DataSourceID="sds_tablerows" Theme="BlackGlass" Width="100%">
                                            <SettingsPager Visible="False">
                                            </SettingsPager>
                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="表格名稱" FieldName="schema_table" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="100%">
                                                    <HeaderStyle Wrap="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="索引名稱" FieldName="index_name" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="使用大小(kb)" FieldName="used_in_kb" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="保留大小(kb)" FieldName="reserved_in_kb" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="記錄筆數" FieldName="rows" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                    <HeaderStyle Wrap="False" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
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
            <asp:SqlDataSource ID="sds_tablerows" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT TOP 20 t.schema_name+ '.'+ t.table_name as schema_table
, t.index_name
, sum(t.used) as used_in_kb
, sum(t.reserved) as reserved_in_kb
, sum(t.tbl_rows) as rows
from
(
SELECT s.Name schema_name
, o.Name table_name
, coalesce(i.Name, 'HEAP') index_name
, p.used_page_count * 8 used
, p.reserved_page_count * 8 reserved
, p.row_count ind_rows
, case when i.index_id in ( 0, 1 ) then p.row_count else 0 end tbl_rows
FROM sys.dm_db_partition_stats p
INNER JOIN sys.objects as o
ON o.object_id = p.object_id
INNER JOIN sys.schemas as s
ON s.schema_id = o.schema_id
LEFT OUTER JOIN sys.indexes as i
on i.object_id = p.object_id and i.index_id = p.index_id
WHERE o.type_desc = 'USER_TABLE'
and o.is_ms_shipped = 0
) as t
GROUP BY
t.schema_name, t.table_name
, t.index_name
ORDER BY
5 desc"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
