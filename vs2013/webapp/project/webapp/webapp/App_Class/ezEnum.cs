using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ezapp
{
    /// <summary>
    /// 自定義枚舉類型
    /// </summary>
    public class ezEnum
    {
        /// <summary>
        /// 使用者類別
        /// </summary>
        public enum UserCode
        {
            /// <summary>
            /// 使用者
            /// </summary>
            User = 0,
            /// <summary>
            /// 管理者
            /// </summary>
            Admin = 1
        }
        /// <summary>
        /// 是或否
        /// </summary>
        public enum YesNo
        {
            /// <summary>
            /// 是
            /// </summary>
            Yes = 1,
            /// <summary>
            /// 否
            /// </summary>
            No = 0
        }
        /// <summary>
        /// 系統語系
        /// </summary>
        public enum Language
        {
            /// <summary>
            /// 繁體中文
            /// </summary>
            zh_TW = 0,
            /// <summary>
            /// 簡體中文
            /// </summary>
            zh_CN = 1,
            /// <summary>
            /// 英文
            /// </summary>
            en_US = 2
        }
        /// <summary>
        /// AppSetting Key 值
        /// </summary>
        public enum AppKey
        {
            AppName = 0,
            DebugMode = 1,
            LoginUrl = 2,
            HomeUrl = 3,
            ConnName = 4,
            Language = 6
        }
    }
}