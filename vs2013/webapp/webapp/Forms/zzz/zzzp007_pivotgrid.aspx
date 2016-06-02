<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zzzp007_pivotgrid.aspx.cs" Inherits="webapp.Forms.zzz.zzzp007_pivotgrid" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxRoundPanel ID="rpl_master" runat="server" ShowCollapseButton="true" Theme="BlackGlass" Width="100%">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btn_excel" runat="server" OnClick="btn_excel_Click" Text="轉出 Excel" Theme="BlackGlass">
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btn_pdf" runat="server" OnClick="btn_pdf_Click" Text="轉出 PDF" Theme="BlackGlass">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr />
                        <div>
                            <dx:ASPxPivotGrid ID="pvg_master" runat="server" ClientIDMode="AutoID" DataSourceID="sds_master" EnableTheming="True" Theme="BlackGlass" Font-Names="Microsoft Sans Serif">
                                <Fields>
                                    <dx:PivotGridField ID="fieldtotals" Area="DataArea" AreaIndex="0" Caption="銷售金額" CellFormat-FormatString="#,##0" CellFormat-FormatType="Numeric" FieldName="totals" GrandTotalCellFormat-FormatString="#,##0" GrandTotalCellFormat-FormatType="Numeric" TotalCellFormat-FormatString="#,##0" TotalCellFormat-FormatType="Numeric" TotalValueFormat-FormatString="#,##0" TotalValueFormat-FormatType="Numeric" ValueFormat-FormatString="#,##0" ValueFormat-FormatType="Numeric">
                                    </dx:PivotGridField>
                                    <dx:PivotGridField ID="fieldmsname" Area="RowArea" AreaIndex="0" Caption="客戶" FieldName="msname">
                                    </dx:PivotGridField>
                                    <dx:PivotGridField ID="fieldsheetdate" Area="ColumnArea" AreaIndex="0" Caption="銷售日期" CellFormat-FormatString="yyyy/MM/dd" CellFormat-FormatType="DateTime" FieldName="sheet_date" ValueFormat-FormatString="yyyy/MM/dd" ValueFormat-FormatType="DateTime">
                                    </dx:PivotGridField>
                                    <dx:PivotGridField ID="fieldcloseym" AreaIndex="0" Caption="月份" FieldName="close_ym">
                                    </dx:PivotGridField>
                                    <dx:PivotGridField ID="fieldtotals1" Area="DataArea" AreaIndex="1" Caption="平均售價" CellFormat-FormatString="#,##0" CellFormat-FormatType="Numeric" FieldName="totals" GrandTotalCellFormat-FormatString="#,##0" GrandTotalCellFormat-FormatType="Numeric" SummaryType="Average" TotalCellFormat-FormatString="#,##0" TotalCellFormat-FormatType="Numeric" TotalValueFormat-FormatString="#,##0" TotalValueFormat-FormatType="Numeric" ValueFormat-FormatString="#,##0" ValueFormat-FormatType="Numeric">
                                    </dx:PivotGridField>
                                </Fields>
                            </dx:ASPxPivotGrid>
                        </div>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </div>
        <asp:SqlDataSource ID="sds_master" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT z_sal_sale.close_ym, z_sal_sale.sheet_date , z_bas_customer.msname, z_sal_sale.totals FROM z_sal_sale INNER JOIN z_bas_customer ON z_sal_sale.target_no = z_bas_customer.mno "></asp:SqlDataSource>
        <dx:ASPxPivotGridExporter ID="pge_master" runat="server" ASPxPivotGridID="pvg_master">
        </dx:ASPxPivotGridExporter>
    </form>
</body>
</html>
