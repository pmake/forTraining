﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;

namespace webmall.user
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session 變數初始化
            ezSession.SessionInit();

            //設定角色
            ezSession.LoginRole = ezEnum.LoginRole.User;

            //導向登入頁,設定在 Configs/appSettings.config 中
            ezUtility.RedirectToLoginUrl();
        }
    }
}