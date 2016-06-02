using DevExpress.Web;
using ezapp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webmall
{
    public partial class manager : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) SetPageLoad();
        }
        private void SetPageLoad()
        {
            //設定登入使用者資訊
            lbl_user.Text = ezUtility.GetLoginUserInfo();
            //載入選單
            SetGroup();
        }

        protected void imb_logout_Click(object sender, ImageClickEventArgs e)
        {
            //登出(返回登入頁),設定在 Configs/appSettings.config 中
            ezUtility.RedirectToLoginUrl();
        }

        private void SetGroup()
        {
            string str_group_name = "";
            string str_module_no = "";
            string str_module_name = "";
            NavBarGroup group;

            DataTable dt_group = new DataTable();
            dt_group = GetDataTable(sds_z_sys_module);

            if (dt_group != null)
            {
                if (dt_group.Rows.Count > 0)
                {
                    for (int i = 0; i < dt_group.Rows.Count; i++)
                    {
                        str_module_no = dt_group.Rows[i]["no_module"].ToString();
                        str_module_name = dt_group.Rows[i]["name_module"].ToString();
                        str_group_name = str_module_no + "." + str_module_name;

                        group = new NavBarGroup(str_group_name, str_module_no);
                        SetGroupItem(ref group, str_module_no);
                        if (group.Items.Count > 0) nvb_prg.Groups.Add(group);
                    }
                }
            }
        }

        private void SetGroupItem(ref NavBarGroup group, string module_no)
        {
            string str_item_name = "";
            string str_prg_no = "";
            string str_prg_name = "";
            string str_ImageUrl = "";
            NavBarItem item;
            sds_z_sys_prg.SelectParameters["module_no"].DefaultValue = module_no;
            DataTable dt_item = new DataTable();
            dt_item = GetDataTable(sds_z_sys_prg);

            if (dt_item != null)
            {
                if (dt_item.Rows.Count > 0)
                {
                    for (int i = 0; i < dt_item.Rows.Count; i++)
                    {
                        str_prg_no = dt_item.Rows[i]["no_prg"].ToString();
                        //檢查程式是否有權限
                        if (CheckSecurity(str_prg_no))
                        {
                            str_prg_name = dt_item.Rows[i]["name_prg"].ToString();
                            str_item_name = str_prg_no + "." + str_prg_name;

                            if (ezSession.PrgIcon == ezEnum.YesNo.Yes)
                            {
                                string str_code = str_prg_no.Substring(3, 1);
                                str_ImageUrl = ezUtility.GetIconFile(str_code);
                                item = new NavBarItem(str_item_name, str_prg_no, str_ImageUrl);
                            }
                            else
                                item = new NavBarItem(str_item_name, str_prg_no);
                            group.Items.Add(item);
                        }
                    }
                }
            }
        }

        private bool CheckSecurity(string sPrgNo)
        {
            bool bln_checked = true;
            //除錯模式不檢查程式權限
            if (ezSession.DebugMode == ezEnum.YesNo.Yes) return bln_checked;

            //公用的程式不檢查程式權限
            int int_ispublic = 0;
            ezSqlServer ezsql = new ezSqlServer();
            ezsql.CommandText = "SELECT ispublic FROM z_sys_prg WHERE no_prg = @no_prg";
            ezsql.ParametersAdd("@no_prg", sPrgNo, true);
            int_ispublic = ezsql.GetValueInt("ispublic");
            ezsql.Close();
            if (int_ispublic == 1) return bln_checked;

            //檢查程式權限
            string str_user_no = ezSession.UserNo;
            ezsql.CommandText = "SELECT rowid FROM z_sys_security WHERE user_no = @user_no AND prg_no = @prg_no";
            ezsql.ParametersAdd("@prg_no", sPrgNo, true);
            ezsql.ParametersAdd("@user_no", str_user_no, false);
            if (!ezsql.HasRows) bln_checked = false;
            ezsql.Close();
            return bln_checked;
        }

        /// <summary>
        /// 取得資料記錄集
        /// </summary>
        /// <returns></returns>
        private DataTable GetDataTable(SqlDataSource sdsSource)
        {
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            DataView view = (DataView)sdsSource.Select(args);
            DataTable dt = view.ToTable();
            return dt;
        }

        protected void nvb_prg_ItemClick(object source, NavBarItemEventArgs e)
        {
            ezSession.PrgNo = e.Item.Name;
            ezSession.PrgName = ezUtility.GetPrgNameByPNo(e.Item.Name);
            string str_url = ezUtility.GetPrgUrlByPNo(e.Item.Name);
            if (!string.IsNullOrEmpty(str_url)) OpenPrg(str_url);
        }

        private void OpenPrg(string sPrgNo, string sPrgName, string sPrgUrl)
        {
            ezSession.PrgNo = sPrgNo;
            ezSession.PrgName = sPrgName;
            Response.Redirect(sPrgUrl);
            Response.End();
        }
        private void OpenPrg(string sPrgUrl)
        {
            Response.Redirect(sPrgUrl);
            Response.End();
        }

        protected void nvb_prg_ItemClick1(object source, NavBarItemEventArgs e)
        {
            ezSession.PrgNo = e.Item.Name;
            ezSession.PrgName = ezUtility.GetPrgNameByPNo(e.Item.Name);
            string str_url = ezUtility.GetPrgUrlByPNo(e.Item.Name);
            if (!string.IsNullOrEmpty(str_url)) OpenPrg(str_url);
        }

        protected void imb_tree_Click(object sender, ImageClickEventArgs e)
        {
            pnl_prg.Visible = !pnl_prg.Visible;
        }
    }
}