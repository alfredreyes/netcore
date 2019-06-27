//Fecha Creación:5/24/2019 6:13:30 PM Template DataClass, Author: Alfredo Reyes C., V1
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
    public class ParametrosComisionesData : IParametrosComisionesData, IDisposable
    {
        private string _conexion;
       
        public ParametrosComisionesData(string conexion)
        {
            _conexion = conexion;
        }
        public Result DeleteParametrosComisiones(string id)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spDeleteParametrosComisiones";
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
                        res.Message = "La entidad ParametrosComisiones tiene registros que dependen de ella en otra tabla no se pudo eliminar.";
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
        
        public ParametrosComisiones GetParametrosComisiones(string id)
        {
            ParametrosComisiones entidad = new  ParametrosComisiones();           

            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetParametrosComisionesByID";
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
                         entidad.ParametrosComisiones_ID = reader["ID"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         entidad.ParametrosComisiones_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["TipoCalculo"] != DBNull.Value)               
                         entidad.ParametrosComisiones_TipoCalculo = reader["TipoCalculo"].ToString();
 if(reader["AQuienSeCobra"] != DBNull.Value)               
                         entidad.ParametrosComisiones_AQuienSeCobra = reader["AQuienSeCobra"].ToString();
 if(reader["MontoAceptacion"] != DBNull.Value)               
                         entidad.ParametrosComisiones_MontoAceptacion = Double.Parse(reader["MontoAceptacion"].ToString());
 if(reader["ImporteAnualizado"] != DBNull.Value)               
                         entidad.ParametrosComisiones_ImporteAnualizado = reader["ImporteAnualizado"].ToString();
 if(reader["Periodicidad"] != DBNull.Value)               
                         entidad.ParametrosComisiones_Periodicidad = reader["Periodicidad"].ToString();
 if(reader["CalculoAlDiaPrimero"] != DBNull.Value)               
                         entidad.ParametrosComisiones_CalculoAlDiaPrimero = reader["CalculoAlDiaPrimero"].ToString();
 if(reader["Reevaluacion"] != DBNull.Value)               
                         entidad.ParametrosComisiones_Reevaluacion = reader["Reevaluacion"].ToString();
 if(reader["FechaConstitucion"] != DBNull.Value)               
                         entidad.ParametrosComisiones_FechaConstitucion = DateTime.Parse(reader["FechaConstitucion"].ToString());
 if(reader["FechaPivote"] != DBNull.Value)               
                         entidad.ParametrosComisiones_FechaPivote = DateTime.Parse(reader["FechaPivote"].ToString());
 if(reader["FechaProxCalculo"] != DBNull.Value)               
                         entidad.ParametrosComisiones_FechaProxCalculo = DateTime.Parse(reader["FechaProxCalculo"].ToString());
 if(reader["MetodoPago"] != DBNull.Value)               
                         entidad.ParametrosComisiones_MetodoPago = reader["MetodoPago"].ToString();
 if(reader["AQuienFactura"] != DBNull.Value)               
                         entidad.ParametrosComisiones_AQuienFactura = reader["AQuienFactura"].ToString();
 if(reader["Nombre"] != DBNull.Value)               
                         entidad.ParametrosComisiones_Nombre = reader["Nombre"].ToString();
 if(reader["Comentario"] != DBNull.Value)               
                         entidad.ParametrosComisiones_Comentario = reader["Comentario"].ToString();
 if(reader["Estatus"] != DBNull.Value)               
                         entidad.ParametrosComisiones_Estatus = reader["Estatus"].ToString();
 if(reader["PenasConvencionales"] != DBNull.Value)               
                         entidad.ParametrosComisiones_PenasConvencionales = reader["PenasConvencionales"].ToString();
 if(reader["Moneda"] != DBNull.Value)               
                         entidad.ParametrosComisiones_Moneda = reader["Moneda"].ToString();
 if(reader["Interes"] != DBNull.Value)               
                         entidad.ParametrosComisiones_Interes = reader["Interes"].ToString();
 if(reader["TipoIva"] != DBNull.Value)               
                         entidad.ParametrosComisiones_TipoIva = reader["TipoIva"].ToString();
 if(reader["DiaCorte"] != DBNull.Value)               
                         entidad.ParametrosComisiones_DiaCorte = Int32.Parse(reader["DiaCorte"].ToString());
 if(reader["FechaPrimerCalculo"] != DBNull.Value)               
                         entidad.ParametrosComisiones_FechaPrimerCalculo = DateTime.Parse(reader["FechaPrimerCalculo"].ToString());
 if(reader["FechaUltimoCalculo"] != DBNull.Value)               
                         entidad.ParametrosComisiones_FechaUltimoCalculo = DateTime.Parse(reader["FechaUltimoCalculo"].ToString());
 if(reader["CuentaPago"] != DBNull.Value)               
                         entidad.ParametrosComisiones_CuentaPago = reader["CuentaPago"].ToString();
 if(reader["Numero"] != DBNull.Value)               
                         entidad.ParametrosComisiones_Numero = reader["Numero"].ToString();
 if(reader["SituacionMorosidad"] != DBNull.Value)               
                         entidad.ParametrosComisiones_SituacionMorosidad = reader["SituacionMorosidad"].ToString();
                   
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
        public List<ParametrosComisiones> GetParametrosComisionessAndRelations(int page, int numrecords)
        {
            List<ParametrosComisiones> lista = new List<ParametrosComisiones>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListParametrosComisionesPaged";
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
                    var it = new ParametrosComisiones();
            
                      if(reader["ID"] != DBNull.Value)               
                         it.ParametrosComisiones_ID = reader["ID"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         it.ParametrosComisiones_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["TipoCalculo"] != DBNull.Value)               
                         it.ParametrosComisiones_TipoCalculo = reader["TipoCalculo"].ToString();
 if(reader["AQuienSeCobra"] != DBNull.Value)               
                         it.ParametrosComisiones_AQuienSeCobra = reader["AQuienSeCobra"].ToString();
 if(reader["MontoAceptacion"] != DBNull.Value)               
                         it.ParametrosComisiones_MontoAceptacion = Double.Parse(reader["MontoAceptacion"].ToString());
 if(reader["ImporteAnualizado"] != DBNull.Value)               
                         it.ParametrosComisiones_ImporteAnualizado = reader["ImporteAnualizado"].ToString();
 if(reader["Periodicidad"] != DBNull.Value)               
                         it.ParametrosComisiones_Periodicidad = reader["Periodicidad"].ToString();
 if(reader["CalculoAlDiaPrimero"] != DBNull.Value)               
                         it.ParametrosComisiones_CalculoAlDiaPrimero = reader["CalculoAlDiaPrimero"].ToString();
 if(reader["Reevaluacion"] != DBNull.Value)               
                         it.ParametrosComisiones_Reevaluacion = reader["Reevaluacion"].ToString();
 if(reader["FechaConstitucion"] != DBNull.Value)               
                         it.ParametrosComisiones_FechaConstitucion = DateTime.Parse(reader["FechaConstitucion"].ToString());
 if(reader["FechaPivote"] != DBNull.Value)               
                         it.ParametrosComisiones_FechaPivote = DateTime.Parse(reader["FechaPivote"].ToString());
 if(reader["FechaProxCalculo"] != DBNull.Value)               
                         it.ParametrosComisiones_FechaProxCalculo = DateTime.Parse(reader["FechaProxCalculo"].ToString());
 if(reader["MetodoPago"] != DBNull.Value)               
                         it.ParametrosComisiones_MetodoPago = reader["MetodoPago"].ToString();
 if(reader["AQuienFactura"] != DBNull.Value)               
                         it.ParametrosComisiones_AQuienFactura = reader["AQuienFactura"].ToString();
 if(reader["Nombre"] != DBNull.Value)               
                         it.ParametrosComisiones_Nombre = reader["Nombre"].ToString();
 if(reader["Comentario"] != DBNull.Value)               
                         it.ParametrosComisiones_Comentario = reader["Comentario"].ToString();
 if(reader["Estatus"] != DBNull.Value)               
                         it.ParametrosComisiones_Estatus = reader["Estatus"].ToString();
 if(reader["PenasConvencionales"] != DBNull.Value)               
                         it.ParametrosComisiones_PenasConvencionales = reader["PenasConvencionales"].ToString();
 if(reader["Moneda"] != DBNull.Value)               
                         it.ParametrosComisiones_Moneda = reader["Moneda"].ToString();
 if(reader["Interes"] != DBNull.Value)               
                         it.ParametrosComisiones_Interes = reader["Interes"].ToString();
 if(reader["TipoIva"] != DBNull.Value)               
                         it.ParametrosComisiones_TipoIva = reader["TipoIva"].ToString();
 if(reader["DiaCorte"] != DBNull.Value)               
                         it.ParametrosComisiones_DiaCorte = Int32.Parse(reader["DiaCorte"].ToString());
 if(reader["FechaPrimerCalculo"] != DBNull.Value)               
                         it.ParametrosComisiones_FechaPrimerCalculo = DateTime.Parse(reader["FechaPrimerCalculo"].ToString());
 if(reader["FechaUltimoCalculo"] != DBNull.Value)               
                         it.ParametrosComisiones_FechaUltimoCalculo = DateTime.Parse(reader["FechaUltimoCalculo"].ToString());
 if(reader["CuentaPago"] != DBNull.Value)               
                         it.ParametrosComisiones_CuentaPago = reader["CuentaPago"].ToString();
 if(reader["Numero"] != DBNull.Value)               
                         it.ParametrosComisiones_Numero = reader["Numero"].ToString();
 if(reader["SituacionMorosidad"] != DBNull.Value)               
                         it.ParametrosComisiones_SituacionMorosidad = reader["SituacionMorosidad"].ToString();
                   
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
        public List<ParametrosComisiones> GetParametrosComisioness(int page, int numrecords)
        {
            List<ParametrosComisiones> lista = new List<ParametrosComisiones>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListParametrosComisionesPaged";
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
                    var it = new ParametrosComisiones();
            
                            if(reader["ID"] != DBNull.Value)               
                             it.ParametrosComisiones_ID = reader["ID"].ToString();
                            if(reader["Fideicomiso"] != DBNull.Value)               
                             it.ParametrosComisiones_Fideicomiso = reader["Fideicomiso"].ToString();
                            if(reader["TipoCalculo"] != DBNull.Value)               
                             it.ParametrosComisiones_TipoCalculo = reader["TipoCalculo"].ToString();
                            if(reader["AQuienSeCobra"] != DBNull.Value)               
                             it.ParametrosComisiones_AQuienSeCobra = reader["AQuienSeCobra"].ToString();
                            if(reader["MontoAceptacion"] != DBNull.Value)               
                             it.ParametrosComisiones_MontoAceptacion = Double.Parse(reader["MontoAceptacion"].ToString());
                            if(reader["ImporteAnualizado"] != DBNull.Value)               
                             it.ParametrosComisiones_ImporteAnualizado = reader["ImporteAnualizado"].ToString();
                            if(reader["Periodicidad"] != DBNull.Value)               
                             it.ParametrosComisiones_Periodicidad = reader["Periodicidad"].ToString();
                            if(reader["CalculoAlDiaPrimero"] != DBNull.Value)               
                             it.ParametrosComisiones_CalculoAlDiaPrimero = reader["CalculoAlDiaPrimero"].ToString();
                            if(reader["Reevaluacion"] != DBNull.Value)               
                             it.ParametrosComisiones_Reevaluacion = reader["Reevaluacion"].ToString();
                            if(reader["FechaConstitucion"] != DBNull.Value)               
                             it.ParametrosComisiones_FechaConstitucion = DateTime.Parse(reader["FechaConstitucion"].ToString());
                            if(reader["FechaPivote"] != DBNull.Value)               
                             it.ParametrosComisiones_FechaPivote = DateTime.Parse(reader["FechaPivote"].ToString());
                            if(reader["FechaProxCalculo"] != DBNull.Value)               
                             it.ParametrosComisiones_FechaProxCalculo = DateTime.Parse(reader["FechaProxCalculo"].ToString());
                            if(reader["MetodoPago"] != DBNull.Value)               
                             it.ParametrosComisiones_MetodoPago = reader["MetodoPago"].ToString();
                            if(reader["AQuienFactura"] != DBNull.Value)               
                             it.ParametrosComisiones_AQuienFactura = reader["AQuienFactura"].ToString();
                            if(reader["Nombre"] != DBNull.Value)               
                             it.ParametrosComisiones_Nombre = reader["Nombre"].ToString();
                            if(reader["Comentario"] != DBNull.Value)               
                             it.ParametrosComisiones_Comentario = reader["Comentario"].ToString();
                            if(reader["Estatus"] != DBNull.Value)               
                             it.ParametrosComisiones_Estatus = reader["Estatus"].ToString();
                            if(reader["PenasConvencionales"] != DBNull.Value)               
                             it.ParametrosComisiones_PenasConvencionales = reader["PenasConvencionales"].ToString();
                            if(reader["Moneda"] != DBNull.Value)               
                             it.ParametrosComisiones_Moneda = reader["Moneda"].ToString();
                            if(reader["Interes"] != DBNull.Value)               
                             it.ParametrosComisiones_Interes = reader["Interes"].ToString();
                            if(reader["TipoIva"] != DBNull.Value)               
                             it.ParametrosComisiones_TipoIva = reader["TipoIva"].ToString();
                            if(reader["DiaCorte"] != DBNull.Value)               
                             it.ParametrosComisiones_DiaCorte = Int32.Parse(reader["DiaCorte"].ToString());
                            if(reader["FechaPrimerCalculo"] != DBNull.Value)               
                             it.ParametrosComisiones_FechaPrimerCalculo = DateTime.Parse(reader["FechaPrimerCalculo"].ToString());
                            if(reader["FechaUltimoCalculo"] != DBNull.Value)               
                             it.ParametrosComisiones_FechaUltimoCalculo = DateTime.Parse(reader["FechaUltimoCalculo"].ToString());
                            if(reader["CuentaPago"] != DBNull.Value)               
                             it.ParametrosComisiones_CuentaPago = reader["CuentaPago"].ToString();
                            if(reader["Numero"] != DBNull.Value)               
                             it.ParametrosComisiones_Numero = reader["Numero"].ToString();
                            if(reader["SituacionMorosidad"] != DBNull.Value)               
                             it.ParametrosComisiones_SituacionMorosidad = reader["SituacionMorosidad"].ToString();
                   
                   

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
        public Result InsertParametrosComisiones(ParametrosComisiones item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spInsertParametrosComisiones";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
       
                                insertCommand.Parameters.AddWithValue("@Fideicomiso", item.ParametrosComisiones_Fideicomiso);
                    insertCommand.Parameters.AddWithValue("@TipoCalculo", item.ParametrosComisiones_TipoCalculo);
                    insertCommand.Parameters.AddWithValue("@AQuienSeCobra", item.ParametrosComisiones_AQuienSeCobra);
  if (item.ParametrosComisiones_MontoAceptacion == null) 
                      insertCommand.Parameters.AddWithValue("@MontoAceptacion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@MontoAceptacion", item.ParametrosComisiones_MontoAceptacion);


  if (item.ParametrosComisiones_ImporteAnualizado == null) 
                      insertCommand.Parameters.AddWithValue("@ImporteAnualizado", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@ImporteAnualizado", item.ParametrosComisiones_ImporteAnualizado);


  if (item.ParametrosComisiones_Periodicidad == null) 
                      insertCommand.Parameters.AddWithValue("@Periodicidad", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Periodicidad", item.ParametrosComisiones_Periodicidad);


  if (item.ParametrosComisiones_CalculoAlDiaPrimero == null) 
                      insertCommand.Parameters.AddWithValue("@CalculoAlDiaPrimero", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CalculoAlDiaPrimero", item.ParametrosComisiones_CalculoAlDiaPrimero);


  if (item.ParametrosComisiones_Reevaluacion == null) 
                      insertCommand.Parameters.AddWithValue("@Reevaluacion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Reevaluacion", item.ParametrosComisiones_Reevaluacion);


  if (item.ParametrosComisiones_FechaConstitucion == null) 
                      insertCommand.Parameters.AddWithValue("@FechaConstitucion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@FechaConstitucion", item.ParametrosComisiones_FechaConstitucion);


  if (item.ParametrosComisiones_FechaPivote == null) 
                      insertCommand.Parameters.AddWithValue("@FechaPivote", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@FechaPivote", item.ParametrosComisiones_FechaPivote);


  if (item.ParametrosComisiones_FechaProxCalculo == null) 
                      insertCommand.Parameters.AddWithValue("@FechaProxCalculo", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@FechaProxCalculo", item.ParametrosComisiones_FechaProxCalculo);


  if (item.ParametrosComisiones_MetodoPago == null) 
                      insertCommand.Parameters.AddWithValue("@MetodoPago", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@MetodoPago", item.ParametrosComisiones_MetodoPago);


  if (item.ParametrosComisiones_AQuienFactura == null) 
                      insertCommand.Parameters.AddWithValue("@AQuienFactura", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AQuienFactura", item.ParametrosComisiones_AQuienFactura);


  if (item.ParametrosComisiones_Nombre == null) 
                      insertCommand.Parameters.AddWithValue("@Nombre", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Nombre", item.ParametrosComisiones_Nombre);


  if (item.ParametrosComisiones_Comentario == null) 
                      insertCommand.Parameters.AddWithValue("@Comentario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Comentario", item.ParametrosComisiones_Comentario);


  if (item.ParametrosComisiones_Estatus == null) 
                      insertCommand.Parameters.AddWithValue("@Estatus", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Estatus", item.ParametrosComisiones_Estatus);


  if (item.ParametrosComisiones_PenasConvencionales == null) 
                      insertCommand.Parameters.AddWithValue("@PenasConvencionales", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@PenasConvencionales", item.ParametrosComisiones_PenasConvencionales);


  if (item.ParametrosComisiones_Moneda == null) 
                      insertCommand.Parameters.AddWithValue("@Moneda", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Moneda", item.ParametrosComisiones_Moneda);


  if (item.ParametrosComisiones_Interes == null) 
                      insertCommand.Parameters.AddWithValue("@Interes", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Interes", item.ParametrosComisiones_Interes);


  if (item.ParametrosComisiones_TipoIva == null) 
                      insertCommand.Parameters.AddWithValue("@TipoIva", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@TipoIva", item.ParametrosComisiones_TipoIva);


  if (item.ParametrosComisiones_DiaCorte == null) 
                      insertCommand.Parameters.AddWithValue("@DiaCorte", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@DiaCorte", item.ParametrosComisiones_DiaCorte);


  if (item.ParametrosComisiones_FechaPrimerCalculo == null) 
                      insertCommand.Parameters.AddWithValue("@FechaPrimerCalculo", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@FechaPrimerCalculo", item.ParametrosComisiones_FechaPrimerCalculo);


  if (item.ParametrosComisiones_FechaUltimoCalculo == null) 
                      insertCommand.Parameters.AddWithValue("@FechaUltimoCalculo", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@FechaUltimoCalculo", item.ParametrosComisiones_FechaUltimoCalculo);


  if (item.ParametrosComisiones_CuentaPago == null) 
                      insertCommand.Parameters.AddWithValue("@CuentaPago", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentaPago", item.ParametrosComisiones_CuentaPago);


  if (item.ParametrosComisiones_Numero == null) 
                      insertCommand.Parameters.AddWithValue("@Numero", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Numero", item.ParametrosComisiones_Numero);


  if (item.ParametrosComisiones_SituacionMorosidad == null) 
                      insertCommand.Parameters.AddWithValue("@SituacionMorosidad", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@SituacionMorosidad", item.ParametrosComisiones_SituacionMorosidad);




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
        public Result UpdateParametrosComisiones(string id, ParametrosComisiones item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdateParametrosComisiones";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                                 insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.ParametrosComisiones_Fideicomiso);

                                    insertCommand.Parameters.AddWithValue("@TipoCalculo", item.ParametrosComisiones_TipoCalculo);

                                    insertCommand.Parameters.AddWithValue("@AQuienSeCobra", item.ParametrosComisiones_AQuienSeCobra);

  if (item.ParametrosComisiones_MontoAceptacion == null) 
                                  insertCommand.Parameters.AddWithValue("@MontoAceptacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@MontoAceptacion", item.ParametrosComisiones_MontoAceptacion);

    
  if (item.ParametrosComisiones_ImporteAnualizado == null) 
                                  insertCommand.Parameters.AddWithValue("@ImporteAnualizado", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ImporteAnualizado", item.ParametrosComisiones_ImporteAnualizado);

    
  if (item.ParametrosComisiones_Periodicidad == null) 
                                  insertCommand.Parameters.AddWithValue("@Periodicidad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Periodicidad", item.ParametrosComisiones_Periodicidad);

    
  if (item.ParametrosComisiones_CalculoAlDiaPrimero == null) 
                                  insertCommand.Parameters.AddWithValue("@CalculoAlDiaPrimero", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CalculoAlDiaPrimero", item.ParametrosComisiones_CalculoAlDiaPrimero);

    
  if (item.ParametrosComisiones_Reevaluacion == null) 
                                  insertCommand.Parameters.AddWithValue("@Reevaluacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Reevaluacion", item.ParametrosComisiones_Reevaluacion);

    
  if (item.ParametrosComisiones_FechaConstitucion == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaConstitucion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaConstitucion", item.ParametrosComisiones_FechaConstitucion);

    
  if (item.ParametrosComisiones_FechaPivote == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaPivote", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaPivote", item.ParametrosComisiones_FechaPivote);

    
  if (item.ParametrosComisiones_FechaProxCalculo == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaProxCalculo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaProxCalculo", item.ParametrosComisiones_FechaProxCalculo);

    
  if (item.ParametrosComisiones_MetodoPago == null) 
                                  insertCommand.Parameters.AddWithValue("@MetodoPago", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@MetodoPago", item.ParametrosComisiones_MetodoPago);

    
  if (item.ParametrosComisiones_AQuienFactura == null) 
                                  insertCommand.Parameters.AddWithValue("@AQuienFactura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AQuienFactura", item.ParametrosComisiones_AQuienFactura);

    
  if (item.ParametrosComisiones_Nombre == null) 
                                  insertCommand.Parameters.AddWithValue("@Nombre", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Nombre", item.ParametrosComisiones_Nombre);

    
  if (item.ParametrosComisiones_Comentario == null) 
                                  insertCommand.Parameters.AddWithValue("@Comentario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Comentario", item.ParametrosComisiones_Comentario);

    
  if (item.ParametrosComisiones_Estatus == null) 
                                  insertCommand.Parameters.AddWithValue("@Estatus", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Estatus", item.ParametrosComisiones_Estatus);

    
  if (item.ParametrosComisiones_PenasConvencionales == null) 
                                  insertCommand.Parameters.AddWithValue("@PenasConvencionales", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PenasConvencionales", item.ParametrosComisiones_PenasConvencionales);

    
  if (item.ParametrosComisiones_Moneda == null) 
                                  insertCommand.Parameters.AddWithValue("@Moneda", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Moneda", item.ParametrosComisiones_Moneda);

    
  if (item.ParametrosComisiones_Interes == null) 
                                  insertCommand.Parameters.AddWithValue("@Interes", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Interes", item.ParametrosComisiones_Interes);

    
  if (item.ParametrosComisiones_TipoIva == null) 
                                  insertCommand.Parameters.AddWithValue("@TipoIva", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TipoIva", item.ParametrosComisiones_TipoIva);

    
  if (item.ParametrosComisiones_DiaCorte == null) 
                                  insertCommand.Parameters.AddWithValue("@DiaCorte", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DiaCorte", item.ParametrosComisiones_DiaCorte);

    
  if (item.ParametrosComisiones_FechaPrimerCalculo == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaPrimerCalculo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaPrimerCalculo", item.ParametrosComisiones_FechaPrimerCalculo);

    
  if (item.ParametrosComisiones_FechaUltimoCalculo == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaUltimoCalculo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaUltimoCalculo", item.ParametrosComisiones_FechaUltimoCalculo);

    
  if (item.ParametrosComisiones_CuentaPago == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentaPago", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentaPago", item.ParametrosComisiones_CuentaPago);

    
  if (item.ParametrosComisiones_Numero == null) 
                                  insertCommand.Parameters.AddWithValue("@Numero", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Numero", item.ParametrosComisiones_Numero);

    
  if (item.ParametrosComisiones_SituacionMorosidad == null) 
                                  insertCommand.Parameters.AddWithValue("@SituacionMorosidad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@SituacionMorosidad", item.ParametrosComisiones_SituacionMorosidad);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.ParametrosComisiones_ID.ToString(); 
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
        
        public Result UpdatePartialParametrosComisiones(string id, ParametrosComisiones item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdatePartialParametrosComisiones";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                             insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.ParametrosComisiones_Fideicomiso);

                                    insertCommand.Parameters.AddWithValue("@TipoCalculo", item.ParametrosComisiones_TipoCalculo);

                                    insertCommand.Parameters.AddWithValue("@AQuienSeCobra", item.ParametrosComisiones_AQuienSeCobra);

  if (item.ParametrosComisiones_MontoAceptacion == null) 
                                  insertCommand.Parameters.AddWithValue("@MontoAceptacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@MontoAceptacion", item.ParametrosComisiones_MontoAceptacion);

    
  if (item.ParametrosComisiones_ImporteAnualizado == null) 
                                  insertCommand.Parameters.AddWithValue("@ImporteAnualizado", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@ImporteAnualizado", item.ParametrosComisiones_ImporteAnualizado);

    
  if (item.ParametrosComisiones_Periodicidad == null) 
                                  insertCommand.Parameters.AddWithValue("@Periodicidad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Periodicidad", item.ParametrosComisiones_Periodicidad);

    
  if (item.ParametrosComisiones_CalculoAlDiaPrimero == null) 
                                  insertCommand.Parameters.AddWithValue("@CalculoAlDiaPrimero", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CalculoAlDiaPrimero", item.ParametrosComisiones_CalculoAlDiaPrimero);

    
  if (item.ParametrosComisiones_Reevaluacion == null) 
                                  insertCommand.Parameters.AddWithValue("@Reevaluacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Reevaluacion", item.ParametrosComisiones_Reevaluacion);

    
  if (item.ParametrosComisiones_FechaConstitucion == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaConstitucion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaConstitucion", item.ParametrosComisiones_FechaConstitucion);

    
  if (item.ParametrosComisiones_FechaPivote == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaPivote", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaPivote", item.ParametrosComisiones_FechaPivote);

    
  if (item.ParametrosComisiones_FechaProxCalculo == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaProxCalculo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaProxCalculo", item.ParametrosComisiones_FechaProxCalculo);

    
  if (item.ParametrosComisiones_MetodoPago == null) 
                                  insertCommand.Parameters.AddWithValue("@MetodoPago", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@MetodoPago", item.ParametrosComisiones_MetodoPago);

    
  if (item.ParametrosComisiones_AQuienFactura == null) 
                                  insertCommand.Parameters.AddWithValue("@AQuienFactura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AQuienFactura", item.ParametrosComisiones_AQuienFactura);

    
  if (item.ParametrosComisiones_Nombre == null) 
                                  insertCommand.Parameters.AddWithValue("@Nombre", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Nombre", item.ParametrosComisiones_Nombre);

    
  if (item.ParametrosComisiones_Comentario == null) 
                                  insertCommand.Parameters.AddWithValue("@Comentario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Comentario", item.ParametrosComisiones_Comentario);

    
  if (item.ParametrosComisiones_Estatus == null) 
                                  insertCommand.Parameters.AddWithValue("@Estatus", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Estatus", item.ParametrosComisiones_Estatus);

    
  if (item.ParametrosComisiones_PenasConvencionales == null) 
                                  insertCommand.Parameters.AddWithValue("@PenasConvencionales", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@PenasConvencionales", item.ParametrosComisiones_PenasConvencionales);

    
  if (item.ParametrosComisiones_Moneda == null) 
                                  insertCommand.Parameters.AddWithValue("@Moneda", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Moneda", item.ParametrosComisiones_Moneda);

    
  if (item.ParametrosComisiones_Interes == null) 
                                  insertCommand.Parameters.AddWithValue("@Interes", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Interes", item.ParametrosComisiones_Interes);

    
  if (item.ParametrosComisiones_TipoIva == null) 
                                  insertCommand.Parameters.AddWithValue("@TipoIva", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@TipoIva", item.ParametrosComisiones_TipoIva);

    
  if (item.ParametrosComisiones_DiaCorte == null) 
                                  insertCommand.Parameters.AddWithValue("@DiaCorte", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DiaCorte", item.ParametrosComisiones_DiaCorte);

    
  if (item.ParametrosComisiones_FechaPrimerCalculo == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaPrimerCalculo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaPrimerCalculo", item.ParametrosComisiones_FechaPrimerCalculo);

    
  if (item.ParametrosComisiones_FechaUltimoCalculo == null) 
                                  insertCommand.Parameters.AddWithValue("@FechaUltimoCalculo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@FechaUltimoCalculo", item.ParametrosComisiones_FechaUltimoCalculo);

    
  if (item.ParametrosComisiones_CuentaPago == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentaPago", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentaPago", item.ParametrosComisiones_CuentaPago);

    
  if (item.ParametrosComisiones_Numero == null) 
                                  insertCommand.Parameters.AddWithValue("@Numero", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@Numero", item.ParametrosComisiones_Numero);

    
  if (item.ParametrosComisiones_SituacionMorosidad == null) 
                                  insertCommand.Parameters.AddWithValue("@SituacionMorosidad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@SituacionMorosidad", item.ParametrosComisiones_SituacionMorosidad);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.ParametrosComisiones_ID.ToString(); 
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
