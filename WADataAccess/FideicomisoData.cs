//Fecha Creación:5/24/2019 6:13:12 PM Template DataClass, Author: Alfredo Reyes C., V1
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
    public class FideicomisoData : IFideicomisoData, IDisposable
    {
        private string _conexion;
       
        public FideicomisoData(string conexion)
        {
            _conexion = conexion;
        }
        public Result DeleteFideicomiso(string id)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spDeleteFideicomiso";
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
                        res.Message = "La entidad Fideicomiso tiene registros que dependen de ella en otra tabla no se pudo eliminar.";
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
        
        public Fideicomiso GetFideicomiso(string id)
        {
            Fideicomiso entidad = new  Fideicomiso();           

            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetFideicomisoByID";
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
                         entidad.Fideicomiso_ID = reader["ID"].ToString();
 if(reader["GeneralesNumero"] != DBNull.Value)               
                         entidad.Fideicomiso_GeneralesNumero = Int32.Parse(reader["GeneralesNumero"].ToString());
 if(reader["GeneralesNombre"] != DBNull.Value)               
                         entidad.Fideicomiso_GeneralesNombre = reader["GeneralesNombre"].ToString();
 if(reader["GeneralesAdministrador"] != DBNull.Value)               
                         entidad.Fideicomiso_GeneralesAdministrador = reader["GeneralesAdministrador"].ToString();
 if(reader["GeneralesPromotor"] != DBNull.Value)               
                         entidad.Fideicomiso_GeneralesPromotor = reader["GeneralesPromotor"].ToString();
 if(reader["CaracteristicasFormaManejo"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasFormaManejo = reader["CaracteristicasFormaManejo"].ToString();
 if(reader["CaracteristicasTipoNegocio"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasTipoNegocio = reader["CaracteristicasTipoNegocio"].ToString();
 if(reader["CaracteristicasClasificacionProducto"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasClasificacionProducto = reader["CaracteristicasClasificacionProducto"].ToString();
 if(reader["CaracteristicasProductoEstandar"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasProductoEstandar = reader["CaracteristicasProductoEstandar"].ToString();
 if(reader["CaracteristicasProducto"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasProducto = reader["CaracteristicasProducto"].ToString();
 if(reader["CaracteristicasValFatca"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasValFatca = reader["CaracteristicasValFatca"].ToString();
 if(reader["CaracteristicasMontoApertura"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasMontoApertura = Double.Parse(reader["CaracteristicasMontoApertura"].ToString());
 if(reader["CaracteristicasManejoSubFisos"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasManejoSubFisos = reader["CaracteristicasManejoSubFisos"].ToString();
 if(reader["CaracteristicasSujetoArt151"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasSujetoArt151 = reader["CaracteristicasSujetoArt151"].ToString();
 if(reader["CaracteristicasCerrado"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasCerrado = reader["CaracteristicasCerrado"].ToString();
 if(reader["CaracteristicasRevocable"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasRevocable = reader["CaracteristicasRevocable"].ToString();
 if(reader["CaracteristicasEsContratoEje"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasEsContratoEje = reader["CaracteristicasEsContratoEje"].ToString();
 if(reader["CaracteristicasComiteTecnico"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasComiteTecnico = reader["CaracteristicasComiteTecnico"].ToString();
 if(reader["CaracteristicasOfiBanxico"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasOfiBanxico = reader["CaracteristicasOfiBanxico"].ToString();
 if(reader["CaracteristicasManejaMonExt"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasManejaMonExt = reader["CaracteristicasManejaMonExt"].ToString();
 if(reader["CaracteristicasIvaFronterizo"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasIvaFronterizo = reader["CaracteristicasIvaFronterizo"].ToString();
 if(reader["CaracteristicasFechaAlta"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasFechaAlta = DateTime.Parse(reader["CaracteristicasFechaAlta"].ToString());
 if(reader["CaracteristicasFechaConstitucion"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasFechaConstitucion = DateTime.Parse(reader["CaracteristicasFechaConstitucion"].ToString());
 if(reader["CaracteristicasFechaAprobacion"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasFechaAprobacion = DateTime.Parse(reader["CaracteristicasFechaAprobacion"].ToString());
 if(reader["CaracteristicasEstado"] != DBNull.Value)               
                         entidad.Fideicomiso_CaracteristicasEstado = reader["CaracteristicasEstado"].ToString();
 if(reader["AdicionalesTipo"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesTipo = reader["AdicionalesTipo"].ToString();
 if(reader["AdicionalesTipoPersona"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesTipoPersona = reader["AdicionalesTipoPersona"].ToString();
 if(reader["AdicionalesConActividadEmpresarial"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesConActividadEmpresarial = reader["AdicionalesConActividadEmpresarial"].ToString();
 if(reader["AdicionalesPermisoSre"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesPermisoSre = reader["AdicionalesPermisoSre"].ToString();
 if(reader["AdicionalesFechaPermisoSre"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesFechaPermisoSre = DateTime.Parse(reader["AdicionalesFechaPermisoSre"].ToString());
 if(reader["AdicionalesProvSustFiduciaria"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesProvSustFiduciaria = reader["AdicionalesProvSustFiduciaria"].ToString();
 if(reader["AdicionalesFondosInterfaseAfore"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesFondosInterfaseAfore = reader["AdicionalesFondosInterfaseAfore"].ToString();
 if(reader["AdicionalesRegNalInvExt"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesRegNalInvExt = reader["AdicionalesRegNalInvExt"].ToString();
 if(reader["AdicionalesFechaInscripcion"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesFechaInscripcion = DateTime.Parse(reader["AdicionalesFechaInscripcion"].ToString());
 if(reader["AdicionalesFormalizacionContrato"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesFormalizacionContrato = reader["AdicionalesFormalizacionContrato"].ToString();
 if(reader["AdicionalesNoEscritura"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesNoEscritura = reader["AdicionalesNoEscritura"].ToString();
 if(reader["AdicionalesFechaEscritura"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesFechaEscritura = DateTime.Parse(reader["AdicionalesFechaEscritura"].ToString());
 if(reader["AdicionalesNombreNotario"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesNombreNotario = reader["AdicionalesNombreNotario"].ToString();
 if(reader["AdicionalesNoNotario"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesNoNotario = reader["AdicionalesNoNotario"].ToString();
 if(reader["AdicionalesCiudadNotario"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesCiudadNotario = reader["AdicionalesCiudadNotario"].ToString();
 if(reader["AdicionalesEstadoNotario"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesEstadoNotario = reader["AdicionalesEstadoNotario"].ToString();
 if(reader["AdicionalesPaisNotario"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesPaisNotario = reader["AdicionalesPaisNotario"].ToString();
 if(reader["AdicionalesFolioRegistroPublico"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesFolioRegistroPublico = reader["AdicionalesFolioRegistroPublico"].ToString();
 if(reader["AdicionalesFechaInscripcionRegPublico"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesFechaInscripcionRegPublico = DateTime.Parse(reader["AdicionalesFechaInscripcionRegPublico"].ToString());
 if(reader["AdicionalesAdministracion"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesAdministracion = reader["AdicionalesAdministracion"].ToString();
 if(reader["AdicionalesContabilidadDelegada"] != DBNull.Value)               
                         entidad.Fideicomiso_AdicionalesContabilidadDelegada = reader["AdicionalesContabilidadDelegada"].ToString();
 if(reader["DatosBanxicoActividadEconomica"] != DBNull.Value)               
                         entidad.Fideicomiso_DatosBanxicoActividadEconomica = reader["DatosBanxicoActividadEconomica"].ToString();
 if(reader["DatosBanxicoFiducuario"] != DBNull.Value)               
                         entidad.Fideicomiso_DatosBanxicoFiducuario = reader["DatosBanxicoFiducuario"].ToString();
 if(reader["DatosBanxicoSectorBancario"] != DBNull.Value)               
                         entidad.Fideicomiso_DatosBanxicoSectorBancario = reader["DatosBanxicoSectorBancario"].ToString();
 if(reader["DatosBanxicoLocalidad"] != DBNull.Value)               
                         entidad.Fideicomiso_DatosBanxicoLocalidad = reader["DatosBanxicoLocalidad"].ToString();
 if(reader["DatosBanxicoCentroResp"] != DBNull.Value)               
                         entidad.Fideicomiso_DatosBanxicoCentroResp = reader["DatosBanxicoCentroResp"].ToString();
 if(reader["DatosBanxicoNoCr"] != DBNull.Value)               
                         entidad.Fideicomiso_DatosBanxicoNoCr = reader["DatosBanxicoNoCr"].ToString();
 if(reader["DatosBanxicoRfcContrato"] != DBNull.Value)               
                         entidad.Fideicomiso_DatosBanxicoRfcContrato = reader["DatosBanxicoRfcContrato"].ToString();
 if(reader["DatosBanxicoNumeroCliente"] != DBNull.Value)               
                         entidad.Fideicomiso_DatosBanxicoNumeroCliente = reader["DatosBanxicoNumeroCliente"].ToString();
                   
                                         
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
        public List<Fideicomiso> GetFideicomisosAndRelations(int page, int numrecords)
        {
            List<Fideicomiso> lista = new List<Fideicomiso>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListFideicomisoPaged";
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
                    var it = new Fideicomiso();
            
                      if(reader["ID"] != DBNull.Value)               
                         it.Fideicomiso_ID = reader["ID"].ToString();
 if(reader["GeneralesNumero"] != DBNull.Value)               
                         it.Fideicomiso_GeneralesNumero = Int32.Parse(reader["GeneralesNumero"].ToString());
 if(reader["GeneralesNombre"] != DBNull.Value)               
                         it.Fideicomiso_GeneralesNombre = reader["GeneralesNombre"].ToString();
 if(reader["GeneralesAdministrador"] != DBNull.Value)               
                         it.Fideicomiso_GeneralesAdministrador = reader["GeneralesAdministrador"].ToString();
 if(reader["GeneralesPromotor"] != DBNull.Value)               
                         it.Fideicomiso_GeneralesPromotor = reader["GeneralesPromotor"].ToString();
 if(reader["CaracteristicasFormaManejo"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasFormaManejo = reader["CaracteristicasFormaManejo"].ToString();
 if(reader["CaracteristicasTipoNegocio"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasTipoNegocio = reader["CaracteristicasTipoNegocio"].ToString();
 if(reader["CaracteristicasClasificacionProducto"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasClasificacionProducto = reader["CaracteristicasClasificacionProducto"].ToString();
 if(reader["CaracteristicasProductoEstandar"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasProductoEstandar = reader["CaracteristicasProductoEstandar"].ToString();
 if(reader["CaracteristicasProducto"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasProducto = reader["CaracteristicasProducto"].ToString();
 if(reader["CaracteristicasValFatca"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasValFatca = reader["CaracteristicasValFatca"].ToString();
 if(reader["CaracteristicasMontoApertura"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasMontoApertura = Double.Parse(reader["CaracteristicasMontoApertura"].ToString());
 if(reader["CaracteristicasManejoSubFisos"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasManejoSubFisos = reader["CaracteristicasManejoSubFisos"].ToString();
 if(reader["CaracteristicasSujetoArt151"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasSujetoArt151 = reader["CaracteristicasSujetoArt151"].ToString();
 if(reader["CaracteristicasCerrado"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasCerrado = reader["CaracteristicasCerrado"].ToString();
 if(reader["CaracteristicasRevocable"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasRevocable = reader["CaracteristicasRevocable"].ToString();
 if(reader["CaracteristicasEsContratoEje"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasEsContratoEje = reader["CaracteristicasEsContratoEje"].ToString();
 if(reader["CaracteristicasComiteTecnico"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasComiteTecnico = reader["CaracteristicasComiteTecnico"].ToString();
 if(reader["CaracteristicasOfiBanxico"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasOfiBanxico = reader["CaracteristicasOfiBanxico"].ToString();
 if(reader["CaracteristicasManejaMonExt"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasManejaMonExt = reader["CaracteristicasManejaMonExt"].ToString();
 if(reader["CaracteristicasIvaFronterizo"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasIvaFronterizo = reader["CaracteristicasIvaFronterizo"].ToString();
 if(reader["CaracteristicasFechaAlta"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasFechaAlta = DateTime.Parse(reader["CaracteristicasFechaAlta"].ToString());
 if(reader["CaracteristicasFechaConstitucion"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasFechaConstitucion = DateTime.Parse(reader["CaracteristicasFechaConstitucion"].ToString());
 if(reader["CaracteristicasFechaAprobacion"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasFechaAprobacion = DateTime.Parse(reader["CaracteristicasFechaAprobacion"].ToString());
 if(reader["CaracteristicasEstado"] != DBNull.Value)               
                         it.Fideicomiso_CaracteristicasEstado = reader["CaracteristicasEstado"].ToString();
 if(reader["AdicionalesTipo"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesTipo = reader["AdicionalesTipo"].ToString();
 if(reader["AdicionalesTipoPersona"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesTipoPersona = reader["AdicionalesTipoPersona"].ToString();
 if(reader["AdicionalesConActividadEmpresarial"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesConActividadEmpresarial = reader["AdicionalesConActividadEmpresarial"].ToString();
 if(reader["AdicionalesPermisoSre"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesPermisoSre = reader["AdicionalesPermisoSre"].ToString();
 if(reader["AdicionalesFechaPermisoSre"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesFechaPermisoSre = DateTime.Parse(reader["AdicionalesFechaPermisoSre"].ToString());
 if(reader["AdicionalesProvSustFiduciaria"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesProvSustFiduciaria = reader["AdicionalesProvSustFiduciaria"].ToString();
 if(reader["AdicionalesFondosInterfaseAfore"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesFondosInterfaseAfore = reader["AdicionalesFondosInterfaseAfore"].ToString();
 if(reader["AdicionalesRegNalInvExt"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesRegNalInvExt = reader["AdicionalesRegNalInvExt"].ToString();
 if(reader["AdicionalesFechaInscripcion"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesFechaInscripcion = DateTime.Parse(reader["AdicionalesFechaInscripcion"].ToString());
 if(reader["AdicionalesFormalizacionContrato"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesFormalizacionContrato = reader["AdicionalesFormalizacionContrato"].ToString();
 if(reader["AdicionalesNoEscritura"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesNoEscritura = reader["AdicionalesNoEscritura"].ToString();
 if(reader["AdicionalesFechaEscritura"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesFechaEscritura = DateTime.Parse(reader["AdicionalesFechaEscritura"].ToString());
 if(reader["AdicionalesNombreNotario"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesNombreNotario = reader["AdicionalesNombreNotario"].ToString();
 if(reader["AdicionalesNoNotario"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesNoNotario = reader["AdicionalesNoNotario"].ToString();
 if(reader["AdicionalesCiudadNotario"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesCiudadNotario = reader["AdicionalesCiudadNotario"].ToString();
 if(reader["AdicionalesEstadoNotario"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesEstadoNotario = reader["AdicionalesEstadoNotario"].ToString();
 if(reader["AdicionalesPaisNotario"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesPaisNotario = reader["AdicionalesPaisNotario"].ToString();
 if(reader["AdicionalesFolioRegistroPublico"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesFolioRegistroPublico = reader["AdicionalesFolioRegistroPublico"].ToString();
 if(reader["AdicionalesFechaInscripcionRegPublico"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesFechaInscripcionRegPublico = DateTime.Parse(reader["AdicionalesFechaInscripcionRegPublico"].ToString());
 if(reader["AdicionalesAdministracion"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesAdministracion = reader["AdicionalesAdministracion"].ToString();
 if(reader["AdicionalesContabilidadDelegada"] != DBNull.Value)               
                         it.Fideicomiso_AdicionalesContabilidadDelegada = reader["AdicionalesContabilidadDelegada"].ToString();
 if(reader["DatosBanxicoActividadEconomica"] != DBNull.Value)               
                         it.Fideicomiso_DatosBanxicoActividadEconomica = reader["DatosBanxicoActividadEconomica"].ToString();
 if(reader["DatosBanxicoFiducuario"] != DBNull.Value)               
                         it.Fideicomiso_DatosBanxicoFiducuario = reader["DatosBanxicoFiducuario"].ToString();
 if(reader["DatosBanxicoSectorBancario"] != DBNull.Value)               
                         it.Fideicomiso_DatosBanxicoSectorBancario = reader["DatosBanxicoSectorBancario"].ToString();
 if(reader["DatosBanxicoLocalidad"] != DBNull.Value)               
                         it.Fideicomiso_DatosBanxicoLocalidad = reader["DatosBanxicoLocalidad"].ToString();
 if(reader["DatosBanxicoCentroResp"] != DBNull.Value)               
                         it.Fideicomiso_DatosBanxicoCentroResp = reader["DatosBanxicoCentroResp"].ToString();
 if(reader["DatosBanxicoNoCr"] != DBNull.Value)               
                         it.Fideicomiso_DatosBanxicoNoCr = reader["DatosBanxicoNoCr"].ToString();
 if(reader["DatosBanxicoRfcContrato"] != DBNull.Value)               
                         it.Fideicomiso_DatosBanxicoRfcContrato = reader["DatosBanxicoRfcContrato"].ToString();
 if(reader["DatosBanxicoNumeroCliente"] != DBNull.Value)               
                         it.Fideicomiso_DatosBanxicoNumeroCliente = reader["DatosBanxicoNumeroCliente"].ToString();
                   
                                        

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
        public List<Fideicomiso> GetFideicomisos(int page, int numrecords)
        {
            List<Fideicomiso> lista = new List<Fideicomiso>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListFideicomisoPaged";
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
                    var it = new Fideicomiso();
            
                            if(reader["ID"] != DBNull.Value)               
                             it.Fideicomiso_ID = reader["ID"].ToString();
                            if(reader["GeneralesNumero"] != DBNull.Value)               
                             it.Fideicomiso_GeneralesNumero = Int32.Parse(reader["GeneralesNumero"].ToString());
                            if(reader["GeneralesNombre"] != DBNull.Value)               
                             it.Fideicomiso_GeneralesNombre = reader["GeneralesNombre"].ToString();
                            if(reader["GeneralesAdministrador"] != DBNull.Value)               
                             it.Fideicomiso_GeneralesAdministrador = reader["GeneralesAdministrador"].ToString();
                            if(reader["GeneralesPromotor"] != DBNull.Value)               
                             it.Fideicomiso_GeneralesPromotor = reader["GeneralesPromotor"].ToString();
                            if(reader["CaracteristicasFormaManejo"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasFormaManejo = reader["CaracteristicasFormaManejo"].ToString();
                            if(reader["CaracteristicasTipoNegocio"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasTipoNegocio = reader["CaracteristicasTipoNegocio"].ToString();
                            if(reader["CaracteristicasClasificacionProducto"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasClasificacionProducto = reader["CaracteristicasClasificacionProducto"].ToString();
                            if(reader["CaracteristicasProductoEstandar"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasProductoEstandar = reader["CaracteristicasProductoEstandar"].ToString();
                            if(reader["CaracteristicasProducto"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasProducto = reader["CaracteristicasProducto"].ToString();
                            if(reader["CaracteristicasValFatca"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasValFatca = reader["CaracteristicasValFatca"].ToString();
                            if(reader["CaracteristicasMontoApertura"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasMontoApertura = Double.Parse(reader["CaracteristicasMontoApertura"].ToString());
                            if(reader["CaracteristicasManejoSubFisos"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasManejoSubFisos = reader["CaracteristicasManejoSubFisos"].ToString();
                            if(reader["CaracteristicasSujetoArt151"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasSujetoArt151 = reader["CaracteristicasSujetoArt151"].ToString();
                            if(reader["CaracteristicasCerrado"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasCerrado = reader["CaracteristicasCerrado"].ToString();
                            if(reader["CaracteristicasRevocable"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasRevocable = reader["CaracteristicasRevocable"].ToString();
                            if(reader["CaracteristicasEsContratoEje"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasEsContratoEje = reader["CaracteristicasEsContratoEje"].ToString();
                            if(reader["CaracteristicasComiteTecnico"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasComiteTecnico = reader["CaracteristicasComiteTecnico"].ToString();
                            if(reader["CaracteristicasOfiBanxico"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasOfiBanxico = reader["CaracteristicasOfiBanxico"].ToString();
                            if(reader["CaracteristicasManejaMonExt"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasManejaMonExt = reader["CaracteristicasManejaMonExt"].ToString();
                            if(reader["CaracteristicasIvaFronterizo"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasIvaFronterizo = reader["CaracteristicasIvaFronterizo"].ToString();
                            if(reader["CaracteristicasFechaAlta"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasFechaAlta = DateTime.Parse(reader["CaracteristicasFechaAlta"].ToString());
                            if(reader["CaracteristicasFechaConstitucion"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasFechaConstitucion = DateTime.Parse(reader["CaracteristicasFechaConstitucion"].ToString());
                            if(reader["CaracteristicasFechaAprobacion"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasFechaAprobacion = DateTime.Parse(reader["CaracteristicasFechaAprobacion"].ToString());
                            if(reader["CaracteristicasEstado"] != DBNull.Value)               
                             it.Fideicomiso_CaracteristicasEstado = reader["CaracteristicasEstado"].ToString();
                            if(reader["AdicionalesTipo"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesTipo = reader["AdicionalesTipo"].ToString();
                            if(reader["AdicionalesTipoPersona"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesTipoPersona = reader["AdicionalesTipoPersona"].ToString();
                            if(reader["AdicionalesConActividadEmpresarial"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesConActividadEmpresarial = reader["AdicionalesConActividadEmpresarial"].ToString();
                            if(reader["AdicionalesPermisoSre"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesPermisoSre = reader["AdicionalesPermisoSre"].ToString();
                            if(reader["AdicionalesFechaPermisoSre"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesFechaPermisoSre = DateTime.Parse(reader["AdicionalesFechaPermisoSre"].ToString());
                            if(reader["AdicionalesProvSustFiduciaria"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesProvSustFiduciaria = reader["AdicionalesProvSustFiduciaria"].ToString();
                            if(reader["AdicionalesFondosInterfaseAfore"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesFondosInterfaseAfore = reader["AdicionalesFondosInterfaseAfore"].ToString();
                            if(reader["AdicionalesRegNalInvExt"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesRegNalInvExt = reader["AdicionalesRegNalInvExt"].ToString();
                            if(reader["AdicionalesFechaInscripcion"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesFechaInscripcion = DateTime.Parse(reader["AdicionalesFechaInscripcion"].ToString());
                            if(reader["AdicionalesFormalizacionContrato"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesFormalizacionContrato = reader["AdicionalesFormalizacionContrato"].ToString();
                            if(reader["AdicionalesNoEscritura"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesNoEscritura = reader["AdicionalesNoEscritura"].ToString();
                            if(reader["AdicionalesFechaEscritura"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesFechaEscritura = DateTime.Parse(reader["AdicionalesFechaEscritura"].ToString());
                            if(reader["AdicionalesNombreNotario"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesNombreNotario = reader["AdicionalesNombreNotario"].ToString();
                            if(reader["AdicionalesNoNotario"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesNoNotario = reader["AdicionalesNoNotario"].ToString();
                            if(reader["AdicionalesCiudadNotario"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesCiudadNotario = reader["AdicionalesCiudadNotario"].ToString();
                            if(reader["AdicionalesEstadoNotario"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesEstadoNotario = reader["AdicionalesEstadoNotario"].ToString();
                            if(reader["AdicionalesPaisNotario"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesPaisNotario = reader["AdicionalesPaisNotario"].ToString();
                            if(reader["AdicionalesFolioRegistroPublico"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesFolioRegistroPublico = reader["AdicionalesFolioRegistroPublico"].ToString();
                            if(reader["AdicionalesFechaInscripcionRegPublico"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesFechaInscripcionRegPublico = DateTime.Parse(reader["AdicionalesFechaInscripcionRegPublico"].ToString());
                            if(reader["AdicionalesAdministracion"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesAdministracion = reader["AdicionalesAdministracion"].ToString();
                            if(reader["AdicionalesContabilidadDelegada"] != DBNull.Value)               
                             it.Fideicomiso_AdicionalesContabilidadDelegada = reader["AdicionalesContabilidadDelegada"].ToString();
                            if(reader["DatosBanxicoActividadEconomica"] != DBNull.Value)               
                             it.Fideicomiso_DatosBanxicoActividadEconomica = reader["DatosBanxicoActividadEconomica"].ToString();
                            if(reader["DatosBanxicoFiducuario"] != DBNull.Value)               
                             it.Fideicomiso_DatosBanxicoFiducuario = reader["DatosBanxicoFiducuario"].ToString();
                            if(reader["DatosBanxicoSectorBancario"] != DBNull.Value)               
                             it.Fideicomiso_DatosBanxicoSectorBancario = reader["DatosBanxicoSectorBancario"].ToString();
                            if(reader["DatosBanxicoLocalidad"] != DBNull.Value)               
                             it.Fideicomiso_DatosBanxicoLocalidad = reader["DatosBanxicoLocalidad"].ToString();
                            if(reader["DatosBanxicoCentroResp"] != DBNull.Value)               
                             it.Fideicomiso_DatosBanxicoCentroResp = reader["DatosBanxicoCentroResp"].ToString();
                            if(reader["DatosBanxicoNoCr"] != DBNull.Value)               
                             it.Fideicomiso_DatosBanxicoNoCr = reader["DatosBanxicoNoCr"].ToString();
                            if(reader["DatosBanxicoRfcContrato"] != DBNull.Value)               
                             it.Fideicomiso_DatosBanxicoRfcContrato = reader["DatosBanxicoRfcContrato"].ToString();
                            if(reader["DatosBanxicoNumeroCliente"] != DBNull.Value)               
                             it.Fideicomiso_DatosBanxicoNumeroCliente = reader["DatosBanxicoNumeroCliente"].ToString();
                   
                   

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
        public Result InsertFideicomiso(Fideicomiso item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spInsertFideicomiso";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
       
                                insertCommand.Parameters.AddWithValue("@GeneralesNumero", item.Fideicomiso_GeneralesNumero);
                    insertCommand.Parameters.AddWithValue("@GeneralesNombre", item.Fideicomiso_GeneralesNombre);
                    insertCommand.Parameters.AddWithValue("@GeneralesAdministrador", item.Fideicomiso_GeneralesAdministrador);
                    insertCommand.Parameters.AddWithValue("@GeneralesPromotor", item.Fideicomiso_GeneralesPromotor);
                    insertCommand.Parameters.AddWithValue("@CaracteristicasFormaManejo", item.Fideicomiso_CaracteristicasFormaManejo);
                    insertCommand.Parameters.AddWithValue("@CaracteristicasTipoNegocio", item.Fideicomiso_CaracteristicasTipoNegocio);
                    insertCommand.Parameters.AddWithValue("@CaracteristicasClasificacionProducto", item.Fideicomiso_CaracteristicasClasificacionProducto);
                    insertCommand.Parameters.AddWithValue("@CaracteristicasProductoEstandar", item.Fideicomiso_CaracteristicasProductoEstandar);
                    insertCommand.Parameters.AddWithValue("@CaracteristicasProducto", item.Fideicomiso_CaracteristicasProducto);
                    insertCommand.Parameters.AddWithValue("@CaracteristicasValFatca", item.Fideicomiso_CaracteristicasValFatca);
  if (item.Fideicomiso_CaracteristicasMontoApertura == null) 
                      insertCommand.Parameters.AddWithValue("@CaracteristicasMontoApertura", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CaracteristicasMontoApertura", item.Fideicomiso_CaracteristicasMontoApertura);


  if (item.Fideicomiso_CaracteristicasManejoSubFisos == null) 
                      insertCommand.Parameters.AddWithValue("@CaracteristicasManejoSubFisos", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CaracteristicasManejoSubFisos", item.Fideicomiso_CaracteristicasManejoSubFisos);


  if (item.Fideicomiso_CaracteristicasSujetoArt151 == null) 
                      insertCommand.Parameters.AddWithValue("@CaracteristicasSujetoArt151", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CaracteristicasSujetoArt151", item.Fideicomiso_CaracteristicasSujetoArt151);


  if (item.Fideicomiso_CaracteristicasCerrado == null) 
                      insertCommand.Parameters.AddWithValue("@CaracteristicasCerrado", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CaracteristicasCerrado", item.Fideicomiso_CaracteristicasCerrado);


  if (item.Fideicomiso_CaracteristicasRevocable == null) 
                      insertCommand.Parameters.AddWithValue("@CaracteristicasRevocable", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CaracteristicasRevocable", item.Fideicomiso_CaracteristicasRevocable);


  if (item.Fideicomiso_CaracteristicasEsContratoEje == null) 
                      insertCommand.Parameters.AddWithValue("@CaracteristicasEsContratoEje", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CaracteristicasEsContratoEje", item.Fideicomiso_CaracteristicasEsContratoEje);


  if (item.Fideicomiso_CaracteristicasComiteTecnico == null) 
                      insertCommand.Parameters.AddWithValue("@CaracteristicasComiteTecnico", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CaracteristicasComiteTecnico", item.Fideicomiso_CaracteristicasComiteTecnico);


  if (item.Fideicomiso_CaracteristicasOfiBanxico == null) 
                      insertCommand.Parameters.AddWithValue("@CaracteristicasOfiBanxico", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CaracteristicasOfiBanxico", item.Fideicomiso_CaracteristicasOfiBanxico);


  if (item.Fideicomiso_CaracteristicasManejaMonExt == null) 
                      insertCommand.Parameters.AddWithValue("@CaracteristicasManejaMonExt", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CaracteristicasManejaMonExt", item.Fideicomiso_CaracteristicasManejaMonExt);


  if (item.Fideicomiso_CaracteristicasIvaFronterizo == null) 
                      insertCommand.Parameters.AddWithValue("@CaracteristicasIvaFronterizo", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CaracteristicasIvaFronterizo", item.Fideicomiso_CaracteristicasIvaFronterizo);


  if (item.Fideicomiso_CaracteristicasFechaAlta == null) 
                      insertCommand.Parameters.AddWithValue("@CaracteristicasFechaAlta", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CaracteristicasFechaAlta", item.Fideicomiso_CaracteristicasFechaAlta);


  if (item.Fideicomiso_CaracteristicasFechaConstitucion == null) 
                      insertCommand.Parameters.AddWithValue("@CaracteristicasFechaConstitucion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CaracteristicasFechaConstitucion", item.Fideicomiso_CaracteristicasFechaConstitucion);


  if (item.Fideicomiso_CaracteristicasFechaAprobacion == null) 
                      insertCommand.Parameters.AddWithValue("@CaracteristicasFechaAprobacion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CaracteristicasFechaAprobacion", item.Fideicomiso_CaracteristicasFechaAprobacion);


                    insertCommand.Parameters.AddWithValue("@CaracteristicasEstado", item.Fideicomiso_CaracteristicasEstado);
  if (item.Fideicomiso_AdicionalesTipo == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesTipo", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesTipo", item.Fideicomiso_AdicionalesTipo);


                    insertCommand.Parameters.AddWithValue("@AdicionalesTipoPersona", item.Fideicomiso_AdicionalesTipoPersona);
  if (item.Fideicomiso_AdicionalesConActividadEmpresarial == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesConActividadEmpresarial", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesConActividadEmpresarial", item.Fideicomiso_AdicionalesConActividadEmpresarial);


  if (item.Fideicomiso_AdicionalesPermisoSre == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesPermisoSre", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesPermisoSre", item.Fideicomiso_AdicionalesPermisoSre);


  if (item.Fideicomiso_AdicionalesFechaPermisoSre == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesFechaPermisoSre", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesFechaPermisoSre", item.Fideicomiso_AdicionalesFechaPermisoSre);


  if (item.Fideicomiso_AdicionalesProvSustFiduciaria == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesProvSustFiduciaria", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesProvSustFiduciaria", item.Fideicomiso_AdicionalesProvSustFiduciaria);


  if (item.Fideicomiso_AdicionalesFondosInterfaseAfore == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesFondosInterfaseAfore", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesFondosInterfaseAfore", item.Fideicomiso_AdicionalesFondosInterfaseAfore);


  if (item.Fideicomiso_AdicionalesRegNalInvExt == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesRegNalInvExt", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesRegNalInvExt", item.Fideicomiso_AdicionalesRegNalInvExt);


  if (item.Fideicomiso_AdicionalesFechaInscripcion == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesFechaInscripcion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesFechaInscripcion", item.Fideicomiso_AdicionalesFechaInscripcion);


  if (item.Fideicomiso_AdicionalesFormalizacionContrato == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesFormalizacionContrato", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesFormalizacionContrato", item.Fideicomiso_AdicionalesFormalizacionContrato);


  if (item.Fideicomiso_AdicionalesNoEscritura == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesNoEscritura", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesNoEscritura", item.Fideicomiso_AdicionalesNoEscritura);


  if (item.Fideicomiso_AdicionalesFechaEscritura == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesFechaEscritura", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesFechaEscritura", item.Fideicomiso_AdicionalesFechaEscritura);


  if (item.Fideicomiso_AdicionalesNombreNotario == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesNombreNotario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesNombreNotario", item.Fideicomiso_AdicionalesNombreNotario);


  if (item.Fideicomiso_AdicionalesNoNotario == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesNoNotario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesNoNotario", item.Fideicomiso_AdicionalesNoNotario);


  if (item.Fideicomiso_AdicionalesCiudadNotario == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesCiudadNotario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesCiudadNotario", item.Fideicomiso_AdicionalesCiudadNotario);


  if (item.Fideicomiso_AdicionalesEstadoNotario == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesEstadoNotario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesEstadoNotario", item.Fideicomiso_AdicionalesEstadoNotario);


  if (item.Fideicomiso_AdicionalesPaisNotario == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesPaisNotario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesPaisNotario", item.Fideicomiso_AdicionalesPaisNotario);


  if (item.Fideicomiso_AdicionalesFolioRegistroPublico == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesFolioRegistroPublico", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesFolioRegistroPublico", item.Fideicomiso_AdicionalesFolioRegistroPublico);


  if (item.Fideicomiso_AdicionalesFechaInscripcionRegPublico == null) 
                      insertCommand.Parameters.AddWithValue("@AdicionalesFechaInscripcionRegPublico", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@AdicionalesFechaInscripcionRegPublico", item.Fideicomiso_AdicionalesFechaInscripcionRegPublico);


                    insertCommand.Parameters.AddWithValue("@AdicionalesAdministracion", item.Fideicomiso_AdicionalesAdministracion);
                    insertCommand.Parameters.AddWithValue("@AdicionalesContabilidadDelegada", item.Fideicomiso_AdicionalesContabilidadDelegada);
  if (item.Fideicomiso_DatosBanxicoActividadEconomica == null) 
                      insertCommand.Parameters.AddWithValue("@DatosBanxicoActividadEconomica", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@DatosBanxicoActividadEconomica", item.Fideicomiso_DatosBanxicoActividadEconomica);


  if (item.Fideicomiso_DatosBanxicoFiducuario == null) 
                      insertCommand.Parameters.AddWithValue("@DatosBanxicoFiducuario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@DatosBanxicoFiducuario", item.Fideicomiso_DatosBanxicoFiducuario);


  if (item.Fideicomiso_DatosBanxicoSectorBancario == null) 
                      insertCommand.Parameters.AddWithValue("@DatosBanxicoSectorBancario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@DatosBanxicoSectorBancario", item.Fideicomiso_DatosBanxicoSectorBancario);


  if (item.Fideicomiso_DatosBanxicoLocalidad == null) 
                      insertCommand.Parameters.AddWithValue("@DatosBanxicoLocalidad", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@DatosBanxicoLocalidad", item.Fideicomiso_DatosBanxicoLocalidad);


  if (item.Fideicomiso_DatosBanxicoCentroResp == null) 
                      insertCommand.Parameters.AddWithValue("@DatosBanxicoCentroResp", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@DatosBanxicoCentroResp", item.Fideicomiso_DatosBanxicoCentroResp);


  if (item.Fideicomiso_DatosBanxicoNoCr == null) 
                      insertCommand.Parameters.AddWithValue("@DatosBanxicoNoCr", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@DatosBanxicoNoCr", item.Fideicomiso_DatosBanxicoNoCr);


  if (item.Fideicomiso_DatosBanxicoRfcContrato == null) 
                      insertCommand.Parameters.AddWithValue("@DatosBanxicoRfcContrato", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@DatosBanxicoRfcContrato", item.Fideicomiso_DatosBanxicoRfcContrato);


  if (item.Fideicomiso_DatosBanxicoNumeroCliente == null) 
                      insertCommand.Parameters.AddWithValue("@DatosBanxicoNumeroCliente", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@DatosBanxicoNumeroCliente", item.Fideicomiso_DatosBanxicoNumeroCliente);




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
        public Result UpdateFideicomiso(string id, Fideicomiso item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdateFideicomiso";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                                 insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@GeneralesNumero", item.Fideicomiso_GeneralesNumero);

                                    insertCommand.Parameters.AddWithValue("@GeneralesNombre", item.Fideicomiso_GeneralesNombre);

                                    insertCommand.Parameters.AddWithValue("@GeneralesAdministrador", item.Fideicomiso_GeneralesAdministrador);

                                    insertCommand.Parameters.AddWithValue("@GeneralesPromotor", item.Fideicomiso_GeneralesPromotor);

                                    insertCommand.Parameters.AddWithValue("@CaracteristicasFormaManejo", item.Fideicomiso_CaracteristicasFormaManejo);

                                    insertCommand.Parameters.AddWithValue("@CaracteristicasTipoNegocio", item.Fideicomiso_CaracteristicasTipoNegocio);

                                    insertCommand.Parameters.AddWithValue("@CaracteristicasClasificacionProducto", item.Fideicomiso_CaracteristicasClasificacionProducto);

                                    insertCommand.Parameters.AddWithValue("@CaracteristicasProductoEstandar", item.Fideicomiso_CaracteristicasProductoEstandar);

                                    insertCommand.Parameters.AddWithValue("@CaracteristicasProducto", item.Fideicomiso_CaracteristicasProducto);

                                    insertCommand.Parameters.AddWithValue("@CaracteristicasValFatca", item.Fideicomiso_CaracteristicasValFatca);

  if (item.Fideicomiso_CaracteristicasMontoApertura == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasMontoApertura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasMontoApertura", item.Fideicomiso_CaracteristicasMontoApertura);

    
  if (item.Fideicomiso_CaracteristicasManejoSubFisos == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasManejoSubFisos", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasManejoSubFisos", item.Fideicomiso_CaracteristicasManejoSubFisos);

    
  if (item.Fideicomiso_CaracteristicasSujetoArt151 == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasSujetoArt151", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasSujetoArt151", item.Fideicomiso_CaracteristicasSujetoArt151);

    
  if (item.Fideicomiso_CaracteristicasCerrado == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasCerrado", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasCerrado", item.Fideicomiso_CaracteristicasCerrado);

    
  if (item.Fideicomiso_CaracteristicasRevocable == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasRevocable", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasRevocable", item.Fideicomiso_CaracteristicasRevocable);

    
  if (item.Fideicomiso_CaracteristicasEsContratoEje == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasEsContratoEje", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasEsContratoEje", item.Fideicomiso_CaracteristicasEsContratoEje);

    
  if (item.Fideicomiso_CaracteristicasComiteTecnico == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasComiteTecnico", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasComiteTecnico", item.Fideicomiso_CaracteristicasComiteTecnico);

    
  if (item.Fideicomiso_CaracteristicasOfiBanxico == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasOfiBanxico", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasOfiBanxico", item.Fideicomiso_CaracteristicasOfiBanxico);

    
  if (item.Fideicomiso_CaracteristicasManejaMonExt == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasManejaMonExt", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasManejaMonExt", item.Fideicomiso_CaracteristicasManejaMonExt);

    
  if (item.Fideicomiso_CaracteristicasIvaFronterizo == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasIvaFronterizo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasIvaFronterizo", item.Fideicomiso_CaracteristicasIvaFronterizo);

    
  if (item.Fideicomiso_CaracteristicasFechaAlta == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasFechaAlta", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasFechaAlta", item.Fideicomiso_CaracteristicasFechaAlta);

    
  if (item.Fideicomiso_CaracteristicasFechaConstitucion == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasFechaConstitucion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasFechaConstitucion", item.Fideicomiso_CaracteristicasFechaConstitucion);

    
  if (item.Fideicomiso_CaracteristicasFechaAprobacion == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasFechaAprobacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasFechaAprobacion", item.Fideicomiso_CaracteristicasFechaAprobacion);

    
                                    insertCommand.Parameters.AddWithValue("@CaracteristicasEstado", item.Fideicomiso_CaracteristicasEstado);

  if (item.Fideicomiso_AdicionalesTipo == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesTipo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesTipo", item.Fideicomiso_AdicionalesTipo);

    
                                    insertCommand.Parameters.AddWithValue("@AdicionalesTipoPersona", item.Fideicomiso_AdicionalesTipoPersona);

  if (item.Fideicomiso_AdicionalesConActividadEmpresarial == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesConActividadEmpresarial", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesConActividadEmpresarial", item.Fideicomiso_AdicionalesConActividadEmpresarial);

    
  if (item.Fideicomiso_AdicionalesPermisoSre == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesPermisoSre", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesPermisoSre", item.Fideicomiso_AdicionalesPermisoSre);

    
  if (item.Fideicomiso_AdicionalesFechaPermisoSre == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesFechaPermisoSre", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesFechaPermisoSre", item.Fideicomiso_AdicionalesFechaPermisoSre);

    
  if (item.Fideicomiso_AdicionalesProvSustFiduciaria == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesProvSustFiduciaria", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesProvSustFiduciaria", item.Fideicomiso_AdicionalesProvSustFiduciaria);

    
  if (item.Fideicomiso_AdicionalesFondosInterfaseAfore == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesFondosInterfaseAfore", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesFondosInterfaseAfore", item.Fideicomiso_AdicionalesFondosInterfaseAfore);

    
  if (item.Fideicomiso_AdicionalesRegNalInvExt == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesRegNalInvExt", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesRegNalInvExt", item.Fideicomiso_AdicionalesRegNalInvExt);

    
  if (item.Fideicomiso_AdicionalesFechaInscripcion == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesFechaInscripcion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesFechaInscripcion", item.Fideicomiso_AdicionalesFechaInscripcion);

    
  if (item.Fideicomiso_AdicionalesFormalizacionContrato == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesFormalizacionContrato", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesFormalizacionContrato", item.Fideicomiso_AdicionalesFormalizacionContrato);

    
  if (item.Fideicomiso_AdicionalesNoEscritura == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesNoEscritura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesNoEscritura", item.Fideicomiso_AdicionalesNoEscritura);

    
  if (item.Fideicomiso_AdicionalesFechaEscritura == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesFechaEscritura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesFechaEscritura", item.Fideicomiso_AdicionalesFechaEscritura);

    
  if (item.Fideicomiso_AdicionalesNombreNotario == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesNombreNotario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesNombreNotario", item.Fideicomiso_AdicionalesNombreNotario);

    
  if (item.Fideicomiso_AdicionalesNoNotario == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesNoNotario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesNoNotario", item.Fideicomiso_AdicionalesNoNotario);

    
  if (item.Fideicomiso_AdicionalesCiudadNotario == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesCiudadNotario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesCiudadNotario", item.Fideicomiso_AdicionalesCiudadNotario);

    
  if (item.Fideicomiso_AdicionalesEstadoNotario == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesEstadoNotario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesEstadoNotario", item.Fideicomiso_AdicionalesEstadoNotario);

    
  if (item.Fideicomiso_AdicionalesPaisNotario == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesPaisNotario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesPaisNotario", item.Fideicomiso_AdicionalesPaisNotario);

    
  if (item.Fideicomiso_AdicionalesFolioRegistroPublico == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesFolioRegistroPublico", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesFolioRegistroPublico", item.Fideicomiso_AdicionalesFolioRegistroPublico);

    
  if (item.Fideicomiso_AdicionalesFechaInscripcionRegPublico == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesFechaInscripcionRegPublico", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesFechaInscripcionRegPublico", item.Fideicomiso_AdicionalesFechaInscripcionRegPublico);

    
                                    insertCommand.Parameters.AddWithValue("@AdicionalesAdministracion", item.Fideicomiso_AdicionalesAdministracion);

                                    insertCommand.Parameters.AddWithValue("@AdicionalesContabilidadDelegada", item.Fideicomiso_AdicionalesContabilidadDelegada);

  if (item.Fideicomiso_DatosBanxicoActividadEconomica == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoActividadEconomica", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoActividadEconomica", item.Fideicomiso_DatosBanxicoActividadEconomica);

    
  if (item.Fideicomiso_DatosBanxicoFiducuario == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoFiducuario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoFiducuario", item.Fideicomiso_DatosBanxicoFiducuario);

    
  if (item.Fideicomiso_DatosBanxicoSectorBancario == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoSectorBancario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoSectorBancario", item.Fideicomiso_DatosBanxicoSectorBancario);

    
  if (item.Fideicomiso_DatosBanxicoLocalidad == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoLocalidad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoLocalidad", item.Fideicomiso_DatosBanxicoLocalidad);

    
  if (item.Fideicomiso_DatosBanxicoCentroResp == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoCentroResp", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoCentroResp", item.Fideicomiso_DatosBanxicoCentroResp);

    
  if (item.Fideicomiso_DatosBanxicoNoCr == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoNoCr", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoNoCr", item.Fideicomiso_DatosBanxicoNoCr);

    
  if (item.Fideicomiso_DatosBanxicoRfcContrato == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoRfcContrato", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoRfcContrato", item.Fideicomiso_DatosBanxicoRfcContrato);

    
  if (item.Fideicomiso_DatosBanxicoNumeroCliente == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoNumeroCliente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoNumeroCliente", item.Fideicomiso_DatosBanxicoNumeroCliente);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.Fideicomiso_ID.ToString(); 
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
        
        public Result UpdatePartialFideicomiso(string id, Fideicomiso item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdatePartialFideicomiso";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                             insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@GeneralesNumero", item.Fideicomiso_GeneralesNumero);

                                    insertCommand.Parameters.AddWithValue("@GeneralesNombre", item.Fideicomiso_GeneralesNombre);

                                    insertCommand.Parameters.AddWithValue("@GeneralesAdministrador", item.Fideicomiso_GeneralesAdministrador);

                                    insertCommand.Parameters.AddWithValue("@GeneralesPromotor", item.Fideicomiso_GeneralesPromotor);

                                    insertCommand.Parameters.AddWithValue("@CaracteristicasFormaManejo", item.Fideicomiso_CaracteristicasFormaManejo);

                                    insertCommand.Parameters.AddWithValue("@CaracteristicasTipoNegocio", item.Fideicomiso_CaracteristicasTipoNegocio);

                                    insertCommand.Parameters.AddWithValue("@CaracteristicasClasificacionProducto", item.Fideicomiso_CaracteristicasClasificacionProducto);

                                    insertCommand.Parameters.AddWithValue("@CaracteristicasProductoEstandar", item.Fideicomiso_CaracteristicasProductoEstandar);

                                    insertCommand.Parameters.AddWithValue("@CaracteristicasProducto", item.Fideicomiso_CaracteristicasProducto);

                                    insertCommand.Parameters.AddWithValue("@CaracteristicasValFatca", item.Fideicomiso_CaracteristicasValFatca);

  if (item.Fideicomiso_CaracteristicasMontoApertura == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasMontoApertura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasMontoApertura", item.Fideicomiso_CaracteristicasMontoApertura);

    
  if (item.Fideicomiso_CaracteristicasManejoSubFisos == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasManejoSubFisos", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasManejoSubFisos", item.Fideicomiso_CaracteristicasManejoSubFisos);

    
  if (item.Fideicomiso_CaracteristicasSujetoArt151 == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasSujetoArt151", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasSujetoArt151", item.Fideicomiso_CaracteristicasSujetoArt151);

    
  if (item.Fideicomiso_CaracteristicasCerrado == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasCerrado", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasCerrado", item.Fideicomiso_CaracteristicasCerrado);

    
  if (item.Fideicomiso_CaracteristicasRevocable == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasRevocable", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasRevocable", item.Fideicomiso_CaracteristicasRevocable);

    
  if (item.Fideicomiso_CaracteristicasEsContratoEje == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasEsContratoEje", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasEsContratoEje", item.Fideicomiso_CaracteristicasEsContratoEje);

    
  if (item.Fideicomiso_CaracteristicasComiteTecnico == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasComiteTecnico", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasComiteTecnico", item.Fideicomiso_CaracteristicasComiteTecnico);

    
  if (item.Fideicomiso_CaracteristicasOfiBanxico == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasOfiBanxico", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasOfiBanxico", item.Fideicomiso_CaracteristicasOfiBanxico);

    
  if (item.Fideicomiso_CaracteristicasManejaMonExt == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasManejaMonExt", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasManejaMonExt", item.Fideicomiso_CaracteristicasManejaMonExt);

    
  if (item.Fideicomiso_CaracteristicasIvaFronterizo == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasIvaFronterizo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasIvaFronterizo", item.Fideicomiso_CaracteristicasIvaFronterizo);

    
  if (item.Fideicomiso_CaracteristicasFechaAlta == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasFechaAlta", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasFechaAlta", item.Fideicomiso_CaracteristicasFechaAlta);

    
  if (item.Fideicomiso_CaracteristicasFechaConstitucion == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasFechaConstitucion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasFechaConstitucion", item.Fideicomiso_CaracteristicasFechaConstitucion);

    
  if (item.Fideicomiso_CaracteristicasFechaAprobacion == null) 
                                  insertCommand.Parameters.AddWithValue("@CaracteristicasFechaAprobacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CaracteristicasFechaAprobacion", item.Fideicomiso_CaracteristicasFechaAprobacion);

    
                                    insertCommand.Parameters.AddWithValue("@CaracteristicasEstado", item.Fideicomiso_CaracteristicasEstado);

  if (item.Fideicomiso_AdicionalesTipo == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesTipo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesTipo", item.Fideicomiso_AdicionalesTipo);

    
                                    insertCommand.Parameters.AddWithValue("@AdicionalesTipoPersona", item.Fideicomiso_AdicionalesTipoPersona);

  if (item.Fideicomiso_AdicionalesConActividadEmpresarial == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesConActividadEmpresarial", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesConActividadEmpresarial", item.Fideicomiso_AdicionalesConActividadEmpresarial);

    
  if (item.Fideicomiso_AdicionalesPermisoSre == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesPermisoSre", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesPermisoSre", item.Fideicomiso_AdicionalesPermisoSre);

    
  if (item.Fideicomiso_AdicionalesFechaPermisoSre == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesFechaPermisoSre", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesFechaPermisoSre", item.Fideicomiso_AdicionalesFechaPermisoSre);

    
  if (item.Fideicomiso_AdicionalesProvSustFiduciaria == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesProvSustFiduciaria", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesProvSustFiduciaria", item.Fideicomiso_AdicionalesProvSustFiduciaria);

    
  if (item.Fideicomiso_AdicionalesFondosInterfaseAfore == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesFondosInterfaseAfore", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesFondosInterfaseAfore", item.Fideicomiso_AdicionalesFondosInterfaseAfore);

    
  if (item.Fideicomiso_AdicionalesRegNalInvExt == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesRegNalInvExt", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesRegNalInvExt", item.Fideicomiso_AdicionalesRegNalInvExt);

    
  if (item.Fideicomiso_AdicionalesFechaInscripcion == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesFechaInscripcion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesFechaInscripcion", item.Fideicomiso_AdicionalesFechaInscripcion);

    
  if (item.Fideicomiso_AdicionalesFormalizacionContrato == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesFormalizacionContrato", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesFormalizacionContrato", item.Fideicomiso_AdicionalesFormalizacionContrato);

    
  if (item.Fideicomiso_AdicionalesNoEscritura == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesNoEscritura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesNoEscritura", item.Fideicomiso_AdicionalesNoEscritura);

    
  if (item.Fideicomiso_AdicionalesFechaEscritura == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesFechaEscritura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesFechaEscritura", item.Fideicomiso_AdicionalesFechaEscritura);

    
  if (item.Fideicomiso_AdicionalesNombreNotario == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesNombreNotario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesNombreNotario", item.Fideicomiso_AdicionalesNombreNotario);

    
  if (item.Fideicomiso_AdicionalesNoNotario == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesNoNotario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesNoNotario", item.Fideicomiso_AdicionalesNoNotario);

    
  if (item.Fideicomiso_AdicionalesCiudadNotario == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesCiudadNotario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesCiudadNotario", item.Fideicomiso_AdicionalesCiudadNotario);

    
  if (item.Fideicomiso_AdicionalesEstadoNotario == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesEstadoNotario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesEstadoNotario", item.Fideicomiso_AdicionalesEstadoNotario);

    
  if (item.Fideicomiso_AdicionalesPaisNotario == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesPaisNotario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesPaisNotario", item.Fideicomiso_AdicionalesPaisNotario);

    
  if (item.Fideicomiso_AdicionalesFolioRegistroPublico == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesFolioRegistroPublico", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesFolioRegistroPublico", item.Fideicomiso_AdicionalesFolioRegistroPublico);

    
  if (item.Fideicomiso_AdicionalesFechaInscripcionRegPublico == null) 
                                  insertCommand.Parameters.AddWithValue("@AdicionalesFechaInscripcionRegPublico", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@AdicionalesFechaInscripcionRegPublico", item.Fideicomiso_AdicionalesFechaInscripcionRegPublico);

    
                                    insertCommand.Parameters.AddWithValue("@AdicionalesAdministracion", item.Fideicomiso_AdicionalesAdministracion);

                                    insertCommand.Parameters.AddWithValue("@AdicionalesContabilidadDelegada", item.Fideicomiso_AdicionalesContabilidadDelegada);

  if (item.Fideicomiso_DatosBanxicoActividadEconomica == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoActividadEconomica", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoActividadEconomica", item.Fideicomiso_DatosBanxicoActividadEconomica);

    
  if (item.Fideicomiso_DatosBanxicoFiducuario == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoFiducuario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoFiducuario", item.Fideicomiso_DatosBanxicoFiducuario);

    
  if (item.Fideicomiso_DatosBanxicoSectorBancario == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoSectorBancario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoSectorBancario", item.Fideicomiso_DatosBanxicoSectorBancario);

    
  if (item.Fideicomiso_DatosBanxicoLocalidad == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoLocalidad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoLocalidad", item.Fideicomiso_DatosBanxicoLocalidad);

    
  if (item.Fideicomiso_DatosBanxicoCentroResp == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoCentroResp", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoCentroResp", item.Fideicomiso_DatosBanxicoCentroResp);

    
  if (item.Fideicomiso_DatosBanxicoNoCr == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoNoCr", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoNoCr", item.Fideicomiso_DatosBanxicoNoCr);

    
  if (item.Fideicomiso_DatosBanxicoRfcContrato == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoRfcContrato", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoRfcContrato", item.Fideicomiso_DatosBanxicoRfcContrato);

    
  if (item.Fideicomiso_DatosBanxicoNumeroCliente == null) 
                                  insertCommand.Parameters.AddWithValue("@DatosBanxicoNumeroCliente", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@DatosBanxicoNumeroCliente", item.Fideicomiso_DatosBanxicoNumeroCliente);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.Fideicomiso_ID.ToString(); 
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
