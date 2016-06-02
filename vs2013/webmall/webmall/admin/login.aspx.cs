using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;
using System.Web.Security;

namespace webmall.admin
{
    public partial class login : ezPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //進入登入頁就執行 Session 變數初始化
                ezSession.SessionInit();
            }
        }

        protected void rpl_master_Init(object sender, EventArgs e)
        {
            ezASPxRoundPanel.Init(sender, e, false);
            //設定登入頁的系統名稱
            rpl_master.HeaderText = ezSession.AppName;
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
                    ezUtility.RedirectToHomeUrl();
                }
                else
                    ShowMsgBox("帳號或密碼錯誤!!");
            }
        }

        private bool CheckUser()
        {
            //傳回值變數
            bool bln_hasrow = false;
            //使用 ezSqlServer ADO.Net 函數類別
            ezSqlServer ezsql = new ezSqlServer();
            //設定 SQL 語法
            ezsql.CommandText = "SELECT name_user , role_no FROM z_org_user WHERE no_user = @no_user AND pass_user = @pass_user AND issecurity = @issecurity";
            //加入參數
            ezsql.ParametersAdd("@no_user", txt_user_no.Text, true);
            ezsql.ParametersAdd("@pass_user", txt_password.Text, false);
            ezsql.ParametersAdd("@issecurity", 1, false);
            //判斷是否有記錄
            bln_hasrow = ezsql.HasRows;
            //有記錄表示登入正確
            if (bln_hasrow)
            {
                //設定 Session UserNo 使用者代號
                ezSession.UserNo = txt_user_no.Text;
                //設定 Session UserName 使用者名稱
                ezSession.UserName = ezsql.GetValueString("name_user");
                //設定 Session RoleNo 使用者類別 
                ezSession.RoleNo = ezsql.GetValueString("role_no");
            }
            //關閉 ezSqlServer ADO.Net 函數類別
            ezsql.Close();
            //回傳是否登入正確
            return bln_hasrow;
        }
    }
}