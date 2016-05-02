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

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT mname FROM normalmembers WHERE mno = @mno AND mpassword = @mpassword";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@mno", txt_userid.Text);
            cmd.Parameters.AddWithValue("@mpassword", txt_password.Text);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                Session["UserNo"] = txt_userid.Text;
                Session["UserName"] = dr["mname"].ToString();

                dr.Close();
                conn.Close();
                Response.Redirect("home.aspx");
            }
            else
            {
                lbl_message.Text = "帳號或密碼錯誤!";
                txt_userid.Text = "";
                txt_password.Text = "";
            }
            dr.Close();
            conn.Close();
        }
    }
}