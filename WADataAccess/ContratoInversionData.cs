//Fecha Creación:5/24/2019 6:12:53 PM Template DataClass, Author: Alfredo Reyes C., V1
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
    public class ContratoInversionData : IContratoInversionData, IDisposable
    {
        private string _conexion;
       
        public ContratoInversionData(string conexion)
        {
            _conexion = conexion;
        }
        
        public ContratoInversion GetContratoInversion(string id)
        {
            ContratoInversion entidad = new  ContratoInversion();           

            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetContratoInversionByID";
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
                         entidad.ContratoInversion_ID = reader["ID"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         entidad.ContratoInversion_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["TipoContrato"] != DBNull.Value)               
                         entidad.ContratoInversion_TipoContrato = reader["TipoContrato"].ToString();
 if(reader["Intermediario"] != DBNull.Value)               
                         entidad.ContratoInversion_Intermediario = reader["Intermediario"].ToString();
 if(reader["Moneda"] != DBNull.Value)               
                         entidad.ContratoInversion_Moneda = reader["Moneda"].ToString();
 if(reader["NombreContacto1"] != DBNull.Value)               
                         entidad.ContratoInversion_NombreContacto1 = reader["NombreContacto1"].ToString();
 if(reader["NombreContacto2"] != DBNull.Value)               
                         entidad.ContratoInversion_NombreContacto2 = reader["NombreContacto2"].ToString();
 if(reader["ResParamLiq"] != DBNull.Value)               
                         entidad.ContratoInversion_ResParamLiq = reader["ResParamLiq"].ToString();
 if(reader["EnvioRecursosInv"] != DBNull.Value)               
                         entidad.ContratoInversion_EnvioRecursosInv = reader["EnvioRecursosInv"].ToString();
 if(reader["TransferenciaRecDesinver"] != DBNull.Value)               
                         entidad.ContratoInversion_TransferenciaRecDesinver = reader["TransferenciaRecDesinver"].ToString();
 if(reader["RetenerIsr"] != DBNull.Value)               
                         entidad.ContratoInversion_RetenerIsr = reader["RetenerIsr"].ToString();
 if(reader["Subfiso"] != DBNull.Value)               
                         entidad.ContratoInversion_Subfiso = reader["Subfiso"].ToString();
 if(reader["FechaVencimiento"] != DBNull.Value)               
                         entidad.ContratoInversion_FechaVencimiento = DateTime.Parse(reader["FechaVencimiento"].ToString());
 if(reader["Estatus"] != DBNull.Value)               
                         entidad.ContratoInversion_Estatus = reader["Estatus"].ToString();
 if(reader["ContratoIversion"] != DBNull.Value)               
                         entidad.ContratoInversion_ContratoIversion = reader["ContratoIversion"].ToString();
 if(reader["ContratoOtrasInst"] != DBNull.Value)               
                         entidad.ContratoInversion_ContratoOtrasInst = reader["ContratoOtrasInst"].ToString();
 if(reader["Contacto1Lada"] != DBNull.Value)               
                         entidad.ContratoInversion_Contacto1Lada = reader["Contacto1Lada"].ToString();
 if(reader["Contacto1Telefono"] != DBNull.Value)               
                         entidad.ContratoInversion_Contacto1Telefono = reader["Contacto1Telefono"].ToString();
 if(reader["Contacto1Ext"] != DBNull.Value)               
                         entidad.ContratoInversion_Contacto1Ext = reader["Contacto1Ext"].ToString();
 if(reader["Contacto2Lada"] != DBNull.Value)               
                         entidad.ContratoInversion_Contacto2Lada = reader["Contacto2Lada"].ToString();
 if(reader["Contacto2Telefono"] != DBNull.Value)               
                         entidad.ContratoInversion_Contacto2Telefono = reader["Contacto2Telefono"].ToString();
 if(reader["Contacto2Ext"] != DBNull.Value)               
                         entidad.ContratoInversion_Contacto2Ext = reader["Contacto2Ext"].ToString();
 if(reader["Nombre"] != DBNull.Value)               
                         entidad.ContratoInversion_Nombre = reader["Nombre"].ToString();
 if(reader["Cuenta"] != DBNull.Value)               
                         entidad.ContratoInversion_Cuenta = reader["Cuenta"].ToString();
 if(reader["TraspasoEntreSubFiso"] != DBNull.Value)               
                         entidad.ContratoInversion_TraspasoEntreSubFiso = reader["TraspasoEntreSubFiso"].ToString();
 if(reader["FechaApertura"] != DBNull.Value)               
                         entidad.ContratoInversion_FechaApertura = DateTime.Parse(reader["FechaApertura"].ToString());
 if(reader["OrigenRecursos"] != DBNull.Value)               
                         entidad.ContratoInversion_OrigenRecursos = reader["OrigenRecursos"].ToString();
                   
                      if(reader["GeneralesNumero1"] != DBNull.Value){
                             entidad.MyFideicomiso1 = new  Fideicomiso();  
                             entidad.MyFideicomiso1.Fideicomiso_GeneralesNumero = Int32.Parse(reader["GeneralesNumero1"].ToString());
                        }
 if(reader["Numero2"] != DBNull.Value){
                             entidad.MySubfiso2 = new  Subfiso();  
                             entidad.MySubfiso2.Subfiso_Numero = Int32.Parse(reader["Numero2"].ToString());
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
        public List<ContratoInversion> GetContratoInversionsAndRelations(int page, int numrecords)
        {
            List<ContratoInversion> lista = new List<ContratoInversion>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListContratoInversionPaged";
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
                    var it = new ContratoInversion();
            
                      if(reader["ID"] != DBNull.Value)               
                         it.ContratoInversion_ID = reader["ID"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         it.ContratoInversion_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["TipoContrato"] != DBNull.Value)               
                         it.ContratoInversion_TipoContrato = reader["TipoContrato"].ToString();
 if(reader["Intermediario"] != DBNull.Value)               
                         it.ContratoInversion_Intermediario = reader["Intermediario"].ToString();
 if(reader["Moneda"] != DBNull.Value)               
                         it.ContratoInversion_Moneda = reader["Moneda"].ToString();
 if(reader["NombreContacto1"] != DBNull.Value)               
                         it.ContratoInversion_NombreContacto1 = reader["NombreContacto1"].ToString();
 if(reader["NombreContacto2"] != DBNull.Value)               
                         it.ContratoInversion_NombreContacto2 = reader["NombreContacto2"].ToString();
 if(reader["ResParamLiq"] != DBNull.Value)               
                         it.ContratoInversion_ResParamLiq = reader["ResParamLiq"].ToString();
 if(reader["EnvioRecursosInv"] != DBNull.Value)               
                         it.ContratoInversion_EnvioRecursosInv = reader["EnvioRecursosInv"].ToString();
 if(reader["TransferenciaRecDesinver"] != DBNull.Value)               
                         it.ContratoInversion_TransferenciaRecDesinver = reader["TransferenciaRecDesinver"].ToString();
 if(reader["RetenerIsr"] != DBNull.Value)               
                         it.ContratoInversion_RetenerIsr = reader["RetenerIsr"].ToString();
 if(reader["Subfiso"] != DBNull.Value)               
                         it.ContratoInversion_Subfiso = reader["Subfiso"].ToString();
 if(reader["FechaVencimiento"] != DBNull.Value)               
                         it.ContratoInversion_FechaVencimiento = DateTime.Parse(reader["FechaVencimiento"].ToString());
 if(reader["Estatus"] != DBNull.Value)               
                         it.ContratoInversion_Estatus = reader["Estatus"].ToString();
 if(reader["ContratoIversion"] != DBNull.Value)               
                         it.ContratoInversion_ContratoIversion = reader["ContratoIversion"].ToString();
 if(reader["ContratoOtrasInst"] != DBNull.Value)               
                         it.ContratoInversion_ContratoOtrasInst = reader["ContratoOtrasInst"].ToString();
 if(reader["Contacto1Lada"] != DBNull.Value)               
                         it.ContratoInversion_Contacto1Lada = reader["Contacto1Lada"].ToString();
 if(reader["Contacto1Telefono"] != DBNull.Value)               
                         it.ContratoInversion_Contacto1Telefono = reader["Contacto1Telefono"].ToString();
 if(reader["Contacto1Ext"] != DBNull.Value)               
                         it.ContratoInversion_Contacto1Ext = reader["Contacto1Ext"].ToString();
 if(reader["Contacto2Lada"] != DBNull.Value)               
                         it.ContratoInversion_Contacto2Lada = reader["Contacto2Lada"].ToString();
 if(reader["Contacto2Telefono"] != DBNull.Value)               
                         it.ContratoInversion_Contacto2Telefono = reader["Contacto2Telefono"].ToString();
 if(reader["Contacto2Ext"] != DBNull.Value)               
                         it.ContratoInversion_Contacto2Ext = reader["Contacto2Ext"].ToString();
 if(reader["Nombre"] != DBNull.Value)               
                         it.ContratoInversion_Nombre = reader["Nombre"].ToString();
 if(reader["Cuenta"] != DBNull.Value)               
                         it.ContratoInversion_Cuenta = reader["Cuenta"].ToString();
 if(reader["TraspasoEntreSubFiso"] != DBNull.Value)               
                         it.ContratoInversion_TraspasoEntreSubFiso = reader["TraspasoEntreSubFiso"].ToString();
 if(reader["FechaApertura"] != DBNull.Value)               
                         it.ContratoInversion_FechaApertura = DateTime.Parse(reader["FechaApertura"].ToString());
 if(reader["OrigenRecursos"] != DBNull.Value)               
                         it.ContratoInversion_OrigenRecursos = reader["OrigenRecursos"].ToString();
                   
                      if(reader["GeneralesNumero1"] != DBNull.Value){
                             it.MyFideicomiso1 = new  Fideicomiso();  
                             it.MyFideicomiso1.Fideicomiso_GeneralesNumero = Int32.Parse(reader["GeneralesNumero1"].ToString());
                        }
 if(reader["Numero2"] != DBNull.Value){
                             it.MySubfiso2 = new  Subfiso();  
                             it.MySubfiso2.Subfiso_Numero = Int32.Parse(reader["Numero2"].ToString());
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
        public List<ContratoInversion> GetContratoInversions(int page, int numrecords)
        {
            List<ContratoInversion> lista = new List<ContratoInversion>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListContratoInversionPaged";
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
                    var it = new ContratoInversion();
            
                            if(reader["ID"] != DBNull.Value)               
                             it.ContratoInversion_ID = reader["ID"].ToString();
                            if(reader["Fideicomiso"] != DBNull.Value)               
                             it.ContratoInversion_Fideicomiso = reader["Fideicomiso"].ToString();
                            if(reader["TipoContrato"] != DBNull.Value)               
                             it.ContratoInversion_TipoContrato = reader["TipoContrato"].ToString();
                            if(reader["Intermediario"] != DBNull.Value)               
                             it.ContratoInversion_Intermediario = reader["Intermediario"].ToString();
                            if(reader["Moneda"] != DBNull.Value)               
                             it.ContratoInversion_Moneda = reader["Moneda"].ToString();
                            if(reader["NombreContacto1"] != DBNull.Value)               
                             it.ContratoInversion_NombreContacto1 = reader["NombreContacto1"].ToString();
                            if(reader["NombreContacto2"] != DBNull.Value)               
                             it.ContratoInversion_NombreContacto2 = reader["NombreContacto2"].ToString();
                            if(reader["ResParamLiq"] != DBNull.Value)               
                             it.ContratoInversion_ResParamLiq = reader["ResParamLiq"].ToString();
                            if(reader["EnvioRecursosInv"] != DBNull.Value)               
                             it.ContratoInversion_EnvioRecursosInv = reader["EnvioRecursosInv"].ToString();
                            if(reader["TransferenciaRecDesinver"] != DBNull.Value)               
                             it.ContratoInversion_TransferenciaRecDesinver = reader["TransferenciaRecDesinver"].ToString();
                            if(reader["RetenerIsr"] != DBNull.Value)               
                             it.ContratoInversion_RetenerIsr = reader["RetenerIsr"].ToString();
                            if(reader["Subfiso"] != DBNull.Value)               
                             it.ContratoInversion_Subfiso = reader["Subfiso"].ToString();
                            if(reader["FechaVencimiento"] != DBNull.Value)               
                             it.ContratoInversion_FechaVencimiento = DateTime.Parse(reader["FechaVencimiento"].ToString());
                            if(reader["Estatus"] != DBNull.Value)               
                             it.ContratoInversion_Estatus = reader["Estatus"].ToString();
                            if(reader["ContratoIversion"] != DBNull.Value)               
                             it.ContratoInversion_ContratoIversion = reader["ContratoIversion"].ToString();
                            if(reader["ContratoOtrasInst"] != DBNull.Value)               
                             it.ContratoInversion_ContratoOtrasInst = reader["ContratoOtrasInst"].ToString();
                            if(reader["Contacto1Lada"] != DBNull.Value)               
                             it.ContratoInversion_Contacto1Lada = reader["Contacto1Lada"].ToString();
                            if(reader["Contacto1Telefono"] != DBNull.Value)               
                             it.ContratoInversion_Contacto1Telefono = reader["Contacto1Telefono"].ToString();
                            if(reader["Contacto1Ext"] != DBNull.Value)               
                             it.ContratoInversion_Contacto1Ext = reader["Contacto1Ext"].ToString();
                            if(reader["Contacto2Lada"] != DBNull.Value)               
                             it.ContratoInversion_Contacto2Lada = reader["Contacto2Lada"].ToString();
                            if(reader["Contacto2Telefono"] != DBNull.Value)               
                             it.ContratoInversion_Contacto2Telefono = reader["Contacto2Telefono"].ToString();
                            if(reader["Contacto2Ext"] != DBNull.Value)               
                             it.ContratoInversion_Contacto2Ext = reader["Contacto2Ext"].ToString();
                            if(reader["Nombre"] != DBNull.Value)               
                             it.ContratoInversion_Nombre = reader["Nombre"].ToString();
                            if(reader["Cuenta"] != DBNull.Value)               
                             it.ContratoInversion_Cuenta = reader["Cuenta"].ToString();
                            if(reader["TraspasoEntreSubFiso"] != DBNull.Value)               
                             it.ContratoInversion_TraspasoEntreSubFiso = reader["TraspasoEntreSubFiso"].ToString();
                            if(reader["FechaApertura"] != DBNull.Value)               
                             it.ContratoInversion_FechaApertura = DateTime.Parse(reader["FechaApertura"].ToString());
                            if(reader["OrigenRecursos"] != DBNull.Value)               
                             it.ContratoInversion_OrigenRecursos = reader["OrigenRecursos"].ToString();
                   
                   

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
        public Result InsertContratoInversion(ContratoInversion item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spInsertContratoInversion";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
       
                                insertCommand.Parameters.AddWithValue("@Fideicomiso", item.ContratoInversion_Fideicomiso);
  if (item.ContratoInversion_TipoContrato == null) 
                      insertCommand.Parameters.AddWithValue("@TipoContrato", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@TipoContrato", item.ContratoInversion_TipoContrato);


  if (item.ContratoInversion_Intermediario == null) 
                      insertCommand.Parameters.AddWithValue("@Intermediario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Intermediario", item.ContratoInversion_Intermediario);


  if (item.ContratoInversion_Moneda == null) 
                      insertCommand.Parameters.AddWithValue("@Moneda", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Moneda", item.ContratoInversion_Moneda);


  if (item.ContratoInversion_NombreContacto1 == null) 
                      insertCommand.Parameters.AddWithValue("@NombreContacto1", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NombreContacto1", item.ContratoInversion_NombreContacto1);


  if (item.ContratoInversion_NombreContacto2 == null) 
                      insertCommand.Parameters.AddWithValue("@NombreContacto2", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NombreContacto2", item.ContratoInversion_NombreContacto2);


  if (item.ContratoInversion_ResParamLiq == null) 
                      insertCommand.Parameters.AddWithValue("@ResParamLiq", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@ResParamLiq", item.ContratoInversion_ResParamLiq);


  if (item.ContratoInversion_EnvioRecursosInv == null) 
                      insertCommand.Parameters.AddWithValue("@EnvioRecursosInv", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EnvioRecursosInv", item.ContratoInversion_EnvioRecursosInv);


  if (item.ContratoInversion_TransferenciaRecDesinver == null) 
                      insertCommand.Parameters.AddWithValue("@TransferenciaRecDesinver", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@TransferenciaRecDesinver", item.ContratoInversion_TransferenciaRecDesinver);


  if (item.ContratoInversion_RetenerIsr == null) 
                      insertCommand.Parameters.AddWithValue("@RetenerIsr", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@RetenerIsr", item.ContratoInversion_RetenerIsr);


  if (item.ContratoInversion_Subfiso == null) 
                      insertCommand.Parameters.AddWithValue("@Subfiso", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Subfiso", item.ContratoInversion_Subfiso);


  if (item.ContratoInversion_FechaVencimiento == null) 
                      insertCommand.Parameters.AddWithValue("@FechaVencimiento", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@FechaVencimiento", item.ContratoInversion_FechaVencimiento);


  if (item.ContratoInversion_Estatus == null) 
                      insertCommand.Parameters.AddWithValue("@Estatus", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Estatus", item.ContratoInversion_Estatus);


  if (item.ContratoInversion_ContratoIversion == null) 
                      insertCommand.Parameters.AddWithValue("@ContratoIversion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@ContratoIversion", item.ContratoInversion_ContratoIversion);


  if (item.ContratoInversion_ContratoOtrasInst == null) 
                      insertCommand.Parameters.AddWithValue("@ContratoOtrasInst", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@ContratoOtrasInst", item.ContratoInversion_ContratoOtrasInst);


  if (item.ContratoInversion_Contacto1Lada == null) 
                      insertCommand.Parameters.AddWithValue("@Contacto1Lada", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Contacto1Lada", item.ContratoInversion_Contacto1Lada);


  if (item.ContratoInversion_Contacto1Telefono == null) 
                      insertCommand.Parameters.AddWithValue("@Contacto1Telefono", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Contacto1Telefono", item.ContratoInversion_Contacto1Telefono);


  if (item.ContratoInversion_Contacto1Ext == null) 
                      insertCommand.Parameters.AddWithValue("@Contacto1Ext", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Contacto1Ext", item.ContratoInversion_Contacto1Ext);


  if (item.ContratoInversion_Contacto2Lada == null) 
                      insertCommand.Parameters.AddWithValue("@Contacto2Lada", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Contacto2Lada", item.ContratoInversion_Contacto2Lada);


  if (item.ContratoInversion_Contacto2Telefono == null) 
                      insertCommand.Parameters.AddWithValue("@Contacto2Telefono", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Contacto2Telefono", item.ContratoInversion_Contacto2Telefono);


  if (item.ContratoInversion_Contacto2Ext == null) 
                      insertCommand.Parameters.AddWithValue("@Contacto2Ext", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Contacto2Ext", item.ContratoInversion_Contacto2Ext);


  if (item.ContratoInversion_Nombre == null) 
                      insertCommand.Parameters.AddWithValue("@Nombre", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Nombre", item.ContratoInversion_Nombre);


  if (item.ContratoInversion_Cuenta == null) 
                      insertCommand.Parameters.AddWithValue("@Cuenta", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Cuenta", item.ContratoInversion_Cuenta);


  if (item.ContratoInversion_TraspasoEntreSubFiso == null) 
                      insertCommand.Parameters.AddWithValue("@TraspasoEntreSubFiso", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@TraspasoEntreSubFiso", item.ContratoInversion_TraspasoEntreSubFiso);


  if (item.ContratoInversion_FechaApertura == null) 
                      insertCommand.Parameters.AddWithValue("@FechaApertura", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@FechaApertura", item.ContratoInversion_FechaApertura);


  if (item.ContratoInversion_OrigenRecursos == null) 
                      insertCommand.Parameters.AddWithValue("@OrigenRecursos", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@OrigenRecursos", item.ContratoInversion_OrigenRecursos);




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
        public Result UpdateContratoInversion(string id, ContratoInversion item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdateContratoInversion";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                                 insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.ContratoInversion_Fideicomiso);

  if (item.ContratoInversion_TipoContrato == null) 
                                  insertCommand.Parameters.AddWithValue("@TipoContrato", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TipoContrato", item.ContratoInversion_TipoContrato);

    
  if (item.ContratoInversion_Intermediario == null) 
                                  insertCommand.Parameters.AddWithValue("@Intermediario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Intermediario", item.ContratoInversion_Intermediario);

    
  if (item.ContratoInversion_Moneda == null) 
                                  insertCommand.Parameters.AddWithValue("@Moneda", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Moneda", item.ContratoInversion_Moneda);

    
  if (item.ContratoInversion_NombreContacto1 == null) 
                                  insertCommand.Parameters.AddWithValue("@NombreContacto1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombreContacto1", item.ContratoInversion_NombreContacto1);

    
  if (item.ContratoInversion_NombreContacto2 == null) 
                                  insertCommand.Parameters.AddWithValue("@NombreContacto2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombreContacto2", item.ContratoInversion_NombreContacto2);

    
  if (item.ContratoInversion_ResParamLiq == null) 
                                  insertCommand.Parameters.AddWithValue("@ResParamLiq", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ResParamLiq", item.ContratoInversion_ResParamLiq);

    
  if (item.ContratoInversion_EnvioRecursosInv == null) 
                                  insertCommand.Parameters.AddWithValue("@EnvioRecursosInv", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EnvioRecursosInv", item.ContratoInversion_EnvioRecursosInv);

    
  if (item.ContratoInversion_TransferenciaRecDesinver == null) 
                                  insertCommand.Parameters.AddWithValue("@TransferenciaRecDesinver", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TransferenciaRecDesinver", item.ContratoInversion_TransferenciaRecDesinver);

    
  if (item.ContratoInversion_RetenerIsr == null) 
                                  insertCommand.Parameters.AddWithValue("@RetenerIsr", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RetenerIsr", item.ContratoInversion_RetenerIsr);

    
  if (item.ContratoInversion_Subfiso == null) 
                                  insertCommand.Parameters.AddWithValue("@Subfiso", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Subfiso", item.ContratoInversion_Subfiso);

    
  if (item.ContratoInversion_FechaVencimiento == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaVencimiento", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaVencimiento", item.ContratoInversion_FechaVencimiento);

    
  if (item.ContratoInversion_Estatus == null) 
                                  insertCommand.Parameters.AddWithValue("@Estatus", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Estatus", item.ContratoInversion_Estatus);

    
  if (item.ContratoInversion_ContratoIversion == null) 
                                  insertCommand.Parameters.AddWithValue("@ContratoIversion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ContratoIversion", item.ContratoInversion_ContratoIversion);

    
  if (item.ContratoInversion_ContratoOtrasInst == null) 
                                  insertCommand.Parameters.AddWithValue("@ContratoOtrasInst", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ContratoOtrasInst", item.ContratoInversion_ContratoOtrasInst);

    
  if (item.ContratoInversion_Contacto1Lada == null) 
                                  insertCommand.Parameters.AddWithValue("@Contacto1Lada", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Contacto1Lada", item.ContratoInversion_Contacto1Lada);

    
  if (item.ContratoInversion_Contacto1Telefono == null) 
                                  insertCommand.Parameters.AddWithValue("@Contacto1Telefono", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Contacto1Telefono", item.ContratoInversion_Contacto1Telefono);

    
  if (item.ContratoInversion_Contacto1Ext == null) 
                                  insertCommand.Parameters.AddWithValue("@Contacto1Ext", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Contacto1Ext", item.ContratoInversion_Contacto1Ext);

    
  if (item.ContratoInversion_Contacto2Lada == null) 
                                  insertCommand.Parameters.AddWithValue("@Contacto2Lada", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Contacto2Lada", item.ContratoInversion_Contacto2Lada);

    
  if (item.ContratoInversion_Contacto2Telefono == null) 
                                  insertCommand.Parameters.AddWithValue("@Contacto2Telefono", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Contacto2Telefono", item.ContratoInversion_Contacto2Telefono);

    
  if (item.ContratoInversion_Contacto2Ext == null) 
                                  insertCommand.Parameters.AddWithValue("@Contacto2Ext", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Contacto2Ext", item.ContratoInversion_Contacto2Ext);

    
  if (item.ContratoInversion_Nombre == null) 
                                  insertCommand.Parameters.AddWithValue("@Nombre", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Nombre", item.ContratoInversion_Nombre);

    
  if (item.ContratoInversion_Cuenta == null) 
                                  insertCommand.Parameters.AddWithValue("@Cuenta", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Cuenta", item.ContratoInversion_Cuenta);

    
  if (item.ContratoInversion_TraspasoEntreSubFiso == null) 
                                  insertCommand.Parameters.AddWithValue("@TraspasoEntreSubFiso", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TraspasoEntreSubFiso", item.ContratoInversion_TraspasoEntreSubFiso);

    
  if (item.ContratoInversion_FechaApertura == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaApertura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaApertura", item.ContratoInversion_FechaApertura);

    
  if (item.ContratoInversion_OrigenRecursos == null) 
                                  insertCommand.Parameters.AddWithValue("@OrigenRecursos", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@OrigenRecursos", item.ContratoInversion_OrigenRecursos);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.ContratoInversion_ID.ToString(); 
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
        
        public Result UpdatePartialContratoInversion(string id, ContratoInversion item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdatePartialContratoInversion";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                             insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.ContratoInversion_Fideicomiso);

  if (item.ContratoInversion_TipoContrato == null) 
                                  insertCommand.Parameters.AddWithValue("@TipoContrato", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TipoContrato", item.ContratoInversion_TipoContrato);

    
  if (item.ContratoInversion_Intermediario == null) 
                                  insertCommand.Parameters.AddWithValue("@Intermediario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Intermediario", item.ContratoInversion_Intermediario);

    
  if (item.ContratoInversion_Moneda == null) 
                                  insertCommand.Parameters.AddWithValue("@Moneda", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Moneda", item.ContratoInversion_Moneda);

    
  if (item.ContratoInversion_NombreContacto1 == null) 
                                  insertCommand.Parameters.AddWithValue("@NombreContacto1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombreContacto1", item.ContratoInversion_NombreContacto1);

    
  if (item.ContratoInversion_NombreContacto2 == null) 
                                  insertCommand.Parameters.AddWithValue("@NombreContacto2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NombreContacto2", item.ContratoInversion_NombreContacto2);

    
  if (item.ContratoInversion_ResParamLiq == null) 
                                  insertCommand.Parameters.AddWithValue("@ResParamLiq", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ResParamLiq", item.ContratoInversion_ResParamLiq);

    
  if (item.ContratoInversion_EnvioRecursosInv == null) 
                                  insertCommand.Parameters.AddWithValue("@EnvioRecursosInv", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EnvioRecursosInv", item.ContratoInversion_EnvioRecursosInv);

    
  if (item.ContratoInversion_TransferenciaRecDesinver == null) 
                                  insertCommand.Parameters.AddWithValue("@TransferenciaRecDesinver", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TransferenciaRecDesinver", item.ContratoInversion_TransferenciaRecDesinver);

    
  if (item.ContratoInversion_RetenerIsr == null) 
                                  insertCommand.Parameters.AddWithValue("@RetenerIsr", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RetenerIsr", item.ContratoInversion_RetenerIsr);

    
  if (item.ContratoInversion_Subfiso == null) 
                                  insertCommand.Parameters.AddWithValue("@Subfiso", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Subfiso", item.ContratoInversion_Subfiso);

    
  if (item.ContratoInversion_FechaVencimiento == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaVencimiento", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaVencimiento", item.ContratoInversion_FechaVencimiento);

    
  if (item.ContratoInversion_Estatus == null) 
                                  insertCommand.Parameters.AddWithValue("@Estatus", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Estatus", item.ContratoInversion_Estatus);

    
  if (item.ContratoInversion_ContratoIversion == null) 
                                  insertCommand.Parameters.AddWithValue("@ContratoIversion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ContratoIversion", item.ContratoInversion_ContratoIversion);

    
  if (item.ContratoInversion_ContratoOtrasInst == null) 
                                  insertCommand.Parameters.AddWithValue("@ContratoOtrasInst", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ContratoOtrasInst", item.ContratoInversion_ContratoOtrasInst);

    
  if (item.ContratoInversion_Contacto1Lada == null) 
                                  insertCommand.Parameters.AddWithValue("@Contacto1Lada", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Contacto1Lada", item.ContratoInversion_Contacto1Lada);

    
  if (item.ContratoInversion_Contacto1Telefono == null) 
                                  insertCommand.Parameters.AddWithValue("@Contacto1Telefono", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Contacto1Telefono", item.ContratoInversion_Contacto1Telefono);

    
  if (item.ContratoInversion_Contacto1Ext == null) 
                                  insertCommand.Parameters.AddWithValue("@Contacto1Ext", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Contacto1Ext", item.ContratoInversion_Contacto1Ext);

    
  if (item.ContratoInversion_Contacto2Lada == null) 
                                  insertCommand.Parameters.AddWithValue("@Contacto2Lada", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Contacto2Lada", item.ContratoInversion_Contacto2Lada);

    
  if (item.ContratoInversion_Contacto2Telefono == null) 
                                  insertCommand.Parameters.AddWithValue("@Contacto2Telefono", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Contacto2Telefono", item.ContratoInversion_Contacto2Telefono);

    
  if (item.ContratoInversion_Contacto2Ext == null) 
                                  insertCommand.Parameters.AddWithValue("@Contacto2Ext", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Contacto2Ext", item.ContratoInversion_Contacto2Ext);

    
  if (item.ContratoInversion_Nombre == null) 
                                  insertCommand.Parameters.AddWithValue("@Nombre", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Nombre", item.ContratoInversion_Nombre);

    
  if (item.ContratoInversion_Cuenta == null) 
                                  insertCommand.Parameters.AddWithValue("@Cuenta", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Cuenta", item.ContratoInversion_Cuenta);

    
  if (item.ContratoInversion_TraspasoEntreSubFiso == null) 
                                  insertCommand.Parameters.AddWithValue("@TraspasoEntreSubFiso", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TraspasoEntreSubFiso", item.ContratoInversion_TraspasoEntreSubFiso);

    
  if (item.ContratoInversion_FechaApertura == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaApertura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaApertura", item.ContratoInversion_FechaApertura);

    
  if (item.ContratoInversion_OrigenRecursos == null) 
                                  insertCommand.Parameters.AddWithValue("@OrigenRecursos", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@OrigenRecursos", item.ContratoInversion_OrigenRecursos);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.ContratoInversion_ID.ToString(); 
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
