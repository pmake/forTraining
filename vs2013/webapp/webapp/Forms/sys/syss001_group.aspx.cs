using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;

namespace webapp.Forms.sys
{
    public partial class syss001_group : ezPage
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
            ezASPxGridView.InitNewRow(sender, e, "isenabled", 1);
        }

        protected void gv_master_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            ezASPxGridView.CheckRequire(sender, e, "no_group");
            ezASPxGridView.CheckRequire(sender, e, "name_group");
            ezASPxGridView.CheckDuplicate(sender, e, "no_group" , sds_z_sys_group );
        }

        protected void sds_z_sys_group_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void gv_detail_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, true);
        }

        protected void gv_detail_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ezASPxGridView.BeforePerformDataSelect(sender, e, "parm1", "no_group");
        }

        protected void gv_detail_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            string str_group_no = Session["parm1"].ToString();
            string str_where = "group_no = '" + str_group_no + "'";
            ezASPxGridView.CheckRequire(sender, e, "user_no", "user_name", false);
            ezASPxGridView.CheckDuplicate(sender, e, "user_no", sds_z_org_user_group, "user_no", str_where, false);
        }

        protected void glu_group_no_Init(object sender, EventArgs e)
        {
            ezASPxGridLookup.Init(sender, e);
        }

        protected void gv_detail_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            ezASPxGridView.InitNewRow(sender, e, "isenabled", 1);
        }

        protected void pgc_detail_Init(object sender, EventArgs e)
        {
            ezAspxPageControl.Init(sender, e);
        }

        protected void gv_security_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ezASPxGridView.BeforePerformDataSelect(sender, e, "parm1", "no_group");
        }

        protected void gv_security_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, true);
        }
    }
}