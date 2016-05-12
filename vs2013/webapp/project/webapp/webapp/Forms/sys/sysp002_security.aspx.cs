using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;
using System.Data;

namespace webapp.Forms.sys
{
    public partial class sysp002_security : ezPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) SetPageLoad();
        }

        private void SetPageLoad()
        {
            Session["parm1"] = "";
            btn_add.Enabled = false;
        }

        protected void rpl_master_Init(object sender, EventArgs e)
        {
            ezASPxRoundPanel.Init(sender, e, true);
        }

        protected void gv_master_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, false);
            ezASPxGridView.SetTitle(sender, e, "使用者");
            ezASPxGridView.SetPager(sender, e, false, true, true, false, true, false);
            ezASPxGridView.SetSingleSelect(sender, e, true);
        }

        protected void gv_detail_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, false);
            ezASPxGridView.SetTitle(sender, e, "使用者權限");
        }

        protected void gv_master_SelectionChanged(object sender, EventArgs e)
        {
            if (gv_master.Selection.Count > 0)
            {
                string str_user_no = ezASPxGridView.GetSelectedRowValue(sender, "no_user").ToString();
                string str_user_name = ezASPxGridView.GetSelectedRowValue(sender, "name_user").ToString();
                gv_detail.SettingsText.Title = str_user_no + " (" + str_user_name + ") 的個人權限";
                Session["parm1"] = str_user_no;
                gv_detail.DataBind();
                if (btn_add.Enabled == false) btn_add.Enabled = true;
            }
        }

        protected void puc_add_Init(object sender, EventArgs e)
        {
            ezASPxPopupControl.Init(sender, e);
        }

        protected void gv_add_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, false);
        }
        protected void btn_add_Click(object sender, EventArgs e)
        {
            gv_add.DataBind();
            puc_add.ShowOnPageLoad = true;
        }

        protected void btn_add_confirm_Click(object sender, EventArgs e)
        {
            AddToSecurity();
            gv_detail.DataBind();
            puc_add.ShowOnPageLoad = false;
        }

        protected void btn_add_cancel_Click(object sender, EventArgs e)
        {
            puc_add.ShowOnPageLoad = false;
        }

        private void AddToSecurity()
        {
            if (gv_add.Selection.Count > 0)
            {
                List<object> datas = ezASPxGridView.ezGetSelectedFieldValues(gv_add, new string[] { "no_prg" });
                if (datas.Count > 0)
                {
                    string str_prg_no = "";
                    string str_user_no = Session["parm1"].ToString();
                    ezSqlServer ezsql = new ezSqlServer();
                    foreach(object oValue in datas)
                    {
                        str_prg_no = oValue.ToString();
                        ezsql.CommandText = "INSERT INTO z_sys_security (user_no , prg_no)";
                        ezsql.CommandText += "VALUES (@user_no , @prg_no) ";
                        ezsql.ParametersAdd("@user_no", str_user_no, true);
                        ezsql.ParametersAdd("@prg_no", str_prg_no, false);
                        ezsql.ExecuteNonQuery(false);
                    }
                    ezsql.Close();
                }
            }
        }

        protected void sds_z_org_user_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void sds_z_sys_security_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void sds_z_sys_prg_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }
    }
}