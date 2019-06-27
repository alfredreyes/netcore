//Fecha Creación:12/11/2018 03:37:26 p.m. Template DataClass, Author: Alfredo Reyes C., V1
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
    public class RolesData : IRolesData, IDisposable
    {
        private string _conexion;
       
        public RolesData(string conexion)
        {
            _conexion = conexion;
        }
 //       public Result DeleteRole(string id)
 //       {
 //           Result res = new Result();
 //           SqlConnection connection = new SqlConnection(_conexion);
 //           string insertProcedure = "spDeleteTRol";
 //           SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
 //           insertCommand.CommandType = CommandType.StoredProcedure;
 //           if (id != "")
 //           {
 //               insertCommand.Parameters.AddWithValue("@IdRol", id);
 //           }
 //           else
 //           {
 //               res.Exito = false;
 //               return res;
 //           }
            
 //           insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
 //           insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
 //           insertCommand.Parameters.Add("@NumHijos", System.Data.SqlDbType.Int);
 //           insertCommand.Parameters["@NumHijos"].Direction = ParameterDirection.Output;
 //           try
 //           {
 //               connection.Open();
 //               insertCommand.ExecuteNonQuery();
 //               int idEliminado = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
 //               int Numhijos = System.Convert.ToInt32(insertCommand.Parameters["@NumHijos"].Value);
 //               if (idEliminado > 0 && Numhijos == 0)
 //               {                                      
 //                   res.Exito = true;
 //               }
 //               else
 //               {
 //                   if (Numhijos > 0)
 //                       res.Message = "La entidad Role tiene registros que dependen de ella en otra tabla no se pudo eliminar.";
 //                   else
 //                       res.Message = "No se pudo eliminar el registro";
                        
 //                   res.Exito = false;
 //               }
 //           }
 //           catch (Exception ex)
 //           {
 //               res.Message = ex.Message;
 //               res.Exito = false;
 //           }
 //           finally
 //           {
 //               connection.Close();
 //           }

 //           return res;
 //       }
        
 //       public Role GetRole(string id)
 //       {
 //           Role entidad = new  Role();           

 //           Result res = new Result();
 //           SqlConnection conn = new SqlConnection(_conexion);
 //           try{
 //           conn.Open();
 //           var cmd = new SqlCommand();
 //           cmd.CommandType = CommandType.StoredProcedure;
 //           string sql = "";

 //           sql = "spGetTRolByID";
 //           cmd.CommandText = sql;
 //           cmd.Connection = conn;
 //           //manejar llave primaria
 //           cmd.Parameters.AddWithValue("@IdRol", id);
 //           SqlDataReader reader;
 //           reader = cmd.ExecuteReader();
 //           if (reader.HasRows)
 //           {
 //               while (reader.Read())
 //               {
                  
 //                     if(reader["IdRol"] != DBNull.Value)               
 //                        entidad.id = reader["IdRol"].ToString();
 //if(reader["name"] != DBNull.Value)               
 //                        entidad.name = reader["name"].ToString();
 //if(reader["description"] != DBNull.Value)               
 //                        entidad.description = reader["description"].ToString();
 //if(reader["enabled"] != DBNull.Value)               
 //                        entidad.enabled = Boolean.Parse(reader["enabled"].ToString());
                   
                                         
 //               }
 //           }
            
 //           }
 //           catch(Exception ex)
 //           {
 //               res.Exito = false;
 //               res.Message= ex.Message;
 //           }
 //           finally
 //           {
 //               conn.Close();
 //           }
           
 //           return entidad;
 //       }
 //       public List<Role> GetRolesAndRelations(int page, int numrecords)
 //       {
 //           List<Role> lista = new List<Role>();
            
 //           Result res = new Result();
 //           SqlConnection conn = new SqlConnection(_conexion);
            
 //           try{
 //           conn.Open();
 //           var cmd = new SqlCommand();
 //           cmd.CommandType = CommandType.StoredProcedure;
 //           string sql = "";

 //           sql = "spGetListTRolPaged";
 //           cmd.CommandText = sql;
 //           cmd.Connection = conn;
 //           cmd.Parameters.AddWithValue("@pagNo", page);
 //           cmd.Parameters.AddWithValue("@pageSize", numrecords);
 //           SqlDataReader reader;
 //           reader = cmd.ExecuteReader();
 //           if (reader.HasRows)
 //           {
 //               while (reader.Read())
 //               {
 //                   var it = new Role();
            
 //                     if(reader["IdRol"] != DBNull.Value)               
 //                        it.id = reader["IdRol"].ToString();
 //if(reader["name"] != DBNull.Value)               
 //                        it.name = reader["name"].ToString();
 //if(reader["description"] != DBNull.Value)               
 //                        it.description = reader["description"].ToString();
 //if(reader["enabled"] != DBNull.Value)               
 //                        it.enabled = Boolean.Parse(reader["enabled"].ToString());
                   
                                        

 //                   lista.Add(it);
 //               }
 //           }
 //           }
 //           catch(Exception ex)
 //           {
 //               res.Exito = false;
 //               res.Message = ex.Message;
 //           }
 //           finally
 //           {
 //               conn.Close();
 //           }
            

 //           return lista;
 //       }
 //       public List<Role> GetRoles(int page, int numrecords)
 //       {
 //           List<Role> lista = new List<Role>();
            
 //           Result res = new Result();
 //           SqlConnection conn = new SqlConnection(_conexion);
            
 //           try{
 //           conn.Open();
 //           var cmd = new SqlCommand();
 //           cmd.CommandType = CommandType.StoredProcedure;
 //           string sql = "";

 //           sql = "spGetListTRolPaged";
 //           cmd.CommandText = sql;
 //           cmd.Connection = conn;
 //           cmd.Parameters.AddWithValue("@pagNo", page);
 //           cmd.Parameters.AddWithValue("@pageSize", numrecords);
 //           SqlDataReader reader;
 //           reader = cmd.ExecuteReader();
 //           if (reader.HasRows)
 //           {
 //               while (reader.Read())
 //               {
 //                   var it = new Role();
            
 //                           if(reader["IdRol"] != DBNull.Value)               
 //                            it.id = reader["IdRol"].ToString();
 //                           if(reader["name"] != DBNull.Value)               
 //                            it.name = reader["name"].ToString();
 //                           if(reader["description"] != DBNull.Value)               
 //                            it.description = reader["description"].ToString();
 //                           if(reader["enabled"] != DBNull.Value)               
 //                            it.enabled = Boolean.Parse(reader["enabled"].ToString());
                   
                   

 //                   lista.Add(it);
 //               }
 //           }
 //           }
 //           catch(Exception ex)
 //           {
 //               res.Exito = false;
 //               res.Message = ex.Message;
 //           }
 //           finally
 //           {
 //               conn.Close();
 //           }
            

 //           return lista;
 //       }
 //       public Result InsertRole(Role item)
 //       {
 //           Result res = new Result();
 //           SqlConnection connection = new SqlConnection(_conexion);
 //           string insertProcedure = "spInsertTRol";
 //           SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
 //           insertCommand.CommandType = CommandType.StoredProcedure;
       
                                     
 //                               insertCommand.Parameters.AddWithValue("@IdRol", item.id);

                         
 //                               insertCommand.Parameters.AddWithValue("@name", item.name);

                         
 //                               insertCommand.Parameters.AddWithValue("@description", item.description);

                         
 //                               insertCommand.Parameters.AddWithValue("@enabled", item.enabled);



 //           insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
 //           insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
 //           try
 //           {
 //               connection.Open();
 //               insertCommand.ExecuteNonQuery();
 //               int idNuevo = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
 //               if (idNuevo > 0)
 //               {                   
 //                   res.IdInserted = idNuevo.ToString();  
 //                   res.Exito = true;
 //               }
 //               else
 //               {
 //                   res.Exito = false;
 //               }
 //           }
 //           catch (Exception ex)
 //           {
 //               res.Message = ex.Message;
 //               res.Exito = false;
 //           }
 //           finally
 //           {
 //               connection.Close();
 //           }

 //           return res;
 //       }
 //       public Result UpdateRole(string id, Role item)
 //       {
 //           Result res = new Result();
 //           SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
 //           string insertProcedure = "spUpdateTRol";
 //           SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
 //           insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                      
 //                               insertCommand.Parameters.AddWithValue("@IdRol", item.id);

                         
 //                               insertCommand.Parameters.AddWithValue("@name", item.name);

                         
 //                               insertCommand.Parameters.AddWithValue("@description", item.description);

                         
 //                               insertCommand.Parameters.AddWithValue("@enabled", item.enabled);

          

 //           insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
 //           insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
 //           try
 //           {
 //               connection.Open();
 //               insertCommand.ExecuteNonQuery();
 //               int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
 //               if (idUpdate > 0)
 //               {
 //                   res.IdInserted = item.id; 
 //                   res.Exito = true;
 //               }
 //               else
 //               {
 //                   res.Exito = false;
 //               }
 //           }
 //           catch (Exception ex)
 //           {
 //               res.Message = ex.Message;
 //               res.Exito = false;
 //           }
 //           finally
 //           {
 //               connection.Close();
 //           }

 //           return res;
        
 //       }
        
 //       public Result UpdatePartialRole(string id, Role item)
 //       {
 //           Result res = new Result();
 //           SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
 //           string insertProcedure = "spUpdatePartialTRol";
 //           SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
 //           insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                      
 //                               insertCommand.Parameters.AddWithValue("@IdRol", item.id);

                         
 //                               insertCommand.Parameters.AddWithValue("@name", item.name);

                         
 //                               insertCommand.Parameters.AddWithValue("@description", item.description);

                         
 //                               insertCommand.Parameters.AddWithValue("@enabled", item.enabled);

          

 //           insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
 //           insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
 //           try
 //           {
 //               connection.Open();
 //               insertCommand.ExecuteNonQuery();
 //               int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
 //               if (idUpdate > 0)
 //               {
 //                   res.IdInserted = item.id; 
 //                   res.Exito = true;
 //               }
 //               else
 //               {
 //                   res.Exito = false;
 //               }
 //           }
 //           catch (Exception ex)
 //           {
 //               res.Message = ex.Message;
 //               res.Exito = false;
 //           }
 //           finally
 //           {
 //               connection.Close();
 //           }

 //           return res;
        
 //       }

        public Role GetRolePemissions(string id)
        {
            Role entidad = new Role();

            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            try
            {
                conn.Open();
                var cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                string sql = "";

                sql = "spGetTRolPermissionsByID";
                cmd.CommandText = sql;
                cmd.Connection = conn;
                //manejar llave primaria
                cmd.Parameters.AddWithValue("@IdRol", id);
                SqlDataReader reader;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    List<Permission> list = new List<Permission>();
                    entidad.Permissions = new List<Permission>();
                    while (reader.Read())
                    {
                        Permission it = new Permission();

                        if (reader["IdRol"] != DBNull.Value)
                            entidad.id = reader["IdRol"].ToString();
                        if (reader["name"] != DBNull.Value)
                            entidad.name = reader["name"].ToString();
                        if (reader["description"] != DBNull.Value)
                            entidad.description = reader["description"].ToString();
                        if (reader["enabled"] != DBNull.Value)
                            entidad.enabled = Boolean.Parse(reader["enabled"].ToString());
                        

                        if (reader["idpermission"] != DBNull.Value)
                            it.id  = reader["idpermission"].ToString();

                        if (reader["code"] != DBNull.Value)
                            it.code  = reader["code"].ToString();

                        if (reader["description"] != DBNull.Value)
                            it.description = reader["description"].ToString();

                        entidad.Permissions.Add(it);
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
