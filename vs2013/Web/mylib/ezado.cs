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
    class dbReader
    {
        public void connecting (string connectionstring)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn.Open();

        }
    }
}
