using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using WADataAccess.Interfaces;
using WAModel;

namespace WADataAccess
{
    public class ProfileData : IProfileData, IDisposable
    {
        private string _conexion;

        public ProfileData(string conexion)
        {
            _conexion = conexion;
        }

        public Profile GetProfile(string email)
        {

            Profile entidad = null;

            SqlConnection conn = new SqlConnection(_conexion);
            try
            {
                conn.Open();
                var cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                string sql = "";

                sql = "spGetUserPermissions";
                cmd.CommandText = sql;
                cmd.Connection = conn;
                //manejar llave primaria
                cmd.Parameters.AddWithValue("@email", email);
              
                SqlDataReader reader;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    entidad = new Profile();
                    entidad.Permissions = new List<Permission>();

                    while (reader.Read())
                    {
                        entidad.User = new User();
                        if (reader["IdUser"] != DBNull.Value)
                            entidad.User.id = reader["IdUser"].ToString();
                        if (reader["username"] != DBNull.Value)
                            entidad.User.username = reader["username"].ToString();
                        if (reader["display_name"] != DBNull.Value)
                            entidad.User.display_name = reader["display_name"].ToString();
                        if (reader["email"] != DBNull.Value)
                            entidad.User.email = reader["email"].ToString();
                        //if (reader["password"] != DBNull.Value)
                        //    entidad.Usuario.password = reader["password"].ToString();
                        if (reader["enabled"] != DBNull.Value)
                            entidad.User.enabled = Boolean.Parse(reader["enabled"].ToString());
                        if (reader["roleId"] != DBNull.Value)
                            entidad.User.roleId = reader["roleId"].ToString();

                        Permission perm = new Permission();
                       
                        if (reader["code"] != DBNull.Value)
                            perm.code = reader["code"].ToString();
                        if (reader["description"] != DBNull.Value)
                           perm.description = reader["description"].ToString();

                        entidad.Permissions.Add(perm);
                    }
                }

            }
            catch (Exception ex)
            {
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
