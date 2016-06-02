using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ezapp
{
    /// <summary>
    /// ASPxGridLookup 自定公用功能類別
    /// </summary>
	public static class ezASPxGridLookup
	{
        public static void Init(object sender, EventArgs e)
        {
            //Width
            (sender as ASPxGridLookup).Width = Unit.Percentage(100);
            (sender as ASPxGridLookup).GridView.Width = Unit.Pixel(500);
            //FontSize
            (sender as ASPxGridLookup).Font.Size = ezSession.FontSize;
            (sender as ASPxGridLookup).GridView.Font.Size = ezSession.FontSize;
            (sender as ASPxGridLookup).GridViewStyles.Table.Font.Size = ezSession.FontSize;
            (sender as ASPxGridLookup).GridViewStyles.Header.Font.Size = ezSession.FontSize;
            (sender as ASPxGridLookup).GridViewStyles.TitlePanel.Font.Size = ezSession.FontSize;
            (sender as ASPxGridLookup).GridViewStylesPager.Pager.Font.Size = ezSession.FontSize;
            //Focus
            (sender as ASPxGridLookup).GridViewProperties.SettingsBehavior.AllowFocusedRow = true;
            (sender as ASPxGridLookup).GridViewProperties.SettingsBehavior.AllowSelectSingleRowOnly = true;
            (sender as ASPxGridLookup).GridView.SettingsBehavior.EnableRowHotTrack = true;
            (sender as ASPxGridLookup).GridView.SettingsBehavior.AllowFocusedRow = true;
            //Filter
            (sender as ASPxGridLookup).GridView.Settings.ShowFilterBar = GridViewStatusBarMode.Visible;
            (sender as ASPxGridLookup).GridView.Settings.ShowFilterRow = true;
            (sender as ASPxGridLookup).GridView.Settings.ShowFilterRowMenu = true;
            (sender as ASPxGridLookup).GridView.Settings.ShowHeaderFilterButton = true;
            (sender as ASPxGridLookup).GridViewProperties.Settings.ShowFilterBar = GridViewStatusBarMode.Visible;
            (sender as ASPxGridLookup).GridViewProperties.Settings.ShowFilterRow = true;
            (sender as ASPxGridLookup).GridViewProperties.Settings.ShowFilterRowMenu = true;
            (sender as ASPxGridLookup).GridViewProperties.Settings.ShowHeaderFilterButton = true;
            //PageSize
            (sender as ASPxGridLookup).GridViewProperties.SettingsPager.PageSize = 5;
            (sender as ASPxGridLookup).GridViewProperties.SettingsPager.PageSizeItemSettings.ShowAllItem = true;
            (sender as ASPxGridLookup).GridViewProperties.SettingsPager.PageSizeItemSettings.Visible = true;

        }
	}
}