using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;
using DevExpress.Web;

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
            ezASPxGridView.Init(sender, e, true);
        }

        protected void gv_master_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["isenabled"] = 1;
            e.NewValues["issecurity"] = 1;
            e.NewValues["date_join"] = DateTime.Today;
        }

        protected void sds_z_org_user_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void glu_role_no_Init(object sender, EventArgs e)
        {
            ezASPxGridLookup.Init(sender, e);
        }

        protected void gv_master_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            ezASPxGridView.CheckRequire(sender, e, "no_user");
            ezASPxGridView.CheckRequire(sender, e, "name_user");
            ezASPxGridView.CheckRequire(sender, e, "role_no", "role_name", false);
            ezASPxGridView.CheckDuplicate(sender, e, "no_user", sds_z_org_user);
        }

        protected void gv_detail_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, false);
        }

        protected void glu_group_no_Init(object sender, EventArgs e)
        {
            ezASPxGridLookup.Init(sender, e);
        }

        protected void gv_detail_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ezASPxGridView.BeforePerformDataSelect(sender, e, "parm1", "no_user");
            ezASPxGridView.BeforePerformDataSelect(sender, e, "parm2", "role_no");
        }
    }
}