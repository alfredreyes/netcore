using System;
using System.Collections.Generic;
using System.Text;

namespace WADataAccess.BaseDataAccess
{
   public class DBConnection
    {
        public static string GetConnection()
        {
            var conn = System.Configuration.ConfigurationManager.AppSettings["DefaultConnection"];
            var conn2 = System.Configuration.ConfigurationManager.AppSettings["Data:DefaultConnection:ConnectionString"];
            return conn;
        }
    }
}
