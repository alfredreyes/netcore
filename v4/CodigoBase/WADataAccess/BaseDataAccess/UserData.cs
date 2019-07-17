//Fecha Creación:12/11/2018 02:48:01 p.m. Template DataClass, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using WADataAccess.Interfaces;
using WADataAccess.BaseDataAccess;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess
{
    public class UserData : IUserData, IDisposable
    {
        private string _conexion;
       
        public UserData(string conexion)
        {
            _conexion = conexion;
        }
        public Result DeleteUser(string id)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spDeleteTUser";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
            if (id != "")
            {
                insertCommand.Parameters.AddWithValue("@IdUser", id);
            }
            else
            {
                res.Exito = false;
                return res;
            }
            
            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            insertCommand.Parameters.Add("@NumHijos", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@NumHijos"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idEliminado = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                int Numhijos = System.Convert.ToInt32(insertCommand.Parameters["@NumHijos"].Value);
                if (idEliminado > 0 && Numhijos == 0)
                {                                      
                    res.Exito = true;
                }
                else
                {
                    if (Numhijos > 0)
                        res.Message = "La entidad User tiene registros que dependen de ella en otra tabla no se pudo eliminar.";
                    else
                        res.Message = "No se pudo eliminar el registro";
                        
                    res.Exito = false;
                }
            }
            catch (Exception ex)
            {
                res.Message = ex.Message;
                res.Exito = false;
            }
            finally
            {
                connection.Close();
            }

            return res;
        }
        
        public User GetUser(string id)
        {
            User entidad = new  User();           

            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetTUserByID";
            cmd.CommandText = sql;
            cmd.Connection = conn;
            //manejar llave primaria
            cmd.Parameters.AddWithValue("@IdUser", id);
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                  
                      if(reader["IdUser"] != DBNull.Value)               
                         entidad.id = reader["IdUser"].ToString();
 if(reader["username"] != DBNull.Value)               
                         entidad.username = reader["username"].ToString();
 if(reader["display_name"] != DBNull.Value)               
                         entidad.display_name = reader["display_name"].ToString();
 if(reader["email"] != DBNull.Value)               
                         entidad.email = reader["email"].ToString();
 if(reader["password"] != DBNull.Value)               
                         entidad.password = reader["password"].ToString();
 if(reader["enabled"] != DBNull.Value)               
                         entidad.enabled = Boolean.Parse(reader["enabled"].ToString());
 if(reader["roleId"] != DBNull.Value)               
                         entidad.roleId = reader["roleId"].ToString();
                   
                                         
                }
            }
            
            }
            catch(Exception ex)
            {
                res.Exito = false;
                res.Message= ex.Message;
            }
            finally
            {
                conn.Close();
            }
           
            return entidad;
        }
        public List<User> GetUsersAndRelations(int page, int numrecords)
        {
            List<User> lista = new List<User>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListTUserPaged";
            cmd.CommandText = sql;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@pagNo", page);
            cmd.Parameters.AddWithValue("@pageSize", numrecords);
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    var it = new User();
            
                      if(reader["IdUser"] != DBNull.Value)               
                         it.id = reader["IdUser"].ToString();
 if(reader["username"] != DBNull.Value)               
                         it.username = reader["username"].ToString();
 if(reader["display_name"] != DBNull.Value)               
                         it.display_name = reader["display_name"].ToString();
 if(reader["email"] != DBNull.Value)               
                         it.email = reader["email"].ToString();
 if(reader["password"] != DBNull.Value)               
                         it.password = reader["password"].ToString();
 if(reader["enabled"] != DBNull.Value)               
                         it.enabled = Boolean.Parse(reader["enabled"].ToString());
 if(reader["roleId"] != DBNull.Value)               
                         it.roleId = reader["roleId"].ToString();
                   
                                        

                    lista.Add(it);
                }
            }
            }
            catch(Exception ex)
            {
                res.Exito = false;
                res.Message = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            

            return lista;
        }
        public List<User> GetUsers(int page, int numrecords)
        {
            List<User> lista = new List<User>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListTUserPaged";
            cmd.CommandText = sql;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@pagNo", page);
            cmd.Parameters.AddWithValue("@pageSize", numrecords);
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    var it = new User();
            
                            if(reader["IdUser"] != DBNull.Value)               
                             it.id = reader["IdUser"].ToString();
                            if(reader["username"] != DBNull.Value)               
                             it.username = reader["username"].ToString();
                            if(reader["display_name"] != DBNull.Value)               
                             it.display_name = reader["display_name"].ToString();
                            if(reader["email"] != DBNull.Value)               
                             it.email = reader["email"].ToString();
                            if(reader["password"] != DBNull.Value)               
                             it.password = reader["password"].ToString();
                            if(reader["enabled"] != DBNull.Value)               
                             it.enabled = Boolean.Parse(reader["enabled"].ToString());
                            if(reader["roleId"] != DBNull.Value)               
                             it.roleId = reader["roleId"].ToString();
                   
                   

                    lista.Add(it);
                }
            }
            }
            catch(Exception ex)
            {
                res.Exito = false;
                res.Message = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            

            return lista;
        }
        public Result InsertUser(User item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spInsertTUser";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
       
                                     
                                insertCommand.Parameters.AddWithValue("@IdUser", item.id);

                         
                                insertCommand.Parameters.AddWithValue("@username", item.username);

                         
                                insertCommand.Parameters.AddWithValue("@display_name", item.display_name);

                         
                                insertCommand.Parameters.AddWithValue("@email", item.email);

                         
                                insertCommand.Parameters.AddWithValue("@password", item.password);

                         
                                insertCommand.Parameters.AddWithValue("@enabled", item.enabled);

                         
                                insertCommand.Parameters.AddWithValue("@roleId", item.roleId);



            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idNuevo = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idNuevo > 0)
                {                   
                    res.IdInserted = idNuevo.ToString();  
                    res.Exito = true;
                }
                else
                {
                    res.Exito = false;
                }
            }
            catch (Exception ex)
            {
                res.Message = ex.Message;
                res.Exito = false;
            }
            finally
            {
                connection.Close();
            }

            return res;
        }
        public Result UpdateUser(string id, User item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdateTUser";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                      
                                insertCommand.Parameters.AddWithValue("@IdUser", item.id);

                         
                                insertCommand.Parameters.AddWithValue("@username", item.username);

                         
                                insertCommand.Parameters.AddWithValue("@display_name", item.display_name);

                         
                                insertCommand.Parameters.AddWithValue("@email", item.email);

                         
                                insertCommand.Parameters.AddWithValue("@password", item.password);

                         
                                insertCommand.Parameters.AddWithValue("@enabled", item.enabled);

                         
                                insertCommand.Parameters.AddWithValue("@roleId", item.roleId);

          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    res.IdInserted = item.id; 
                    res.Exito = true;
                }
                else
                {
                    res.Exito = false;
                }
            }
            catch (Exception ex)
            {
                res.Message = ex.Message;
                res.Exito = false;
            }
            finally
            {
                connection.Close();
            }

            return res;
        
        }
        
        public Result UpdatePartialUser(string id, User item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdatePartialTUser";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                      
                                insertCommand.Parameters.AddWithValue("@IdUser", item.id);

                         
                                insertCommand.Parameters.AddWithValue("@username", item.username);

                         
                                insertCommand.Parameters.AddWithValue("@display_name", item.display_name);

                         
                                insertCommand.Parameters.AddWithValue("@email", item.email);

                         
                                insertCommand.Parameters.AddWithValue("@password", item.password);

                         
                                insertCommand.Parameters.AddWithValue("@enabled", item.enabled);

                         
                                insertCommand.Parameters.AddWithValue("@roleId", item.roleId);

          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    res.IdInserted = item.id; 
                    res.Exito = true;
                }
                else
                {
                    res.Exito = false;
                }
            }
            catch (Exception ex)
            {
                res.Message = ex.Message;
                res.Exito = false;
            }
            finally
            {
                connection.Close();
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
