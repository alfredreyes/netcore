//Fecha Creación:5/24/2019 6:13:00 PM Template DataClass, Author: Alfredo Reyes C., V1
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
    public class CuentaChequesData : ICuentaChequesData, IDisposable
    {
        private string _conexion;
       
        public CuentaChequesData(string conexion)
        {
            _conexion = conexion;
        }
        public Result DeleteCuentaCheques(string id)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spDeleteCuentaCheques";
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
                        res.Message = "La entidad CuentaCheques tiene registros que dependen de ella en otra tabla no se pudo eliminar.";
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
        
        public CuentaCheques GetCuentaCheques(string id)
        {
            CuentaCheques entidad = new  CuentaCheques();           

            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetCuentaChequesByID";
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
                         entidad.CuentaCheques_ID = reader["ID"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         entidad.CuentaCheques_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["TipoPersona"] != DBNull.Value)               
                         entidad.CuentaCheques_TipoPersona = reader["TipoPersona"].ToString();
 if(reader["Fideicomitente"] != DBNull.Value)               
                         entidad.CuentaCheques_Fideicomitente = reader["Fideicomitente"].ToString();
 if(reader["TipoCuenta"] != DBNull.Value)               
                         entidad.CuentaCheques_TipoCuenta = reader["TipoCuenta"].ToString();
 if(reader["TipoPago"] != DBNull.Value)               
                         entidad.CuentaCheques_TipoPago = reader["TipoPago"].ToString();
 if(reader["BancoSpei"] != DBNull.Value)               
                         entidad.CuentaCheques_BancoSpei = reader["BancoSpei"].ToString();
 if(reader["Banco"] != DBNull.Value)               
                         entidad.CuentaCheques_Banco = reader["Banco"].ToString();
 if(reader["DomBanco"] != DBNull.Value)               
                         entidad.CuentaCheques_DomBanco = reader["DomBanco"].ToString();
 if(reader["Moneda"] != DBNull.Value)               
                         entidad.CuentaCheques_Moneda = reader["Moneda"].ToString();
 if(reader["ClaveVostro"] != DBNull.Value)               
                         entidad.CuentaCheques_ClaveVostro = reader["ClaveVostro"].ToString();
 if(reader["NumCuenta"] != DBNull.Value)               
                         entidad.CuentaCheques_NumCuenta = reader["NumCuenta"].ToString();
 if(reader["DomBeneficiario"] != DBNull.Value)               
                         entidad.CuentaCheques_DomBeneficiario = reader["DomBeneficiario"].ToString();
 if(reader["PlazaInternacional"] != DBNull.Value)               
                         entidad.CuentaCheques_PlazaInternacional = reader["PlazaInternacional"].ToString();
 if(reader["Pais"] != DBNull.Value)               
                         entidad.CuentaCheques_Pais = reader["Pais"].ToString();
 if(reader["ClaveSiacInst"] != DBNull.Value)               
                         entidad.CuentaCheques_ClaveSiacInst = reader["ClaveSiacInst"].ToString();
 if(reader["ConvenioCieDie"] != DBNull.Value)               
                         entidad.CuentaCheques_ConvenioCieDie = reader["ConvenioCieDie"].ToString();
 if(reader["Estatus"] != DBNull.Value)               
                         entidad.CuentaCheques_Estatus = reader["Estatus"].ToString();
 if(reader["Clabe"] != DBNull.Value)               
                         entidad.CuentaCheques_Clabe = reader["Clabe"].ToString();
 if(reader["CuentaChequera"] != DBNull.Value)               
                         entidad.CuentaCheques_CuentaChequera = reader["CuentaChequera"].ToString();
 if(reader["FechaVence"] != DBNull.Value)               
                         entidad.CuentaCheques_FechaVence = reader["FechaVence"].ToString();
 if(reader["NumAbbasSwift"] != DBNull.Value)               
                         entidad.CuentaCheques_NumAbbasSwift = reader["NumAbbasSwift"].ToString();
 if(reader["ConceptoSiac"] != DBNull.Value)               
                         entidad.CuentaCheques_ConceptoSiac = reader["ConceptoSiac"].ToString();
 if(reader["RefCieDie"] != DBNull.Value)               
                         entidad.CuentaCheques_RefCieDie = reader["RefCieDie"].ToString();
 if(reader["Autorizacion"] != DBNull.Value)               
                         entidad.CuentaCheques_Autorizacion = reader["Autorizacion"].ToString();
                   
                      if(reader["GeneralesNumero1"] != DBNull.Value){
                             entidad.MyFideicomiso1 = new  Fideicomiso();  
                             entidad.MyFideicomiso1.Fideicomiso_GeneralesNumero = Int32.Parse(reader["GeneralesNumero1"].ToString());
                        }
 if(reader["NumeroFideicomitente2"] != DBNull.Value){
                             entidad.MyFideicomitente2 = new  Fideicomitente();  
                             entidad.MyFideicomitente2.Fideicomitente_NumeroFideicomitente = reader["NumeroFideicomitente2"].ToString();
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
        public List<CuentaCheques> GetCuentaChequessAndRelations(int page, int numrecords)
        {
            List<CuentaCheques> lista = new List<CuentaCheques>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListCuentaChequesPaged";
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
                    var it = new CuentaCheques();
            
                      if(reader["ID"] != DBNull.Value)               
                         it.CuentaCheques_ID = reader["ID"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         it.CuentaCheques_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["TipoPersona"] != DBNull.Value)               
                         it.CuentaCheques_TipoPersona = reader["TipoPersona"].ToString();
 if(reader["Fideicomitente"] != DBNull.Value)               
                         it.CuentaCheques_Fideicomitente = reader["Fideicomitente"].ToString();
 if(reader["TipoCuenta"] != DBNull.Value)               
                         it.CuentaCheques_TipoCuenta = reader["TipoCuenta"].ToString();
 if(reader["TipoPago"] != DBNull.Value)               
                         it.CuentaCheques_TipoPago = reader["TipoPago"].ToString();
 if(reader["BancoSpei"] != DBNull.Value)               
                         it.CuentaCheques_BancoSpei = reader["BancoSpei"].ToString();
 if(reader["Banco"] != DBNull.Value)               
                         it.CuentaCheques_Banco = reader["Banco"].ToString();
 if(reader["DomBanco"] != DBNull.Value)               
                         it.CuentaCheques_DomBanco = reader["DomBanco"].ToString();
 if(reader["Moneda"] != DBNull.Value)               
                         it.CuentaCheques_Moneda = reader["Moneda"].ToString();
 if(reader["ClaveVostro"] != DBNull.Value)               
                         it.CuentaCheques_ClaveVostro = reader["ClaveVostro"].ToString();
 if(reader["NumCuenta"] != DBNull.Value)               
                         it.CuentaCheques_NumCuenta = reader["NumCuenta"].ToString();
 if(reader["DomBeneficiario"] != DBNull.Value)               
                         it.CuentaCheques_DomBeneficiario = reader["DomBeneficiario"].ToString();
 if(reader["PlazaInternacional"] != DBNull.Value)               
                         it.CuentaCheques_PlazaInternacional = reader["PlazaInternacional"].ToString();
 if(reader["Pais"] != DBNull.Value)               
                         it.CuentaCheques_Pais = reader["Pais"].ToString();
 if(reader["ClaveSiacInst"] != DBNull.Value)               
                         it.CuentaCheques_ClaveSiacInst = reader["ClaveSiacInst"].ToString();
 if(reader["ConvenioCieDie"] != DBNull.Value)               
                         it.CuentaCheques_ConvenioCieDie = reader["ConvenioCieDie"].ToString();
 if(reader["Estatus"] != DBNull.Value)               
                         it.CuentaCheques_Estatus = reader["Estatus"].ToString();
 if(reader["Clabe"] != DBNull.Value)               
                         it.CuentaCheques_Clabe = reader["Clabe"].ToString();
 if(reader["CuentaChequera"] != DBNull.Value)               
                         it.CuentaCheques_CuentaChequera = reader["CuentaChequera"].ToString();
 if(reader["FechaVence"] != DBNull.Value)               
                         it.CuentaCheques_FechaVence = reader["FechaVence"].ToString();
 if(reader["NumAbbasSwift"] != DBNull.Value)               
                         it.CuentaCheques_NumAbbasSwift = reader["NumAbbasSwift"].ToString();
 if(reader["ConceptoSiac"] != DBNull.Value)               
                         it.CuentaCheques_ConceptoSiac = reader["ConceptoSiac"].ToString();
 if(reader["RefCieDie"] != DBNull.Value)               
                         it.CuentaCheques_RefCieDie = reader["RefCieDie"].ToString();
 if(reader["Autorizacion"] != DBNull.Value)               
                         it.CuentaCheques_Autorizacion = reader["Autorizacion"].ToString();
                   
                      if(reader["GeneralesNumero1"] != DBNull.Value){
                             it.MyFideicomiso1 = new  Fideicomiso();  
                             it.MyFideicomiso1.Fideicomiso_GeneralesNumero = Int32.Parse(reader["GeneralesNumero1"].ToString());
                        }
 if(reader["NumeroFideicomitente2"] != DBNull.Value){
                             it.MyFideicomitente2 = new  Fideicomitente();  
                             it.MyFideicomitente2.Fideicomitente_NumeroFideicomitente = reader["NumeroFideicomitente2"].ToString();
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
        public List<CuentaCheques> GetCuentaChequess(int page, int numrecords)
        {
            List<CuentaCheques> lista = new List<CuentaCheques>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListCuentaChequesPaged";
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
                    var it = new CuentaCheques();
            
                            if(reader["ID"] != DBNull.Value)               
                             it.CuentaCheques_ID = reader["ID"].ToString();
                            if(reader["Fideicomiso"] != DBNull.Value)               
                             it.CuentaCheques_Fideicomiso = reader["Fideicomiso"].ToString();
                            if(reader["TipoPersona"] != DBNull.Value)               
                             it.CuentaCheques_TipoPersona = reader["TipoPersona"].ToString();
                            if(reader["Fideicomitente"] != DBNull.Value)               
                             it.CuentaCheques_Fideicomitente = reader["Fideicomitente"].ToString();
                            if(reader["TipoCuenta"] != DBNull.Value)               
                             it.CuentaCheques_TipoCuenta = reader["TipoCuenta"].ToString();
                            if(reader["TipoPago"] != DBNull.Value)               
                             it.CuentaCheques_TipoPago = reader["TipoPago"].ToString();
                            if(reader["BancoSpei"] != DBNull.Value)               
                             it.CuentaCheques_BancoSpei = reader["BancoSpei"].ToString();
                            if(reader["Banco"] != DBNull.Value)               
                             it.CuentaCheques_Banco = reader["Banco"].ToString();
                            if(reader["DomBanco"] != DBNull.Value)               
                             it.CuentaCheques_DomBanco = reader["DomBanco"].ToString();
                            if(reader["Moneda"] != DBNull.Value)               
                             it.CuentaCheques_Moneda = reader["Moneda"].ToString();
                            if(reader["ClaveVostro"] != DBNull.Value)               
                             it.CuentaCheques_ClaveVostro = reader["ClaveVostro"].ToString();
                            if(reader["NumCuenta"] != DBNull.Value)               
                             it.CuentaCheques_NumCuenta = reader["NumCuenta"].ToString();
                            if(reader["DomBeneficiario"] != DBNull.Value)               
                             it.CuentaCheques_DomBeneficiario = reader["DomBeneficiario"].ToString();
                            if(reader["PlazaInternacional"] != DBNull.Value)               
                             it.CuentaCheques_PlazaInternacional = reader["PlazaInternacional"].ToString();
                            if(reader["Pais"] != DBNull.Value)               
                             it.CuentaCheques_Pais = reader["Pais"].ToString();
                            if(reader["ClaveSiacInst"] != DBNull.Value)               
                             it.CuentaCheques_ClaveSiacInst = reader["ClaveSiacInst"].ToString();
                            if(reader["ConvenioCieDie"] != DBNull.Value)               
                             it.CuentaCheques_ConvenioCieDie = reader["ConvenioCieDie"].ToString();
                            if(reader["Estatus"] != DBNull.Value)               
                             it.CuentaCheques_Estatus = reader["Estatus"].ToString();
                            if(reader["Clabe"] != DBNull.Value)               
                             it.CuentaCheques_Clabe = reader["Clabe"].ToString();
                            if(reader["CuentaChequera"] != DBNull.Value)               
                             it.CuentaCheques_CuentaChequera = reader["CuentaChequera"].ToString();
                            if(reader["FechaVence"] != DBNull.Value)               
                             it.CuentaCheques_FechaVence = reader["FechaVence"].ToString();
                            if(reader["NumAbbasSwift"] != DBNull.Value)               
                             it.CuentaCheques_NumAbbasSwift = reader["NumAbbasSwift"].ToString();
                            if(reader["ConceptoSiac"] != DBNull.Value)               
                             it.CuentaCheques_ConceptoSiac = reader["ConceptoSiac"].ToString();
                            if(reader["RefCieDie"] != DBNull.Value)               
                             it.CuentaCheques_RefCieDie = reader["RefCieDie"].ToString();
                            if(reader["Autorizacion"] != DBNull.Value)               
                             it.CuentaCheques_Autorizacion = reader["Autorizacion"].ToString();
                   
                   

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
        public Result InsertCuentaCheques(CuentaCheques item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spInsertCuentaCheques";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
       
                                insertCommand.Parameters.AddWithValue("@Fideicomiso", item.CuentaCheques_Fideicomiso);
                    insertCommand.Parameters.AddWithValue("@TipoPersona", item.CuentaCheques_TipoPersona);
                    insertCommand.Parameters.AddWithValue("@Fideicomitente", item.CuentaCheques_Fideicomitente);
                    insertCommand.Parameters.AddWithValue("@TipoCuenta", item.CuentaCheques_TipoCuenta);
  if (item.CuentaCheques_TipoPago == null) 
                      insertCommand.Parameters.AddWithValue("@TipoPago", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@TipoPago", item.CuentaCheques_TipoPago);


  if (item.CuentaCheques_BancoSpei == null) 
                      insertCommand.Parameters.AddWithValue("@BancoSpei", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@BancoSpei", item.CuentaCheques_BancoSpei);


  if (item.CuentaCheques_Banco == null) 
                      insertCommand.Parameters.AddWithValue("@Banco", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Banco", item.CuentaCheques_Banco);


  if (item.CuentaCheques_DomBanco == null) 
                      insertCommand.Parameters.AddWithValue("@DomBanco", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@DomBanco", item.CuentaCheques_DomBanco);


  if (item.CuentaCheques_Moneda == null) 
                      insertCommand.Parameters.AddWithValue("@Moneda", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Moneda", item.CuentaCheques_Moneda);


  if (item.CuentaCheques_ClaveVostro == null) 
                      insertCommand.Parameters.AddWithValue("@ClaveVostro", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@ClaveVostro", item.CuentaCheques_ClaveVostro);


  if (item.CuentaCheques_NumCuenta == null) 
                      insertCommand.Parameters.AddWithValue("@NumCuenta", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NumCuenta", item.CuentaCheques_NumCuenta);


  if (item.CuentaCheques_DomBeneficiario == null) 
                      insertCommand.Parameters.AddWithValue("@DomBeneficiario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@DomBeneficiario", item.CuentaCheques_DomBeneficiario);


  if (item.CuentaCheques_PlazaInternacional == null) 
                      insertCommand.Parameters.AddWithValue("@PlazaInternacional", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@PlazaInternacional", item.CuentaCheques_PlazaInternacional);


  if (item.CuentaCheques_Pais == null) 
                      insertCommand.Parameters.AddWithValue("@Pais", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Pais", item.CuentaCheques_Pais);


  if (item.CuentaCheques_ClaveSiacInst == null) 
                      insertCommand.Parameters.AddWithValue("@ClaveSiacInst", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@ClaveSiacInst", item.CuentaCheques_ClaveSiacInst);


  if (item.CuentaCheques_ConvenioCieDie == null) 
                      insertCommand.Parameters.AddWithValue("@ConvenioCieDie", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@ConvenioCieDie", item.CuentaCheques_ConvenioCieDie);


  if (item.CuentaCheques_Estatus == null) 
                      insertCommand.Parameters.AddWithValue("@Estatus", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Estatus", item.CuentaCheques_Estatus);


  if (item.CuentaCheques_Clabe == null) 
                      insertCommand.Parameters.AddWithValue("@Clabe", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Clabe", item.CuentaCheques_Clabe);


                    insertCommand.Parameters.AddWithValue("@CuentaChequera", item.CuentaCheques_CuentaChequera);
  if (item.CuentaCheques_FechaVence == null) 
                      insertCommand.Parameters.AddWithValue("@FechaVence", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@FechaVence", item.CuentaCheques_FechaVence);


  if (item.CuentaCheques_NumAbbasSwift == null) 
                      insertCommand.Parameters.AddWithValue("@NumAbbasSwift", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NumAbbasSwift", item.CuentaCheques_NumAbbasSwift);


  if (item.CuentaCheques_ConceptoSiac == null) 
                      insertCommand.Parameters.AddWithValue("@ConceptoSiac", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@ConceptoSiac", item.CuentaCheques_ConceptoSiac);


  if (item.CuentaCheques_RefCieDie == null) 
                      insertCommand.Parameters.AddWithValue("@RefCieDie", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@RefCieDie", item.CuentaCheques_RefCieDie);


  if (item.CuentaCheques_Autorizacion == null) 
                      insertCommand.Parameters.AddWithValue("@Autorizacion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Autorizacion", item.CuentaCheques_Autorizacion);




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
        public Result UpdateCuentaCheques(string id, CuentaCheques item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdateCuentaCheques";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                                 insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.CuentaCheques_Fideicomiso);

                                    insertCommand.Parameters.AddWithValue("@TipoPersona", item.CuentaCheques_TipoPersona);

                                    insertCommand.Parameters.AddWithValue("@Fideicomitente", item.CuentaCheques_Fideicomitente);

                                    insertCommand.Parameters.AddWithValue("@TipoCuenta", item.CuentaCheques_TipoCuenta);

  if (item.CuentaCheques_TipoPago == null) 
                                  insertCommand.Parameters.AddWithValue("@TipoPago", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TipoPago", item.CuentaCheques_TipoPago);

    
  if (item.CuentaCheques_BancoSpei == null) 
                                  insertCommand.Parameters.AddWithValue("@BancoSpei", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@BancoSpei", item.CuentaCheques_BancoSpei);

    
  if (item.CuentaCheques_Banco == null) 
                                  insertCommand.Parameters.AddWithValue("@Banco", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Banco", item.CuentaCheques_Banco);

    
  if (item.CuentaCheques_DomBanco == null) 
                                  insertCommand.Parameters.AddWithValue("@DomBanco", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DomBanco", item.CuentaCheques_DomBanco);

    
  if (item.CuentaCheques_Moneda == null) 
                                  insertCommand.Parameters.AddWithValue("@Moneda", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Moneda", item.CuentaCheques_Moneda);

    
  if (item.CuentaCheques_ClaveVostro == null) 
                                  insertCommand.Parameters.AddWithValue("@ClaveVostro", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ClaveVostro", item.CuentaCheques_ClaveVostro);

    
  if (item.CuentaCheques_NumCuenta == null) 
                                  insertCommand.Parameters.AddWithValue("@NumCuenta", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NumCuenta", item.CuentaCheques_NumCuenta);

    
  if (item.CuentaCheques_DomBeneficiario == null) 
                                  insertCommand.Parameters.AddWithValue("@DomBeneficiario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DomBeneficiario", item.CuentaCheques_DomBeneficiario);

    
  if (item.CuentaCheques_PlazaInternacional == null) 
                                  insertCommand.Parameters.AddWithValue("@PlazaInternacional", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PlazaInternacional", item.CuentaCheques_PlazaInternacional);

    
  if (item.CuentaCheques_Pais == null) 
                                  insertCommand.Parameters.AddWithValue("@Pais", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Pais", item.CuentaCheques_Pais);

    
  if (item.CuentaCheques_ClaveSiacInst == null) 
                                  insertCommand.Parameters.AddWithValue("@ClaveSiacInst", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ClaveSiacInst", item.CuentaCheques_ClaveSiacInst);

    
  if (item.CuentaCheques_ConvenioCieDie == null) 
                                  insertCommand.Parameters.AddWithValue("@ConvenioCieDie", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ConvenioCieDie", item.CuentaCheques_ConvenioCieDie);

    
  if (item.CuentaCheques_Estatus == null) 
                                  insertCommand.Parameters.AddWithValue("@Estatus", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Estatus", item.CuentaCheques_Estatus);

    
  if (item.CuentaCheques_Clabe == null) 
                                  insertCommand.Parameters.AddWithValue("@Clabe", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Clabe", item.CuentaCheques_Clabe);

    
                                    insertCommand.Parameters.AddWithValue("@CuentaChequera", item.CuentaCheques_CuentaChequera);

  if (item.CuentaCheques_FechaVence == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaVence", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaVence", item.CuentaCheques_FechaVence);

    
  if (item.CuentaCheques_NumAbbasSwift == null) 
                                  insertCommand.Parameters.AddWithValue("@NumAbbasSwift", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NumAbbasSwift", item.CuentaCheques_NumAbbasSwift);

    
  if (item.CuentaCheques_ConceptoSiac == null) 
                                  insertCommand.Parameters.AddWithValue("@ConceptoSiac", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ConceptoSiac", item.CuentaCheques_ConceptoSiac);

    
  if (item.CuentaCheques_RefCieDie == null) 
                                  insertCommand.Parameters.AddWithValue("@RefCieDie", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RefCieDie", item.CuentaCheques_RefCieDie);

    
  if (item.CuentaCheques_Autorizacion == null) 
                                  insertCommand.Parameters.AddWithValue("@Autorizacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Autorizacion", item.CuentaCheques_Autorizacion);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.CuentaCheques_ID.ToString(); 
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
        
        public Result UpdatePartialCuentaCheques(string id, CuentaCheques item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdatePartialCuentaCheques";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                             insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.CuentaCheques_Fideicomiso);

                                    insertCommand.Parameters.AddWithValue("@TipoPersona", item.CuentaCheques_TipoPersona);

                                    insertCommand.Parameters.AddWithValue("@Fideicomitente", item.CuentaCheques_Fideicomitente);

                                    insertCommand.Parameters.AddWithValue("@TipoCuenta", item.CuentaCheques_TipoCuenta);

  if (item.CuentaCheques_TipoPago == null) 
                                  insertCommand.Parameters.AddWithValue("@TipoPago", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TipoPago", item.CuentaCheques_TipoPago);

    
  if (item.CuentaCheques_BancoSpei == null) 
                                  insertCommand.Parameters.AddWithValue("@BancoSpei", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@BancoSpei", item.CuentaCheques_BancoSpei);

    
  if (item.CuentaCheques_Banco == null) 
                                  insertCommand.Parameters.AddWithValue("@Banco", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Banco", item.CuentaCheques_Banco);

    
  if (item.CuentaCheques_DomBanco == null) 
                                  insertCommand.Parameters.AddWithValue("@DomBanco", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DomBanco", item.CuentaCheques_DomBanco);

    
  if (item.CuentaCheques_Moneda == null) 
                                  insertCommand.Parameters.AddWithValue("@Moneda", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Moneda", item.CuentaCheques_Moneda);

    
  if (item.CuentaCheques_ClaveVostro == null) 
                                  insertCommand.Parameters.AddWithValue("@ClaveVostro", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ClaveVostro", item.CuentaCheques_ClaveVostro);

    
  if (item.CuentaCheques_NumCuenta == null) 
                                  insertCommand.Parameters.AddWithValue("@NumCuenta", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NumCuenta", item.CuentaCheques_NumCuenta);

    
  if (item.CuentaCheques_DomBeneficiario == null) 
                                  insertCommand.Parameters.AddWithValue("@DomBeneficiario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DomBeneficiario", item.CuentaCheques_DomBeneficiario);

    
  if (item.CuentaCheques_PlazaInternacional == null) 
                                  insertCommand.Parameters.AddWithValue("@PlazaInternacional", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PlazaInternacional", item.CuentaCheques_PlazaInternacional);

    
  if (item.CuentaCheques_Pais == null) 
                                  insertCommand.Parameters.AddWithValue("@Pais", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Pais", item.CuentaCheques_Pais);

    
  if (item.CuentaCheques_ClaveSiacInst == null) 
                                  insertCommand.Parameters.AddWithValue("@ClaveSiacInst", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ClaveSiacInst", item.CuentaCheques_ClaveSiacInst);

    
  if (item.CuentaCheques_ConvenioCieDie == null) 
                                  insertCommand.Parameters.AddWithValue("@ConvenioCieDie", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ConvenioCieDie", item.CuentaCheques_ConvenioCieDie);

    
  if (item.CuentaCheques_Estatus == null) 
                                  insertCommand.Parameters.AddWithValue("@Estatus", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Estatus", item.CuentaCheques_Estatus);

    
  if (item.CuentaCheques_Clabe == null) 
                                  insertCommand.Parameters.AddWithValue("@Clabe", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Clabe", item.CuentaCheques_Clabe);

    
                                    insertCommand.Parameters.AddWithValue("@CuentaChequera", item.CuentaCheques_CuentaChequera);

  if (item.CuentaCheques_FechaVence == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaVence", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaVence", item.CuentaCheques_FechaVence);

    
  if (item.CuentaCheques_NumAbbasSwift == null) 
                                  insertCommand.Parameters.AddWithValue("@NumAbbasSwift", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@NumAbbasSwift", item.CuentaCheques_NumAbbasSwift);

    
  if (item.CuentaCheques_ConceptoSiac == null) 
                                  insertCommand.Parameters.AddWithValue("@ConceptoSiac", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ConceptoSiac", item.CuentaCheques_ConceptoSiac);

    
  if (item.CuentaCheques_RefCieDie == null) 
                                  insertCommand.Parameters.AddWithValue("@RefCieDie", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@RefCieDie", item.CuentaCheques_RefCieDie);

    
  if (item.CuentaCheques_Autorizacion == null) 
                                  insertCommand.Parameters.AddWithValue("@Autorizacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Autorizacion", item.CuentaCheques_Autorizacion);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.CuentaCheques_ID.ToString(); 
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
