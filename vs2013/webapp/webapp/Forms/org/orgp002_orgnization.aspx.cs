using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;

namespace webapp.Forms.org
{
    public partial class orgp002_orgnization : ezPage
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

        protected void glu_comp_no_Init(object sender, EventArgs e)
        {
            ezASPxGridLookup.Init(sender, e);
        }

        protected void glu_role_no_Init(object sender, EventArgs e)
        {
            ezASPxGridLookup.Init(sender, e);
        }

        protected void gv_detail2_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, false);
        }

        protected void gv_detail2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ezASPxGridView.BeforePerformDataSelect(sender , e , "parm1" ,"rowid");
        }

        protected void glu_comp_no2_Init(object sender, EventArgs e)
        {
            ezASPxGridLookup.Init(sender, e);
        }

        protected void glu_role_no2_Init(object sender, EventArgs e)
        {
            ezASPxGridLookup.Init(sender, e);
        }

        protected void gv_detail3_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, false);
        }

        protected void gv_detail3_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ezASPxGridView.BeforePerformDataSelect(sender, e, "parm2", "rowid");
        }

        protected void glu_comp_no3_Init(object sender, EventArgs e)
        {
            ezASPxGridLookup.Init(sender, e);
        }

        protected void glu_role_no3_Init(object sender, EventArgs e)
        {
            ezASPxGridLookup.Init(sender, e);
        }

        protected void sds_z_org_orgnization1_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void sds_z_org_orgnization2_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void sds_z_org_orgnization3_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void sds_ddlb_z_org_company_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void sds_ddlb_z_org_role_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void gv_master_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            ezASPxGridView.CheckRequire(sender, e, "no_org");
            ezASPxGridView.CheckRequire(sender, e, "name_org");
            ezASPxGridView.CheckDuplicate(sender, e, "no_org", sds_z_org_orgnization1);
        }

        protected void gv_detail2_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            ezASPxGridView.CheckRequire(sender, e, "no_org");
            ezASPxGridView.CheckRequire(sender, e, "name_org");
            ezASPxGridView.CheckDuplicate(sender, e, "no_org", sds_z_org_orgnization2);
        }

        protected void gv_detail3_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            ezASPxGridView.CheckRequire(sender, e, "no_org");
            ezASPxGridView.CheckRequire(sender, e, "name_org");
            ezASPxGridView.CheckDuplicate(sender, e, "no_org", sds_z_org_orgnization3);
        }
    }
}