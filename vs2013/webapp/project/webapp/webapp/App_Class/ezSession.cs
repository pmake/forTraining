using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace ezapp
{
    /// <summary>
    /// Session 自定公用功能類別
    /// </summary>
    public static class ezSession
    {
        /// <summary>
        /// 初始化 Session 值
        /// </summary>
        public static void SessionInit()
        {
            //讀取 AppSettings 值
            object objAppName = WebConfigurationManager.AppSettings["AppName"];
            object objDebugMode = WebConfigurationManager.AppSettings["DebugMode"];
            object objLoginUrl = WebConfigurationManager.AppSettings["LoginUrl"];
            object objHomeUrl = WebConfigurationManager.AppSettings["HomeUrl"];
            object objConnName = WebConfigurationManager.AppSettings["ConnName"];
            object objLanguage = WebConfigurationManager.AppSettings["Language"];
            //設定預設值
            string strAppName = (objAppName == null || objAppName.ToString() == "") ? "資訊管理系統" : objAppName.ToString();
            string strDebugMode = (objDebugMode == null || objDebugMode.ToString() == "") ? "1" : objDebugMode.ToString();
            string strLoginUrl = (objLoginUrl == null || objLoginUrl.ToString() == "") ? "~/login.aspx" : objLoginUrl.ToString();
            string strHomeUrl = (objHomeUrl == null || objHomeUrl.ToString() == "") ? "~/home.aspx" : objHomeUrl.ToString();
            string strConnName = (objConnName == null || objConnName.ToString() == "") ? "dbconn" : objConnName.ToString();
            string strLanguage = (objLanguage == null || objLanguage.ToString() == "") ? "zh-TW" : objLanguage.ToString();
            ezEnum.YesNo enuDebugMode = ezEnum.YesNo.Yes;
            ezEnum.Language enuLanguage = ezEnum.Language.zh_TW;
            if (strDebugMode == "0") enuDebugMode = ezEnum.YesNo.No;
            if (strLanguage == "zh-TW") enuLanguage = ezEnum.Language.zh_TW;
            if (strLanguage == "zh-CN") enuLanguage = ezEnum.Language.zh_CN;
            if (strLanguage == "en-US") enuLanguage = ezEnum.Language.en_US;

            //設定 Session 變數
            AppName = strAppName;
            DebugMode = enuDebugMode;
            LoginUrl = strLoginUrl;
            HomeUrl = strHomeUrl;
            ConnName = strConnName;
            Language = enuLanguage;

            PrgNo = "";
            PrgName = "";
            UserNo = "";
            UserName = "";
            CompNo = "";
            CompName = "";
            ConnectionString = "";
            ProviderName = "";

            UserCode = ezEnum.UserCode.User;
            IsAdd = ezEnum.YesNo.Yes;
            IsEdit = ezEnum.YesNo.Yes;
            IsDelete = ezEnum.YesNo.Yes;
            IsConfirm = ezEnum.YesNo.Yes;
            IsAbolish = ezEnum.YesNo.Yes;
            IsPrice = ezEnum.YesNo.Yes;
            IsPrint = ezEnum.YesNo.Yes;
            IsDownload = ezEnum.YesNo.Yes;

            sparm1 = "";
            sparm2 = "";
            sparm3 = "";
            sparm4 = "";
            sparm5 = "";
            iparm1 = 0;
            iparm2 = 0;
            iparm3 = 0;
            iparm4 = 0;
            iparm5 = 0;
        }
        /// <summary>
        /// 取得 AppName 系統名稱
        /// </summary>
        public static string AppName {
            get { return (HttpContext.Current.Session["AppName"] == null) ? "資訊管理系統" : HttpContext.Current.Session["AppName"].ToString(); }
            set { HttpContext.Current.Session["AppName"] = value; }
        }
        /// <summary>
        /// 取得 LoginUrl 登入網頁名稱
        /// </summary>
        public static string LoginUrl
        {
            get { return (HttpContext.Current.Session["LoginUrl"] == null) ? "~/login.aspx" : HttpContext.Current.Session["LoginUrl"].ToString(); }
            set { HttpContext.Current.Session["LoginUrl"] = value; }
        }
        /// <summary>
        /// 取得 HomeUrl 首頁名稱
        /// </summary>
        public static string HomeUrl
        {
            get { return (HttpContext.Current.Session["HomeUrl"] == null) ? "~/home.aspx" : HttpContext.Current.Session["HomeUrl"].ToString(); }
            set { HttpContext.Current.Session["HomeUrl"] = value; }
        }
        /// <summary>
        /// 取得 UserNo 使用者代號
        /// </summary>
        public static string UserNo
        {
            get { return (HttpContext.Current.Session["UserNo"] == null) ? "" : HttpContext.Current.Session["UserNo"].ToString(); }
            set { HttpContext.Current.Session["UserNo"] = value; }
        }
        /// <summary>
        /// 存取 UserName 使用者名稱
        /// </summary>
        public static string UserName { 
            get { return (HttpContext.Current.Session["UserName"] == null) ? "" : HttpContext.Current.Session["UserName"].ToString(); }
            set { HttpContext.Current.Session["UserName"] = value; }
        }
        /// <summary>
        /// 取得 Language 使用者類別 (使用者/管理者)
        /// </summary>
        public static ezEnum.UserCode UserCode { 
            get { return (HttpContext.Current.Session["UserCode"] == null) ? ezEnum.UserCode.User : (ezEnum.UserCode)HttpContext.Current.Session["UserCode"]; }
            set { HttpContext.Current.Session["UserCode"] = value; }
        }
        /// <summary>
        /// 存取 CompNo 公司代號
        /// </summary>
        public static string CompNo
        {
            get { return (HttpContext.Current.Session["CompNo"] == null) ? "" : HttpContext.Current.Session["CompNo"].ToString(); }
            set { HttpContext.Current.Session["CompNo"] = value; }
        }
        /// <summary>
        /// 存取 CompName 公司名稱
        /// </summary>
        public static string CompName
        {
            get { return (HttpContext.Current.Session["CompName"] == null) ? "" : HttpContext.Current.Session["CompName"].ToString(); }
            set { HttpContext.Current.Session["CompName"] = value; }
        }
        /// <summary>
        /// 存取 ConnectionString 連線字串名稱
        /// </summary>
        public static string ConnectionString
        {
            get 
            {
                string str_string = (HttpContext.Current.Session["ConnectionString"] == null) ? "" : HttpContext.Current.Session["ConnectionString"].ToString();
                if (string.IsNullOrEmpty(str_string))
                {
                    str_string = WebConfigurationManager.ConnectionStrings[ConnName].ConnectionString;
                    HttpContext.Current.Session["ConnectionString"] = str_string;
                }
                return str_string; 
            }
            set { HttpContext.Current.Session["ConnectionString"] = value; }
        }
        /// <summary>
        /// 存取 ProviderName 連線資料庫提供者名稱
        /// </summary>
        public static string ProviderName
        {
            get 
            {
                string str_provider = (HttpContext.Current.Session["ProviderName"] == null) ? "" : HttpContext.Current.Session["ProviderName"].ToString();
                if (string.IsNullOrEmpty(str_provider))
                {
                    str_provider = WebConfigurationManager.ConnectionStrings[ConnName].ProviderName;
                    HttpContext.Current.Session["ProviderName"] = str_provider;
                }
                return str_provider; 
            }
            set { HttpContext.Current.Session["ProviderName"] = value; }
        }
        /// <summary>
        /// 存取 ConnName 資料庫連線名稱
        /// </summary>
        public static string ConnName
        {
            get { return (HttpContext.Current.Session["ConnName"] == null) ? "dbconn" : HttpContext.Current.Session["ConnName"].ToString(); }
            set 
            {
                string str_conn_name = value;
                HttpContext.Current.Session["ConnName"] = str_conn_name;
                ConnectionString = WebConfigurationManager.ConnectionStrings[str_conn_name].ConnectionString;
                ProviderName = WebConfigurationManager.ConnectionStrings[str_conn_name].ProviderName;
            }
        }
        /// <summary>
        /// 存取 PrgNo 程式代號
        /// </summary>
        public static string PrgNo { 
            get { return (HttpContext.Current.Session["PrgNo"] == null) ? "" : HttpContext.Current.Session["PrgNo"].ToString(); }
            set { HttpContext.Current.Session["PrgNo"] = value; }
        }
        /// <summary>
        /// 存取 PrgName 程式名稱
        /// </summary>
        public static string PrgName { 
            get { return (HttpContext.Current.Session["PrgName"] == null) ? "" : HttpContext.Current.Session["PrgName"].ToString(); }
            set { HttpContext.Current.Session["PrgName"] = value; }
        }
        /// <summary>
        /// 存取 Language 語系名稱
        /// </summary>
        public static ezEnum.Language Language { 
            get { return (HttpContext.Current.Session["Language"] == null) ? ezEnum.Language.zh_TW : (ezEnum.Language)HttpContext.Current.Session["Language"]; }
            set { HttpContext.Current.Session["Language"] = value; }
        }
        /// <summary>
        /// 存取 IsAdd 是否有新增權限
        /// </summary>
        public static ezEnum.YesNo IsAdd { 
            get { return (HttpContext.Current.Session["IsAdd"] == null) ? ezEnum.YesNo.Yes : (ezEnum.YesNo)HttpContext.Current.Session["IsAdd"]; }
            set { HttpContext.Current.Session["IsAdd"] = value; }
        }
        /// <summary>
        /// 存取 IsAdd 是否有修改權限
        /// </summary>
        public static ezEnum.YesNo IsEdit { 
            get { return (HttpContext.Current.Session["IsEdit"] == null) ? ezEnum.YesNo.Yes : (ezEnum.YesNo)HttpContext.Current.Session["IsEdit"]; }
            set { HttpContext.Current.Session["IsAdd"] = value; }
        }
        /// <summary>
        /// 取得 IsAdd 是否有刪除權限
        /// </summary>
        public static ezEnum.YesNo IsDelete { 
            get { return (HttpContext.Current.Session["IsDelete"] == null) ? ezEnum.YesNo.Yes : (ezEnum.YesNo)HttpContext.Current.Session["IsDelete"]; }
            set { HttpContext.Current.Session["IsDelete"] = value; }
        }
        /// <summary>
        /// 存取 IsConfirm 是否有審核權限
        /// </summary>
        public static ezEnum.YesNo IsConfirm { 
            get { return (HttpContext.Current.Session["IsConfirm"] == null) ? ezEnum.YesNo.Yes : (ezEnum.YesNo)HttpContext.Current.Session["IsConfirm"]; }
            set { HttpContext.Current.Session["IsConfirm"] = value; }
        }
        /// <summary>
        /// 存取 IsAbolish 是否有反確認權限
        /// </summary>
        public static ezEnum.YesNo IsAbolish {
            get { return (HttpContext.Current.Session["IsAbolish"] == null) ? ezEnum.YesNo.Yes : (ezEnum.YesNo)HttpContext.Current.Session["IsAbolish"]; }
            set { HttpContext.Current.Session["IsAbolish"] = value; }
        }
        /// <summary>
        /// 取得 IsPrice 是否有查詢單價權限
        /// </summary>
        public static ezEnum.YesNo IsPrice
        {
            get { return (HttpContext.Current.Session["IsPrice"] == null) ? ezEnum.YesNo.Yes : (ezEnum.YesNo)HttpContext.Current.Session["IsPrice"]; }
            set { HttpContext.Current.Session["IsPrice"] = value; }
        }
        /// <summary>
        /// 存取 IsPrint 是否有列印權限
        /// </summary>
        public static ezEnum.YesNo IsPrint
        {
            get { return (HttpContext.Current.Session["IsPrint"] == null) ? ezEnum.YesNo.Yes : (ezEnum.YesNo)HttpContext.Current.Session["IsPrint"]; }
            set { HttpContext.Current.Session["IsPrint"] = value; }
        }
        /// <summary>
        /// 存取 IsDownload 是否有下載權限
        /// </summary>
        public static ezEnum.YesNo IsDownload
        {
            get { return (HttpContext.Current.Session["IsDownload"] == null) ? ezEnum.YesNo.Yes : (ezEnum.YesNo)HttpContext.Current.Session["IsDownload"]; }
            set { HttpContext.Current.Session["IsDownload"] = value; }
        }
        /// <summary>
        /// 存取 sparm1 文字型參數1
        /// </summary>
        public static string sparm1
        {
            get { return (HttpContext.Current.Session["sparm1"] == null) ? "" : HttpContext.Current.Session["sparm1"].ToString(); }
            set { HttpContext.Current.Session["sparm1"] = value; }
        }
        /// <summary>
        /// 存取 sparm2 文字型參數2
        /// </summary>
        public static string sparm2
        {
            get { return (HttpContext.Current.Session["sparm2"] == null) ? "" : HttpContext.Current.Session["sparm2"].ToString(); }
            set { HttpContext.Current.Session["sparm2"] = value; }
        }
        /// <summary>
        /// 存取 sparm3 文字型參數3
        /// </summary>
        public static string sparm3
        {
            get { return (HttpContext.Current.Session["sparm3"] == null) ? "" : HttpContext.Current.Session["sparm3"].ToString(); }
            set { HttpContext.Current.Session["sparm3"] = value; }
        }
        /// <summary>
        /// 存取 sparm4 文字型參數4
        /// </summary>
        public static string sparm4
        {
            get { return (HttpContext.Current.Session["sparm4"] == null) ? "" : HttpContext.Current.Session["sparm4"].ToString(); }
            set { HttpContext.Current.Session["sparm4"] = value; }
        }
        /// <summary>
        /// 存取 sparm5 文字型參數5
        /// </summary>
        public static string sparm5
        {
            get { return (HttpContext.Current.Session["sparm5"] == null) ? "" : HttpContext.Current.Session["sparm5"].ToString(); }
            set { HttpContext.Current.Session["sparm5"] = value; }
        }
        /// <summary>
        /// 存取 iparm1 數字型參數1
        /// </summary>
        public static int iparm1
        {
            get { return (HttpContext.Current.Session["iparm1"] == null || string.IsNullOrEmpty(HttpContext.Current.Session["iparm1"].ToString())) ? 0 : int.Parse(HttpContext.Current.Session["iparm1"].ToString()); }
            set { HttpContext.Current.Session["iparm1"] = value; }
        }
        /// <summary>
        /// 存取 iparm2 數字型參數2
        /// </summary>
        public static int iparm2
        {
            get { return (HttpContext.Current.Session["iparm2"] == null || string.IsNullOrEmpty(HttpContext.Current.Session["iparm2"].ToString())) ? 0 : int.Parse(HttpContext.Current.Session["iparm2"].ToString()); }
            set { HttpContext.Current.Session["iparm2"] = value; }
        }
        /// <summary>
        /// 存取 iparm3 數字型參數3
        /// </summary>
        public static int iparm3
        {
            get { return (HttpContext.Current.Session["iparm3"] == null || string.IsNullOrEmpty(HttpContext.Current.Session["iparm3"].ToString())) ? 0 : int.Parse(HttpContext.Current.Session["iparm3"].ToString()); }
            set { HttpContext.Current.Session["iparm3"] = value; }
        }
        /// <summary>
        /// 存取 iparm4 數字型參數4
        /// </summary>
        public static int iparm4
        {
            get { return (HttpContext.Current.Session["iparm4"] == null || string.IsNullOrEmpty(HttpContext.Current.Session["iparm4"].ToString())) ? 0 : int.Parse(HttpContext.Current.Session["iparm4"].ToString()); }
            set { HttpContext.Current.Session["iparm4"] = value; }
        }
        /// <summary>
        /// 存取 iparm5 數字型參數5
        /// </summary>
        public static int iparm5
        {
            get { return (HttpContext.Current.Session["iparm5"] == null || string.IsNullOrEmpty(HttpContext.Current.Session["iparm5"].ToString())) ? 0 : int.Parse(HttpContext.Current.Session["iparm5"].ToString()); }
            set { HttpContext.Current.Session["iparm5"] = value; }
        }
        /// <summary>
        /// 取得 DebugMode 是否為除錯模式
        /// </summary>
        public static ezEnum.YesNo DebugMode 
        {
            get { return (HttpContext.Current.Session["DebugMode"] == null || string.IsNullOrEmpty(HttpContext.Current.Session["DebugMode"].ToString())) ? ezEnum.YesNo.Yes : (HttpContext.Current.Session["DebugMode"].ToString() == "0") ? ezEnum.YesNo.No : ezEnum.YesNo.Yes; }
            set { HttpContext.Current.Session["DebugMode"] = (value == ezEnum.YesNo.No) ? "0" : "1"; }
        }
    }
}