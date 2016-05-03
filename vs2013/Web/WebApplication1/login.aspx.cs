using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//database
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using mylib;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            userVerifier userChecker = new userVerifier();
            userChecker.dbConnect("dbconn");
            string dataReturn = userChecker.userDataCompare("mname",txt_userid.Text,txt_password.Text);
            if (dataReturn != "")
            {
                Session["UserNo"] = txt_userid.Text;
                Session["UserName"] = dataReturn;
                Response.Redirect("home.aspx");
            }
            else
            {
                lbl_message.Text = "帳號或密碼錯誤!";
                txt_userid.Text = "";
                txt_password.Text = "";
            }
        }
    }
}