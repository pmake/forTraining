using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace ezapp
{
    /// <summary>
    /// 自定公用功能類別
    /// </summary>
    public static class ezUtility
    {
        /// <summary>
        /// 取得指定網址中的檔名部份
        /// </summary>
        /// <param name="s_Url">指定網址</param>
        /// <returns></returns>
        public static string GetUrlPageName(string sUrl)
        {
            string str_url = sUrl;
            string str_page = sUrl;
            int int_index = str_url.LastIndexOf('/');
            if (int_index >= 0) str_page = str_page.Substring((int_index + 1), (str_url.Length - 1) - int_index);
            return str_page;
        }
        /// <summary>
        /// 以程式代號查程式網址
        /// </summary>
        /// <param name="sPrgNo">程式代號</param>
        /// <returns></returns>
        public static string GetPrgUrlByPNo(string sPrgNo)
        {
            string str_url = "";
            ezSqlServer ezsql = new ezSqlServer();
            ezsql.CommandText = "SELECT url_prg FROM z_sys_prg WHERE no_prg = @no_prg";
            ezsql.ParametersAdd("@no_prg", sPrgNo, true);
            str_url = ezsql.GetValueString("url_prg");
            if (string.IsNullOrEmpty(str_url)) str_url = "";
            if (!string.IsNullOrEmpty(str_url))
            {
                if (str_url.Substring(0, 4).ToLower() != "http")
                    str_url = "~/Forms/" + sPrgNo.Substring(0, 3).ToLower() + "/" + str_url;
                if (str_url.IndexOf('.') < 0) str_url += ".aspx";
            }
            return str_url;
        }
        /// <summary>
        /// 以程式代號查程式名稱
        /// </summary>
        /// <param name="sPrgNo">程式代號</param>
        /// <returns></returns>
        public static string GetPrgNameByPNo(string sPrgNo)
        {
            string str_name = "";
            ezSqlServer ezsql = new ezSqlServer();
            ezsql.CommandText = "SELECT name_prg FROM z_sys_prg WHERE no_prg = @no_prg";
            ezsql.ParametersAdd("@no_prg", sPrgNo, true);
            str_name = ezsql.GetValueString("name_prg");
            if (string.IsNullOrEmpty(str_name)) str_name = "";
            return str_name;
        }
        /// <summary>
        /// 返回登入頁
        /// </summary>
        public static void RedirectToLoginUrl()
        {
            HttpContext.Current.Response.Redirect(ezSession.LoginUrl);
            HttpContext.Current.Response.End();
        }
        /// <summary>
        /// 返回首頁
        /// </summary>
        public static void RedirectToHomeUrl()
        {
            HttpContext.Current.Response.Redirect(ezSession.HomeUrl);
            HttpContext.Current.Response.End();
        }
        /// <summary>
        /// 取得登入者的資訊(登入帳號及名稱)
        /// </summary>
        /// <returns></returns>
        public static string GetLoginUserInfo()
        {
            return ezSession.UserNo + " (" + ezSession.UserName + ")";
        }
    }
}