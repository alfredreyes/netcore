using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using WAModel.BaseModel;

namespace WADataAccess.BaseDataAccess
{
    public class AccessHelperData : IAccessHelperData, IDisposable
    {
        private string _conexion;

        public AccessHelperData(string conexion)
        {
            _conexion = conexion;
        }
        public Result ValidatePermission(string email, string permission)
        {
         

            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            try
            {
                conn.Open();
                var cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                string sql = "";

                sql = "spValidatePermission";
                cmd.CommandText = sql;
                cmd.Connection = conn;
                //manejar llave primaria
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@permission", permission);
                SqlDataReader reader;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        //if (reader["code"] != DBNull.Value)
                        //     res.Exito = Boolean.Parse(reader["result"].ToString());
                        res.Exito = true;     

                    }
                }

            }
            catch (Exception ex)
            {
                res.Exito = false;
                res.Message = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            return res;
        }
        //Dispose Methods
        private bool disposed = false;
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposed)
                return;
            this.disposed = true;
        }
    }
}
