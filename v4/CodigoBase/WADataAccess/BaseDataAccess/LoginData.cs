using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using WADataAccess.Interfaces;
using WAModel;

namespace WADataAccess
{
    public class LoginData : ILoginData, IDisposable
    {
        private string _conexion;

        public LoginData(string conexion)
        {
            _conexion = conexion;
        }
             
        public User ValidateUser(string email, string pwd)
        {
          
            User entidad = null;
            
            SqlConnection conn = new SqlConnection(_conexion);
            try
            {
                conn.Open();
                var cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                string sql = "";

                sql = "spValidateUser";
                cmd.CommandText = sql;
                cmd.Connection = conn;
                //manejar llave primaria
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@pwd", pwd);
                SqlDataReader reader;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    entidad = new User();
                    while (reader.Read())
                    {

                        if (reader["IdUser"] != DBNull.Value)
                            entidad.id = reader["IdUser"].ToString();
                        if (reader["username"] != DBNull.Value)
                            entidad.username = reader["username"].ToString();
                        if (reader["display_name"] != DBNull.Value)
                            entidad.display_name = reader["display_name"].ToString();
                        if (reader["email"] != DBNull.Value)
                            entidad.email = reader["email"].ToString();
                        if (reader["password"] != DBNull.Value)
                            entidad.password = reader["password"].ToString();
                        if (reader["enabled"] != DBNull.Value)
                            entidad.enabled = Boolean.Parse(reader["enabled"].ToString());
                        if (reader["roleId"] != DBNull.Value)
                            entidad.roleId = reader["roleId"].ToString();

                        entidad.Role = new Role();
                        if (reader["IdRol"] != DBNull.Value)
                            entidad.Role.id = reader["IdRol"].ToString();
                        if (reader["name"] != DBNull.Value)
                            entidad.Role.name = reader["name"].ToString();
                        if (reader["rol_enabled"] != DBNull.Value)
                            entidad.Role.enabled = Boolean.Parse(reader["rol_enabled"].ToString());


                    }
                }

            }
            catch (Exception ex)
            {
                string logError = ex.Message;
                entidad = null;
                //res.Exito = false;
                //res.Message = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            return entidad;
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
