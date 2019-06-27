//Fecha Creación:5/24/2019 6:13:36 PM Template DataClass, Author: Alfredo Reyes C., V1
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
    public class SubfisoData : ISubfisoData, IDisposable
    {
        private string _conexion;
       
        public SubfisoData(string conexion)
        {
            _conexion = conexion;
        }
        public Result DeleteSubfiso(string id)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spDeleteSubfiso";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
            if (id != "")
            {
                insertCommand.Parameters.AddWithValue("@ID", id);
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
                        res.Message = "La entidad Subfiso tiene registros que dependen de ella en otra tabla no se pudo eliminar.";
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
        
        public Subfiso GetSubfiso(string id)
        {
            Subfiso entidad = new  Subfiso();           

            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetSubfisoByID";
            cmd.CommandText = sql;
            cmd.Connection = conn;
            //manejar llave primaria
            cmd.Parameters.AddWithValue("@ID", id);
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                  
                      if(reader["ID"] != DBNull.Value)               
                         entidad.Subfiso_ID = reader["ID"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         entidad.Subfiso_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["Numero"] != DBNull.Value)               
                         entidad.Subfiso_Numero = Int32.Parse(reader["Numero"].ToString());
 if(reader["Nombre"] != DBNull.Value)               
                         entidad.Subfiso_Nombre = reader["Nombre"].ToString();
 if(reader["Estatus"] != DBNull.Value)               
                         entidad.Subfiso_Estatus = reader["Estatus"].ToString();
 if(reader["FechaRegistro"] != DBNull.Value)               
                         entidad.Subfiso_FechaRegistro = DateTime.Parse(reader["FechaRegistro"].ToString());
 if(reader["Identificador"] != DBNull.Value)               
                         entidad.Subfiso_Identificador = reader["Identificador"].ToString();
                   
                      if(reader["GeneralesNumero1"] != DBNull.Value){
                             entidad.MyFideicomiso1 = new  Fideicomiso();  
                             entidad.MyFideicomiso1.Fideicomiso_GeneralesNumero = Int32.Parse(reader["GeneralesNumero1"].ToString());
                        }
                    
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
        public List<Subfiso> GetSubfisosAndRelations(int page, int numrecords)
        {
            List<Subfiso> lista = new List<Subfiso>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListSubfisoPaged";
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
                    var it = new Subfiso();
            
                      if(reader["ID"] != DBNull.Value)               
                         it.Subfiso_ID = reader["ID"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         it.Subfiso_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["Numero"] != DBNull.Value)               
                         it.Subfiso_Numero = Int32.Parse(reader["Numero"].ToString());
 if(reader["Nombre"] != DBNull.Value)               
                         it.Subfiso_Nombre = reader["Nombre"].ToString();
 if(reader["Estatus"] != DBNull.Value)               
                         it.Subfiso_Estatus = reader["Estatus"].ToString();
 if(reader["FechaRegistro"] != DBNull.Value)               
                         it.Subfiso_FechaRegistro = DateTime.Parse(reader["FechaRegistro"].ToString());
 if(reader["Identificador"] != DBNull.Value)               
                         it.Subfiso_Identificador = reader["Identificador"].ToString();
                   
                      if(reader["GeneralesNumero1"] != DBNull.Value){
                             it.MyFideicomiso1 = new  Fideicomiso();  
                             it.MyFideicomiso1.Fideicomiso_GeneralesNumero = Int32.Parse(reader["GeneralesNumero1"].ToString());
                        }
                   

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
        public List<Subfiso> GetSubfisos(int page, int numrecords)
        {
            List<Subfiso> lista = new List<Subfiso>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListSubfisoPaged";
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
                    var it = new Subfiso();
            
                            if(reader["ID"] != DBNull.Value)               
                             it.Subfiso_ID = reader["ID"].ToString();
                            if(reader["Fideicomiso"] != DBNull.Value)               
                             it.Subfiso_Fideicomiso = reader["Fideicomiso"].ToString();
                            if(reader["Numero"] != DBNull.Value)               
                             it.Subfiso_Numero = Int32.Parse(reader["Numero"].ToString());
                            if(reader["Nombre"] != DBNull.Value)               
                             it.Subfiso_Nombre = reader["Nombre"].ToString();
                            if(reader["Estatus"] != DBNull.Value)               
                             it.Subfiso_Estatus = reader["Estatus"].ToString();
                            if(reader["FechaRegistro"] != DBNull.Value)               
                             it.Subfiso_FechaRegistro = DateTime.Parse(reader["FechaRegistro"].ToString());
                            if(reader["Identificador"] != DBNull.Value)               
                             it.Subfiso_Identificador = reader["Identificador"].ToString();
                   
                   

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
        public Result InsertSubfiso(Subfiso item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spInsertSubfiso";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
       
                                insertCommand.Parameters.AddWithValue("@Fideicomiso", item.Subfiso_Fideicomiso);
                    insertCommand.Parameters.AddWithValue("@Numero", item.Subfiso_Numero);
                    insertCommand.Parameters.AddWithValue("@Nombre", item.Subfiso_Nombre);
                    insertCommand.Parameters.AddWithValue("@Estatus", item.Subfiso_Estatus);
                    insertCommand.Parameters.AddWithValue("@FechaRegistro", item.Subfiso_FechaRegistro);
  if (item.Subfiso_Identificador == null) 
                      insertCommand.Parameters.AddWithValue("@Identificador", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Identificador", item.Subfiso_Identificador);




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
        public Result UpdateSubfiso(string id, Subfiso item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdateSubfiso";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                                 insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.Subfiso_Fideicomiso);

                                    insertCommand.Parameters.AddWithValue("@Numero", item.Subfiso_Numero);

                                    insertCommand.Parameters.AddWithValue("@Nombre", item.Subfiso_Nombre);

                                    insertCommand.Parameters.AddWithValue("@Estatus", item.Subfiso_Estatus);

                                    insertCommand.Parameters.AddWithValue("@FechaRegistro", item.Subfiso_FechaRegistro);

  if (item.Subfiso_Identificador == null) 
                                  insertCommand.Parameters.AddWithValue("@Identificador", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Identificador", item.Subfiso_Identificador);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.Subfiso_ID.ToString(); 
                    res.IdInserted = id; 
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
        
        public Result UpdatePartialSubfiso(string id, Subfiso item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdatePartialSubfiso";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                             insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.Subfiso_Fideicomiso);

                                    insertCommand.Parameters.AddWithValue("@Numero", item.Subfiso_Numero);

                                    insertCommand.Parameters.AddWithValue("@Nombre", item.Subfiso_Nombre);

                                    insertCommand.Parameters.AddWithValue("@Estatus", item.Subfiso_Estatus);

                                    insertCommand.Parameters.AddWithValue("@FechaRegistro", item.Subfiso_FechaRegistro);

  if (item.Subfiso_Identificador == null) 
                                  insertCommand.Parameters.AddWithValue("@Identificador", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Identificador", item.Subfiso_Identificador);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.Subfiso_ID.ToString(); 
                    res.IdInserted = id; 
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
