using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;

namespace webapp.Forms.sys
{
    public partial class sysp004_tables : ezPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rpl_master_Init(object sender, EventArgs e)
        {
            ezASPxRoundPanel.Init(sender, e, true);
        }

        protected void gv_master_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, false);
        }

        protected void sds_table_layout_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void btn_excel_Click(object sender, EventArgs e)
        {
            string str_file = "table_layout_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xlsx";
            gve_export.WriteXlsxToResponse(str_file);
        }
    }
}