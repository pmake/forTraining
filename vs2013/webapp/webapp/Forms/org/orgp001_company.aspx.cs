using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using ezapp;

namespace webapp.Forms.org
{
    public partial class orgp001_company : ezPage
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
            ezASPxGridView.InitNewRow(sender , e , "isenabled" , 1);
        }

        protected void gv_master_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            ezASPxGridView.CheckRequire(sender, e, "no_comp");
            ezASPxGridView.CheckRequire(sender, e, "name_comp");
            ezASPxGridView.CheckDuplicate(sender, e, "no_comp", sds_z_org_company);
        }

        protected void sds_z_org_company_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }
    }
}