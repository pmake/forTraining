using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;
using System.Web.Security;

namespace webmall.forms.app
{
    public partial class login : ezPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //進入登入頁就執行 Session 變數初始化
                ezSession.SessionInit();

                //設定登入者公司資訊訊
                SetCompany();
            }
        }

        private void SetCompany()
        {
            //系統管理者與會員無輸入公司問題 , 使用者,客戶,廠商需輸入公司代號
            if (ezSession.LoginRole == ezEnum.LoginRole.Admin) ezSession.CompCode = ezEnum.CompCode.None;
            if (ezSession.LoginRole == ezEnum.LoginRole.Member) ezSession.CompCode = ezEnum.CompCode.None;
            if (ezSession.LoginRole == ezEnum.LoginRole.User) ezSession.CompCode = ezEnum.CompCode.Company;
            if (ezSession.LoginRole == ezEnum.LoginRole.Customer) ezSession.CompCode = ezEnum.CompCode.Customer;
            if (ezSession.LoginRole == ezEnum.LoginRole.Vendor) ezSession.CompCode = ezEnum.CompCode.Vendor;
            if (ezSession.CompCode == ezEnum.CompCode.None)
            {
                //不需要顯示登入公司
                lbl_comp_no.Visible = false;
                cbb_comp_no.Visible = false;
                cbb_comp_no.Value = "xxx";
                cbb_comp_no.Text = "xxx";
                rfv_comp_no_cbb.Visible = false;
                txt_comp_no.Visible = false;
                txt_comp_no.Text = "xxx";
                rfv_comp_no_txt.Visible = false;
            }
            else
            {
                lbl_comp_no.Visible = true;
                //需要登入公司,使用者用下拉公司, 客戶與廠商輸入公司代號
                if (ezSession.LoginRole == ezEnum.LoginRole.User)
                {
                    //顯示
                    cbb_comp_no.Visible = true;
                    cbb_comp_no.Value = "";
                    cbb_comp_no.Text = "";
                    rfv_comp_no_cbb.Visible = true;
                    //不顯示
                    txt_comp_no.Visible = false;
                    txt_comp_no.Text = "xxx";
                    rfv_comp_no_txt.Visible = false;
                }
                else
                {
                    //顯示
                    txt_comp_no.Visible = true;
                    txt_comp_no.Text = "";
                    rfv_comp_no_txt.Visible = true;
                    //不顯示
                    cbb_comp_no.Visible = false;
                    cbb_comp_no.Value = "xxx";
                    cbb_comp_no.Text = "xxx";
                    rfv_comp_no_cbb.Visible = false;
                }
            }
        }

        protected void rpl_master_Init(object sender, EventArgs e)
        {
            ezASPxRoundPanel.Init(sender, e, false);
            //設定登入頁的系統名稱
            rpl_master.HeaderText = ezSession.AppName;
            if (ezSession.LoginRole == ezEnum.LoginRole.Admin) rpl_master.HeaderText += "(管理者登入)";
            if (ezSession.LoginRole == ezEnum.LoginRole.User) rpl_master.HeaderText += "(使用者登入)";
            if (ezSession.LoginRole == ezEnum.LoginRole.Member) rpl_master.HeaderText += "(會員登入)";
            if (ezSession.LoginRole == ezEnum.LoginRole.Customer) rpl_master.HeaderText += "(客戶登入)";
            if (ezSession.LoginRole == ezEnum.LoginRole.Vendor) rpl_master.HeaderText += "(廠商登入)";
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            //檢查驗驗碼是否正確
            if (cpc_code.IsValid)
            {
                //檢查使用者帳密是否正確
                if (CheckUser())
                {
                    //導向首頁
                    ezUtility.RedirectToAdminUrl();
                }
                else
                    ShowMsgBox("帳號或密碼錯誤!!");
            }
        }

        private bool CheckUser()
        {
            //傳回值變數
            bool bln_hasrow = false;
            string str_comp_code = Session["CompCode"].ToString();
            string str_comp_no = (ezSession.LoginRole == ezEnum.LoginRole.User) ? cbb_comp_no.Value.ToString() : txt_comp_no.Text;

            //使用 ezSqlServer ADO.Net 函數類別
            ezSqlServer ezsql = new ezSqlServer();
            //設定 SQL 語法
            if (ezSession.LoginRole == ezEnum.LoginRole.Admin)
            { ezsql.CommandText = "SELECT name_admin as login_name FROM z_sys_admin WHERE no_admin = @login_no AND pass_admin = @login_pass AND isenabled = @issecurity"; }
            else if (ezSession.LoginRole == ezEnum.LoginRole.Member)
            { ezsql.CommandText = "SELECT name_member as login_name FROM z_sys_member WHERE no_member = @login_no AND pass_member = @login_pass AND isenabled = @issecurity"; }
            else
            {
                ezsql.CommandText = "SELECT name_user as login_name , role_no FROM z_org_user WHERE ";
                ezsql.CommandText += "no_user = @login_no AND pass_user = @login_pass AND ";
                ezsql.CommandText += "issecurity = @issecurity AND ";
                ezsql.CommandText += "comp_code = @comp_code AND comp_no = @comp_no";
            }
            //加入參數
            ezsql.ParametersAdd("@login_no", txt_user_no.Text, true);
            ezsql.ParametersAdd("@login_pass", txt_password.Text, false);
            ezsql.ParametersAdd("@issecurity", 1, false);

            if (ezSession.LoginRole != ezEnum.LoginRole.Admin && ezSession.LoginRole != ezEnum.LoginRole.Member)
            {
                ezsql.ParametersAdd("@comp_code", str_comp_code, false);
                ezsql.ParametersAdd("@comp_no", str_comp_no , false);
            }
                
            //判斷是否有記錄
            bln_hasrow = ezsql.HasRows;
            //有記錄表示登入正確
            if (bln_hasrow)
            {
                //設定 Session UserNo 使用者代號
                ezSession.UserNo = txt_user_no.Text;
                //設定 Session UserName 使用者名稱
                ezSession.UserName = ezsql.GetValueString("login_name");
                //設定 Session RoleNo 使用者類別 
                if (ezSession.LoginRole != ezEnum.LoginRole.Admin && ezSession.LoginRole != ezEnum.LoginRole.Member)
                    ezSession.RoleNo = ezsql.GetValueString("role_no");
                else if (ezSession.LoginRole == ezEnum.LoginRole.Admin)
                    ezSession.RoleNo = "admin";
                else if (ezSession.LoginRole == ezEnum.LoginRole.Member)
                    ezSession.RoleNo = "member";
                else
                    ezSession.RoleNo = "none";
            }
            //關閉 ezSqlServer ADO.Net 函數類別
            ezsql.Close();
            //回傳是否登入正確
            return bln_hasrow;
        }
    }
}