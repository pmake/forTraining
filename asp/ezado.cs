using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ezlib
{
    public class ezado
    {
        public SqlConnection conn { get; set; }
        public SqlCommand cmd { get; set; }
        public string ConnName { get; set; }
        public string CommandText {
            get 
            {
                return cmd.CommandText;
            }
            set
            {
                cmd.CommandText = value;
            }
        }

        public ezado()
        {
            ConnName = "dbconn";
            Open();
        }
        public ezado(string sConnName)
        {
            ConnName = sConnName;
            Open();
        }

        private void Open()
        {
            conn = new SqlConnection();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings[ConnName].ConnectionString;
            conn.Open();
            cmd = new SqlCommand();
            cmd.Connection = conn;
        }

        public void Close()
        {
            conn.Close();
        }

        public void ParametersAddWithValue(string sParmName , object oValue , bool bClear)
        {
            if (bClear) cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue(sParmName, oValue);
        }

        public bool HasRow()
        {
            bool bln_hasrow = false;
            SqlDataReader dr = cmd.ExecuteReader();
            bln_hasrow = dr.HasRows;
            dr.Close();
            return bln_hasrow;
        }

        public string GetSelectValue(string sColName)
        {
            string str_value = "";

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                str_value = (dr[sColName] == null) ? "" : dr[sColName].ToString();
            }
            dr.Close();

            return str_value;
        }

    }
}
