//Fecha Creación:5/24/2019 6:12:47 PM Template DataClass, Author: Alfredo Reyes C., V1
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
    public class ComiteTecnicoData : IComiteTecnicoData, IDisposable
    {
        private string _conexion;
       
        public ComiteTecnicoData(string conexion)
        {
            _conexion = conexion;
        }
        public Result DeleteComiteTecnico(string id)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spDeleteComiteTecnico";
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
                        res.Message = "La entidad ComiteTecnico tiene registros que dependen de ella en otra tabla no se pudo eliminar.";
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
        
        public ComiteTecnico GetComiteTecnico(string id)
        {
            ComiteTecnico entidad = new  ComiteTecnico();           

            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetComiteTecnicoByID";
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
                         entidad.ComiteTecnico_ID = reader["ID"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         entidad.ComiteTecnico_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["Nombre"] != DBNull.Value)               
                         entidad.ComiteTecnico_Nombre = reader["Nombre"].ToString();
 if(reader["Integracion"] != DBNull.Value)               
                         entidad.ComiteTecnico_Integracion = reader["Integracion"].ToString();
 if(reader["Facultades"] != DBNull.Value)               
                         entidad.ComiteTecnico_Facultades = reader["Facultades"].ToString();
 if(reader["Comentarios"] != DBNull.Value)               
                         entidad.ComiteTecnico_Comentarios = reader["Comentarios"].ToString();
 if(reader["FechaConstitucion"] != DBNull.Value)               
                         entidad.ComiteTecnico_FechaConstitucion = DateTime.Parse(reader["FechaConstitucion"].ToString());
 if(reader["MiembrosQuorum"] != DBNull.Value)               
                         entidad.ComiteTecnico_MiembrosQuorum = Int32.Parse(reader["MiembrosQuorum"].ToString());
 if(reader["Estatus"] != DBNull.Value)               
                         entidad.ComiteTecnico_Estatus = reader["Estatus"].ToString();
 if(reader["NombrePresidentePropietario"] != DBNull.Value)               
                         entidad.ComiteTecnico_NombrePresidentePropietario = reader["NombrePresidentePropietario"].ToString();
 if(reader["RfcPresidentePropietario"] != DBNull.Value)               
                         entidad.ComiteTecnico_RfcPresidentePropietario = reader["RfcPresidentePropietario"].ToString();
 if(reader["NacionalidadPresidentePropietario"] != DBNull.Value)               
                         entidad.ComiteTecnico_NacionalidadPresidentePropietario = reader["NacionalidadPresidentePropietario"].ToString();
 if(reader["PepPresidentePropietario"] != DBNull.Value)               
                         entidad.ComiteTecnico_PepPresidentePropietario = reader["PepPresidentePropietario"].ToString();
 if(reader["NombrePresidenteSuplente"] != DBNull.Value)               
                         entidad.ComiteTecnico_NombrePresidenteSuplente = reader["NombrePresidenteSuplente"].ToString();
 if(reader["RfcPresidenteSuplente"] != DBNull.Value)               
                         entidad.ComiteTecnico_RfcPresidenteSuplente = reader["RfcPresidenteSuplente"].ToString();
 if(reader["NacionalidadPresidenteSuplente"] != DBNull.Value)               
                         entidad.ComiteTecnico_NacionalidadPresidenteSuplente = reader["NacionalidadPresidenteSuplente"].ToString();
 if(reader["PepPresidenteSuplente"] != DBNull.Value)               
                         entidad.ComiteTecnico_PepPresidenteSuplente = reader["PepPresidenteSuplente"].ToString();
 if(reader["NombreSecretarioPropietario"] != DBNull.Value)               
                         entidad.ComiteTecnico_NombreSecretarioPropietario = reader["NombreSecretarioPropietario"].ToString();
 if(reader["RfcSecretarioPropietario"] != DBNull.Value)               
                         entidad.ComiteTecnico_RfcSecretarioPropietario = reader["RfcSecretarioPropietario"].ToString();
 if(reader["NacionalidadSecretarioPropietario"] != DBNull.Value)               
                         entidad.ComiteTecnico_NacionalidadSecretarioPropietario = reader["NacionalidadSecretarioPropietario"].ToString();
 if(reader["PepSecretarioPropietario"] != DBNull.Value)               
                         entidad.ComiteTecnico_PepSecretarioPropietario = reader["PepSecretarioPropietario"].ToString();
 if(reader["NombreSecretarioSuplente"] != DBNull.Value)               
                         entidad.ComiteTecnico_NombreSecretarioSuplente = reader["NombreSecretarioSuplente"].ToString();
 if(reader["RfcSecretarioSuplente"] != DBNull.Value)               
                         entidad.ComiteTecnico_RfcSecretarioSuplente = reader["RfcSecretarioSuplente"].ToString();
 if(reader["NacionalidadSecretarioSuplente"] != DBNull.Value)               
                         entidad.ComiteTecnico_NacionalidadSecretarioSuplente = reader["NacionalidadSecretarioSuplente"].ToString();
 if(reader["PepSecretarioSuplente"] != DBNull.Value)               
                         entidad.ComiteTecnico_PepSecretarioSuplente = reader["PepSecretarioSuplente"].ToString();
 if(reader["NombreVocalPropietario"] != DBNull.Value)               
                         entidad.ComiteTecnico_NombreVocalPropietario = reader["NombreVocalPropietario"].ToString();
 if(reader["RfcVocalPropietario"] != DBNull.Value)               
                         entidad.ComiteTecnico_RfcVocalPropietario = reader["RfcVocalPropietario"].ToString();
 if(reader["NacionalidadVocalPropietario"] != DBNull.Value)               
                         entidad.ComiteTecnico_NacionalidadVocalPropietario = reader["NacionalidadVocalPropietario"].ToString();
 if(reader["PepVocalPropietario"] != DBNull.Value)               
                         entidad.ComiteTecnico_PepVocalPropietario = reader["PepVocalPropietario"].ToString();
 if(reader["NombreVocalSuplente"] != DBNull.Value)               
                         entidad.ComiteTecnico_NombreVocalSuplente = reader["NombreVocalSuplente"].ToString();
 if(reader["RfcVocalSuplente"] != DBNull.Value)               
                         entidad.ComiteTecnico_RfcVocalSuplente = reader["RfcVocalSuplente"].ToString();
 if(reader["NacionalidadVocalSuplente"] != DBNull.Value)               
                         entidad.ComiteTecnico_NacionalidadVocalSuplente = reader["NacionalidadVocalSuplente"].ToString();
 if(reader["PepVocalSuplente"] != DBNull.Value)               
                         entidad.ComiteTecnico_PepVocalSuplente = reader["PepVocalSuplente"].ToString();
                   
                      if(reader["GeneralesNumero1"] != DBNull.Value){
                             entidad.MyFideicomiso1 = new  Fideicomiso();  
                             entidad.MyFideicomiso1.Fideicomiso_GeneralesNumero =Int32.Parse(reader["GeneralesNumero1"].ToString());
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
        public List<ComiteTecnico> GetComiteTecnicosAndRelations(int page, int numrecords)
        {
            List<ComiteTecnico> lista = new List<ComiteTecnico>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListComiteTecnicoPaged";
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
                    var it = new ComiteTecnico();
            
                      if(reader["ID"] != DBNull.Value)               
                         it.ComiteTecnico_ID = reader["ID"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         it.ComiteTecnico_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["Nombre"] != DBNull.Value)               
                         it.ComiteTecnico_Nombre = reader["Nombre"].ToString();
 if(reader["Integracion"] != DBNull.Value)               
                         it.ComiteTecnico_Integracion = reader["Integracion"].ToString();
 if(reader["Facultades"] != DBNull.Value)               
                         it.ComiteTecnico_Facultades = reader["Facultades"].ToString();
 if(reader["Comentarios"] != DBNull.Value)               
                         it.ComiteTecnico_Comentarios = reader["Comentarios"].ToString();
 if(reader["FechaConstitucion"] != DBNull.Value)               
                         it.ComiteTecnico_FechaConstitucion = DateTime.Parse(reader["FechaConstitucion"].ToString());
 if(reader["MiembrosQuorum"] != DBNull.Value)               
                         it.ComiteTecnico_MiembrosQuorum = Int32.Parse(reader["MiembrosQuorum"].ToString());
 if(reader["Estatus"] != DBNull.Value)               
                         it.ComiteTecnico_Estatus = reader["Estatus"].ToString();
 if(reader["NombrePresidentePropietario"] != DBNull.Value)               
                         it.ComiteTecnico_NombrePresidentePropietario = reader["NombrePresidentePropietario"].ToString();
 if(reader["RfcPresidentePropietario"] != DBNull.Value)               
                         it.ComiteTecnico_RfcPresidentePropietario = reader["RfcPresidentePropietario"].ToString();
 if(reader["NacionalidadPresidentePropietario"] != DBNull.Value)               
                         it.ComiteTecnico_NacionalidadPresidentePropietario = reader["NacionalidadPresidentePropietario"].ToString();
 if(reader["PepPresidentePropietario"] != DBNull.Value)               
                         it.ComiteTecnico_PepPresidentePropietario = reader["PepPresidentePropietario"].ToString();
 if(reader["NombrePresidenteSuplente"] != DBNull.Value)               
                         it.ComiteTecnico_NombrePresidenteSuplente = reader["NombrePresidenteSuplente"].ToString();
 if(reader["RfcPresidenteSuplente"] != DBNull.Value)               
                         it.ComiteTecnico_RfcPresidenteSuplente = reader["RfcPresidenteSuplente"].ToString();
 if(reader["NacionalidadPresidenteSuplente"] != DBNull.Value)               
                         it.ComiteTecnico_NacionalidadPresidenteSuplente = reader["NacionalidadPresidenteSuplente"].ToString();
 if(reader["PepPresidenteSuplente"] != DBNull.Value)               
                         it.ComiteTecnico_PepPresidenteSuplente = reader["PepPresidenteSuplente"].ToString();
 if(reader["NombreSecretarioPropietario"] != DBNull.Value)               
                         it.ComiteTecnico_NombreSecretarioPropietario = reader["NombreSecretarioPropietario"].ToString();
 if(reader["RfcSecretarioPropietario"] != DBNull.Value)               
                         it.ComiteTecnico_RfcSecretarioPropietario = reader["RfcSecretarioPropietario"].ToString();
 if(reader["NacionalidadSecretarioPropietario"] != DBNull.Value)               
                         it.ComiteTecnico_NacionalidadSecretarioPropietario = reader["NacionalidadSecretarioPropietario"].ToString();
 if(reader["PepSecretarioPropietario"] != DBNull.Value)               
                         it.ComiteTecnico_PepSecretarioPropietario = reader["PepSecretarioPropietario"].ToString();
 if(reader["NombreSecretarioSuplente"] != DBNull.Value)               
                         it.ComiteTecnico_NombreSecretarioSuplente = reader["NombreSecretarioSuplente"].ToString();
 if(reader["RfcSecretarioSuplente"] != DBNull.Value)               
                         it.ComiteTecnico_RfcSecretarioSuplente = reader["RfcSecretarioSuplente"].ToString();
 if(reader["NacionalidadSecretarioSuplente"] != DBNull.Value)               
                         it.ComiteTecnico_NacionalidadSecretarioSuplente = reader["NacionalidadSecretarioSuplente"].ToString();
 if(reader["PepSecretarioSuplente"] != DBNull.Value)               
                         it.ComiteTecnico_PepSecretarioSuplente = reader["PepSecretarioSuplente"].ToString();
 if(reader["NombreVocalPropietario"] != DBNull.Value)               
                         it.ComiteTecnico_NombreVocalPropietario = reader["NombreVocalPropietario"].ToString();
 if(reader["RfcVocalPropietario"] != DBNull.Value)               
                         it.ComiteTecnico_RfcVocalPropietario = reader["RfcVocalPropietario"].ToString();
 if(reader["NacionalidadVocalPropietario"] != DBNull.Value)               
                         it.ComiteTecnico_NacionalidadVocalPropietario = reader["NacionalidadVocalPropietario"].ToString();
 if(reader["PepVocalPropietario"] != DBNull.Value)               
                         it.ComiteTecnico_PepVocalPropietario = reader["PepVocalPropietario"].ToString();
 if(reader["NombreVocalSuplente"] != DBNull.Value)               
                         it.ComiteTecnico_NombreVocalSuplente = reader["NombreVocalSuplente"].ToString();
 if(reader["RfcVocalSuplente"] != DBNull.Value)               
                         it.ComiteTecnico_RfcVocalSuplente = reader["RfcVocalSuplente"].ToString();
 if(reader["NacionalidadVocalSuplente"] != DBNull.Value)               
                         it.ComiteTecnico_NacionalidadVocalSuplente = reader["NacionalidadVocalSuplente"].ToString();
 if(reader["PepVocalSuplente"] != DBNull.Value)               
                         it.ComiteTecnico_PepVocalSuplente = reader["PepVocalSuplente"].ToString();
                   
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
        public List<ComiteTecnico> GetComiteTecnicos(int page, int numrecords)
        {
            List<ComiteTecnico> lista = new List<ComiteTecnico>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListComiteTecnicoPaged";
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
                    var it = new ComiteTecnico();
            
                            if(reader["ID"] != DBNull.Value)               
                             it.ComiteTecnico_ID = reader["ID"].ToString();
                            if(reader["Fideicomiso"] != DBNull.Value)               
                             it.ComiteTecnico_Fideicomiso = reader["Fideicomiso"].ToString();
                            if(reader["Nombre"] != DBNull.Value)               
                             it.ComiteTecnico_Nombre = reader["Nombre"].ToString();
                            if(reader["Integracion"] != DBNull.Value)               
                             it.ComiteTecnico_Integracion = reader["Integracion"].ToString();
                            if(reader["Facultades"] != DBNull.Value)               
                             it.ComiteTecnico_Facultades = reader["Facultades"].ToString();
                            if(reader["Comentarios"] != DBNull.Value)               
                             it.ComiteTecnico_Comentarios = reader["Comentarios"].ToString();
                            if(reader["FechaConstitucion"] != DBNull.Value)               
                             it.ComiteTecnico_FechaConstitucion = DateTime.Parse(reader["FechaConstitucion"].ToString());
                            if(reader["MiembrosQuorum"] != DBNull.Value)               
                             it.ComiteTecnico_MiembrosQuorum = Int32.Parse(reader["MiembrosQuorum"].ToString());
                            if(reader["Estatus"] != DBNull.Value)               
                             it.ComiteTecnico_Estatus = reader["Estatus"].ToString();
                            if(reader["NombrePresidentePropietario"] != DBNull.Value)               
                             it.ComiteTecnico_NombrePresidentePropietario = reader["NombrePresidentePropietario"].ToString();
                            if(reader["RfcPresidentePropietario"] != DBNull.Value)               
                             it.ComiteTecnico_RfcPresidentePropietario = reader["RfcPresidentePropietario"].ToString();
                            if(reader["NacionalidadPresidentePropietario"] != DBNull.Value)               
                             it.ComiteTecnico_NacionalidadPresidentePropietario = reader["NacionalidadPresidentePropietario"].ToString();
                            if(reader["PepPresidentePropietario"] != DBNull.Value)               
                             it.ComiteTecnico_PepPresidentePropietario = reader["PepPresidentePropietario"].ToString();
                            if(reader["NombrePresidenteSuplente"] != DBNull.Value)               
                             it.ComiteTecnico_NombrePresidenteSuplente = reader["NombrePresidenteSuplente"].ToString();
                            if(reader["RfcPresidenteSuplente"] != DBNull.Value)               
                             it.ComiteTecnico_RfcPresidenteSuplente = reader["RfcPresidenteSuplente"].ToString();
                            if(reader["NacionalidadPresidenteSuplente"] != DBNull.Value)               
                             it.ComiteTecnico_NacionalidadPresidenteSuplente = reader["NacionalidadPresidenteSuplente"].ToString();
                            if(reader["PepPresidenteSuplente"] != DBNull.Value)               
                             it.ComiteTecnico_PepPresidenteSuplente = reader["PepPresidenteSuplente"].ToString();
                            if(reader["NombreSecretarioPropietario"] != DBNull.Value)               
                             it.ComiteTecnico_NombreSecretarioPropietario = reader["NombreSecretarioPropietario"].ToString();
                            if(reader["RfcSecretarioPropietario"] != DBNull.Value)               
                             it.ComiteTecnico_RfcSecretarioPropietario = reader["RfcSecretarioPropietario"].ToString();
                            if(reader["NacionalidadSecretarioPropietario"] != DBNull.Value)               
                             it.ComiteTecnico_NacionalidadSecretarioPropietario = reader["NacionalidadSecretarioPropietario"].ToString();
                            if(reader["PepSecretarioPropietario"] != DBNull.Value)               
                             it.ComiteTecnico_PepSecretarioPropietario = reader["PepSecretarioPropietario"].ToString();
                            if(reader["NombreSecretarioSuplente"] != DBNull.Value)               
                             it.ComiteTecnico_NombreSecretarioSuplente = reader["NombreSecretarioSuplente"].ToString();
                            if(reader["RfcSecretarioSuplente"] != DBNull.Value)               
                             it.ComiteTecnico_RfcSecretarioSuplente = reader["RfcSecretarioSuplente"].ToString();
                            if(reader["NacionalidadSecretarioSuplente"] != DBNull.Value)               
                             it.ComiteTecnico_NacionalidadSecretarioSuplente = reader["NacionalidadSecretarioSuplente"].ToString();
                            if(reader["PepSecretarioSuplente"] != DBNull.Value)               
                             it.ComiteTecnico_PepSecretarioSuplente = reader["PepSecretarioSuplente"].ToString();
                            if(reader["NombreVocalPropietario"] != DBNull.Value)               
                             it.ComiteTecnico_NombreVocalPropietario = reader["NombreVocalPropietario"].ToString();
                            if(reader["RfcVocalPropietario"] != DBNull.Value)               
                             it.ComiteTecnico_RfcVocalPropietario = reader["RfcVocalPropietario"].ToString();
                            if(reader["NacionalidadVocalPropietario"] != DBNull.Value)               
                             it.ComiteTecnico_NacionalidadVocalPropietario = reader["NacionalidadVocalPropietario"].ToString();
                            if(reader["PepVocalPropietario"] != DBNull.Value)               
                             it.ComiteTecnico_PepVocalPropietario = reader["PepVocalPropietario"].ToString();
                            if(reader["NombreVocalSuplente"] != DBNull.Value)               
                             it.ComiteTecnico_NombreVocalSuplente = reader["NombreVocalSuplente"].ToString();
                            if(reader["RfcVocalSuplente"] != DBNull.Value)               
                             it.ComiteTecnico_RfcVocalSuplente = reader["RfcVocalSuplente"].ToString();
                            if(reader["NacionalidadVocalSuplente"] != DBNull.Value)               
                             it.ComiteTecnico_NacionalidadVocalSuplente = reader["NacionalidadVocalSuplente"].ToString();
                            if(reader["PepVocalSuplente"] != DBNull.Value)               
                             it.ComiteTecnico_PepVocalSuplente = reader["PepVocalSuplente"].ToString();
                   
                   

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
        public Result InsertComiteTecnico(ComiteTecnico item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spInsertComiteTecnico";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
       
                                insertCommand.Parameters.AddWithValue("@Fideicomiso", item.ComiteTecnico_Fideicomiso);
                    insertCommand.Parameters.AddWithValue("@Nombre", item.ComiteTecnico_Nombre);
  if (item.ComiteTecnico_Integracion == null) 
                      insertCommand.Parameters.AddWithValue("@Integracion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Integracion", item.ComiteTecnico_Integracion);


  if (item.ComiteTecnico_Facultades == null) 
                      insertCommand.Parameters.AddWithValue("@Facultades", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Facultades", item.ComiteTecnico_Facultades);


  if (item.ComiteTecnico_Comentarios == null) 
                      insertCommand.Parameters.AddWithValue("@Comentarios", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Comentarios", item.ComiteTecnico_Comentarios);


                    insertCommand.Parameters.AddWithValue("@FechaConstitucion", item.ComiteTecnico_FechaConstitucion);
  if (item.ComiteTecnico_MiembrosQuorum == null) 
                      insertCommand.Parameters.AddWithValue("@MiembrosQuorum", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@MiembrosQuorum", item.ComiteTecnico_MiembrosQuorum);


                    insertCommand.Parameters.AddWithValue("@Estatus", item.ComiteTecnico_Estatus);
  if (item.ComiteTecnico_NombrePresidentePropietario == null) 
                      insertCommand.Parameters.AddWithValue("@NombrePresidentePropietario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NombrePresidentePropietario", item.ComiteTecnico_NombrePresidentePropietario);


  if (item.ComiteTecnico_RfcPresidentePropietario == null) 
                      insertCommand.Parameters.AddWithValue("@RfcPresidentePropietario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@RfcPresidentePropietario", item.ComiteTecnico_RfcPresidentePropietario);


  if (item.ComiteTecnico_NacionalidadPresidentePropietario == null) 
                      insertCommand.Parameters.AddWithValue("@NacionalidadPresidentePropietario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NacionalidadPresidentePropietario", item.ComiteTecnico_NacionalidadPresidentePropietario);


  if (item.ComiteTecnico_PepPresidentePropietario == null) 
                      insertCommand.Parameters.AddWithValue("@PepPresidentePropietario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@PepPresidentePropietario", item.ComiteTecnico_PepPresidentePropietario);


  if (item.ComiteTecnico_NombrePresidenteSuplente == null) 
                      insertCommand.Parameters.AddWithValue("@NombrePresidenteSuplente", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NombrePresidenteSuplente", item.ComiteTecnico_NombrePresidenteSuplente);


  if (item.ComiteTecnico_RfcPresidenteSuplente == null) 
                      insertCommand.Parameters.AddWithValue("@RfcPresidenteSuplente", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@RfcPresidenteSuplente", item.ComiteTecnico_RfcPresidenteSuplente);


  if (item.ComiteTecnico_NacionalidadPresidenteSuplente == null) 
                      insertCommand.Parameters.AddWithValue("@NacionalidadPresidenteSuplente", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NacionalidadPresidenteSuplente", item.ComiteTecnico_NacionalidadPresidenteSuplente);


  if (item.ComiteTecnico_PepPresidenteSuplente == null) 
                      insertCommand.Parameters.AddWithValue("@PepPresidenteSuplente", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@PepPresidenteSuplente", item.ComiteTecnico_PepPresidenteSuplente);


  if (item.ComiteTecnico_NombreSecretarioPropietario == null) 
                      insertCommand.Parameters.AddWithValue("@NombreSecretarioPropietario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NombreSecretarioPropietario", item.ComiteTecnico_NombreSecretarioPropietario);


  if (item.ComiteTecnico_RfcSecretarioPropietario == null) 
                      insertCommand.Parameters.AddWithValue("@RfcSecretarioPropietario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@RfcSecretarioPropietario", item.ComiteTecnico_RfcSecretarioPropietario);


  if (item.ComiteTecnico_NacionalidadSecretarioPropietario == null) 
                      insertCommand.Parameters.AddWithValue("@NacionalidadSecretarioPropietario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NacionalidadSecretarioPropietario", item.ComiteTecnico_NacionalidadSecretarioPropietario);


  if (item.ComiteTecnico_PepSecretarioPropietario == null) 
                      insertCommand.Parameters.AddWithValue("@PepSecretarioPropietario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@PepSecretarioPropietario", item.ComiteTecnico_PepSecretarioPropietario);


  if (item.ComiteTecnico_NombreSecretarioSuplente == null) 
                      insertCommand.Parameters.AddWithValue("@NombreSecretarioSuplente", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NombreSecretarioSuplente", item.ComiteTecnico_NombreSecretarioSuplente);


  if (item.ComiteTecnico_RfcSecretarioSuplente == null) 
                      insertCommand.Parameters.AddWithValue("@RfcSecretarioSuplente", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@RfcSecretarioSuplente", item.ComiteTecnico_RfcSecretarioSuplente);


  if (item.ComiteTecnico_NacionalidadSecretarioSuplente == null) 
                      insertCommand.Parameters.AddWithValue("@NacionalidadSecretarioSuplente", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NacionalidadSecretarioSuplente", item.ComiteTecnico_NacionalidadSecretarioSuplente);


  if (item.ComiteTecnico_PepSecretarioSuplente == null) 
                      insertCommand.Parameters.AddWithValue("@PepSecretarioSuplente", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@PepSecretarioSuplente", item.ComiteTecnico_PepSecretarioSuplente);


  if (item.ComiteTecnico_NombreVocalPropietario == null) 
                      insertCommand.Parameters.AddWithValue("@NombreVocalPropietario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NombreVocalPropietario", item.ComiteTecnico_NombreVocalPropietario);


  if (item.ComiteTecnico_RfcVocalPropietario == null) 
                      insertCommand.Parameters.AddWithValue("@RfcVocalPropietario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@RfcVocalPropietario", item.ComiteTecnico_RfcVocalPropietario);


  if (item.ComiteTecnico_NacionalidadVocalPropietario == null) 
                      insertCommand.Parameters.AddWithValue("@NacionalidadVocalPropietario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NacionalidadVocalPropietario", item.ComiteTecnico_NacionalidadVocalPropietario);


  if (item.ComiteTecnico_PepVocalPropietario == null) 
                      insertCommand.Parameters.AddWithValue("@PepVocalPropietario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@PepVocalPropietario", item.ComiteTecnico_PepVocalPropietario);


  if (item.ComiteTecnico_NombreVocalSuplente == null) 
                      insertCommand.Parameters.AddWithValue("@NombreVocalSuplente", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NombreVocalSuplente", item.ComiteTecnico_NombreVocalSuplente);


  if (item.ComiteTecnico_RfcVocalSuplente == null) 
                      insertCommand.Parameters.AddWithValue("@RfcVocalSuplente", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@RfcVocalSuplente", item.ComiteTecnico_RfcVocalSuplente);


  if (item.ComiteTecnico_NacionalidadVocalSuplente == null) 
                      insertCommand.Parameters.AddWithValue("@NacionalidadVocalSuplente", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NacionalidadVocalSuplente", item.ComiteTecnico_NacionalidadVocalSuplente);


  if (item.ComiteTecnico_PepVocalSuplente == null) 
                      insertCommand.Parameters.AddWithValue("@PepVocalSuplente", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@PepVocalSuplente", item.ComiteTecnico_PepVocalSuplente);




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
        public Result UpdateComiteTecnico(string id, ComiteTecnico item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdateComiteTecnico";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                                 insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.ComiteTecnico_Fideicomiso);

                                    insertCommand.Parameters.AddWithValue("@Nombre", item.ComiteTecnico_Nombre);

  if (item.ComiteTecnico_Integracion == null) 
                                  insertCommand.Parameters.AddWithValue("@Integracion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Integracion", item.ComiteTecnico_Integracion);

    
  if (item.ComiteTecnico_Facultades == null) 
                                  insertCommand.Parameters.AddWithValue("@Facultades", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Facultades", item.ComiteTecnico_Facultades);

    
  if (item.ComiteTecnico_Comentarios == null) 
                                  insertCommand.Parameters.AddWithValue("@Comentarios", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Comentarios", item.ComiteTecnico_Comentarios);

    
                                    insertCommand.Parameters.AddWithValue("@FechaConstitucion", item.ComiteTecnico_FechaConstitucion);

  if (item.ComiteTecnico_MiembrosQuorum == null) 
                                  insertCommand.Parameters.AddWithValue("@MiembrosQuorum", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@MiembrosQuorum", item.ComiteTecnico_MiembrosQuorum);

    
                                    insertCommand.Parameters.AddWithValue("@Estatus", item.ComiteTecnico_Estatus);

  if (item.ComiteTecnico_NombrePresidentePropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@NombrePresidentePropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombrePresidentePropietario", item.ComiteTecnico_NombrePresidentePropietario);

    
  if (item.ComiteTecnico_RfcPresidentePropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@RfcPresidentePropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RfcPresidentePropietario", item.ComiteTecnico_RfcPresidentePropietario);

    
  if (item.ComiteTecnico_NacionalidadPresidentePropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@NacionalidadPresidentePropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NacionalidadPresidentePropietario", item.ComiteTecnico_NacionalidadPresidentePropietario);

    
  if (item.ComiteTecnico_PepPresidentePropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@PepPresidentePropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PepPresidentePropietario", item.ComiteTecnico_PepPresidentePropietario);

    
  if (item.ComiteTecnico_NombrePresidenteSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@NombrePresidenteSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombrePresidenteSuplente", item.ComiteTecnico_NombrePresidenteSuplente);

    
  if (item.ComiteTecnico_RfcPresidenteSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@RfcPresidenteSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RfcPresidenteSuplente", item.ComiteTecnico_RfcPresidenteSuplente);

    
  if (item.ComiteTecnico_NacionalidadPresidenteSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@NacionalidadPresidenteSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NacionalidadPresidenteSuplente", item.ComiteTecnico_NacionalidadPresidenteSuplente);

    
  if (item.ComiteTecnico_PepPresidenteSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@PepPresidenteSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PepPresidenteSuplente", item.ComiteTecnico_PepPresidenteSuplente);

    
  if (item.ComiteTecnico_NombreSecretarioPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@NombreSecretarioPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombreSecretarioPropietario", item.ComiteTecnico_NombreSecretarioPropietario);

    
  if (item.ComiteTecnico_RfcSecretarioPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@RfcSecretarioPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RfcSecretarioPropietario", item.ComiteTecnico_RfcSecretarioPropietario);

    
  if (item.ComiteTecnico_NacionalidadSecretarioPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@NacionalidadSecretarioPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NacionalidadSecretarioPropietario", item.ComiteTecnico_NacionalidadSecretarioPropietario);

    
  if (item.ComiteTecnico_PepSecretarioPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@PepSecretarioPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PepSecretarioPropietario", item.ComiteTecnico_PepSecretarioPropietario);

    
  if (item.ComiteTecnico_NombreSecretarioSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@NombreSecretarioSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombreSecretarioSuplente", item.ComiteTecnico_NombreSecretarioSuplente);

    
  if (item.ComiteTecnico_RfcSecretarioSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@RfcSecretarioSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RfcSecretarioSuplente", item.ComiteTecnico_RfcSecretarioSuplente);

    
  if (item.ComiteTecnico_NacionalidadSecretarioSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@NacionalidadSecretarioSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NacionalidadSecretarioSuplente", item.ComiteTecnico_NacionalidadSecretarioSuplente);

    
  if (item.ComiteTecnico_PepSecretarioSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@PepSecretarioSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PepSecretarioSuplente", item.ComiteTecnico_PepSecretarioSuplente);

    
  if (item.ComiteTecnico_NombreVocalPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@NombreVocalPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombreVocalPropietario", item.ComiteTecnico_NombreVocalPropietario);

    
  if (item.ComiteTecnico_RfcVocalPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@RfcVocalPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RfcVocalPropietario", item.ComiteTecnico_RfcVocalPropietario);

    
  if (item.ComiteTecnico_NacionalidadVocalPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@NacionalidadVocalPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NacionalidadVocalPropietario", item.ComiteTecnico_NacionalidadVocalPropietario);

    
  if (item.ComiteTecnico_PepVocalPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@PepVocalPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PepVocalPropietario", item.ComiteTecnico_PepVocalPropietario);

    
  if (item.ComiteTecnico_NombreVocalSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@NombreVocalSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombreVocalSuplente", item.ComiteTecnico_NombreVocalSuplente);

    
  if (item.ComiteTecnico_RfcVocalSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@RfcVocalSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RfcVocalSuplente", item.ComiteTecnico_RfcVocalSuplente);

    
  if (item.ComiteTecnico_NacionalidadVocalSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@NacionalidadVocalSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NacionalidadVocalSuplente", item.ComiteTecnico_NacionalidadVocalSuplente);

    
  if (item.ComiteTecnico_PepVocalSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@PepVocalSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PepVocalSuplente", item.ComiteTecnico_PepVocalSuplente);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.ComiteTecnico_ID.ToString(); 
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
        
        public Result UpdatePartialComiteTecnico(string id, ComiteTecnico item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdatePartialComiteTecnico";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                             insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.ComiteTecnico_Fideicomiso);

                                    insertCommand.Parameters.AddWithValue("@Nombre", item.ComiteTecnico_Nombre);

  if (item.ComiteTecnico_Integracion == null) 
                                  insertCommand.Parameters.AddWithValue("@Integracion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Integracion", item.ComiteTecnico_Integracion);

    
  if (item.ComiteTecnico_Facultades == null) 
                                  insertCommand.Parameters.AddWithValue("@Facultades", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Facultades", item.ComiteTecnico_Facultades);

    
  if (item.ComiteTecnico_Comentarios == null) 
                                  insertCommand.Parameters.AddWithValue("@Comentarios", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Comentarios", item.ComiteTecnico_Comentarios);

    
                                    insertCommand.Parameters.AddWithValue("@FechaConstitucion", item.ComiteTecnico_FechaConstitucion);

  if (item.ComiteTecnico_MiembrosQuorum == null) 
                                  insertCommand.Parameters.AddWithValue("@MiembrosQuorum", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@MiembrosQuorum", item.ComiteTecnico_MiembrosQuorum);

    
                                    insertCommand.Parameters.AddWithValue("@Estatus", item.ComiteTecnico_Estatus);

  if (item.ComiteTecnico_NombrePresidentePropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@NombrePresidentePropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombrePresidentePropietario", item.ComiteTecnico_NombrePresidentePropietario);

    
  if (item.ComiteTecnico_RfcPresidentePropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@RfcPresidentePropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RfcPresidentePropietario", item.ComiteTecnico_RfcPresidentePropietario);

    
  if (item.ComiteTecnico_NacionalidadPresidentePropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@NacionalidadPresidentePropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NacionalidadPresidentePropietario", item.ComiteTecnico_NacionalidadPresidentePropietario);

    
  if (item.ComiteTecnico_PepPresidentePropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@PepPresidentePropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PepPresidentePropietario", item.ComiteTecnico_PepPresidentePropietario);

    
  if (item.ComiteTecnico_NombrePresidenteSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@NombrePresidenteSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombrePresidenteSuplente", item.ComiteTecnico_NombrePresidenteSuplente);

    
  if (item.ComiteTecnico_RfcPresidenteSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@RfcPresidenteSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RfcPresidenteSuplente", item.ComiteTecnico_RfcPresidenteSuplente);

    
  if (item.ComiteTecnico_NacionalidadPresidenteSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@NacionalidadPresidenteSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NacionalidadPresidenteSuplente", item.ComiteTecnico_NacionalidadPresidenteSuplente);

    
  if (item.ComiteTecnico_PepPresidenteSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@PepPresidenteSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PepPresidenteSuplente", item.ComiteTecnico_PepPresidenteSuplente);

    
  if (item.ComiteTecnico_NombreSecretarioPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@NombreSecretarioPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombreSecretarioPropietario", item.ComiteTecnico_NombreSecretarioPropietario);

    
  if (item.ComiteTecnico_RfcSecretarioPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@RfcSecretarioPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RfcSecretarioPropietario", item.ComiteTecnico_RfcSecretarioPropietario);

    
  if (item.ComiteTecnico_NacionalidadSecretarioPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@NacionalidadSecretarioPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NacionalidadSecretarioPropietario", item.ComiteTecnico_NacionalidadSecretarioPropietario);

    
  if (item.ComiteTecnico_PepSecretarioPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@PepSecretarioPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PepSecretarioPropietario", item.ComiteTecnico_PepSecretarioPropietario);

    
  if (item.ComiteTecnico_NombreSecretarioSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@NombreSecretarioSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombreSecretarioSuplente", item.ComiteTecnico_NombreSecretarioSuplente);

    
  if (item.ComiteTecnico_RfcSecretarioSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@RfcSecretarioSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RfcSecretarioSuplente", item.ComiteTecnico_RfcSecretarioSuplente);

    
  if (item.ComiteTecnico_NacionalidadSecretarioSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@NacionalidadSecretarioSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NacionalidadSecretarioSuplente", item.ComiteTecnico_NacionalidadSecretarioSuplente);

    
  if (item.ComiteTecnico_PepSecretarioSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@PepSecretarioSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PepSecretarioSuplente", item.ComiteTecnico_PepSecretarioSuplente);

    
  if (item.ComiteTecnico_NombreVocalPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@NombreVocalPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombreVocalPropietario", item.ComiteTecnico_NombreVocalPropietario);

    
  if (item.ComiteTecnico_RfcVocalPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@RfcVocalPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RfcVocalPropietario", item.ComiteTecnico_RfcVocalPropietario);

    
  if (item.ComiteTecnico_NacionalidadVocalPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@NacionalidadVocalPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NacionalidadVocalPropietario", item.ComiteTecnico_NacionalidadVocalPropietario);

    
  if (item.ComiteTecnico_PepVocalPropietario == null) 
                                  insertCommand.Parameters.AddWithValue("@PepVocalPropietario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PepVocalPropietario", item.ComiteTecnico_PepVocalPropietario);

    
  if (item.ComiteTecnico_NombreVocalSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@NombreVocalSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombreVocalSuplente", item.ComiteTecnico_NombreVocalSuplente);

    
  if (item.ComiteTecnico_RfcVocalSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@RfcVocalSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RfcVocalSuplente", item.ComiteTecnico_RfcVocalSuplente);

    
  if (item.ComiteTecnico_NacionalidadVocalSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@NacionalidadVocalSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NacionalidadVocalSuplente", item.ComiteTecnico_NacionalidadVocalSuplente);

    
  if (item.ComiteTecnico_PepVocalSuplente == null) 
                                  insertCommand.Parameters.AddWithValue("@PepVocalSuplente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PepVocalSuplente", item.ComiteTecnico_PepVocalSuplente);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.ComiteTecnico_ID.ToString(); 
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
