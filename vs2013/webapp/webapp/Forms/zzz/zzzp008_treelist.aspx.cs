using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxTreeList;
using ezapp;

namespace webapp.Forms.zzz
{
    public partial class zzzp008_treelist : ezPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void tl_master_FocusedNodeChanged(object sender, EventArgs e)
        {
            TreeListNode node = tl_master.FocusedNode;
            if (node.Level == 3)
            {
                Label1.Text = node["mname"].ToString();
            }
        }

        protected void btn_excel_Click(object sender, EventArgs e)
        {
            tle_master.WriteXlsxToResponse("aaa");
        }

        protected void btn_pdf_Click(object sender, EventArgs e)
        {
            tle_master.WritePdfToResponse("bbb");
        }

        protected void tl_master_Init(object sender, EventArgs e)
        {
            ezASPxTreeList.Init(sender, e, true, true, true);
        }

        protected void glu_mno_Init(object sender, EventArgs e)
        {
            ezASPxGridLookup.Init(sender, e);
        }
    }
}