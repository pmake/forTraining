﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ezapp
{
    /// <summary>
    /// SqlDataSource 自定公用功能類別
    /// </summary>
    public class ezSqlDataSource
    {
        public static void Init(object sender, EventArgs e)
        {
            (sender as SqlDataSource).ConnectionString = ezSession.ConnectionString;
            (sender as SqlDataSource).ProviderName = ezSession.ProviderName;
        }
        /// <summary>
        /// 從 Insert Query 中取得 Table Name
        /// </summary>
        /// <param name="sender">SqlDataSource Object</param>
        /// <returns></returns>
        public static string GetTableNameFromInsertQuery(object sender)
        {
            string str_insert = (sender as SqlDataSource).InsertCommand.ToString();
            return GetTableNameFromInsertQuery(str_insert);
        }

        /// <summary>
        /// 從 Insert Query 中取得 Table Name
        /// </summary>
        /// <param name="sInsertQuery">SqlDataSource InsertCommand</param>
        /// <returns></returns>
        public static string GetTableNameFromInsertQuery(string sInsertQuery)
        {
            int int_index = 0;
            string str_table_name = "";
            sInsertQuery = sInsertQuery.ToLower();
            int_index = sInsertQuery.IndexOf("insert into") + 11;
            sInsertQuery = sInsertQuery.Substring(int_index, sInsertQuery.Length - int_index).Trim();
            int_index = sInsertQuery.IndexOf('(');
            str_table_name = sInsertQuery.Substring(0, int_index);
            return str_table_name;
        }
    }
}