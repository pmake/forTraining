using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ezapp
{
    /// <summary>
    /// SqlDataSource 自定公用功能類別
    /// </summary>
    public class ezSqlDataSource
    {
        public static void Init(object sender, EventArgs e)
        {
            (sender as SqlDataSource).ConnectionString = ezSession.ConnectionString;
            (sender as SqlDataSource).ProviderName = ezSession.ProviderName;
        }
    }
}