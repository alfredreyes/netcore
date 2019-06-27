//Fecha Creación:5/24/2019 6:13:18 PM Template DataClass, Author: Alfredo Reyes C., V1
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
    public class FideicomitenteData : IFideicomitenteData, IDisposable
    {
        private string _conexion;
       
        public FideicomitenteData(string conexion)
        {
            _conexion = conexion;
        }
        public Result DeleteFideicomitente(string id)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spDeleteFideicomitente";
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
                        res.Message = "La entidad Fideicomitente tiene registros que dependen de ella en otra tabla no se pudo eliminar.";
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
        
        public Fideicomitente GetFideicomitente(string id)
        {
            Fideicomitente entidad = new  Fideicomitente();           

            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetFideicomitenteByID";
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
                         entidad.Fideicomitente_ID = reader["ID"].ToString();
 if(reader["NumeroFideicomitente"] != DBNull.Value)               
                         entidad.Fideicomitente_NumeroFideicomitente = reader["NumeroFideicomitente"].ToString();
 if(reader["TipoPersona"] != DBNull.Value)               
                         entidad.Fideicomitente_TipoPersona = reader["TipoPersona"].ToString();
 if(reader["Participante"] != DBNull.Value)               
                         entidad.Fideicomitente_Participante = reader["Participante"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         entidad.Fideicomitente_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["RegimenFiscal"] != DBNull.Value)               
                         entidad.Fideicomitente_RegimenFiscal = reader["RegimenFiscal"].ToString();
 if(reader["GeneralesControladorFideicomiso"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesControladorFideicomiso = reader["GeneralesControladorFideicomiso"].ToString();
 if(reader["GeneralesNacionalidad"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesNacionalidad = reader["GeneralesNacionalidad"].ToString();
 if(reader["GeneralesPaisOrigen"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesPaisOrigen = reader["GeneralesPaisOrigen"].ToString();
 if(reader["GeneralesActividad"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesActividad = reader["GeneralesActividad"].ToString();
 if(reader["GeneralesAportaRecursos"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesAportaRecursos = reader["GeneralesAportaRecursos"].ToString();
 if(reader["GeneralesPaisResidencia"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesPaisResidencia = reader["GeneralesPaisResidencia"].ToString();
 if(reader["GeneralesClienteScotiaBank"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesClienteScotiaBank = reader["GeneralesClienteScotiaBank"].ToString();
 if(reader["GeneralesPep"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesPep = reader["GeneralesPep"].ToString();
 if(reader["GeneralesEstatus"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesEstatus = reader["GeneralesEstatus"].ToString();
 if(reader["GeneralesGrupoFilial"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesGrupoFilial = reader["GeneralesGrupoFilial"].ToString();
 if(reader["GeneralesCalidadMigratoria"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesCalidadMigratoria = reader["GeneralesCalidadMigratoria"].ToString();
 if(reader["GeneralesLugarOperacion"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesLugarOperacion = reader["GeneralesLugarOperacion"].ToString();
 if(reader["GeneralesOperaCuentaTerceros"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesOperaCuentaTerceros = reader["GeneralesOperaCuentaTerceros"].ToString();
 if(reader["GeneralesNivelParticipante"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesNivelParticipante = reader["GeneralesNivelParticipante"].ToString();
 if(reader["GeneralesClienteRelacionPep"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesClienteRelacionPep = reader["GeneralesClienteRelacionPep"].ToString();
 if(reader["GeneralesGrado"] != DBNull.Value)               
                         entidad.Fideicomitente_GeneralesGrado = reader["GeneralesGrado"].ToString();
 if(reader["InfoPldKycHonorarios"] != DBNull.Value)               
                         entidad.Fideicomitente_InfoPldKycHonorarios = reader["InfoPldKycHonorarios"].ToString();
 if(reader["InfoPldKycComisiones"] != DBNull.Value)               
                         entidad.Fideicomitente_InfoPldKycComisiones = reader["InfoPldKycComisiones"].ToString();
 if(reader["InfoPldKycOtros"] != DBNull.Value)               
                         entidad.Fideicomitente_InfoPldKycOtros = reader["InfoPldKycOtros"].ToString();
 if(reader["InfoPldKycSueldos"] != DBNull.Value)               
                         entidad.Fideicomitente_InfoPldKycSueldos = reader["InfoPldKycSueldos"].ToString();
 if(reader["InfoPldKycVenta"] != DBNull.Value)               
                         entidad.Fideicomitente_InfoPldKycVenta = reader["InfoPldKycVenta"].ToString();
 if(reader["InfoPldKycInversiones"] != DBNull.Value)               
                         entidad.Fideicomitente_InfoPldKycInversiones = reader["InfoPldKycInversiones"].ToString();
 if(reader["InfoPldKycArrendamiento"] != DBNull.Value)               
                         entidad.Fideicomitente_InfoPldKycArrendamiento = reader["InfoPldKycArrendamiento"].ToString();
 if(reader["InfoPldKycTipoPatrimonio"] != DBNull.Value)               
                         entidad.Fideicomitente_InfoPldKycTipoPatrimonio = reader["InfoPldKycTipoPatrimonio"].ToString();
 if(reader["InfoPldKycInstrumento"] != DBNull.Value)               
                         entidad.Fideicomitente_InfoPldKycInstrumento = reader["InfoPldKycInstrumento"].ToString();
 if(reader["InfoPldKycRazonApertura"] != DBNull.Value)               
                         entidad.Fideicomitente_InfoPldKycRazonApertura = reader["InfoPldKycRazonApertura"].ToString();
 if(reader["InfoPldKycComentarios"] != DBNull.Value)               
                         entidad.Fideicomitente_InfoPldKycComentarios = reader["InfoPldKycComentarios"].ToString();
 if(reader["InfoPldKycNivelRiesgo"] != DBNull.Value)               
                         entidad.Fideicomitente_InfoPldKycNivelRiesgo = reader["InfoPldKycNivelRiesgo"].ToString();
 if(reader["InfoPldKycEstatusCalculoPld"] != DBNull.Value)               
                         entidad.Fideicomitente_InfoPldKycEstatusCalculoPld = reader["InfoPldKycEstatusCalculoPld"].ToString();
 if(reader["InfoPldKycFechaVerifFircosoft"] != DBNull.Value)               
                         entidad.Fideicomitente_InfoPldKycFechaVerifFircosoft = DateTime.Parse(reader["InfoPldKycFechaVerifFircosoft"].ToString());
 if(reader["IdentificacionRfc"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionRfc = reader["IdentificacionRfc"].ToString();
 if(reader["IdentificacionCurp"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionCurp = reader["IdentificacionCurp"].ToString();
 if(reader["IdentificacionNoSerieEfirma"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionNoSerieEfirma = reader["IdentificacionNoSerieEfirma"].ToString();
 if(reader["IdentificacionPaisResidFisc1"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionPaisResidFisc1 = reader["IdentificacionPaisResidFisc1"].ToString();
 if(reader["IdentificacionPaisResidFisc2"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionPaisResidFisc2 = reader["IdentificacionPaisResidFisc2"].ToString();
 if(reader["IdentificacionEmail"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionEmail = reader["IdentificacionEmail"].ToString();
 if(reader["IdentificacionFechaConstitucion"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionFechaConstitucion = DateTime.Parse(reader["IdentificacionFechaConstitucion"].ToString());
 if(reader["IdentificacionSexo"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionSexo = reader["IdentificacionSexo"].ToString();
 if(reader["IdentificacionPaisCasa"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionPaisCasa = reader["IdentificacionPaisCasa"].ToString();
 if(reader["IdentificacionPaisOficina"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionPaisOficina = reader["IdentificacionPaisOficina"].ToString();
 if(reader["IdentificacionPaisCelular"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionPaisCelular = reader["IdentificacionPaisCelular"].ToString();
 if(reader["IdentificacionFechaInicioRelNeg"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionFechaInicioRelNeg = DateTime.Parse(reader["IdentificacionFechaInicioRelNeg"].ToString());
 if(reader["IdentificacionNoIdentificacion"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionNoIdentificacion = reader["IdentificacionNoIdentificacion"].ToString();
 if(reader["IdentificacionComprobacionDomicilio"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionComprobacionDomicilio = reader["IdentificacionComprobacionDomicilio"].ToString();
 if(reader["IdentificacionActividadEmpresarial"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionActividadEmpresarial = reader["IdentificacionActividadEmpresarial"].ToString();
 if(reader["IdentificacionNoIdentFisc1"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionNoIdentFisc1 = reader["IdentificacionNoIdentFisc1"].ToString();
 if(reader["IdentificacionNoIdentFisc2"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionNoIdentFisc2 = reader["IdentificacionNoIdentFisc2"].ToString();
 if(reader["IdentificacionClasificacionFatca"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionClasificacionFatca = reader["IdentificacionClasificacionFatca"].ToString();
 if(reader["IdentificacionLadaCasa"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionLadaCasa = reader["IdentificacionLadaCasa"].ToString();
 if(reader["IdentificacionLadaOficina"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionLadaOficina = reader["IdentificacionLadaOficina"].ToString();
 if(reader["IdentificacionLadaCelular"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionLadaCelular = reader["IdentificacionLadaCelular"].ToString();
 if(reader["IdentificacionNumeroCasa"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionNumeroCasa = reader["IdentificacionNumeroCasa"].ToString();
 if(reader["IdentificacionNumeroOficina"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionNumeroOficina = reader["IdentificacionNumeroOficina"].ToString();
 if(reader["IdentificacionNumeroCelular"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionNumeroCelular = reader["IdentificacionNumeroCelular"].ToString();
 if(reader["IdentificacionExtOficina"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionExtOficina = reader["IdentificacionExtOficina"].ToString();
 if(reader["IdentificacionExtCelular"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionExtCelular = reader["IdentificacionExtCelular"].ToString();
 if(reader["IdentificacionIdentOficialVig"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionIdentOficialVig = reader["IdentificacionIdentOficialVig"].ToString();
 if(reader["IdentificacionVigencia"] != DBNull.Value)               
                         entidad.Fideicomitente_IdentificacionVigencia = reader["IdentificacionVigencia"].ToString();
 if(reader["EscrituraNoEscritura"] != DBNull.Value)               
                         entidad.Fideicomitente_EscrituraNoEscritura = reader["EscrituraNoEscritura"].ToString();
 if(reader["EscrituraNotario"] != DBNull.Value)               
                         entidad.Fideicomitente_EscrituraNotario = reader["EscrituraNotario"].ToString();
 if(reader["EscrituraNoNotaria"] != DBNull.Value)               
                         entidad.Fideicomitente_EscrituraNoNotaria = reader["EscrituraNoNotaria"].ToString();
 if(reader["EscrituraCiudad"] != DBNull.Value)               
                         entidad.Fideicomitente_EscrituraCiudad = reader["EscrituraCiudad"].ToString();
 if(reader["EscrituraTelefono"] != DBNull.Value)               
                         entidad.Fideicomitente_EscrituraTelefono = reader["EscrituraTelefono"].ToString();
 if(reader["EscrituraEmail"] != DBNull.Value)               
                         entidad.Fideicomitente_EscrituraEmail = reader["EscrituraEmail"].ToString();
 if(reader["EscrituraFecha"] != DBNull.Value)               
                         entidad.Fideicomitente_EscrituraFecha = DateTime.Parse(reader["EscrituraFecha"].ToString());
 if(reader["EscrituraEstado"] != DBNull.Value)               
                         entidad.Fideicomitente_EscrituraEstado = reader["EscrituraEstado"].ToString();
 if(reader["CuentasKYCNoCuenta1"] != DBNull.Value)               
                         entidad.Fideicomitente_CuentasKYCNoCuenta1 = Int32.Parse(reader["CuentasKYCNoCuenta1"].ToString());
 if(reader["CuentasKYCTipoCuenta1"] != DBNull.Value)               
                         entidad.Fideicomitente_CuentasKYCTipoCuenta1 = reader["CuentasKYCTipoCuenta1"].ToString();
 if(reader["CuentasKYCNoCuenta2"] != DBNull.Value)               
                         entidad.Fideicomitente_CuentasKYCNoCuenta2 = Int32.Parse(reader["CuentasKYCNoCuenta2"].ToString());
 if(reader["CuentasKYCTipoCuenta2"] != DBNull.Value)               
                         entidad.Fideicomitente_CuentasKYCTipoCuenta2 = reader["CuentasKYCTipoCuenta2"].ToString();
 if(reader["CuentasKYCNoCuenta3"] != DBNull.Value)               
                         entidad.Fideicomitente_CuentasKYCNoCuenta3 = Int32.Parse(reader["CuentasKYCNoCuenta3"].ToString());
 if(reader["CuentasKYCTipoCuenta3"] != DBNull.Value)               
                         entidad.Fideicomitente_CuentasKYCTipoCuenta3 = reader["CuentasKYCTipoCuenta3"].ToString();
 if(reader["CuentasKYCNoCuenta4"] != DBNull.Value)               
                         entidad.Fideicomitente_CuentasKYCNoCuenta4 = Int32.Parse(reader["CuentasKYCNoCuenta4"].ToString());
 if(reader["CuentasKYCTipoCuenta4"] != DBNull.Value)               
                         entidad.Fideicomitente_CuentasKYCTipoCuenta4 = reader["CuentasKYCTipoCuenta4"].ToString();
                   
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
        public List<Fideicomitente> GetFideicomitentesAndRelations(int page, int numrecords)
        {
            List<Fideicomitente> lista = new List<Fideicomitente>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListFideicomitentePaged";
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
                    var it = new Fideicomitente();
            
                      if(reader["ID"] != DBNull.Value)               
                         it.Fideicomitente_ID = reader["ID"].ToString();
 if(reader["NumeroFideicomitente"] != DBNull.Value)               
                         it.Fideicomitente_NumeroFideicomitente = reader["NumeroFideicomitente"].ToString();
 if(reader["TipoPersona"] != DBNull.Value)               
                         it.Fideicomitente_TipoPersona = reader["TipoPersona"].ToString();
 if(reader["Participante"] != DBNull.Value)               
                         it.Fideicomitente_Participante = reader["Participante"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         it.Fideicomitente_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["RegimenFiscal"] != DBNull.Value)               
                         it.Fideicomitente_RegimenFiscal = reader["RegimenFiscal"].ToString();
 if(reader["GeneralesControladorFideicomiso"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesControladorFideicomiso = reader["GeneralesControladorFideicomiso"].ToString();
 if(reader["GeneralesNacionalidad"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesNacionalidad = reader["GeneralesNacionalidad"].ToString();
 if(reader["GeneralesPaisOrigen"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesPaisOrigen = reader["GeneralesPaisOrigen"].ToString();
 if(reader["GeneralesActividad"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesActividad = reader["GeneralesActividad"].ToString();
 if(reader["GeneralesAportaRecursos"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesAportaRecursos = reader["GeneralesAportaRecursos"].ToString();
 if(reader["GeneralesPaisResidencia"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesPaisResidencia = reader["GeneralesPaisResidencia"].ToString();
 if(reader["GeneralesClienteScotiaBank"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesClienteScotiaBank = reader["GeneralesClienteScotiaBank"].ToString();
 if(reader["GeneralesPep"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesPep = reader["GeneralesPep"].ToString();
 if(reader["GeneralesEstatus"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesEstatus = reader["GeneralesEstatus"].ToString();
 if(reader["GeneralesGrupoFilial"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesGrupoFilial = reader["GeneralesGrupoFilial"].ToString();
 if(reader["GeneralesCalidadMigratoria"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesCalidadMigratoria = reader["GeneralesCalidadMigratoria"].ToString();
 if(reader["GeneralesLugarOperacion"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesLugarOperacion = reader["GeneralesLugarOperacion"].ToString();
 if(reader["GeneralesOperaCuentaTerceros"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesOperaCuentaTerceros = reader["GeneralesOperaCuentaTerceros"].ToString();
 if(reader["GeneralesNivelParticipante"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesNivelParticipante = reader["GeneralesNivelParticipante"].ToString();
 if(reader["GeneralesClienteRelacionPep"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesClienteRelacionPep = reader["GeneralesClienteRelacionPep"].ToString();
 if(reader["GeneralesGrado"] != DBNull.Value)               
                         it.Fideicomitente_GeneralesGrado = reader["GeneralesGrado"].ToString();
 if(reader["InfoPldKycHonorarios"] != DBNull.Value)               
                         it.Fideicomitente_InfoPldKycHonorarios = reader["InfoPldKycHonorarios"].ToString();
 if(reader["InfoPldKycComisiones"] != DBNull.Value)               
                         it.Fideicomitente_InfoPldKycComisiones = reader["InfoPldKycComisiones"].ToString();
 if(reader["InfoPldKycOtros"] != DBNull.Value)               
                         it.Fideicomitente_InfoPldKycOtros = reader["InfoPldKycOtros"].ToString();
 if(reader["InfoPldKycSueldos"] != DBNull.Value)               
                         it.Fideicomitente_InfoPldKycSueldos = reader["InfoPldKycSueldos"].ToString();
 if(reader["InfoPldKycVenta"] != DBNull.Value)               
                         it.Fideicomitente_InfoPldKycVenta = reader["InfoPldKycVenta"].ToString();
 if(reader["InfoPldKycInversiones"] != DBNull.Value)               
                         it.Fideicomitente_InfoPldKycInversiones = reader["InfoPldKycInversiones"].ToString();
 if(reader["InfoPldKycArrendamiento"] != DBNull.Value)               
                         it.Fideicomitente_InfoPldKycArrendamiento = reader["InfoPldKycArrendamiento"].ToString();
 if(reader["InfoPldKycTipoPatrimonio"] != DBNull.Value)               
                         it.Fideicomitente_InfoPldKycTipoPatrimonio = reader["InfoPldKycTipoPatrimonio"].ToString();
 if(reader["InfoPldKycInstrumento"] != DBNull.Value)               
                         it.Fideicomitente_InfoPldKycInstrumento = reader["InfoPldKycInstrumento"].ToString();
 if(reader["InfoPldKycRazonApertura"] != DBNull.Value)               
                         it.Fideicomitente_InfoPldKycRazonApertura = reader["InfoPldKycRazonApertura"].ToString();
 if(reader["InfoPldKycComentarios"] != DBNull.Value)               
                         it.Fideicomitente_InfoPldKycComentarios = reader["InfoPldKycComentarios"].ToString();
 if(reader["InfoPldKycNivelRiesgo"] != DBNull.Value)               
                         it.Fideicomitente_InfoPldKycNivelRiesgo = reader["InfoPldKycNivelRiesgo"].ToString();
 if(reader["InfoPldKycEstatusCalculoPld"] != DBNull.Value)               
                         it.Fideicomitente_InfoPldKycEstatusCalculoPld = reader["InfoPldKycEstatusCalculoPld"].ToString();
 if(reader["InfoPldKycFechaVerifFircosoft"] != DBNull.Value)               
                         it.Fideicomitente_InfoPldKycFechaVerifFircosoft = DateTime.Parse(reader["InfoPldKycFechaVerifFircosoft"].ToString());
 if(reader["IdentificacionRfc"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionRfc = reader["IdentificacionRfc"].ToString();
 if(reader["IdentificacionCurp"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionCurp = reader["IdentificacionCurp"].ToString();
 if(reader["IdentificacionNoSerieEfirma"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionNoSerieEfirma = reader["IdentificacionNoSerieEfirma"].ToString();
 if(reader["IdentificacionPaisResidFisc1"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionPaisResidFisc1 = reader["IdentificacionPaisResidFisc1"].ToString();
 if(reader["IdentificacionPaisResidFisc2"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionPaisResidFisc2 = reader["IdentificacionPaisResidFisc2"].ToString();
 if(reader["IdentificacionEmail"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionEmail = reader["IdentificacionEmail"].ToString();
 if(reader["IdentificacionFechaConstitucion"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionFechaConstitucion = DateTime.Parse(reader["IdentificacionFechaConstitucion"].ToString());
 if(reader["IdentificacionSexo"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionSexo = reader["IdentificacionSexo"].ToString();
 if(reader["IdentificacionPaisCasa"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionPaisCasa = reader["IdentificacionPaisCasa"].ToString();
 if(reader["IdentificacionPaisOficina"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionPaisOficina = reader["IdentificacionPaisOficina"].ToString();
 if(reader["IdentificacionPaisCelular"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionPaisCelular = reader["IdentificacionPaisCelular"].ToString();
 if(reader["IdentificacionFechaInicioRelNeg"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionFechaInicioRelNeg = DateTime.Parse(reader["IdentificacionFechaInicioRelNeg"].ToString());
 if(reader["IdentificacionNoIdentificacion"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionNoIdentificacion = reader["IdentificacionNoIdentificacion"].ToString();
 if(reader["IdentificacionComprobacionDomicilio"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionComprobacionDomicilio = reader["IdentificacionComprobacionDomicilio"].ToString();
 if(reader["IdentificacionActividadEmpresarial"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionActividadEmpresarial = reader["IdentificacionActividadEmpresarial"].ToString();
 if(reader["IdentificacionNoIdentFisc1"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionNoIdentFisc1 = reader["IdentificacionNoIdentFisc1"].ToString();
 if(reader["IdentificacionNoIdentFisc2"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionNoIdentFisc2 = reader["IdentificacionNoIdentFisc2"].ToString();
 if(reader["IdentificacionClasificacionFatca"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionClasificacionFatca = reader["IdentificacionClasificacionFatca"].ToString();
 if(reader["IdentificacionLadaCasa"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionLadaCasa = reader["IdentificacionLadaCasa"].ToString();
 if(reader["IdentificacionLadaOficina"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionLadaOficina = reader["IdentificacionLadaOficina"].ToString();
 if(reader["IdentificacionLadaCelular"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionLadaCelular = reader["IdentificacionLadaCelular"].ToString();
 if(reader["IdentificacionNumeroCasa"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionNumeroCasa = reader["IdentificacionNumeroCasa"].ToString();
 if(reader["IdentificacionNumeroOficina"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionNumeroOficina = reader["IdentificacionNumeroOficina"].ToString();
 if(reader["IdentificacionNumeroCelular"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionNumeroCelular = reader["IdentificacionNumeroCelular"].ToString();
 if(reader["IdentificacionExtOficina"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionExtOficina = reader["IdentificacionExtOficina"].ToString();
 if(reader["IdentificacionExtCelular"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionExtCelular = reader["IdentificacionExtCelular"].ToString();
 if(reader["IdentificacionIdentOficialVig"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionIdentOficialVig = reader["IdentificacionIdentOficialVig"].ToString();
 if(reader["IdentificacionVigencia"] != DBNull.Value)               
                         it.Fideicomitente_IdentificacionVigencia = reader["IdentificacionVigencia"].ToString();
 if(reader["EscrituraNoEscritura"] != DBNull.Value)               
                         it.Fideicomitente_EscrituraNoEscritura = reader["EscrituraNoEscritura"].ToString();
 if(reader["EscrituraNotario"] != DBNull.Value)               
                         it.Fideicomitente_EscrituraNotario = reader["EscrituraNotario"].ToString();
 if(reader["EscrituraNoNotaria"] != DBNull.Value)               
                         it.Fideicomitente_EscrituraNoNotaria = reader["EscrituraNoNotaria"].ToString();
 if(reader["EscrituraCiudad"] != DBNull.Value)               
                         it.Fideicomitente_EscrituraCiudad = reader["EscrituraCiudad"].ToString();
 if(reader["EscrituraTelefono"] != DBNull.Value)               
                         it.Fideicomitente_EscrituraTelefono = reader["EscrituraTelefono"].ToString();
 if(reader["EscrituraEmail"] != DBNull.Value)               
                         it.Fideicomitente_EscrituraEmail = reader["EscrituraEmail"].ToString();
 if(reader["EscrituraFecha"] != DBNull.Value)               
                         it.Fideicomitente_EscrituraFecha = DateTime.Parse(reader["EscrituraFecha"].ToString());
 if(reader["EscrituraEstado"] != DBNull.Value)               
                         it.Fideicomitente_EscrituraEstado = reader["EscrituraEstado"].ToString();
 if(reader["CuentasKYCNoCuenta1"] != DBNull.Value)               
                         it.Fideicomitente_CuentasKYCNoCuenta1 = Int32.Parse(reader["CuentasKYCNoCuenta1"].ToString());
 if(reader["CuentasKYCTipoCuenta1"] != DBNull.Value)               
                         it.Fideicomitente_CuentasKYCTipoCuenta1 = reader["CuentasKYCTipoCuenta1"].ToString();
 if(reader["CuentasKYCNoCuenta2"] != DBNull.Value)               
                         it.Fideicomitente_CuentasKYCNoCuenta2 = Int32.Parse(reader["CuentasKYCNoCuenta2"].ToString());
 if(reader["CuentasKYCTipoCuenta2"] != DBNull.Value)               
                         it.Fideicomitente_CuentasKYCTipoCuenta2 = reader["CuentasKYCTipoCuenta2"].ToString();
 if(reader["CuentasKYCNoCuenta3"] != DBNull.Value)               
                         it.Fideicomitente_CuentasKYCNoCuenta3 = Int32.Parse(reader["CuentasKYCNoCuenta3"].ToString());
 if(reader["CuentasKYCTipoCuenta3"] != DBNull.Value)               
                         it.Fideicomitente_CuentasKYCTipoCuenta3 = reader["CuentasKYCTipoCuenta3"].ToString();
 if(reader["CuentasKYCNoCuenta4"] != DBNull.Value)               
                         it.Fideicomitente_CuentasKYCNoCuenta4 = Int32.Parse(reader["CuentasKYCNoCuenta4"].ToString());
 if(reader["CuentasKYCTipoCuenta4"] != DBNull.Value)               
                         it.Fideicomitente_CuentasKYCTipoCuenta4 = reader["CuentasKYCTipoCuenta4"].ToString();
                   
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
        public List<Fideicomitente> GetFideicomitentes(int page, int numrecords)
        {
            List<Fideicomitente> lista = new List<Fideicomitente>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListFideicomitentePaged";
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
                    var it = new Fideicomitente();
            
                            if(reader["ID"] != DBNull.Value)               
                             it.Fideicomitente_ID = reader["ID"].ToString();
                            if(reader["NumeroFideicomitente"] != DBNull.Value)               
                             it.Fideicomitente_NumeroFideicomitente = reader["NumeroFideicomitente"].ToString();
                            if(reader["TipoPersona"] != DBNull.Value)               
                             it.Fideicomitente_TipoPersona = reader["TipoPersona"].ToString();
                            if(reader["Participante"] != DBNull.Value)               
                             it.Fideicomitente_Participante = reader["Participante"].ToString();
                            if(reader["Fideicomiso"] != DBNull.Value)               
                             it.Fideicomitente_Fideicomiso = reader["Fideicomiso"].ToString();
                            if(reader["RegimenFiscal"] != DBNull.Value)               
                             it.Fideicomitente_RegimenFiscal = reader["RegimenFiscal"].ToString();
                            if(reader["GeneralesControladorFideicomiso"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesControladorFideicomiso = reader["GeneralesControladorFideicomiso"].ToString();
                            if(reader["GeneralesNacionalidad"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesNacionalidad = reader["GeneralesNacionalidad"].ToString();
                            if(reader["GeneralesPaisOrigen"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesPaisOrigen = reader["GeneralesPaisOrigen"].ToString();
                            if(reader["GeneralesActividad"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesActividad = reader["GeneralesActividad"].ToString();
                            if(reader["GeneralesAportaRecursos"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesAportaRecursos = reader["GeneralesAportaRecursos"].ToString();
                            if(reader["GeneralesPaisResidencia"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesPaisResidencia = reader["GeneralesPaisResidencia"].ToString();
                            if(reader["GeneralesClienteScotiaBank"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesClienteScotiaBank = reader["GeneralesClienteScotiaBank"].ToString();
                            if(reader["GeneralesPep"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesPep = reader["GeneralesPep"].ToString();
                            if(reader["GeneralesEstatus"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesEstatus = reader["GeneralesEstatus"].ToString();
                            if(reader["GeneralesGrupoFilial"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesGrupoFilial = reader["GeneralesGrupoFilial"].ToString();
                            if(reader["GeneralesCalidadMigratoria"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesCalidadMigratoria = reader["GeneralesCalidadMigratoria"].ToString();
                            if(reader["GeneralesLugarOperacion"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesLugarOperacion = reader["GeneralesLugarOperacion"].ToString();
                            if(reader["GeneralesOperaCuentaTerceros"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesOperaCuentaTerceros = reader["GeneralesOperaCuentaTerceros"].ToString();
                            if(reader["GeneralesNivelParticipante"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesNivelParticipante = reader["GeneralesNivelParticipante"].ToString();
                            if(reader["GeneralesClienteRelacionPep"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesClienteRelacionPep = reader["GeneralesClienteRelacionPep"].ToString();
                            if(reader["GeneralesGrado"] != DBNull.Value)               
                             it.Fideicomitente_GeneralesGrado = reader["GeneralesGrado"].ToString();
                            if(reader["InfoPldKycHonorarios"] != DBNull.Value)               
                             it.Fideicomitente_InfoPldKycHonorarios = reader["InfoPldKycHonorarios"].ToString();
                            if(reader["InfoPldKycComisiones"] != DBNull.Value)               
                             it.Fideicomitente_InfoPldKycComisiones = reader["InfoPldKycComisiones"].ToString();
                            if(reader["InfoPldKycOtros"] != DBNull.Value)               
                             it.Fideicomitente_InfoPldKycOtros = reader["InfoPldKycOtros"].ToString();
                            if(reader["InfoPldKycSueldos"] != DBNull.Value)               
                             it.Fideicomitente_InfoPldKycSueldos = reader["InfoPldKycSueldos"].ToString();
                            if(reader["InfoPldKycVenta"] != DBNull.Value)               
                             it.Fideicomitente_InfoPldKycVenta = reader["InfoPldKycVenta"].ToString();
                            if(reader["InfoPldKycInversiones"] != DBNull.Value)               
                             it.Fideicomitente_InfoPldKycInversiones = reader["InfoPldKycInversiones"].ToString();
                            if(reader["InfoPldKycArrendamiento"] != DBNull.Value)               
                             it.Fideicomitente_InfoPldKycArrendamiento = reader["InfoPldKycArrendamiento"].ToString();
                            if(reader["InfoPldKycTipoPatrimonio"] != DBNull.Value)               
                             it.Fideicomitente_InfoPldKycTipoPatrimonio = reader["InfoPldKycTipoPatrimonio"].ToString();
                            if(reader["InfoPldKycInstrumento"] != DBNull.Value)               
                             it.Fideicomitente_InfoPldKycInstrumento = reader["InfoPldKycInstrumento"].ToString();
                            if(reader["InfoPldKycRazonApertura"] != DBNull.Value)               
                             it.Fideicomitente_InfoPldKycRazonApertura = reader["InfoPldKycRazonApertura"].ToString();
                            if(reader["InfoPldKycComentarios"] != DBNull.Value)               
                             it.Fideicomitente_InfoPldKycComentarios = reader["InfoPldKycComentarios"].ToString();
                            if(reader["InfoPldKycNivelRiesgo"] != DBNull.Value)               
                             it.Fideicomitente_InfoPldKycNivelRiesgo = reader["InfoPldKycNivelRiesgo"].ToString();
                            if(reader["InfoPldKycEstatusCalculoPld"] != DBNull.Value)               
                             it.Fideicomitente_InfoPldKycEstatusCalculoPld = reader["InfoPldKycEstatusCalculoPld"].ToString();
                            if(reader["InfoPldKycFechaVerifFircosoft"] != DBNull.Value)               
                             it.Fideicomitente_InfoPldKycFechaVerifFircosoft = DateTime.Parse(reader["InfoPldKycFechaVerifFircosoft"].ToString());
                            if(reader["IdentificacionRfc"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionRfc = reader["IdentificacionRfc"].ToString();
                            if(reader["IdentificacionCurp"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionCurp = reader["IdentificacionCurp"].ToString();
                            if(reader["IdentificacionNoSerieEfirma"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionNoSerieEfirma = reader["IdentificacionNoSerieEfirma"].ToString();
                            if(reader["IdentificacionPaisResidFisc1"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionPaisResidFisc1 = reader["IdentificacionPaisResidFisc1"].ToString();
                            if(reader["IdentificacionPaisResidFisc2"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionPaisResidFisc2 = reader["IdentificacionPaisResidFisc2"].ToString();
                            if(reader["IdentificacionEmail"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionEmail = reader["IdentificacionEmail"].ToString();
                            if(reader["IdentificacionFechaConstitucion"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionFechaConstitucion = DateTime.Parse(reader["IdentificacionFechaConstitucion"].ToString());
                            if(reader["IdentificacionSexo"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionSexo = reader["IdentificacionSexo"].ToString();
                            if(reader["IdentificacionPaisCasa"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionPaisCasa = reader["IdentificacionPaisCasa"].ToString();
                            if(reader["IdentificacionPaisOficina"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionPaisOficina = reader["IdentificacionPaisOficina"].ToString();
                            if(reader["IdentificacionPaisCelular"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionPaisCelular = reader["IdentificacionPaisCelular"].ToString();
                            if(reader["IdentificacionFechaInicioRelNeg"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionFechaInicioRelNeg = DateTime.Parse(reader["IdentificacionFechaInicioRelNeg"].ToString());
                            if(reader["IdentificacionNoIdentificacion"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionNoIdentificacion = reader["IdentificacionNoIdentificacion"].ToString();
                            if(reader["IdentificacionComprobacionDomicilio"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionComprobacionDomicilio = reader["IdentificacionComprobacionDomicilio"].ToString();
                            if(reader["IdentificacionActividadEmpresarial"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionActividadEmpresarial = reader["IdentificacionActividadEmpresarial"].ToString();
                            if(reader["IdentificacionNoIdentFisc1"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionNoIdentFisc1 = reader["IdentificacionNoIdentFisc1"].ToString();
                            if(reader["IdentificacionNoIdentFisc2"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionNoIdentFisc2 = reader["IdentificacionNoIdentFisc2"].ToString();
                            if(reader["IdentificacionClasificacionFatca"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionClasificacionFatca = reader["IdentificacionClasificacionFatca"].ToString();
                            if(reader["IdentificacionLadaCasa"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionLadaCasa = reader["IdentificacionLadaCasa"].ToString();
                            if(reader["IdentificacionLadaOficina"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionLadaOficina = reader["IdentificacionLadaOficina"].ToString();
                            if(reader["IdentificacionLadaCelular"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionLadaCelular = reader["IdentificacionLadaCelular"].ToString();
                            if(reader["IdentificacionNumeroCasa"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionNumeroCasa = reader["IdentificacionNumeroCasa"].ToString();
                            if(reader["IdentificacionNumeroOficina"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionNumeroOficina = reader["IdentificacionNumeroOficina"].ToString();
                            if(reader["IdentificacionNumeroCelular"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionNumeroCelular = reader["IdentificacionNumeroCelular"].ToString();
                            if(reader["IdentificacionExtOficina"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionExtOficina = reader["IdentificacionExtOficina"].ToString();
                            if(reader["IdentificacionExtCelular"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionExtCelular = reader["IdentificacionExtCelular"].ToString();
                            if(reader["IdentificacionIdentOficialVig"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionIdentOficialVig = reader["IdentificacionIdentOficialVig"].ToString();
                            if(reader["IdentificacionVigencia"] != DBNull.Value)               
                             it.Fideicomitente_IdentificacionVigencia = reader["IdentificacionVigencia"].ToString();
                            if(reader["EscrituraNoEscritura"] != DBNull.Value)               
                             it.Fideicomitente_EscrituraNoEscritura = reader["EscrituraNoEscritura"].ToString();
                            if(reader["EscrituraNotario"] != DBNull.Value)               
                             it.Fideicomitente_EscrituraNotario = reader["EscrituraNotario"].ToString();
                            if(reader["EscrituraNoNotaria"] != DBNull.Value)               
                             it.Fideicomitente_EscrituraNoNotaria = reader["EscrituraNoNotaria"].ToString();
                            if(reader["EscrituraCiudad"] != DBNull.Value)               
                             it.Fideicomitente_EscrituraCiudad = reader["EscrituraCiudad"].ToString();
                            if(reader["EscrituraTelefono"] != DBNull.Value)               
                             it.Fideicomitente_EscrituraTelefono = reader["EscrituraTelefono"].ToString();
                            if(reader["EscrituraEmail"] != DBNull.Value)               
                             it.Fideicomitente_EscrituraEmail = reader["EscrituraEmail"].ToString();
                            if(reader["EscrituraFecha"] != DBNull.Value)               
                             it.Fideicomitente_EscrituraFecha = DateTime.Parse(reader["EscrituraFecha"].ToString());
                            if(reader["EscrituraEstado"] != DBNull.Value)               
                             it.Fideicomitente_EscrituraEstado = reader["EscrituraEstado"].ToString();
                            if(reader["CuentasKYCNoCuenta1"] != DBNull.Value)               
                             it.Fideicomitente_CuentasKYCNoCuenta1 = Int32.Parse(reader["CuentasKYCNoCuenta1"].ToString());
                            if(reader["CuentasKYCTipoCuenta1"] != DBNull.Value)               
                             it.Fideicomitente_CuentasKYCTipoCuenta1 = reader["CuentasKYCTipoCuenta1"].ToString();
                            if(reader["CuentasKYCNoCuenta2"] != DBNull.Value)               
                             it.Fideicomitente_CuentasKYCNoCuenta2 = Int32.Parse(reader["CuentasKYCNoCuenta2"].ToString());
                            if(reader["CuentasKYCTipoCuenta2"] != DBNull.Value)               
                             it.Fideicomitente_CuentasKYCTipoCuenta2 = reader["CuentasKYCTipoCuenta2"].ToString();
                            if(reader["CuentasKYCNoCuenta3"] != DBNull.Value)               
                             it.Fideicomitente_CuentasKYCNoCuenta3 = Int32.Parse(reader["CuentasKYCNoCuenta3"].ToString());
                            if(reader["CuentasKYCTipoCuenta3"] != DBNull.Value)               
                             it.Fideicomitente_CuentasKYCTipoCuenta3 = reader["CuentasKYCTipoCuenta3"].ToString();
                            if(reader["CuentasKYCNoCuenta4"] != DBNull.Value)               
                             it.Fideicomitente_CuentasKYCNoCuenta4 = Int32.Parse(reader["CuentasKYCNoCuenta4"].ToString());
                            if(reader["CuentasKYCTipoCuenta4"] != DBNull.Value)               
                             it.Fideicomitente_CuentasKYCTipoCuenta4 = reader["CuentasKYCTipoCuenta4"].ToString();
                   
                   

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
        public Result InsertFideicomitente(Fideicomitente item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spInsertFideicomitente";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
       
                                insertCommand.Parameters.AddWithValue("@NumeroFideicomitente", item.Fideicomitente_NumeroFideicomitente);
                    insertCommand.Parameters.AddWithValue("@TipoPersona", item.Fideicomitente_TipoPersona);
                    insertCommand.Parameters.AddWithValue("@Participante", item.Fideicomitente_Participante);
                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.Fideicomitente_Fideicomiso);
                    insertCommand.Parameters.AddWithValue("@RegimenFiscal", item.Fideicomitente_RegimenFiscal);
  if (item.Fideicomitente_GeneralesControladorFideicomiso == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesControladorFideicomiso", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesControladorFideicomiso", item.Fideicomitente_GeneralesControladorFideicomiso);


  if (item.Fideicomitente_GeneralesNacionalidad == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesNacionalidad", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesNacionalidad", item.Fideicomitente_GeneralesNacionalidad);


  if (item.Fideicomitente_GeneralesPaisOrigen == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesPaisOrigen", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesPaisOrigen", item.Fideicomitente_GeneralesPaisOrigen);


  if (item.Fideicomitente_GeneralesActividad == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesActividad", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesActividad", item.Fideicomitente_GeneralesActividad);


  if (item.Fideicomitente_GeneralesAportaRecursos == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesAportaRecursos", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesAportaRecursos", item.Fideicomitente_GeneralesAportaRecursos);


  if (item.Fideicomitente_GeneralesPaisResidencia == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesPaisResidencia", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesPaisResidencia", item.Fideicomitente_GeneralesPaisResidencia);


  if (item.Fideicomitente_GeneralesClienteScotiaBank == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesClienteScotiaBank", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesClienteScotiaBank", item.Fideicomitente_GeneralesClienteScotiaBank);


  if (item.Fideicomitente_GeneralesPep == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesPep", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesPep", item.Fideicomitente_GeneralesPep);


  if (item.Fideicomitente_GeneralesEstatus == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesEstatus", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesEstatus", item.Fideicomitente_GeneralesEstatus);


  if (item.Fideicomitente_GeneralesGrupoFilial == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesGrupoFilial", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesGrupoFilial", item.Fideicomitente_GeneralesGrupoFilial);


  if (item.Fideicomitente_GeneralesCalidadMigratoria == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesCalidadMigratoria", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesCalidadMigratoria", item.Fideicomitente_GeneralesCalidadMigratoria);


  if (item.Fideicomitente_GeneralesLugarOperacion == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesLugarOperacion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesLugarOperacion", item.Fideicomitente_GeneralesLugarOperacion);


  if (item.Fideicomitente_GeneralesOperaCuentaTerceros == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesOperaCuentaTerceros", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesOperaCuentaTerceros", item.Fideicomitente_GeneralesOperaCuentaTerceros);


  if (item.Fideicomitente_GeneralesNivelParticipante == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesNivelParticipante", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesNivelParticipante", item.Fideicomitente_GeneralesNivelParticipante);


  if (item.Fideicomitente_GeneralesClienteRelacionPep == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesClienteRelacionPep", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesClienteRelacionPep", item.Fideicomitente_GeneralesClienteRelacionPep);


  if (item.Fideicomitente_GeneralesGrado == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesGrado", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesGrado", item.Fideicomitente_GeneralesGrado);


  if (item.Fideicomitente_InfoPldKycHonorarios == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycHonorarios", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycHonorarios", item.Fideicomitente_InfoPldKycHonorarios);


  if (item.Fideicomitente_InfoPldKycComisiones == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycComisiones", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycComisiones", item.Fideicomitente_InfoPldKycComisiones);


  if (item.Fideicomitente_InfoPldKycOtros == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycOtros", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycOtros", item.Fideicomitente_InfoPldKycOtros);


  if (item.Fideicomitente_InfoPldKycSueldos == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycSueldos", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycSueldos", item.Fideicomitente_InfoPldKycSueldos);


  if (item.Fideicomitente_InfoPldKycVenta == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycVenta", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycVenta", item.Fideicomitente_InfoPldKycVenta);


  if (item.Fideicomitente_InfoPldKycInversiones == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycInversiones", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycInversiones", item.Fideicomitente_InfoPldKycInversiones);


  if (item.Fideicomitente_InfoPldKycArrendamiento == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycArrendamiento", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycArrendamiento", item.Fideicomitente_InfoPldKycArrendamiento);


  if (item.Fideicomitente_InfoPldKycTipoPatrimonio == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycTipoPatrimonio", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycTipoPatrimonio", item.Fideicomitente_InfoPldKycTipoPatrimonio);


  if (item.Fideicomitente_InfoPldKycInstrumento == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycInstrumento", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycInstrumento", item.Fideicomitente_InfoPldKycInstrumento);


  if (item.Fideicomitente_InfoPldKycRazonApertura == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycRazonApertura", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycRazonApertura", item.Fideicomitente_InfoPldKycRazonApertura);


  if (item.Fideicomitente_InfoPldKycComentarios == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycComentarios", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycComentarios", item.Fideicomitente_InfoPldKycComentarios);


  if (item.Fideicomitente_InfoPldKycNivelRiesgo == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycNivelRiesgo", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycNivelRiesgo", item.Fideicomitente_InfoPldKycNivelRiesgo);


  if (item.Fideicomitente_InfoPldKycEstatusCalculoPld == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycEstatusCalculoPld", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycEstatusCalculoPld", item.Fideicomitente_InfoPldKycEstatusCalculoPld);


  if (item.Fideicomitente_InfoPldKycFechaVerifFircosoft == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycFechaVerifFircosoft", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycFechaVerifFircosoft", item.Fideicomitente_InfoPldKycFechaVerifFircosoft);


  if (item.Fideicomitente_IdentificacionRfc == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionRfc", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionRfc", item.Fideicomitente_IdentificacionRfc);


  if (item.Fideicomitente_IdentificacionCurp == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionCurp", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionCurp", item.Fideicomitente_IdentificacionCurp);


  if (item.Fideicomitente_IdentificacionNoSerieEfirma == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionNoSerieEfirma", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionNoSerieEfirma", item.Fideicomitente_IdentificacionNoSerieEfirma);


  if (item.Fideicomitente_IdentificacionPaisResidFisc1 == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc1", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc1", item.Fideicomitente_IdentificacionPaisResidFisc1);


  if (item.Fideicomitente_IdentificacionPaisResidFisc2 == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc2", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc2", item.Fideicomitente_IdentificacionPaisResidFisc2);


  if (item.Fideicomitente_IdentificacionEmail == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionEmail", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionEmail", item.Fideicomitente_IdentificacionEmail);


  if (item.Fideicomitente_IdentificacionFechaConstitucion == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionFechaConstitucion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionFechaConstitucion", item.Fideicomitente_IdentificacionFechaConstitucion);


  if (item.Fideicomitente_IdentificacionSexo == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionSexo", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionSexo", item.Fideicomitente_IdentificacionSexo);


  if (item.Fideicomitente_IdentificacionPaisCasa == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisCasa", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionPaisCasa", item.Fideicomitente_IdentificacionPaisCasa);


  if (item.Fideicomitente_IdentificacionPaisOficina == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisOficina", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionPaisOficina", item.Fideicomitente_IdentificacionPaisOficina);


  if (item.Fideicomitente_IdentificacionPaisCelular == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisCelular", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionPaisCelular", item.Fideicomitente_IdentificacionPaisCelular);


  if (item.Fideicomitente_IdentificacionFechaInicioRelNeg == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionFechaInicioRelNeg", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionFechaInicioRelNeg", item.Fideicomitente_IdentificacionFechaInicioRelNeg);


  if (item.Fideicomitente_IdentificacionNoIdentificacion == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentificacion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentificacion", item.Fideicomitente_IdentificacionNoIdentificacion);


  if (item.Fideicomitente_IdentificacionComprobacionDomicilio == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionComprobacionDomicilio", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionComprobacionDomicilio", item.Fideicomitente_IdentificacionComprobacionDomicilio);


  if (item.Fideicomitente_IdentificacionActividadEmpresarial == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionActividadEmpresarial", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionActividadEmpresarial", item.Fideicomitente_IdentificacionActividadEmpresarial);


  if (item.Fideicomitente_IdentificacionNoIdentFisc1 == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc1", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc1", item.Fideicomitente_IdentificacionNoIdentFisc1);


  if (item.Fideicomitente_IdentificacionNoIdentFisc2 == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc2", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc2", item.Fideicomitente_IdentificacionNoIdentFisc2);


  if (item.Fideicomitente_IdentificacionClasificacionFatca == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionClasificacionFatca", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionClasificacionFatca", item.Fideicomitente_IdentificacionClasificacionFatca);


  if (item.Fideicomitente_IdentificacionLadaCasa == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaCasa", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionLadaCasa", item.Fideicomitente_IdentificacionLadaCasa);


  if (item.Fideicomitente_IdentificacionLadaOficina == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaOficina", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionLadaOficina", item.Fideicomitente_IdentificacionLadaOficina);


  if (item.Fideicomitente_IdentificacionLadaCelular == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaCelular", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionLadaCelular", item.Fideicomitente_IdentificacionLadaCelular);


  if (item.Fideicomitente_IdentificacionNumeroCasa == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCasa", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCasa", item.Fideicomitente_IdentificacionNumeroCasa);


  if (item.Fideicomitente_IdentificacionNumeroOficina == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroOficina", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionNumeroOficina", item.Fideicomitente_IdentificacionNumeroOficina);


  if (item.Fideicomitente_IdentificacionNumeroCelular == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCelular", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCelular", item.Fideicomitente_IdentificacionNumeroCelular);


  if (item.Fideicomitente_IdentificacionExtOficina == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionExtOficina", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionExtOficina", item.Fideicomitente_IdentificacionExtOficina);


  if (item.Fideicomitente_IdentificacionExtCelular == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionExtCelular", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionExtCelular", item.Fideicomitente_IdentificacionExtCelular);


  if (item.Fideicomitente_IdentificacionIdentOficialVig == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionIdentOficialVig", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionIdentOficialVig", item.Fideicomitente_IdentificacionIdentOficialVig);


  if (item.Fideicomitente_IdentificacionVigencia == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionVigencia", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionVigencia", item.Fideicomitente_IdentificacionVigencia);


  if (item.Fideicomitente_EscrituraNoEscritura == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraNoEscritura", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraNoEscritura", item.Fideicomitente_EscrituraNoEscritura);


  if (item.Fideicomitente_EscrituraNotario == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraNotario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraNotario", item.Fideicomitente_EscrituraNotario);


  if (item.Fideicomitente_EscrituraNoNotaria == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraNoNotaria", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraNoNotaria", item.Fideicomitente_EscrituraNoNotaria);


  if (item.Fideicomitente_EscrituraCiudad == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraCiudad", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraCiudad", item.Fideicomitente_EscrituraCiudad);


  if (item.Fideicomitente_EscrituraTelefono == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraTelefono", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraTelefono", item.Fideicomitente_EscrituraTelefono);


  if (item.Fideicomitente_EscrituraEmail == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraEmail", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraEmail", item.Fideicomitente_EscrituraEmail);


  if (item.Fideicomitente_EscrituraFecha == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraFecha", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraFecha", item.Fideicomitente_EscrituraFecha);


  if (item.Fideicomitente_EscrituraEstado == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraEstado", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraEstado", item.Fideicomitente_EscrituraEstado);


  if (item.Fideicomitente_CuentasKYCNoCuenta1 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta1", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta1", item.Fideicomitente_CuentasKYCNoCuenta1);


  if (item.Fideicomitente_CuentasKYCTipoCuenta1 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta1", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta1", item.Fideicomitente_CuentasKYCTipoCuenta1);


  if (item.Fideicomitente_CuentasKYCNoCuenta2 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta2", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta2", item.Fideicomitente_CuentasKYCNoCuenta2);


  if (item.Fideicomitente_CuentasKYCTipoCuenta2 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta2", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta2", item.Fideicomitente_CuentasKYCTipoCuenta2);


  if (item.Fideicomitente_CuentasKYCNoCuenta3 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta3", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta3", item.Fideicomitente_CuentasKYCNoCuenta3);


  if (item.Fideicomitente_CuentasKYCTipoCuenta3 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta3", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta3", item.Fideicomitente_CuentasKYCTipoCuenta3);


  if (item.Fideicomitente_CuentasKYCNoCuenta4 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta4", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta4", item.Fideicomitente_CuentasKYCNoCuenta4);


  if (item.Fideicomitente_CuentasKYCTipoCuenta4 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta4", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta4", item.Fideicomitente_CuentasKYCTipoCuenta4);




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
        public Result UpdateFideicomitente(string id, Fideicomitente item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdateFideicomitente";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                                 insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@NumeroFideicomitente", item.Fideicomitente_NumeroFideicomitente);

                                    insertCommand.Parameters.AddWithValue("@TipoPersona", item.Fideicomitente_TipoPersona);

                                    insertCommand.Parameters.AddWithValue("@Participante", item.Fideicomitente_Participante);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.Fideicomitente_Fideicomiso);

                                    insertCommand.Parameters.AddWithValue("@RegimenFiscal", item.Fideicomitente_RegimenFiscal);

  if (item.Fideicomitente_GeneralesControladorFideicomiso == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesControladorFideicomiso", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesControladorFideicomiso", item.Fideicomitente_GeneralesControladorFideicomiso);

    
  if (item.Fideicomitente_GeneralesNacionalidad == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesNacionalidad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesNacionalidad", item.Fideicomitente_GeneralesNacionalidad);

    
  if (item.Fideicomitente_GeneralesPaisOrigen == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesPaisOrigen", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesPaisOrigen", item.Fideicomitente_GeneralesPaisOrigen);

    
  if (item.Fideicomitente_GeneralesActividad == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesActividad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesActividad", item.Fideicomitente_GeneralesActividad);

    
  if (item.Fideicomitente_GeneralesAportaRecursos == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesAportaRecursos", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesAportaRecursos", item.Fideicomitente_GeneralesAportaRecursos);

    
  if (item.Fideicomitente_GeneralesPaisResidencia == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesPaisResidencia", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesPaisResidencia", item.Fideicomitente_GeneralesPaisResidencia);

    
  if (item.Fideicomitente_GeneralesClienteScotiaBank == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesClienteScotiaBank", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesClienteScotiaBank", item.Fideicomitente_GeneralesClienteScotiaBank);

    
  if (item.Fideicomitente_GeneralesPep == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesPep", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesPep", item.Fideicomitente_GeneralesPep);

    
  if (item.Fideicomitente_GeneralesEstatus == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesEstatus", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesEstatus", item.Fideicomitente_GeneralesEstatus);

    
  if (item.Fideicomitente_GeneralesGrupoFilial == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesGrupoFilial", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesGrupoFilial", item.Fideicomitente_GeneralesGrupoFilial);

    
  if (item.Fideicomitente_GeneralesCalidadMigratoria == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesCalidadMigratoria", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesCalidadMigratoria", item.Fideicomitente_GeneralesCalidadMigratoria);

    
  if (item.Fideicomitente_GeneralesLugarOperacion == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesLugarOperacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesLugarOperacion", item.Fideicomitente_GeneralesLugarOperacion);

    
  if (item.Fideicomitente_GeneralesOperaCuentaTerceros == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesOperaCuentaTerceros", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesOperaCuentaTerceros", item.Fideicomitente_GeneralesOperaCuentaTerceros);

    
  if (item.Fideicomitente_GeneralesNivelParticipante == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesNivelParticipante", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesNivelParticipante", item.Fideicomitente_GeneralesNivelParticipante);

    
  if (item.Fideicomitente_GeneralesClienteRelacionPep == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesClienteRelacionPep", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesClienteRelacionPep", item.Fideicomitente_GeneralesClienteRelacionPep);

    
  if (item.Fideicomitente_GeneralesGrado == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesGrado", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesGrado", item.Fideicomitente_GeneralesGrado);

    
  if (item.Fideicomitente_InfoPldKycHonorarios == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycHonorarios", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycHonorarios", item.Fideicomitente_InfoPldKycHonorarios);

    
  if (item.Fideicomitente_InfoPldKycComisiones == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycComisiones", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycComisiones", item.Fideicomitente_InfoPldKycComisiones);

    
  if (item.Fideicomitente_InfoPldKycOtros == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycOtros", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycOtros", item.Fideicomitente_InfoPldKycOtros);

    
  if (item.Fideicomitente_InfoPldKycSueldos == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycSueldos", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycSueldos", item.Fideicomitente_InfoPldKycSueldos);

    
  if (item.Fideicomitente_InfoPldKycVenta == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycVenta", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycVenta", item.Fideicomitente_InfoPldKycVenta);

    
  if (item.Fideicomitente_InfoPldKycInversiones == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycInversiones", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycInversiones", item.Fideicomitente_InfoPldKycInversiones);

    
  if (item.Fideicomitente_InfoPldKycArrendamiento == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycArrendamiento", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycArrendamiento", item.Fideicomitente_InfoPldKycArrendamiento);

    
  if (item.Fideicomitente_InfoPldKycTipoPatrimonio == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycTipoPatrimonio", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycTipoPatrimonio", item.Fideicomitente_InfoPldKycTipoPatrimonio);

    
  if (item.Fideicomitente_InfoPldKycInstrumento == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycInstrumento", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycInstrumento", item.Fideicomitente_InfoPldKycInstrumento);

    
  if (item.Fideicomitente_InfoPldKycRazonApertura == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycRazonApertura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycRazonApertura", item.Fideicomitente_InfoPldKycRazonApertura);

    
  if (item.Fideicomitente_InfoPldKycComentarios == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycComentarios", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycComentarios", item.Fideicomitente_InfoPldKycComentarios);

    
  if (item.Fideicomitente_InfoPldKycNivelRiesgo == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycNivelRiesgo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycNivelRiesgo", item.Fideicomitente_InfoPldKycNivelRiesgo);

    
  if (item.Fideicomitente_InfoPldKycEstatusCalculoPld == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycEstatusCalculoPld", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycEstatusCalculoPld", item.Fideicomitente_InfoPldKycEstatusCalculoPld);

    
  if (item.Fideicomitente_InfoPldKycFechaVerifFircosoft == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycFechaVerifFircosoft", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycFechaVerifFircosoft", item.Fideicomitente_InfoPldKycFechaVerifFircosoft);

    
  if (item.Fideicomitente_IdentificacionRfc == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionRfc", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionRfc", item.Fideicomitente_IdentificacionRfc);

    
  if (item.Fideicomitente_IdentificacionCurp == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionCurp", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionCurp", item.Fideicomitente_IdentificacionCurp);

    
  if (item.Fideicomitente_IdentificacionNoSerieEfirma == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoSerieEfirma", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoSerieEfirma", item.Fideicomitente_IdentificacionNoSerieEfirma);

    
  if (item.Fideicomitente_IdentificacionPaisResidFisc1 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc1", item.Fideicomitente_IdentificacionPaisResidFisc1);

    
  if (item.Fideicomitente_IdentificacionPaisResidFisc2 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc2", item.Fideicomitente_IdentificacionPaisResidFisc2);

    
  if (item.Fideicomitente_IdentificacionEmail == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionEmail", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionEmail", item.Fideicomitente_IdentificacionEmail);

    
  if (item.Fideicomitente_IdentificacionFechaConstitucion == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionFechaConstitucion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionFechaConstitucion", item.Fideicomitente_IdentificacionFechaConstitucion);

    
  if (item.Fideicomitente_IdentificacionSexo == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionSexo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionSexo", item.Fideicomitente_IdentificacionSexo);

    
  if (item.Fideicomitente_IdentificacionPaisCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisCasa", item.Fideicomitente_IdentificacionPaisCasa);

    
  if (item.Fideicomitente_IdentificacionPaisOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisOficina", item.Fideicomitente_IdentificacionPaisOficina);

    
  if (item.Fideicomitente_IdentificacionPaisCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisCelular", item.Fideicomitente_IdentificacionPaisCelular);

    
  if (item.Fideicomitente_IdentificacionFechaInicioRelNeg == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionFechaInicioRelNeg", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionFechaInicioRelNeg", item.Fideicomitente_IdentificacionFechaInicioRelNeg);

    
  if (item.Fideicomitente_IdentificacionNoIdentificacion == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentificacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentificacion", item.Fideicomitente_IdentificacionNoIdentificacion);

    
  if (item.Fideicomitente_IdentificacionComprobacionDomicilio == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionComprobacionDomicilio", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionComprobacionDomicilio", item.Fideicomitente_IdentificacionComprobacionDomicilio);

    
  if (item.Fideicomitente_IdentificacionActividadEmpresarial == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionActividadEmpresarial", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionActividadEmpresarial", item.Fideicomitente_IdentificacionActividadEmpresarial);

    
  if (item.Fideicomitente_IdentificacionNoIdentFisc1 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc1", item.Fideicomitente_IdentificacionNoIdentFisc1);

    
  if (item.Fideicomitente_IdentificacionNoIdentFisc2 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc2", item.Fideicomitente_IdentificacionNoIdentFisc2);

    
  if (item.Fideicomitente_IdentificacionClasificacionFatca == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionClasificacionFatca", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionClasificacionFatca", item.Fideicomitente_IdentificacionClasificacionFatca);

    
  if (item.Fideicomitente_IdentificacionLadaCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionLadaCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaCasa", item.Fideicomitente_IdentificacionLadaCasa);

    
  if (item.Fideicomitente_IdentificacionLadaOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionLadaOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaOficina", item.Fideicomitente_IdentificacionLadaOficina);

    
  if (item.Fideicomitente_IdentificacionLadaCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionLadaCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaCelular", item.Fideicomitente_IdentificacionLadaCelular);

    
  if (item.Fideicomitente_IdentificacionNumeroCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCasa", item.Fideicomitente_IdentificacionNumeroCasa);

    
  if (item.Fideicomitente_IdentificacionNumeroOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNumeroOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroOficina", item.Fideicomitente_IdentificacionNumeroOficina);

    
  if (item.Fideicomitente_IdentificacionNumeroCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCelular", item.Fideicomitente_IdentificacionNumeroCelular);

    
  if (item.Fideicomitente_IdentificacionExtOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionExtOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionExtOficina", item.Fideicomitente_IdentificacionExtOficina);

    
  if (item.Fideicomitente_IdentificacionExtCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionExtCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionExtCelular", item.Fideicomitente_IdentificacionExtCelular);

    
  if (item.Fideicomitente_IdentificacionIdentOficialVig == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionIdentOficialVig", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionIdentOficialVig", item.Fideicomitente_IdentificacionIdentOficialVig);

    
  if (item.Fideicomitente_IdentificacionVigencia == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionVigencia", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionVigencia", item.Fideicomitente_IdentificacionVigencia);

    
  if (item.Fideicomitente_EscrituraNoEscritura == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraNoEscritura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraNoEscritura", item.Fideicomitente_EscrituraNoEscritura);

    
  if (item.Fideicomitente_EscrituraNotario == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraNotario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraNotario", item.Fideicomitente_EscrituraNotario);

    
  if (item.Fideicomitente_EscrituraNoNotaria == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraNoNotaria", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraNoNotaria", item.Fideicomitente_EscrituraNoNotaria);

    
  if (item.Fideicomitente_EscrituraCiudad == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraCiudad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraCiudad", item.Fideicomitente_EscrituraCiudad);

    
  if (item.Fideicomitente_EscrituraTelefono == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraTelefono", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraTelefono", item.Fideicomitente_EscrituraTelefono);

    
  if (item.Fideicomitente_EscrituraEmail == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraEmail", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraEmail", item.Fideicomitente_EscrituraEmail);

    
  if (item.Fideicomitente_EscrituraFecha == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraFecha", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraFecha", item.Fideicomitente_EscrituraFecha);

    
  if (item.Fideicomitente_EscrituraEstado == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraEstado", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraEstado", item.Fideicomitente_EscrituraEstado);

    
  if (item.Fideicomitente_CuentasKYCNoCuenta1 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta1", item.Fideicomitente_CuentasKYCNoCuenta1);

    
  if (item.Fideicomitente_CuentasKYCTipoCuenta1 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta1", item.Fideicomitente_CuentasKYCTipoCuenta1);

    
  if (item.Fideicomitente_CuentasKYCNoCuenta2 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta2", item.Fideicomitente_CuentasKYCNoCuenta2);

    
  if (item.Fideicomitente_CuentasKYCTipoCuenta2 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta2", item.Fideicomitente_CuentasKYCTipoCuenta2);

    
  if (item.Fideicomitente_CuentasKYCNoCuenta3 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta3", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta3", item.Fideicomitente_CuentasKYCNoCuenta3);

    
  if (item.Fideicomitente_CuentasKYCTipoCuenta3 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta3", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta3", item.Fideicomitente_CuentasKYCTipoCuenta3);

    
  if (item.Fideicomitente_CuentasKYCNoCuenta4 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta4", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta4", item.Fideicomitente_CuentasKYCNoCuenta4);

    
  if (item.Fideicomitente_CuentasKYCTipoCuenta4 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta4", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta4", item.Fideicomitente_CuentasKYCTipoCuenta4);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.Fideicomitente_ID.ToString(); 
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
        
        public Result UpdatePartialFideicomitente(string id, Fideicomitente item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdatePartialFideicomitente";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                             insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@NumeroFideicomitente", item.Fideicomitente_NumeroFideicomitente);

                                    insertCommand.Parameters.AddWithValue("@TipoPersona", item.Fideicomitente_TipoPersona);

                                    insertCommand.Parameters.AddWithValue("@Participante", item.Fideicomitente_Participante);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.Fideicomitente_Fideicomiso);

                                    insertCommand.Parameters.AddWithValue("@RegimenFiscal", item.Fideicomitente_RegimenFiscal);

  if (item.Fideicomitente_GeneralesControladorFideicomiso == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesControladorFideicomiso", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesControladorFideicomiso", item.Fideicomitente_GeneralesControladorFideicomiso);

    
  if (item.Fideicomitente_GeneralesNacionalidad == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesNacionalidad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesNacionalidad", item.Fideicomitente_GeneralesNacionalidad);

    
  if (item.Fideicomitente_GeneralesPaisOrigen == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesPaisOrigen", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesPaisOrigen", item.Fideicomitente_GeneralesPaisOrigen);

    
  if (item.Fideicomitente_GeneralesActividad == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesActividad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesActividad", item.Fideicomitente_GeneralesActividad);

    
  if (item.Fideicomitente_GeneralesAportaRecursos == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesAportaRecursos", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesAportaRecursos", item.Fideicomitente_GeneralesAportaRecursos);

    
  if (item.Fideicomitente_GeneralesPaisResidencia == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesPaisResidencia", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesPaisResidencia", item.Fideicomitente_GeneralesPaisResidencia);

    
  if (item.Fideicomitente_GeneralesClienteScotiaBank == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesClienteScotiaBank", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesClienteScotiaBank", item.Fideicomitente_GeneralesClienteScotiaBank);

    
  if (item.Fideicomitente_GeneralesPep == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesPep", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesPep", item.Fideicomitente_GeneralesPep);

    
  if (item.Fideicomitente_GeneralesEstatus == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesEstatus", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesEstatus", item.Fideicomitente_GeneralesEstatus);

    
  if (item.Fideicomitente_GeneralesGrupoFilial == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesGrupoFilial", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesGrupoFilial", item.Fideicomitente_GeneralesGrupoFilial);

    
  if (item.Fideicomitente_GeneralesCalidadMigratoria == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesCalidadMigratoria", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesCalidadMigratoria", item.Fideicomitente_GeneralesCalidadMigratoria);

    
  if (item.Fideicomitente_GeneralesLugarOperacion == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesLugarOperacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesLugarOperacion", item.Fideicomitente_GeneralesLugarOperacion);

    
  if (item.Fideicomitente_GeneralesOperaCuentaTerceros == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesOperaCuentaTerceros", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesOperaCuentaTerceros", item.Fideicomitente_GeneralesOperaCuentaTerceros);

    
  if (item.Fideicomitente_GeneralesNivelParticipante == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesNivelParticipante", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesNivelParticipante", item.Fideicomitente_GeneralesNivelParticipante);

    
  if (item.Fideicomitente_GeneralesClienteRelacionPep == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesClienteRelacionPep", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesClienteRelacionPep", item.Fideicomitente_GeneralesClienteRelacionPep);

    
  if (item.Fideicomitente_GeneralesGrado == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesGrado", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesGrado", item.Fideicomitente_GeneralesGrado);

    
  if (item.Fideicomitente_InfoPldKycHonorarios == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycHonorarios", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycHonorarios", item.Fideicomitente_InfoPldKycHonorarios);

    
  if (item.Fideicomitente_InfoPldKycComisiones == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycComisiones", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycComisiones", item.Fideicomitente_InfoPldKycComisiones);

    
  if (item.Fideicomitente_InfoPldKycOtros == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycOtros", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycOtros", item.Fideicomitente_InfoPldKycOtros);

    
  if (item.Fideicomitente_InfoPldKycSueldos == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycSueldos", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycSueldos", item.Fideicomitente_InfoPldKycSueldos);

    
  if (item.Fideicomitente_InfoPldKycVenta == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycVenta", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycVenta", item.Fideicomitente_InfoPldKycVenta);

    
  if (item.Fideicomitente_InfoPldKycInversiones == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycInversiones", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycInversiones", item.Fideicomitente_InfoPldKycInversiones);

    
  if (item.Fideicomitente_InfoPldKycArrendamiento == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycArrendamiento", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycArrendamiento", item.Fideicomitente_InfoPldKycArrendamiento);

    
  if (item.Fideicomitente_InfoPldKycTipoPatrimonio == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycTipoPatrimonio", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycTipoPatrimonio", item.Fideicomitente_InfoPldKycTipoPatrimonio);

    
  if (item.Fideicomitente_InfoPldKycInstrumento == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycInstrumento", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycInstrumento", item.Fideicomitente_InfoPldKycInstrumento);

    
  if (item.Fideicomitente_InfoPldKycRazonApertura == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycRazonApertura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycRazonApertura", item.Fideicomitente_InfoPldKycRazonApertura);

    
  if (item.Fideicomitente_InfoPldKycComentarios == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycComentarios", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycComentarios", item.Fideicomitente_InfoPldKycComentarios);

    
  if (item.Fideicomitente_InfoPldKycNivelRiesgo == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycNivelRiesgo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycNivelRiesgo", item.Fideicomitente_InfoPldKycNivelRiesgo);

    
  if (item.Fideicomitente_InfoPldKycEstatusCalculoPld == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycEstatusCalculoPld", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycEstatusCalculoPld", item.Fideicomitente_InfoPldKycEstatusCalculoPld);

    
  if (item.Fideicomitente_InfoPldKycFechaVerifFircosoft == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycFechaVerifFircosoft", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycFechaVerifFircosoft", item.Fideicomitente_InfoPldKycFechaVerifFircosoft);

    
  if (item.Fideicomitente_IdentificacionRfc == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionRfc", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionRfc", item.Fideicomitente_IdentificacionRfc);

    
  if (item.Fideicomitente_IdentificacionCurp == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionCurp", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionCurp", item.Fideicomitente_IdentificacionCurp);

    
  if (item.Fideicomitente_IdentificacionNoSerieEfirma == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoSerieEfirma", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoSerieEfirma", item.Fideicomitente_IdentificacionNoSerieEfirma);

    
  if (item.Fideicomitente_IdentificacionPaisResidFisc1 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc1", item.Fideicomitente_IdentificacionPaisResidFisc1);

    
  if (item.Fideicomitente_IdentificacionPaisResidFisc2 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc2", item.Fideicomitente_IdentificacionPaisResidFisc2);

    
  if (item.Fideicomitente_IdentificacionEmail == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionEmail", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionEmail", item.Fideicomitente_IdentificacionEmail);

    
  if (item.Fideicomitente_IdentificacionFechaConstitucion == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionFechaConstitucion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionFechaConstitucion", item.Fideicomitente_IdentificacionFechaConstitucion);

    
  if (item.Fideicomitente_IdentificacionSexo == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionSexo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionSexo", item.Fideicomitente_IdentificacionSexo);

    
  if (item.Fideicomitente_IdentificacionPaisCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisCasa", item.Fideicomitente_IdentificacionPaisCasa);

    
  if (item.Fideicomitente_IdentificacionPaisOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisOficina", item.Fideicomitente_IdentificacionPaisOficina);

    
  if (item.Fideicomitente_IdentificacionPaisCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisCelular", item.Fideicomitente_IdentificacionPaisCelular);

    
  if (item.Fideicomitente_IdentificacionFechaInicioRelNeg == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionFechaInicioRelNeg", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionFechaInicioRelNeg", item.Fideicomitente_IdentificacionFechaInicioRelNeg);

    
  if (item.Fideicomitente_IdentificacionNoIdentificacion == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentificacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentificacion", item.Fideicomitente_IdentificacionNoIdentificacion);

    
  if (item.Fideicomitente_IdentificacionComprobacionDomicilio == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionComprobacionDomicilio", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionComprobacionDomicilio", item.Fideicomitente_IdentificacionComprobacionDomicilio);

    
  if (item.Fideicomitente_IdentificacionActividadEmpresarial == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionActividadEmpresarial", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionActividadEmpresarial", item.Fideicomitente_IdentificacionActividadEmpresarial);

    
  if (item.Fideicomitente_IdentificacionNoIdentFisc1 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc1", item.Fideicomitente_IdentificacionNoIdentFisc1);

    
  if (item.Fideicomitente_IdentificacionNoIdentFisc2 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc2", item.Fideicomitente_IdentificacionNoIdentFisc2);

    
  if (item.Fideicomitente_IdentificacionClasificacionFatca == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionClasificacionFatca", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionClasificacionFatca", item.Fideicomitente_IdentificacionClasificacionFatca);

    
  if (item.Fideicomitente_IdentificacionLadaCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionLadaCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaCasa", item.Fideicomitente_IdentificacionLadaCasa);

    
  if (item.Fideicomitente_IdentificacionLadaOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionLadaOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaOficina", item.Fideicomitente_IdentificacionLadaOficina);

    
  if (item.Fideicomitente_IdentificacionLadaCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionLadaCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaCelular", item.Fideicomitente_IdentificacionLadaCelular);

    
  if (item.Fideicomitente_IdentificacionNumeroCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCasa", item.Fideicomitente_IdentificacionNumeroCasa);

    
  if (item.Fideicomitente_IdentificacionNumeroOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNumeroOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroOficina", item.Fideicomitente_IdentificacionNumeroOficina);

    
  if (item.Fideicomitente_IdentificacionNumeroCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCelular", item.Fideicomitente_IdentificacionNumeroCelular);

    
  if (item.Fideicomitente_IdentificacionExtOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionExtOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionExtOficina", item.Fideicomitente_IdentificacionExtOficina);

    
  if (item.Fideicomitente_IdentificacionExtCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionExtCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionExtCelular", item.Fideicomitente_IdentificacionExtCelular);

    
  if (item.Fideicomitente_IdentificacionIdentOficialVig == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionIdentOficialVig", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionIdentOficialVig", item.Fideicomitente_IdentificacionIdentOficialVig);

    
  if (item.Fideicomitente_IdentificacionVigencia == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionVigencia", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionVigencia", item.Fideicomitente_IdentificacionVigencia);

    
  if (item.Fideicomitente_EscrituraNoEscritura == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraNoEscritura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraNoEscritura", item.Fideicomitente_EscrituraNoEscritura);

    
  if (item.Fideicomitente_EscrituraNotario == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraNotario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraNotario", item.Fideicomitente_EscrituraNotario);

    
  if (item.Fideicomitente_EscrituraNoNotaria == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraNoNotaria", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraNoNotaria", item.Fideicomitente_EscrituraNoNotaria);

    
  if (item.Fideicomitente_EscrituraCiudad == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraCiudad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraCiudad", item.Fideicomitente_EscrituraCiudad);

    
  if (item.Fideicomitente_EscrituraTelefono == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraTelefono", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraTelefono", item.Fideicomitente_EscrituraTelefono);

    
  if (item.Fideicomitente_EscrituraEmail == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraEmail", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraEmail", item.Fideicomitente_EscrituraEmail);

    
  if (item.Fideicomitente_EscrituraFecha == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraFecha", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraFecha", item.Fideicomitente_EscrituraFecha);

    
  if (item.Fideicomitente_EscrituraEstado == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraEstado", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraEstado", item.Fideicomitente_EscrituraEstado);

    
  if (item.Fideicomitente_CuentasKYCNoCuenta1 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta1", item.Fideicomitente_CuentasKYCNoCuenta1);

    
  if (item.Fideicomitente_CuentasKYCTipoCuenta1 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta1", item.Fideicomitente_CuentasKYCTipoCuenta1);

    
  if (item.Fideicomitente_CuentasKYCNoCuenta2 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta2", item.Fideicomitente_CuentasKYCNoCuenta2);

    
  if (item.Fideicomitente_CuentasKYCTipoCuenta2 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta2", item.Fideicomitente_CuentasKYCTipoCuenta2);

    
  if (item.Fideicomitente_CuentasKYCNoCuenta3 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta3", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta3", item.Fideicomitente_CuentasKYCNoCuenta3);

    
  if (item.Fideicomitente_CuentasKYCTipoCuenta3 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta3", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta3", item.Fideicomitente_CuentasKYCTipoCuenta3);

    
  if (item.Fideicomitente_CuentasKYCNoCuenta4 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta4", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta4", item.Fideicomitente_CuentasKYCNoCuenta4);

    
  if (item.Fideicomitente_CuentasKYCTipoCuenta4 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta4", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta4", item.Fideicomitente_CuentasKYCTipoCuenta4);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.Fideicomitente_ID.ToString(); 
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
