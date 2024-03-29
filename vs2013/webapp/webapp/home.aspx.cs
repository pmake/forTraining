﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;
using System.Web.Security;
using System.Data;
using DevExpress.Web;

namespace webapp
{
    public partial class home : ezPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) SetPageLoad();
        }

        private void SetPageLoad()
        {
            //設定系統名稱
            lbl_app_name.Text = ezSession.AppName;
            //設定登入使用者資訊
            lbl_user.Text = ezUtility.GetLoginUserInfo();
            //後台的頁首選項設定
            SetBannerButton();
            //載入選單
            SetGroup();
        }

        protected void imb_logout_Click(object sender, ImageClickEventArgs e)
        {
            //登出(返回登入頁),設定在 Configs/appSettings.config 中
            ezUtility.RedirectToLoginUrl();
        }

        private void SetBannerButton()
        {
            //後台不需顯示上方的[返回首頁]/[變更密碼]/[行事曆]功能
            if (ezSession.UserCode == ezEnum.UserCode.Admin)
            {
                imb_home.Visible = false;
                imb_password.Visible = false;
                imb_scheduler.Visible = false;
            }
        }

        private void SetGroup()
        {
            string str_group_name = "";
            string str_module_no = "";
            string str_module_name = "";
            NavBarGroup group;

            sds_z_sys_module.SelectParameters["code_module"].DefaultValue = (ezSession.UserCode == ezEnum.UserCode.Admin) ? "B" : "F";
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
                                str_ImageUrl = @"~/Images/Icons/Null24.png";
                                if (str_prg_no.Substring(3, 1).ToUpper() == "P") str_ImageUrl = @"~/Images/Icons/Program24.png";
                                if (str_prg_no.Substring(3, 1).ToUpper() == "G") str_ImageUrl = @"~/Images/Icons/Graph24.png";
                                if (str_prg_no.Substring(3, 1).ToUpper() == "Q") str_ImageUrl = @"~/Images/Icons/Query24.png";
                                if (str_prg_no.Substring(3, 1).ToUpper() == "R") str_ImageUrl = @"~/Images/Icons/Report24.png";
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

        protected void imb_password_Click(object sender, ImageClickEventArgs e)
        {
            txt_password1.Text = "";
            txt_password2.Text = "";
            puc_password.ShowOnPageLoad = true;
        }

        protected void puc_password_Init(object sender, EventArgs e)
        {
            ezASPxPopupControl.Init(sender, e);
        }

        protected void btn_password_confirm_Click(object sender, EventArgs e)
        {
            CheckPassword();
        }

        protected void btn_password_cancel_Click(object sender, EventArgs e)
        {
            puc_password.ShowOnPageLoad = false;
        }

        private bool CheckPassword()
        {
            if (string.IsNullOrEmpty(txt_password1.Text)) { lbl_password_message.Text = "新的密碼不可空白!!"; return false; }
            if (string.IsNullOrEmpty(txt_password2.Text)) { lbl_password_message.Text = "確認密碼不可空白!!"; return false; }
            if (txt_password1.Text != txt_password2.Text) { lbl_password_message.Text = "確認密碼輸入不正確!!"; return false; }

            string str_user_no = ezSession.UserNo;
            string str_user_pass = txt_password1.Text;
            ezSqlServer ezsql = new ezSqlServer();
            ezsql.CommandText = "UPDATE z_org_user SET pass_user = @pass_user WHERE no_user = @no_user";
            ezsql.ParametersAdd("@pass_user", str_user_pass, true);
            ezsql.ParametersAdd("@no_user", str_user_no, false);
            ezsql.ExecuteNonQuery(true);

            lbl_password_message.Text = "您的密碼已變更!!";
            return true;
        }

        protected void imb_scheduler_Click(object sender, ImageClickEventArgs e)
        {
            OpenPrg("APPP001", "行事曆管理", @"~\Forms\app\appp001_scheduler.aspx");
        }

        private void OpenPrg(string sPrgNo , string sPrgName , string sPrgUrl)
        {
            ezSession.PrgNo = sPrgNo;
            ezSession.PrgName = sPrgName;
            ASPxSplitter1.Panes[1].Panes[1].ContentUrl = sPrgUrl;
        }
        private void OpenPrg(string sPrgUrl)
        {
            ASPxSplitter1.Panes[1].Panes[1].ContentUrl = sPrgUrl;
        }
    }
}