//Fecha Creación:5/24/2019 6:13:42 PM Template DataClass, Author: Alfredo Reyes C., V1
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
    public class TerceroData : ITerceroData, IDisposable
    {
        private string _conexion;
       
        public TerceroData(string conexion)
        {
            _conexion = conexion;
        }
        public Result DeleteTercero(string id)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spDeleteTercero";
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
                        res.Message = "La entidad Tercero tiene registros que dependen de ella en otra tabla no se pudo eliminar.";
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
        
        public Tercero GetTercero(string id)
        {
            Tercero entidad = new  Tercero();           

            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetTerceroByID";
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
                         entidad.Tercero_ID = reader["ID"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         entidad.Tercero_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["NoTercero"] != DBNull.Value)               
                         entidad.Tercero_NoTercero = Int32.Parse(reader["NoTercero"].ToString());
 if(reader["RazonSocial"] != DBNull.Value)               
                         entidad.Tercero_RazonSocial = reader["RazonSocial"].ToString();
 if(reader["Nacionalidad"] != DBNull.Value)               
                         entidad.Tercero_Nacionalidad = reader["Nacionalidad"].ToString();
 if(reader["ActividadEconomica"] != DBNull.Value)               
                         entidad.Tercero_ActividadEconomica = reader["ActividadEconomica"].ToString();
 if(reader["LadaCasa"] != DBNull.Value)               
                         entidad.Tercero_LadaCasa = reader["LadaCasa"].ToString();
 if(reader["LadaOficina"] != DBNull.Value)               
                         entidad.Tercero_LadaOficina = reader["LadaOficina"].ToString();
 if(reader["LadaFax"] != DBNull.Value)               
                         entidad.Tercero_LadaFax = reader["LadaFax"].ToString();
 if(reader["TelefonoCasa"] != DBNull.Value)               
                         entidad.Tercero_TelefonoCasa = reader["TelefonoCasa"].ToString();
 if(reader["TelefonoOficina"] != DBNull.Value)               
                         entidad.Tercero_TelefonoOficina = reader["TelefonoOficina"].ToString();
 if(reader["TelefonoFax"] != DBNull.Value)               
                         entidad.Tercero_TelefonoFax = reader["TelefonoFax"].ToString();
 if(reader["ExtOficina"] != DBNull.Value)               
                         entidad.Tercero_ExtOficina = reader["ExtOficina"].ToString();
 if(reader["ExtFax"] != DBNull.Value)               
                         entidad.Tercero_ExtFax = reader["ExtFax"].ToString();
 if(reader["Estatus"] != DBNull.Value)               
                         entidad.Tercero_Estatus = reader["Estatus"].ToString();
 if(reader["FechaVerFircosoft"] != DBNull.Value)               
                         entidad.Tercero_FechaVerFircosoft = DateTime.Parse(reader["FechaVerFircosoft"].ToString());
 if(reader["TipoPersona"] != DBNull.Value)               
                         entidad.Tercero_TipoPersona = reader["TipoPersona"].ToString();
 if(reader["Rfc"] != DBNull.Value)               
                         entidad.Tercero_Rfc = reader["Rfc"].ToString();
 if(reader["Correo"] != DBNull.Value)               
                         entidad.Tercero_Correo = reader["Correo"].ToString();
 if(reader["CalidaMigratoria"] != DBNull.Value)               
                         entidad.Tercero_CalidaMigratoria = reader["CalidaMigratoria"].ToString();
                   
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
        public List<Tercero> GetTercerosAndRelations(int page, int numrecords)
        {
            List<Tercero> lista = new List<Tercero>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListTerceroPaged";
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
                    var it = new Tercero();
            
                      if(reader["ID"] != DBNull.Value)               
                         it.Tercero_ID = reader["ID"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         it.Tercero_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["NoTercero"] != DBNull.Value)               
                         it.Tercero_NoTercero = Int32.Parse(reader["NoTercero"].ToString());
 if(reader["RazonSocial"] != DBNull.Value)               
                         it.Tercero_RazonSocial = reader["RazonSocial"].ToString();
 if(reader["Nacionalidad"] != DBNull.Value)               
                         it.Tercero_Nacionalidad = reader["Nacionalidad"].ToString();
 if(reader["ActividadEconomica"] != DBNull.Value)               
                         it.Tercero_ActividadEconomica = reader["ActividadEconomica"].ToString();
 if(reader["LadaCasa"] != DBNull.Value)               
                         it.Tercero_LadaCasa = reader["LadaCasa"].ToString();
 if(reader["LadaOficina"] != DBNull.Value)               
                         it.Tercero_LadaOficina = reader["LadaOficina"].ToString();
 if(reader["LadaFax"] != DBNull.Value)               
                         it.Tercero_LadaFax = reader["LadaFax"].ToString();
 if(reader["TelefonoCasa"] != DBNull.Value)               
                         it.Tercero_TelefonoCasa = reader["TelefonoCasa"].ToString();
 if(reader["TelefonoOficina"] != DBNull.Value)               
                         it.Tercero_TelefonoOficina = reader["TelefonoOficina"].ToString();
 if(reader["TelefonoFax"] != DBNull.Value)               
                         it.Tercero_TelefonoFax = reader["TelefonoFax"].ToString();
 if(reader["ExtOficina"] != DBNull.Value)               
                         it.Tercero_ExtOficina = reader["ExtOficina"].ToString();
 if(reader["ExtFax"] != DBNull.Value)               
                         it.Tercero_ExtFax = reader["ExtFax"].ToString();
 if(reader["Estatus"] != DBNull.Value)               
                         it.Tercero_Estatus = reader["Estatus"].ToString();
 if(reader["FechaVerFircosoft"] != DBNull.Value)               
                         it.Tercero_FechaVerFircosoft = DateTime.Parse(reader["FechaVerFircosoft"].ToString());
 if(reader["TipoPersona"] != DBNull.Value)               
                         it.Tercero_TipoPersona = reader["TipoPersona"].ToString();
 if(reader["Rfc"] != DBNull.Value)               
                         it.Tercero_Rfc = reader["Rfc"].ToString();
 if(reader["Correo"] != DBNull.Value)               
                         it.Tercero_Correo = reader["Correo"].ToString();
 if(reader["CalidaMigratoria"] != DBNull.Value)               
                         it.Tercero_CalidaMigratoria = reader["CalidaMigratoria"].ToString();
                   
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
        public List<Tercero> GetTerceros(int page, int numrecords)
        {
            List<Tercero> lista = new List<Tercero>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListTerceroPaged";
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
                    var it = new Tercero();
            
                            if(reader["ID"] != DBNull.Value)               
                             it.Tercero_ID = reader["ID"].ToString();
                            if(reader["Fideicomiso"] != DBNull.Value)               
                             it.Tercero_Fideicomiso = reader["Fideicomiso"].ToString();
                            if(reader["NoTercero"] != DBNull.Value)               
                             it.Tercero_NoTercero = Int32.Parse(reader["NoTercero"].ToString());
                            if(reader["RazonSocial"] != DBNull.Value)               
                             it.Tercero_RazonSocial = reader["RazonSocial"].ToString();
                            if(reader["Nacionalidad"] != DBNull.Value)               
                             it.Tercero_Nacionalidad = reader["Nacionalidad"].ToString();
                            if(reader["ActividadEconomica"] != DBNull.Value)               
                             it.Tercero_ActividadEconomica = reader["ActividadEconomica"].ToString();
                            if(reader["LadaCasa"] != DBNull.Value)               
                             it.Tercero_LadaCasa = reader["LadaCasa"].ToString();
                            if(reader["LadaOficina"] != DBNull.Value)               
                             it.Tercero_LadaOficina = reader["LadaOficina"].ToString();
                            if(reader["LadaFax"] != DBNull.Value)               
                             it.Tercero_LadaFax = reader["LadaFax"].ToString();
                            if(reader["TelefonoCasa"] != DBNull.Value)               
                             it.Tercero_TelefonoCasa = reader["TelefonoCasa"].ToString();
                            if(reader["TelefonoOficina"] != DBNull.Value)               
                             it.Tercero_TelefonoOficina = reader["TelefonoOficina"].ToString();
                            if(reader["TelefonoFax"] != DBNull.Value)               
                             it.Tercero_TelefonoFax = reader["TelefonoFax"].ToString();
                            if(reader["ExtOficina"] != DBNull.Value)               
                             it.Tercero_ExtOficina = reader["ExtOficina"].ToString();
                            if(reader["ExtFax"] != DBNull.Value)               
                             it.Tercero_ExtFax = reader["ExtFax"].ToString();
                            if(reader["Estatus"] != DBNull.Value)               
                             it.Tercero_Estatus = reader["Estatus"].ToString();
                            if(reader["FechaVerFircosoft"] != DBNull.Value)               
                             it.Tercero_FechaVerFircosoft = DateTime.Parse(reader["FechaVerFircosoft"].ToString());
                            if(reader["TipoPersona"] != DBNull.Value)               
                             it.Tercero_TipoPersona = reader["TipoPersona"].ToString();
                            if(reader["Rfc"] != DBNull.Value)               
                             it.Tercero_Rfc = reader["Rfc"].ToString();
                            if(reader["Correo"] != DBNull.Value)               
                             it.Tercero_Correo = reader["Correo"].ToString();
                            if(reader["CalidaMigratoria"] != DBNull.Value)               
                             it.Tercero_CalidaMigratoria = reader["CalidaMigratoria"].ToString();
                   
                   

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
        public Result InsertTercero(Tercero item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spInsertTercero";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
       
                                insertCommand.Parameters.AddWithValue("@Fideicomiso", item.Tercero_Fideicomiso);
                    insertCommand.Parameters.AddWithValue("@NoTercero", item.Tercero_NoTercero);
                    insertCommand.Parameters.AddWithValue("@RazonSocial", item.Tercero_RazonSocial);
                    insertCommand.Parameters.AddWithValue("@Nacionalidad", item.Tercero_Nacionalidad);
  if (item.Tercero_ActividadEconomica == null) 
                      insertCommand.Parameters.AddWithValue("@ActividadEconomica", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@ActividadEconomica", item.Tercero_ActividadEconomica);


  if (item.Tercero_LadaCasa == null) 
                      insertCommand.Parameters.AddWithValue("@LadaCasa", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@LadaCasa", item.Tercero_LadaCasa);


  if (item.Tercero_LadaOficina == null) 
                      insertCommand.Parameters.AddWithValue("@LadaOficina", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@LadaOficina", item.Tercero_LadaOficina);


  if (item.Tercero_LadaFax == null) 
                      insertCommand.Parameters.AddWithValue("@LadaFax", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@LadaFax", item.Tercero_LadaFax);


  if (item.Tercero_TelefonoCasa == null) 
                      insertCommand.Parameters.AddWithValue("@TelefonoCasa", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@TelefonoCasa", item.Tercero_TelefonoCasa);


  if (item.Tercero_TelefonoOficina == null) 
                      insertCommand.Parameters.AddWithValue("@TelefonoOficina", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@TelefonoOficina", item.Tercero_TelefonoOficina);


  if (item.Tercero_TelefonoFax == null) 
                      insertCommand.Parameters.AddWithValue("@TelefonoFax", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@TelefonoFax", item.Tercero_TelefonoFax);


  if (item.Tercero_ExtOficina == null) 
                      insertCommand.Parameters.AddWithValue("@ExtOficina", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@ExtOficina", item.Tercero_ExtOficina);


  if (item.Tercero_ExtFax == null) 
                      insertCommand.Parameters.AddWithValue("@ExtFax", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@ExtFax", item.Tercero_ExtFax);


                    insertCommand.Parameters.AddWithValue("@Estatus", item.Tercero_Estatus);
  if (item.Tercero_FechaVerFircosoft == null) 
                      insertCommand.Parameters.AddWithValue("@FechaVerFircosoft", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@FechaVerFircosoft", item.Tercero_FechaVerFircosoft);


                    insertCommand.Parameters.AddWithValue("@TipoPersona", item.Tercero_TipoPersona);
  if (item.Tercero_Rfc == null) 
                      insertCommand.Parameters.AddWithValue("@Rfc", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Rfc", item.Tercero_Rfc);


  if (item.Tercero_Correo == null) 
                      insertCommand.Parameters.AddWithValue("@Correo", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Correo", item.Tercero_Correo);


  if (item.Tercero_CalidaMigratoria == null) 
                      insertCommand.Parameters.AddWithValue("@CalidaMigratoria", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CalidaMigratoria", item.Tercero_CalidaMigratoria);




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
        public Result UpdateTercero(string id, Tercero item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdateTercero";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                                 insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.Tercero_Fideicomiso);

                                    insertCommand.Parameters.AddWithValue("@NoTercero", item.Tercero_NoTercero);

                                    insertCommand.Parameters.AddWithValue("@RazonSocial", item.Tercero_RazonSocial);

                                    insertCommand.Parameters.AddWithValue("@Nacionalidad", item.Tercero_Nacionalidad);

  if (item.Tercero_ActividadEconomica == null) 
                                  insertCommand.Parameters.AddWithValue("@ActividadEconomica", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ActividadEconomica", item.Tercero_ActividadEconomica);

    
  if (item.Tercero_LadaCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@LadaCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@LadaCasa", item.Tercero_LadaCasa);

    
  if (item.Tercero_LadaOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@LadaOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@LadaOficina", item.Tercero_LadaOficina);

    
  if (item.Tercero_LadaFax == null) 
                                  insertCommand.Parameters.AddWithValue("@LadaFax", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@LadaFax", item.Tercero_LadaFax);

    
  if (item.Tercero_TelefonoCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@TelefonoCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TelefonoCasa", item.Tercero_TelefonoCasa);

    
  if (item.Tercero_TelefonoOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@TelefonoOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TelefonoOficina", item.Tercero_TelefonoOficina);

    
  if (item.Tercero_TelefonoFax == null) 
                                  insertCommand.Parameters.AddWithValue("@TelefonoFax", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TelefonoFax", item.Tercero_TelefonoFax);

    
  if (item.Tercero_ExtOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@ExtOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ExtOficina", item.Tercero_ExtOficina);

    
  if (item.Tercero_ExtFax == null) 
                                  insertCommand.Parameters.AddWithValue("@ExtFax", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ExtFax", item.Tercero_ExtFax);

    
                                    insertCommand.Parameters.AddWithValue("@Estatus", item.Tercero_Estatus);

  if (item.Tercero_FechaVerFircosoft == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaVerFircosoft", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaVerFircosoft", item.Tercero_FechaVerFircosoft);

    
                                    insertCommand.Parameters.AddWithValue("@TipoPersona", item.Tercero_TipoPersona);

  if (item.Tercero_Rfc == null) 
                                  insertCommand.Parameters.AddWithValue("@Rfc", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Rfc", item.Tercero_Rfc);

    
  if (item.Tercero_Correo == null) 
                                  insertCommand.Parameters.AddWithValue("@Correo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Correo", item.Tercero_Correo);

    
  if (item.Tercero_CalidaMigratoria == null) 
                                  insertCommand.Parameters.AddWithValue("@CalidaMigratoria", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CalidaMigratoria", item.Tercero_CalidaMigratoria);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.Tercero_ID.ToString(); 
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
        
        public Result UpdatePartialTercero(string id, Tercero item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdatePartialTercero";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                             insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.Tercero_Fideicomiso);

                                    insertCommand.Parameters.AddWithValue("@NoTercero", item.Tercero_NoTercero);

                                    insertCommand.Parameters.AddWithValue("@RazonSocial", item.Tercero_RazonSocial);

                                    insertCommand.Parameters.AddWithValue("@Nacionalidad", item.Tercero_Nacionalidad);

  if (item.Tercero_ActividadEconomica == null) 
                                  insertCommand.Parameters.AddWithValue("@ActividadEconomica", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ActividadEconomica", item.Tercero_ActividadEconomica);

    
  if (item.Tercero_LadaCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@LadaCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@LadaCasa", item.Tercero_LadaCasa);

    
  if (item.Tercero_LadaOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@LadaOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@LadaOficina", item.Tercero_LadaOficina);

    
  if (item.Tercero_LadaFax == null) 
                                  insertCommand.Parameters.AddWithValue("@LadaFax", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@LadaFax", item.Tercero_LadaFax);

    
  if (item.Tercero_TelefonoCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@TelefonoCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TelefonoCasa", item.Tercero_TelefonoCasa);

    
  if (item.Tercero_TelefonoOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@TelefonoOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TelefonoOficina", item.Tercero_TelefonoOficina);

    
  if (item.Tercero_TelefonoFax == null) 
                                  insertCommand.Parameters.AddWithValue("@TelefonoFax", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TelefonoFax", item.Tercero_TelefonoFax);

    
  if (item.Tercero_ExtOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@ExtOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ExtOficina", item.Tercero_ExtOficina);

    
  if (item.Tercero_ExtFax == null) 
                                  insertCommand.Parameters.AddWithValue("@ExtFax", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ExtFax", item.Tercero_ExtFax);

    
                                    insertCommand.Parameters.AddWithValue("@Estatus", item.Tercero_Estatus);

  if (item.Tercero_FechaVerFircosoft == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaVerFircosoft", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaVerFircosoft", item.Tercero_FechaVerFircosoft);

    
                                    insertCommand.Parameters.AddWithValue("@TipoPersona", item.Tercero_TipoPersona);

  if (item.Tercero_Rfc == null) 
                                  insertCommand.Parameters.AddWithValue("@Rfc", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Rfc", item.Tercero_Rfc);

    
  if (item.Tercero_Correo == null) 
                                  insertCommand.Parameters.AddWithValue("@Correo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Correo", item.Tercero_Correo);

    
  if (item.Tercero_CalidaMigratoria == null) 
                                  insertCommand.Parameters.AddWithValue("@CalidaMigratoria", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CalidaMigratoria", item.Tercero_CalidaMigratoria);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.Tercero_ID.ToString(); 
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
