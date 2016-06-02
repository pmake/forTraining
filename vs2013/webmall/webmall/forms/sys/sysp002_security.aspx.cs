using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;
using System.Data;

namespace webmall.Forms.sys
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
            Session["parm2"] = "";
            Session["parm3"] = "U";
            Session["parm4"] = "M";
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

        protected void gv_group_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, false);
            ezASPxGridView.SetTitle(sender, e, "群組");
            ezASPxGridView.SetPager(sender, e, false, true, true, false, true, false);
            ezASPxGridView.SetSingleSelect(sender, e, true);
        }

        protected void gv_detail_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, false);
            ezASPxGridView.SetTitle(sender, e, "使用者權限");
        }

        protected void gv_user_group_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, false);
            ezASPxGridView.SetTitle(sender, e, "使用者群組");
        }

        protected void gv_master_SelectionChanged(object sender, EventArgs e)
        {
            if (gv_master.Selection.Count > 0)
            {
                string str_user_no = ezASPxGridView.GetSelectedRowValue(sender, "no_user").ToString();
                string str_user_name = ezASPxGridView.GetSelectedRowValue(sender, "name_user").ToString();
                string str_role_no = ezASPxGridView.GetSelectedRowValue(sender, "role_no").ToString();
                gv_detail.SettingsText.Title = str_user_no + " (" + str_user_name + ") 的個人權限";
                gv_user_group.SettingsText.Title = str_user_no + " (" + str_user_name + ") 加入的權限群組";
                Session["parm1"] = str_user_no;
                Session["parm2"] = str_role_no;
                Session["parm3"] = "U";
                gv_detail.DataBind();
                gv_user_group.DataBind();
                if (btn_add.Enabled == false) btn_add.Enabled = true;
            }
        }

        protected void gv_group_SelectionChanged(object sender, EventArgs e)
        {
            if (gv_group.Selection.Count > 0)
            {
                string str_group_no = ezASPxGridView.GetSelectedRowValue(sender, "no_group").ToString();
                string str_group_name = ezASPxGridView.GetSelectedRowValue(sender, "name_group").ToString();
                string str_role_no = "Group";
                gv_detail.SettingsText.Title = str_group_no + " (" + str_group_name + ") 的群組權限";
                Session["parm1"] = str_group_no;
                Session["parm2"] = str_role_no;
                Session["parm3"] = "G";
                gv_detail.DataBind();
                gv_user_group.DataBind();
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
                    string str_role_no = Session["parm2"].ToString();
                    string str_code_no = Session["parm3"].ToString();

                    ezSqlServer ezsql = new ezSqlServer();
                    foreach (object oValue in datas)
                    {
                        str_prg_no = oValue.ToString();
                        ezsql.CommandText = "INSERT INTO z_sys_security (code_no , role_no , user_no , prg_no)";
                        ezsql.CommandText += "VALUES (@code_no , @role_no , @user_no , @prg_no) ";
                        ezsql.ParametersAdd("@code_no", str_code_no, true);
                        ezsql.ParametersAdd("@role_no", str_role_no, false);
                        ezsql.ParametersAdd("@user_no", str_user_no, false);
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

        protected void btn_copy_Click(object sender, EventArgs e)
        {
            gv_copy.Selection.UnselectAll();
            puc_copy.ShowOnPageLoad = true;
        }

        protected void btn_copy_confirm_Click(object sender, EventArgs e)
        {
            string str_source_id = cbb_source.Value.ToString();
            string str_target_id = "";
            if (gv_copy.Selection.Count > 0)
            {

                List<object> selectedValues = gv_copy.GetSelectedFieldValues(new string[] { "rowid" });
                foreach (object obj_value in selectedValues)
                {
                    str_target_id = obj_value.ToString();
                    CopySecurity(str_source_id, str_target_id);
                }
                lbl_copy_message.Text = "權限複製完成!!";
                gv_copy.DataBind();
            }
        }

        private void CopySecurity(string sSourceID, string sTargetID)
        {
            string str_rowid = "";
            string str_prg_no = "", str_remark = "";
            string str_source_no = "", str_target_no = "";
            string str_source_role = "", str_target_role = "";
            int int_isadd = 0, int_isedit = 0, int_isdelete = 0, int_isconfirm = 0;
            int int_isabolish = 0, int_isprice = 0, int_isprint = 0, int_isdownload = 0;

            //讀取來源使用者權限
            ezSqlServer ezsql = new ezSqlServer();
            ezsql.CommandText = "SELECT role_no , no_user FROM z_org_user WHERE rowid = @rowid";
            ezsql.ParametersAdd("@rowid", sSourceID, true);
            str_source_no = ezsql.GetValueString("no_user");
            str_source_role = ezsql.GetValueString("role_no");

            //讀取目的使用者權限
            ezsql.ParametersAdd("@rowid", sTargetID, true);
            str_target_no = ezsql.GetValueString("no_user");
            str_target_role = ezsql.GetValueString("role_no");

            //執行複製
            ezsql.CommandText = "SELECT prg_no,isadd,isedit,isdelete,isconfirm,isabolish,isprice,isprint,isdownload,remark ";
            ezsql.CommandText += "FROM z_sys_security WHERE code_no = @code_no and role_no = @role_no and user_no = @user_no";
            ezsql.ParametersAdd("@code_no", "U", true);
            ezsql.ParametersAdd("@role_no", str_source_role, false);
            ezsql.ParametersAdd("@user_no", str_source_no, false);
            DataTable dt_source = new DataTable();
            dt_source = ezsql.GetDataTable(true);
            if (dt_source != null && dt_source.Rows.Count > 0)
            {
                for (int i = 0; i < dt_source.Rows.Count; i++)
                {
                    str_prg_no = ezUtility.GetStringValue(dt_source.Rows[i]["prg_no"]);
                    str_remark = ezUtility.GetStringValue(dt_source.Rows[i]["remark"]);
                    int_isadd = ezUtility.GetIntValue(dt_source.Rows[i]["isadd"]);
                    int_isedit = ezUtility.GetIntValue(dt_source.Rows[i]["isedit"]);
                    int_isdelete = ezUtility.GetIntValue(dt_source.Rows[i]["isdelete"]);
                    int_isconfirm = ezUtility.GetIntValue(dt_source.Rows[i]["isconfirm"]);
                    int_isabolish = ezUtility.GetIntValue(dt_source.Rows[i]["isabolish"]);
                    int_isprice = ezUtility.GetIntValue(dt_source.Rows[i]["isprice"]);
                    int_isprint = ezUtility.GetIntValue(dt_source.Rows[i]["isprint"]);
                    int_isdownload = ezUtility.GetIntValue(dt_source.Rows[i]["isdownload"]);

                    ezsql.CommandText = "SELECT rowid FROM z_sys_security WHERE code_no = @code_no and role_no = @role_no and user_no = @user_no and prg_no = @prg_no";
                    ezsql.ParametersAdd("@code_no", "U", true);
                    ezsql.ParametersAdd("@role_no", str_target_role, false);
                    ezsql.ParametersAdd("@user_no", str_target_no, false);
                    ezsql.ParametersAdd("@prg_no", str_prg_no, false);
                    if (ezsql.HasRows)
                    {
                        str_rowid = ezsql.GetValueString("rowid");

                        ezsql.CommandText = "UPDATE z_sys_security SET ";
                        ezsql.CommandText += "isadd = @isadd , isedit = @isedit , isdelete = @isdelete ,";
                        ezsql.CommandText += "isconfirm = @isconfirm , isabolish = @isabolish , isprice = @isprice ,";
                        ezsql.CommandText += "isprint = @isprint , isdownload = @isdownload , remark = @remark ";
                        ezsql.CommandText += "WHERE rowid = @rowid";
                        ezsql.ParametersAdd("@rowid", str_rowid, true);
                    }
                    else
                    {
                        ezsql.CommandText = "INSERT INTO  z_sys_security ";
                        ezsql.CommandText += "(isadd , isedit , isdelete , isconfirm , isabolish , isprice , isprint , isdownload , remark , code_no , role_no ,  user_no , prg_no) ";
                        ezsql.CommandText += "VALUES ";
                        ezsql.CommandText += "(@isadd , @isedit , @isdelete , @isconfirm , @isabolish , @isprice , @isprint , @isdownload , @remark , @code_no , @role_no ,  @user_no , @prg_no)";
                        ezsql.ParametersAdd("@code_no", "U", true);
                        ezsql.ParametersAdd("@role_no", str_target_role, false);
                        ezsql.ParametersAdd("@user_no", str_target_no, false);
                        ezsql.ParametersAdd("@prg_no", str_prg_no, false);
                    }
                    ezsql.ParametersAdd("@isadd", int_isadd, false);
                    ezsql.ParametersAdd("@isedit", int_isedit, false);
                    ezsql.ParametersAdd("@isdelete", int_isdelete, false);
                    ezsql.ParametersAdd("@isconfirm", int_isconfirm, false);
                    ezsql.ParametersAdd("@isabolish", int_isabolish, false);
                    ezsql.ParametersAdd("@isprice", int_isprice, false);
                    ezsql.ParametersAdd("@isprint", int_isprint, false);
                    ezsql.ParametersAdd("@isdownload", int_isdownload, false);
                    ezsql.ParametersAdd("@remark", str_remark, false);
                    ezsql.ExecuteNonQuery(false);
                }
            }
            ezsql.Close();
        }

        protected void btn_copy_cancel_Click(object sender, EventArgs e)
        {
            puc_copy.ShowOnPageLoad = false;
        }

        protected void puc_copy_Init(object sender, EventArgs e)
        {
            ezASPxPopupControl.Init(sender, e);
        }

        protected void gv_copy_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, false);
        }

        protected void sds_z_org_user_target_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void pgc_security_Init(object sender, EventArgs e)
        {
            ezAspxPageControl.Init(sender, e);
        }

        protected void pgc_user_Init(object sender, EventArgs e)
        {
            ezAspxPageControl.Init(sender, e);
        }

        protected void gv_user_group_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            ezASPxGridView.InitNewRow(sender, e, "isenabled", 1);
        }

        protected void pgc_user_ActiveTabChanged(object source, DevExpress.Web.TabControlEventArgs e)
        {
            if (pgc_user.ActiveTabIndex == 0)
            {
                Session["parm3"] = "U";
                pgc_security.TabPages[1].Visible = true;
                gv_master.DataBind();
                gv_user_group.DataBind();
            }
            else
            {
                Session["parm3"] = "G";
                pgc_security.TabPages[1].Visible = false;
                gv_group.DataBind();
            }
            gv_detail.DataBind();
            gv_detail.SettingsText.Title = "";
            btn_add.Enabled = false;
            gv_master.Selection.UnselectAll();
            gv_group.Selection.UnselectAll();
        }

        protected void glu_group_no_Init(object sender, EventArgs e)
        {
            ezASPxGridLookup.Init(sender, e);
        }

        protected void gv_user_group_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            string str_where = "role_no = '" + Session["parm2"].ToString() + "' and user_no = '" + Session["parm1"].ToString() + "'";
            ezASPxGridView.CheckRequire(sender, e, "group_no", "group_name", false);
            ezASPxGridView.CheckDuplicate(sender, e, "group_no", sds_z_org_user_group, "group_name", str_where, false);
        }

        protected void gv_master_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            Session["parm4"] = e.Parameters.ToString();
            gv_master.DataBind();
        }
    }
}