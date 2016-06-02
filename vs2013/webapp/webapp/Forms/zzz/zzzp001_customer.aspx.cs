using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;


namespace webapp.Forms.zzz
{
    public partial class zzzp001_customer : ezPage
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

        protected void sds_z_bas_customer_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void gv_master_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            ezASPxGridView.CheckRequire(sender, e, "mno");
            ezASPxGridView.CheckRequire(sender, e, "mname");
            ezASPxGridView.CheckRequire(sender, e, "msname");
            ezASPxGridView.CheckDuplicate(sender, e, "mno", "z_bas_customer", "mno");
        }

        protected void glu_type_no_Init(object sender, EventArgs e)
        {
            ezASPxGridLookup.Init(sender, e);
        }

        protected void btn_excel_Click(object sender, EventArgs e)
        {
            gve_master.WriteXlsxToResponse("abc");
        }

        protected void btn_pdf_Click(object sender, EventArgs e)
        {
            gve_master.WritePdfToResponse("def");
        }
    }
}