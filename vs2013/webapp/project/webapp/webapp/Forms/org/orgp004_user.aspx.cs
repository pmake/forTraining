using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;

namespace webapp.Forms.org
{
    public partial class orgp004_user : ezPage
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

        protected void gv_master_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["isenabled"] = 1;
            e.NewValues["code_user"] = "U";
            e.NewValues["date_join"] = DateTime.Today;
        }

        protected void sds_z_org_user_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }
    }
}