using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace mylib
{
    /// <summary>
    /// 使用者驗證類別
    /// </summary>
    public class userVerifier
    {
        private SqlConnection conn = new SqlConnection();
        /// <summary>
        /// 連線至指定資料庫方法
        /// </summary>
        /// <param name="connNameInConfig"></param>
        public void dbConnect (string connNameInConfig)
        {
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connNameInConfig].ConnectionString;
            conn.Open();
        }
        /// <summary>
        /// 比對帳號密碼並傳回指定欄位資料方法
        /// </summary>
        /// <param name="dataReturn"></param>
        /// <param name="userName"></param>
        /// <param name="userPassword"></param>
        /// <returns></returns>
        public string userDataCompare(string dataReturn, object userName, object userPassword)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT mname FROM employee WHERE mno = @mno AND mpassword = @mpassword";
            cmd.Parameters.Clear();
            //cmd.Parameters.AddWithValue("@mname",dataReturn);欄位名稱不能用文字代入，待解
            cmd.Parameters.AddWithValue("@mno", userName);
            cmd.Parameters.AddWithValue("@mpassword",userPassword);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                string temp = (dr[dataReturn] == null) ? "" : dr[dataReturn].ToString();
                dr.Close();
                conn.Close();
                return temp;
            }
            else
            {
                dr.Close();
                conn.Close();
                return "";
            }
        }
    }
}