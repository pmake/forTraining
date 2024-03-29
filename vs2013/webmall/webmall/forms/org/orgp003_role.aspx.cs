﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;

namespace webmall.Forms.org
{
    public partial class orgp003_role : ezPage
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
        }

        protected void gv_detail_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, false);
        }

        protected void gv_detail_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["isenabled"] = 1;
        }

        protected void gv_detail_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ezASPxGridView.BeforePerformDataSelect(sender, e, "parm1", "no_role");
        }

        protected void glu_user_no_Init(object sender, EventArgs e)
        {
            ezASPxGridLookup.Init(sender, e);
        }

        protected void sds_z_org_role_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void sds_z_org_role_user_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void sds_ddlb_z_org_user_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void gv_master_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            ezASPxGridView.CheckRequire(sender, e, "no_role");
            ezASPxGridView.CheckRequire(sender, e, "name_role");
            ezASPxGridView.CheckDuplicate(sender, e, "no_role", sds_z_org_role);
        }

        protected void gv_detail_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            string str_role_no = Session["parm1"].ToString();
            string str_where = "role_no = '" + str_role_no + "'";
            ezASPxGridView.CheckRequire(sender, e, "user_no", "user_name", false);
            ezASPxGridView.CheckDuplicate(sender, e, "user_no", sds_z_org_role_user, "user_name", str_where, false);
        }
    }
}