//Fecha Creación:5/24/2019 6:13:06 PM Template DataClass, Author: Alfredo Reyes C., V1
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
    public class FideicomisarioData : IFideicomisarioData, IDisposable
    {
        private string _conexion;
       
        public FideicomisarioData(string conexion)
        {
            _conexion = conexion;
        }
        public Result DeleteFideicomisario(string id)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spDeleteFideicomisario";
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
                        res.Message = "La entidad Fideicomisario tiene registros que dependen de ella en otra tabla no se pudo eliminar.";
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
        
        public Fideicomisario GetFideicomisario(string id)
        {
            Fideicomisario entidad = new  Fideicomisario();           

            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetFideicomisarioByID";
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
                         entidad.Fideicomisario_ID = reader["ID"].ToString();
 if(reader["NumeroFideicomisario"] != DBNull.Value)               
                         entidad.Fideicomisario_NumeroFideicomisario = reader["NumeroFideicomisario"].ToString();
 if(reader["TipoPersona"] != DBNull.Value)               
                         entidad.Fideicomisario_TipoPersona = reader["TipoPersona"].ToString();
 if(reader["Participante"] != DBNull.Value)               
                         entidad.Fideicomisario_Participante = reader["Participante"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         entidad.Fideicomisario_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["RegimenFiscal"] != DBNull.Value)               
                         entidad.Fideicomisario_RegimenFiscal = reader["RegimenFiscal"].ToString();
 if(reader["GeneralesControladorFideicomiso"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesControladorFideicomiso = reader["GeneralesControladorFideicomiso"].ToString();
 if(reader["GeneralesNacionalidad"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesNacionalidad = reader["GeneralesNacionalidad"].ToString();
 if(reader["GeneralesPaisOrigen"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesPaisOrigen = reader["GeneralesPaisOrigen"].ToString();
 if(reader["GeneralesActividad"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesActividad = reader["GeneralesActividad"].ToString();
 if(reader["GeneralesAportaRecursos"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesAportaRecursos = reader["GeneralesAportaRecursos"].ToString();
 if(reader["GeneralesPaisResidencia"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesPaisResidencia = reader["GeneralesPaisResidencia"].ToString();
 if(reader["GeneralesClienteScotiaBank"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesClienteScotiaBank = reader["GeneralesClienteScotiaBank"].ToString();
 if(reader["GeneralesPep"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesPep = reader["GeneralesPep"].ToString();
 if(reader["GeneralesEstatus"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesEstatus = reader["GeneralesEstatus"].ToString();
 if(reader["GeneralesGrupoFilial"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesGrupoFilial = reader["GeneralesGrupoFilial"].ToString();
 if(reader["GeneralesCalidadMigratoria"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesCalidadMigratoria = reader["GeneralesCalidadMigratoria"].ToString();
 if(reader["GeneralesLugarOperacion"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesLugarOperacion = reader["GeneralesLugarOperacion"].ToString();
 if(reader["GeneralesOperaCuentaTerceros"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesOperaCuentaTerceros = reader["GeneralesOperaCuentaTerceros"].ToString();
 if(reader["GeneralesNivelParticipante"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesNivelParticipante = reader["GeneralesNivelParticipante"].ToString();
 if(reader["GeneralesClienteRelacionPep"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesClienteRelacionPep = reader["GeneralesClienteRelacionPep"].ToString();
 if(reader["GeneralesGrado"] != DBNull.Value)               
                         entidad.Fideicomisario_GeneralesGrado = reader["GeneralesGrado"].ToString();
 if(reader["InfoPldKycHonorarios"] != DBNull.Value)               
                         entidad.Fideicomisario_InfoPldKycHonorarios = reader["InfoPldKycHonorarios"].ToString();
 if(reader["InfoPldKycComisiones"] != DBNull.Value)               
                         entidad.Fideicomisario_InfoPldKycComisiones = reader["InfoPldKycComisiones"].ToString();
 if(reader["InfoPldKycOtros"] != DBNull.Value)               
                         entidad.Fideicomisario_InfoPldKycOtros = reader["InfoPldKycOtros"].ToString();
 if(reader["InfoPldKycSueldos"] != DBNull.Value)               
                         entidad.Fideicomisario_InfoPldKycSueldos = reader["InfoPldKycSueldos"].ToString();
 if(reader["InfoPldKycVenta"] != DBNull.Value)               
                         entidad.Fideicomisario_InfoPldKycVenta = reader["InfoPldKycVenta"].ToString();
 if(reader["InfoPldKycInversiones"] != DBNull.Value)               
                         entidad.Fideicomisario_InfoPldKycInversiones = reader["InfoPldKycInversiones"].ToString();
 if(reader["InfoPldKycArrendamiento"] != DBNull.Value)               
                         entidad.Fideicomisario_InfoPldKycArrendamiento = reader["InfoPldKycArrendamiento"].ToString();
 if(reader["InfoPldKycTipoPatrimonio"] != DBNull.Value)               
                         entidad.Fideicomisario_InfoPldKycTipoPatrimonio = reader["InfoPldKycTipoPatrimonio"].ToString();
 if(reader["InfoPldKycInstrumento"] != DBNull.Value)               
                         entidad.Fideicomisario_InfoPldKycInstrumento = reader["InfoPldKycInstrumento"].ToString();
 if(reader["InfoPldKycRazonApertura"] != DBNull.Value)               
                         entidad.Fideicomisario_InfoPldKycRazonApertura = reader["InfoPldKycRazonApertura"].ToString();
 if(reader["InfoPldKycComentarios"] != DBNull.Value)               
                         entidad.Fideicomisario_InfoPldKycComentarios = reader["InfoPldKycComentarios"].ToString();
 if(reader["InfoPldKycNivelRiesgo"] != DBNull.Value)               
                         entidad.Fideicomisario_InfoPldKycNivelRiesgo = reader["InfoPldKycNivelRiesgo"].ToString();
 if(reader["InfoPldKycEstatusCalculoPld"] != DBNull.Value)               
                         entidad.Fideicomisario_InfoPldKycEstatusCalculoPld = reader["InfoPldKycEstatusCalculoPld"].ToString();
 if(reader["InfoPldKycFechaVerifFircosoft"] != DBNull.Value)               
                         entidad.Fideicomisario_InfoPldKycFechaVerifFircosoft = DateTime.Parse(reader["InfoPldKycFechaVerifFircosoft"].ToString());
 if(reader["IdentificacionRfc"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionRfc = reader["IdentificacionRfc"].ToString();
 if(reader["IdentificacionCurp"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionCurp = reader["IdentificacionCurp"].ToString();
 if(reader["IdentificacionNoSerieEfirma"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionNoSerieEfirma = reader["IdentificacionNoSerieEfirma"].ToString();
 if(reader["IdentificacionPaisResidFisc1"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionPaisResidFisc1 = reader["IdentificacionPaisResidFisc1"].ToString();
 if(reader["IdentificacionPaisResidFisc2"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionPaisResidFisc2 = reader["IdentificacionPaisResidFisc2"].ToString();
 if(reader["IdentificacionEmail"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionEmail = reader["IdentificacionEmail"].ToString();
 if(reader["IdentificacionFechaConstitucion"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionFechaConstitucion = DateTime.Parse(reader["IdentificacionFechaConstitucion"].ToString());
 if(reader["IdentificacionSexo"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionSexo = reader["IdentificacionSexo"].ToString();
 if(reader["IdentificacionPaisCasa"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionPaisCasa = reader["IdentificacionPaisCasa"].ToString();
 if(reader["IdentificacionPaisOficina"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionPaisOficina = reader["IdentificacionPaisOficina"].ToString();
 if(reader["IdentificacionPaisCelular"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionPaisCelular = reader["IdentificacionPaisCelular"].ToString();
 if(reader["IdentificacionFechaInicioRelNeg"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionFechaInicioRelNeg = DateTime.Parse(reader["IdentificacionFechaInicioRelNeg"].ToString());
 if(reader["IdentificacionNoIdentificacion"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionNoIdentificacion = reader["IdentificacionNoIdentificacion"].ToString();
 if(reader["IdentificacionComprobacionDomicilio"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionComprobacionDomicilio = reader["IdentificacionComprobacionDomicilio"].ToString();
 if(reader["IdentificacionActividadEmpresarial"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionActividadEmpresarial = reader["IdentificacionActividadEmpresarial"].ToString();
 if(reader["IdentificacionNoIdentFisc1"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionNoIdentFisc1 = reader["IdentificacionNoIdentFisc1"].ToString();
 if(reader["IdentificacionNoIdentFisc2"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionNoIdentFisc2 = reader["IdentificacionNoIdentFisc2"].ToString();
 if(reader["IdentificacionClasificacionFatca"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionClasificacionFatca = reader["IdentificacionClasificacionFatca"].ToString();
 if(reader["IdentificacionLadaCasa"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionLadaCasa = reader["IdentificacionLadaCasa"].ToString();
 if(reader["IdentificacionLadaOficina"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionLadaOficina = reader["IdentificacionLadaOficina"].ToString();
 if(reader["IdentificacionLadaCelular"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionLadaCelular = reader["IdentificacionLadaCelular"].ToString();
 if(reader["IdentificacionNumeroCasa"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionNumeroCasa = reader["IdentificacionNumeroCasa"].ToString();
 if(reader["IdentificacionNumeroOficina"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionNumeroOficina = reader["IdentificacionNumeroOficina"].ToString();
 if(reader["IdentificacionNumeroCelular"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionNumeroCelular = reader["IdentificacionNumeroCelular"].ToString();
 if(reader["IdentificacionExtOficina"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionExtOficina = reader["IdentificacionExtOficina"].ToString();
 if(reader["IdentificacionExtCelular"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionExtCelular = reader["IdentificacionExtCelular"].ToString();
 if(reader["IdentificacionIdentOficialVig"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionIdentOficialVig = reader["IdentificacionIdentOficialVig"].ToString();
 if(reader["IdentificacionVigencia"] != DBNull.Value)               
                         entidad.Fideicomisario_IdentificacionVigencia = reader["IdentificacionVigencia"].ToString();
 if(reader["EscrituraNoEscritura"] != DBNull.Value)               
                         entidad.Fideicomisario_EscrituraNoEscritura = reader["EscrituraNoEscritura"].ToString();
 if(reader["EscrituraNotario"] != DBNull.Value)               
                         entidad.Fideicomisario_EscrituraNotario = reader["EscrituraNotario"].ToString();
 if(reader["EscrituraNoNotaria"] != DBNull.Value)               
                         entidad.Fideicomisario_EscrituraNoNotaria = reader["EscrituraNoNotaria"].ToString();
 if(reader["EscrituraCiudad"] != DBNull.Value)               
                         entidad.Fideicomisario_EscrituraCiudad = reader["EscrituraCiudad"].ToString();
 if(reader["EscrituraTelefono"] != DBNull.Value)               
                         entidad.Fideicomisario_EscrituraTelefono = reader["EscrituraTelefono"].ToString();
 if(reader["EscrituraEmail"] != DBNull.Value)               
                         entidad.Fideicomisario_EscrituraEmail = reader["EscrituraEmail"].ToString();
 if(reader["EscrituraFecha"] != DBNull.Value)               
                         entidad.Fideicomisario_EscrituraFecha = DateTime.Parse(reader["EscrituraFecha"].ToString());
 if(reader["EscrituraEstado"] != DBNull.Value)               
                         entidad.Fideicomisario_EscrituraEstado = reader["EscrituraEstado"].ToString();
 if(reader["CuentasKYCNoCuenta1"] != DBNull.Value)               
                         entidad.Fideicomisario_CuentasKYCNoCuenta1 = Int32.Parse(reader["CuentasKYCNoCuenta1"].ToString());
 if(reader["CuentasKYCTipoCuenta1"] != DBNull.Value)               
                         entidad.Fideicomisario_CuentasKYCTipoCuenta1 = reader["CuentasKYCTipoCuenta1"].ToString();
 if(reader["CuentasKYCNoCuenta2"] != DBNull.Value)               
                         entidad.Fideicomisario_CuentasKYCNoCuenta2 = Int32.Parse(reader["CuentasKYCNoCuenta2"].ToString());
 if(reader["CuentasKYCTipoCuenta2"] != DBNull.Value)               
                         entidad.Fideicomisario_CuentasKYCTipoCuenta2 = reader["CuentasKYCTipoCuenta2"].ToString();
 if(reader["CuentasKYCNoCuenta3"] != DBNull.Value)               
                         entidad.Fideicomisario_CuentasKYCNoCuenta3 = Int32.Parse(reader["CuentasKYCNoCuenta3"].ToString());
 if(reader["CuentasKYCTipoCuenta3"] != DBNull.Value)               
                         entidad.Fideicomisario_CuentasKYCTipoCuenta3 = reader["CuentasKYCTipoCuenta3"].ToString();
 if(reader["CuentasKYCNoCuenta4"] != DBNull.Value)               
                         entidad.Fideicomisario_CuentasKYCNoCuenta4 = Int32.Parse(reader["CuentasKYCNoCuenta4"].ToString());
 if(reader["CuentasKYCTipoCuenta4"] != DBNull.Value)               
                         entidad.Fideicomisario_CuentasKYCTipoCuenta4 = reader["CuentasKYCTipoCuenta4"].ToString();
                   
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
        public List<Fideicomisario> GetFideicomisariosAndRelations(int page, int numrecords)
        {
            List<Fideicomisario> lista = new List<Fideicomisario>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListFideicomisarioPaged";
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
                    var it = new Fideicomisario();
            
                      if(reader["ID"] != DBNull.Value)               
                         it.Fideicomisario_ID = reader["ID"].ToString();
 if(reader["NumeroFideicomisario"] != DBNull.Value)               
                         it.Fideicomisario_NumeroFideicomisario = reader["NumeroFideicomisario"].ToString();
 if(reader["TipoPersona"] != DBNull.Value)               
                         it.Fideicomisario_TipoPersona = reader["TipoPersona"].ToString();
 if(reader["Participante"] != DBNull.Value)               
                         it.Fideicomisario_Participante = reader["Participante"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         it.Fideicomisario_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["RegimenFiscal"] != DBNull.Value)               
                         it.Fideicomisario_RegimenFiscal = reader["RegimenFiscal"].ToString();
 if(reader["GeneralesControladorFideicomiso"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesControladorFideicomiso = reader["GeneralesControladorFideicomiso"].ToString();
 if(reader["GeneralesNacionalidad"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesNacionalidad = reader["GeneralesNacionalidad"].ToString();
 if(reader["GeneralesPaisOrigen"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesPaisOrigen = reader["GeneralesPaisOrigen"].ToString();
 if(reader["GeneralesActividad"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesActividad = reader["GeneralesActividad"].ToString();
 if(reader["GeneralesAportaRecursos"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesAportaRecursos = reader["GeneralesAportaRecursos"].ToString();
 if(reader["GeneralesPaisResidencia"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesPaisResidencia = reader["GeneralesPaisResidencia"].ToString();
 if(reader["GeneralesClienteScotiaBank"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesClienteScotiaBank = reader["GeneralesClienteScotiaBank"].ToString();
 if(reader["GeneralesPep"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesPep = reader["GeneralesPep"].ToString();
 if(reader["GeneralesEstatus"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesEstatus = reader["GeneralesEstatus"].ToString();
 if(reader["GeneralesGrupoFilial"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesGrupoFilial = reader["GeneralesGrupoFilial"].ToString();
 if(reader["GeneralesCalidadMigratoria"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesCalidadMigratoria = reader["GeneralesCalidadMigratoria"].ToString();
 if(reader["GeneralesLugarOperacion"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesLugarOperacion = reader["GeneralesLugarOperacion"].ToString();
 if(reader["GeneralesOperaCuentaTerceros"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesOperaCuentaTerceros = reader["GeneralesOperaCuentaTerceros"].ToString();
 if(reader["GeneralesNivelParticipante"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesNivelParticipante = reader["GeneralesNivelParticipante"].ToString();
 if(reader["GeneralesClienteRelacionPep"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesClienteRelacionPep = reader["GeneralesClienteRelacionPep"].ToString();
 if(reader["GeneralesGrado"] != DBNull.Value)               
                         it.Fideicomisario_GeneralesGrado = reader["GeneralesGrado"].ToString();
 if(reader["InfoPldKycHonorarios"] != DBNull.Value)               
                         it.Fideicomisario_InfoPldKycHonorarios = reader["InfoPldKycHonorarios"].ToString();
 if(reader["InfoPldKycComisiones"] != DBNull.Value)               
                         it.Fideicomisario_InfoPldKycComisiones = reader["InfoPldKycComisiones"].ToString();
 if(reader["InfoPldKycOtros"] != DBNull.Value)               
                         it.Fideicomisario_InfoPldKycOtros = reader["InfoPldKycOtros"].ToString();
 if(reader["InfoPldKycSueldos"] != DBNull.Value)               
                         it.Fideicomisario_InfoPldKycSueldos = reader["InfoPldKycSueldos"].ToString();
 if(reader["InfoPldKycVenta"] != DBNull.Value)               
                         it.Fideicomisario_InfoPldKycVenta = reader["InfoPldKycVenta"].ToString();
 if(reader["InfoPldKycInversiones"] != DBNull.Value)               
                         it.Fideicomisario_InfoPldKycInversiones = reader["InfoPldKycInversiones"].ToString();
 if(reader["InfoPldKycArrendamiento"] != DBNull.Value)               
                         it.Fideicomisario_InfoPldKycArrendamiento = reader["InfoPldKycArrendamiento"].ToString();
 if(reader["InfoPldKycTipoPatrimonio"] != DBNull.Value)               
                         it.Fideicomisario_InfoPldKycTipoPatrimonio = reader["InfoPldKycTipoPatrimonio"].ToString();
 if(reader["InfoPldKycInstrumento"] != DBNull.Value)               
                         it.Fideicomisario_InfoPldKycInstrumento = reader["InfoPldKycInstrumento"].ToString();
 if(reader["InfoPldKycRazonApertura"] != DBNull.Value)               
                         it.Fideicomisario_InfoPldKycRazonApertura = reader["InfoPldKycRazonApertura"].ToString();
 if(reader["InfoPldKycComentarios"] != DBNull.Value)               
                         it.Fideicomisario_InfoPldKycComentarios = reader["InfoPldKycComentarios"].ToString();
 if(reader["InfoPldKycNivelRiesgo"] != DBNull.Value)               
                         it.Fideicomisario_InfoPldKycNivelRiesgo = reader["InfoPldKycNivelRiesgo"].ToString();
 if(reader["InfoPldKycEstatusCalculoPld"] != DBNull.Value)               
                         it.Fideicomisario_InfoPldKycEstatusCalculoPld = reader["InfoPldKycEstatusCalculoPld"].ToString();
 if(reader["InfoPldKycFechaVerifFircosoft"] != DBNull.Value)               
                         it.Fideicomisario_InfoPldKycFechaVerifFircosoft = DateTime.Parse(reader["InfoPldKycFechaVerifFircosoft"].ToString());
 if(reader["IdentificacionRfc"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionRfc = reader["IdentificacionRfc"].ToString();
 if(reader["IdentificacionCurp"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionCurp = reader["IdentificacionCurp"].ToString();
 if(reader["IdentificacionNoSerieEfirma"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionNoSerieEfirma = reader["IdentificacionNoSerieEfirma"].ToString();
 if(reader["IdentificacionPaisResidFisc1"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionPaisResidFisc1 = reader["IdentificacionPaisResidFisc1"].ToString();
 if(reader["IdentificacionPaisResidFisc2"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionPaisResidFisc2 = reader["IdentificacionPaisResidFisc2"].ToString();
 if(reader["IdentificacionEmail"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionEmail = reader["IdentificacionEmail"].ToString();
 if(reader["IdentificacionFechaConstitucion"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionFechaConstitucion = DateTime.Parse(reader["IdentificacionFechaConstitucion"].ToString());
 if(reader["IdentificacionSexo"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionSexo = reader["IdentificacionSexo"].ToString();
 if(reader["IdentificacionPaisCasa"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionPaisCasa = reader["IdentificacionPaisCasa"].ToString();
 if(reader["IdentificacionPaisOficina"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionPaisOficina = reader["IdentificacionPaisOficina"].ToString();
 if(reader["IdentificacionPaisCelular"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionPaisCelular = reader["IdentificacionPaisCelular"].ToString();
 if(reader["IdentificacionFechaInicioRelNeg"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionFechaInicioRelNeg = DateTime.Parse(reader["IdentificacionFechaInicioRelNeg"].ToString());
 if(reader["IdentificacionNoIdentificacion"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionNoIdentificacion = reader["IdentificacionNoIdentificacion"].ToString();
 if(reader["IdentificacionComprobacionDomicilio"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionComprobacionDomicilio = reader["IdentificacionComprobacionDomicilio"].ToString();
 if(reader["IdentificacionActividadEmpresarial"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionActividadEmpresarial = reader["IdentificacionActividadEmpresarial"].ToString();
 if(reader["IdentificacionNoIdentFisc1"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionNoIdentFisc1 = reader["IdentificacionNoIdentFisc1"].ToString();
 if(reader["IdentificacionNoIdentFisc2"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionNoIdentFisc2 = reader["IdentificacionNoIdentFisc2"].ToString();
 if(reader["IdentificacionClasificacionFatca"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionClasificacionFatca = reader["IdentificacionClasificacionFatca"].ToString();
 if(reader["IdentificacionLadaCasa"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionLadaCasa = reader["IdentificacionLadaCasa"].ToString();
 if(reader["IdentificacionLadaOficina"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionLadaOficina = reader["IdentificacionLadaOficina"].ToString();
 if(reader["IdentificacionLadaCelular"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionLadaCelular = reader["IdentificacionLadaCelular"].ToString();
 if(reader["IdentificacionNumeroCasa"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionNumeroCasa = reader["IdentificacionNumeroCasa"].ToString();
 if(reader["IdentificacionNumeroOficina"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionNumeroOficina = reader["IdentificacionNumeroOficina"].ToString();
 if(reader["IdentificacionNumeroCelular"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionNumeroCelular = reader["IdentificacionNumeroCelular"].ToString();
 if(reader["IdentificacionExtOficina"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionExtOficina = reader["IdentificacionExtOficina"].ToString();
 if(reader["IdentificacionExtCelular"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionExtCelular = reader["IdentificacionExtCelular"].ToString();
 if(reader["IdentificacionIdentOficialVig"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionIdentOficialVig = reader["IdentificacionIdentOficialVig"].ToString();
 if(reader["IdentificacionVigencia"] != DBNull.Value)               
                         it.Fideicomisario_IdentificacionVigencia = reader["IdentificacionVigencia"].ToString();
 if(reader["EscrituraNoEscritura"] != DBNull.Value)               
                         it.Fideicomisario_EscrituraNoEscritura = reader["EscrituraNoEscritura"].ToString();
 if(reader["EscrituraNotario"] != DBNull.Value)               
                         it.Fideicomisario_EscrituraNotario = reader["EscrituraNotario"].ToString();
 if(reader["EscrituraNoNotaria"] != DBNull.Value)               
                         it.Fideicomisario_EscrituraNoNotaria = reader["EscrituraNoNotaria"].ToString();
 if(reader["EscrituraCiudad"] != DBNull.Value)               
                         it.Fideicomisario_EscrituraCiudad = reader["EscrituraCiudad"].ToString();
 if(reader["EscrituraTelefono"] != DBNull.Value)               
                         it.Fideicomisario_EscrituraTelefono = reader["EscrituraTelefono"].ToString();
 if(reader["EscrituraEmail"] != DBNull.Value)               
                         it.Fideicomisario_EscrituraEmail = reader["EscrituraEmail"].ToString();
 if(reader["EscrituraFecha"] != DBNull.Value)               
                         it.Fideicomisario_EscrituraFecha = DateTime.Parse(reader["EscrituraFecha"].ToString());
 if(reader["EscrituraEstado"] != DBNull.Value)               
                         it.Fideicomisario_EscrituraEstado = reader["EscrituraEstado"].ToString();
 if(reader["CuentasKYCNoCuenta1"] != DBNull.Value)               
                         it.Fideicomisario_CuentasKYCNoCuenta1 = Int32.Parse(reader["CuentasKYCNoCuenta1"].ToString());
 if(reader["CuentasKYCTipoCuenta1"] != DBNull.Value)               
                         it.Fideicomisario_CuentasKYCTipoCuenta1 = reader["CuentasKYCTipoCuenta1"].ToString();
 if(reader["CuentasKYCNoCuenta2"] != DBNull.Value)               
                         it.Fideicomisario_CuentasKYCNoCuenta2 = Int32.Parse(reader["CuentasKYCNoCuenta2"].ToString());
 if(reader["CuentasKYCTipoCuenta2"] != DBNull.Value)               
                         it.Fideicomisario_CuentasKYCTipoCuenta2 = reader["CuentasKYCTipoCuenta2"].ToString();
 if(reader["CuentasKYCNoCuenta3"] != DBNull.Value)               
                         it.Fideicomisario_CuentasKYCNoCuenta3 = Int32.Parse(reader["CuentasKYCNoCuenta3"].ToString());
 if(reader["CuentasKYCTipoCuenta3"] != DBNull.Value)               
                         it.Fideicomisario_CuentasKYCTipoCuenta3 = reader["CuentasKYCTipoCuenta3"].ToString();
 if(reader["CuentasKYCNoCuenta4"] != DBNull.Value)               
                         it.Fideicomisario_CuentasKYCNoCuenta4 = Int32.Parse(reader["CuentasKYCNoCuenta4"].ToString());
 if(reader["CuentasKYCTipoCuenta4"] != DBNull.Value)               
                         it.Fideicomisario_CuentasKYCTipoCuenta4 = reader["CuentasKYCTipoCuenta4"].ToString();
                   
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
        public List<Fideicomisario> GetFideicomisarios(int page, int numrecords)
        {
            List<Fideicomisario> lista = new List<Fideicomisario>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListFideicomisarioPaged";
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
                    var it = new Fideicomisario();
            
                            if(reader["ID"] != DBNull.Value)               
                             it.Fideicomisario_ID = reader["ID"].ToString();
                            if(reader["NumeroFideicomisario"] != DBNull.Value)               
                             it.Fideicomisario_NumeroFideicomisario = reader["NumeroFideicomisario"].ToString();
                            if(reader["TipoPersona"] != DBNull.Value)               
                             it.Fideicomisario_TipoPersona = reader["TipoPersona"].ToString();
                            if(reader["Participante"] != DBNull.Value)               
                             it.Fideicomisario_Participante = reader["Participante"].ToString();
                            if(reader["Fideicomiso"] != DBNull.Value)               
                             it.Fideicomisario_Fideicomiso = reader["Fideicomiso"].ToString();
                            if(reader["RegimenFiscal"] != DBNull.Value)               
                             it.Fideicomisario_RegimenFiscal = reader["RegimenFiscal"].ToString();
                            if(reader["GeneralesControladorFideicomiso"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesControladorFideicomiso = reader["GeneralesControladorFideicomiso"].ToString();
                            if(reader["GeneralesNacionalidad"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesNacionalidad = reader["GeneralesNacionalidad"].ToString();
                            if(reader["GeneralesPaisOrigen"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesPaisOrigen = reader["GeneralesPaisOrigen"].ToString();
                            if(reader["GeneralesActividad"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesActividad = reader["GeneralesActividad"].ToString();
                            if(reader["GeneralesAportaRecursos"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesAportaRecursos = reader["GeneralesAportaRecursos"].ToString();
                            if(reader["GeneralesPaisResidencia"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesPaisResidencia = reader["GeneralesPaisResidencia"].ToString();
                            if(reader["GeneralesClienteScotiaBank"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesClienteScotiaBank = reader["GeneralesClienteScotiaBank"].ToString();
                            if(reader["GeneralesPep"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesPep = reader["GeneralesPep"].ToString();
                            if(reader["GeneralesEstatus"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesEstatus = reader["GeneralesEstatus"].ToString();
                            if(reader["GeneralesGrupoFilial"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesGrupoFilial = reader["GeneralesGrupoFilial"].ToString();
                            if(reader["GeneralesCalidadMigratoria"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesCalidadMigratoria = reader["GeneralesCalidadMigratoria"].ToString();
                            if(reader["GeneralesLugarOperacion"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesLugarOperacion = reader["GeneralesLugarOperacion"].ToString();
                            if(reader["GeneralesOperaCuentaTerceros"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesOperaCuentaTerceros = reader["GeneralesOperaCuentaTerceros"].ToString();
                            if(reader["GeneralesNivelParticipante"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesNivelParticipante = reader["GeneralesNivelParticipante"].ToString();
                            if(reader["GeneralesClienteRelacionPep"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesClienteRelacionPep = reader["GeneralesClienteRelacionPep"].ToString();
                            if(reader["GeneralesGrado"] != DBNull.Value)               
                             it.Fideicomisario_GeneralesGrado = reader["GeneralesGrado"].ToString();
                            if(reader["InfoPldKycHonorarios"] != DBNull.Value)               
                             it.Fideicomisario_InfoPldKycHonorarios = reader["InfoPldKycHonorarios"].ToString();
                            if(reader["InfoPldKycComisiones"] != DBNull.Value)               
                             it.Fideicomisario_InfoPldKycComisiones = reader["InfoPldKycComisiones"].ToString();
                            if(reader["InfoPldKycOtros"] != DBNull.Value)               
                             it.Fideicomisario_InfoPldKycOtros = reader["InfoPldKycOtros"].ToString();
                            if(reader["InfoPldKycSueldos"] != DBNull.Value)               
                             it.Fideicomisario_InfoPldKycSueldos = reader["InfoPldKycSueldos"].ToString();
                            if(reader["InfoPldKycVenta"] != DBNull.Value)               
                             it.Fideicomisario_InfoPldKycVenta = reader["InfoPldKycVenta"].ToString();
                            if(reader["InfoPldKycInversiones"] != DBNull.Value)               
                             it.Fideicomisario_InfoPldKycInversiones = reader["InfoPldKycInversiones"].ToString();
                            if(reader["InfoPldKycArrendamiento"] != DBNull.Value)               
                             it.Fideicomisario_InfoPldKycArrendamiento = reader["InfoPldKycArrendamiento"].ToString();
                            if(reader["InfoPldKycTipoPatrimonio"] != DBNull.Value)               
                             it.Fideicomisario_InfoPldKycTipoPatrimonio = reader["InfoPldKycTipoPatrimonio"].ToString();
                            if(reader["InfoPldKycInstrumento"] != DBNull.Value)               
                             it.Fideicomisario_InfoPldKycInstrumento = reader["InfoPldKycInstrumento"].ToString();
                            if(reader["InfoPldKycRazonApertura"] != DBNull.Value)               
                             it.Fideicomisario_InfoPldKycRazonApertura = reader["InfoPldKycRazonApertura"].ToString();
                            if(reader["InfoPldKycComentarios"] != DBNull.Value)               
                             it.Fideicomisario_InfoPldKycComentarios = reader["InfoPldKycComentarios"].ToString();
                            if(reader["InfoPldKycNivelRiesgo"] != DBNull.Value)               
                             it.Fideicomisario_InfoPldKycNivelRiesgo = reader["InfoPldKycNivelRiesgo"].ToString();
                            if(reader["InfoPldKycEstatusCalculoPld"] != DBNull.Value)               
                             it.Fideicomisario_InfoPldKycEstatusCalculoPld = reader["InfoPldKycEstatusCalculoPld"].ToString();
                            if(reader["InfoPldKycFechaVerifFircosoft"] != DBNull.Value)               
                             it.Fideicomisario_InfoPldKycFechaVerifFircosoft = DateTime.Parse(reader["InfoPldKycFechaVerifFircosoft"].ToString());
                            if(reader["IdentificacionRfc"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionRfc = reader["IdentificacionRfc"].ToString();
                            if(reader["IdentificacionCurp"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionCurp = reader["IdentificacionCurp"].ToString();
                            if(reader["IdentificacionNoSerieEfirma"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionNoSerieEfirma = reader["IdentificacionNoSerieEfirma"].ToString();
                            if(reader["IdentificacionPaisResidFisc1"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionPaisResidFisc1 = reader["IdentificacionPaisResidFisc1"].ToString();
                            if(reader["IdentificacionPaisResidFisc2"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionPaisResidFisc2 = reader["IdentificacionPaisResidFisc2"].ToString();
                            if(reader["IdentificacionEmail"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionEmail = reader["IdentificacionEmail"].ToString();
                            if(reader["IdentificacionFechaConstitucion"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionFechaConstitucion = DateTime.Parse(reader["IdentificacionFechaConstitucion"].ToString());
                            if(reader["IdentificacionSexo"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionSexo = reader["IdentificacionSexo"].ToString();
                            if(reader["IdentificacionPaisCasa"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionPaisCasa = reader["IdentificacionPaisCasa"].ToString();
                            if(reader["IdentificacionPaisOficina"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionPaisOficina = reader["IdentificacionPaisOficina"].ToString();
                            if(reader["IdentificacionPaisCelular"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionPaisCelular = reader["IdentificacionPaisCelular"].ToString();
                            if(reader["IdentificacionFechaInicioRelNeg"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionFechaInicioRelNeg = DateTime.Parse(reader["IdentificacionFechaInicioRelNeg"].ToString());
                            if(reader["IdentificacionNoIdentificacion"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionNoIdentificacion = reader["IdentificacionNoIdentificacion"].ToString();
                            if(reader["IdentificacionComprobacionDomicilio"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionComprobacionDomicilio = reader["IdentificacionComprobacionDomicilio"].ToString();
                            if(reader["IdentificacionActividadEmpresarial"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionActividadEmpresarial = reader["IdentificacionActividadEmpresarial"].ToString();
                            if(reader["IdentificacionNoIdentFisc1"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionNoIdentFisc1 = reader["IdentificacionNoIdentFisc1"].ToString();
                            if(reader["IdentificacionNoIdentFisc2"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionNoIdentFisc2 = reader["IdentificacionNoIdentFisc2"].ToString();
                            if(reader["IdentificacionClasificacionFatca"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionClasificacionFatca = reader["IdentificacionClasificacionFatca"].ToString();
                            if(reader["IdentificacionLadaCasa"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionLadaCasa = reader["IdentificacionLadaCasa"].ToString();
                            if(reader["IdentificacionLadaOficina"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionLadaOficina = reader["IdentificacionLadaOficina"].ToString();
                            if(reader["IdentificacionLadaCelular"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionLadaCelular = reader["IdentificacionLadaCelular"].ToString();
                            if(reader["IdentificacionNumeroCasa"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionNumeroCasa = reader["IdentificacionNumeroCasa"].ToString();
                            if(reader["IdentificacionNumeroOficina"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionNumeroOficina = reader["IdentificacionNumeroOficina"].ToString();
                            if(reader["IdentificacionNumeroCelular"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionNumeroCelular = reader["IdentificacionNumeroCelular"].ToString();
                            if(reader["IdentificacionExtOficina"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionExtOficina = reader["IdentificacionExtOficina"].ToString();
                            if(reader["IdentificacionExtCelular"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionExtCelular = reader["IdentificacionExtCelular"].ToString();
                            if(reader["IdentificacionIdentOficialVig"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionIdentOficialVig = reader["IdentificacionIdentOficialVig"].ToString();
                            if(reader["IdentificacionVigencia"] != DBNull.Value)               
                             it.Fideicomisario_IdentificacionVigencia = reader["IdentificacionVigencia"].ToString();
                            if(reader["EscrituraNoEscritura"] != DBNull.Value)               
                             it.Fideicomisario_EscrituraNoEscritura = reader["EscrituraNoEscritura"].ToString();
                            if(reader["EscrituraNotario"] != DBNull.Value)               
                             it.Fideicomisario_EscrituraNotario = reader["EscrituraNotario"].ToString();
                            if(reader["EscrituraNoNotaria"] != DBNull.Value)               
                             it.Fideicomisario_EscrituraNoNotaria = reader["EscrituraNoNotaria"].ToString();
                            if(reader["EscrituraCiudad"] != DBNull.Value)               
                             it.Fideicomisario_EscrituraCiudad = reader["EscrituraCiudad"].ToString();
                            if(reader["EscrituraTelefono"] != DBNull.Value)               
                             it.Fideicomisario_EscrituraTelefono = reader["EscrituraTelefono"].ToString();
                            if(reader["EscrituraEmail"] != DBNull.Value)               
                             it.Fideicomisario_EscrituraEmail = reader["EscrituraEmail"].ToString();
                            if(reader["EscrituraFecha"] != DBNull.Value)               
                             it.Fideicomisario_EscrituraFecha = DateTime.Parse(reader["EscrituraFecha"].ToString());
                            if(reader["EscrituraEstado"] != DBNull.Value)               
                             it.Fideicomisario_EscrituraEstado = reader["EscrituraEstado"].ToString();
                            if(reader["CuentasKYCNoCuenta1"] != DBNull.Value)               
                             it.Fideicomisario_CuentasKYCNoCuenta1 = Int32.Parse(reader["CuentasKYCNoCuenta1"].ToString());
                            if(reader["CuentasKYCTipoCuenta1"] != DBNull.Value)               
                             it.Fideicomisario_CuentasKYCTipoCuenta1 = reader["CuentasKYCTipoCuenta1"].ToString();
                            if(reader["CuentasKYCNoCuenta2"] != DBNull.Value)               
                             it.Fideicomisario_CuentasKYCNoCuenta2 = Int32.Parse(reader["CuentasKYCNoCuenta2"].ToString());
                            if(reader["CuentasKYCTipoCuenta2"] != DBNull.Value)               
                             it.Fideicomisario_CuentasKYCTipoCuenta2 = reader["CuentasKYCTipoCuenta2"].ToString();
                            if(reader["CuentasKYCNoCuenta3"] != DBNull.Value)               
                             it.Fideicomisario_CuentasKYCNoCuenta3 = Int32.Parse(reader["CuentasKYCNoCuenta3"].ToString());
                            if(reader["CuentasKYCTipoCuenta3"] != DBNull.Value)               
                             it.Fideicomisario_CuentasKYCTipoCuenta3 = reader["CuentasKYCTipoCuenta3"].ToString();
                            if(reader["CuentasKYCNoCuenta4"] != DBNull.Value)               
                             it.Fideicomisario_CuentasKYCNoCuenta4 = Int32.Parse(reader["CuentasKYCNoCuenta4"].ToString());
                            if(reader["CuentasKYCTipoCuenta4"] != DBNull.Value)               
                             it.Fideicomisario_CuentasKYCTipoCuenta4 = reader["CuentasKYCTipoCuenta4"].ToString();
                   
                   

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
        public Result InsertFideicomisario(Fideicomisario item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spInsertFideicomisario";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
       
                                insertCommand.Parameters.AddWithValue("@NumeroFideicomisario", item.Fideicomisario_NumeroFideicomisario);
                    insertCommand.Parameters.AddWithValue("@TipoPersona", item.Fideicomisario_TipoPersona);
                    insertCommand.Parameters.AddWithValue("@Participante", item.Fideicomisario_Participante);
                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.Fideicomisario_Fideicomiso);
                    insertCommand.Parameters.AddWithValue("@RegimenFiscal", item.Fideicomisario_RegimenFiscal);
  if (item.Fideicomisario_GeneralesControladorFideicomiso == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesControladorFideicomiso", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesControladorFideicomiso", item.Fideicomisario_GeneralesControladorFideicomiso);


  if (item.Fideicomisario_GeneralesNacionalidad == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesNacionalidad", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesNacionalidad", item.Fideicomisario_GeneralesNacionalidad);


  if (item.Fideicomisario_GeneralesPaisOrigen == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesPaisOrigen", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesPaisOrigen", item.Fideicomisario_GeneralesPaisOrigen);


  if (item.Fideicomisario_GeneralesActividad == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesActividad", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesActividad", item.Fideicomisario_GeneralesActividad);


  if (item.Fideicomisario_GeneralesAportaRecursos == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesAportaRecursos", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesAportaRecursos", item.Fideicomisario_GeneralesAportaRecursos);


  if (item.Fideicomisario_GeneralesPaisResidencia == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesPaisResidencia", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesPaisResidencia", item.Fideicomisario_GeneralesPaisResidencia);


  if (item.Fideicomisario_GeneralesClienteScotiaBank == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesClienteScotiaBank", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesClienteScotiaBank", item.Fideicomisario_GeneralesClienteScotiaBank);


  if (item.Fideicomisario_GeneralesPep == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesPep", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesPep", item.Fideicomisario_GeneralesPep);


  if (item.Fideicomisario_GeneralesEstatus == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesEstatus", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesEstatus", item.Fideicomisario_GeneralesEstatus);


  if (item.Fideicomisario_GeneralesGrupoFilial == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesGrupoFilial", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesGrupoFilial", item.Fideicomisario_GeneralesGrupoFilial);


  if (item.Fideicomisario_GeneralesCalidadMigratoria == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesCalidadMigratoria", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesCalidadMigratoria", item.Fideicomisario_GeneralesCalidadMigratoria);


  if (item.Fideicomisario_GeneralesLugarOperacion == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesLugarOperacion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesLugarOperacion", item.Fideicomisario_GeneralesLugarOperacion);


  if (item.Fideicomisario_GeneralesOperaCuentaTerceros == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesOperaCuentaTerceros", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesOperaCuentaTerceros", item.Fideicomisario_GeneralesOperaCuentaTerceros);


  if (item.Fideicomisario_GeneralesNivelParticipante == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesNivelParticipante", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesNivelParticipante", item.Fideicomisario_GeneralesNivelParticipante);


  if (item.Fideicomisario_GeneralesClienteRelacionPep == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesClienteRelacionPep", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesClienteRelacionPep", item.Fideicomisario_GeneralesClienteRelacionPep);


  if (item.Fideicomisario_GeneralesGrado == null) 
                      insertCommand.Parameters.AddWithValue("@GeneralesGrado", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@GeneralesGrado", item.Fideicomisario_GeneralesGrado);


  if (item.Fideicomisario_InfoPldKycHonorarios == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycHonorarios", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycHonorarios", item.Fideicomisario_InfoPldKycHonorarios);


  if (item.Fideicomisario_InfoPldKycComisiones == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycComisiones", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycComisiones", item.Fideicomisario_InfoPldKycComisiones);


  if (item.Fideicomisario_InfoPldKycOtros == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycOtros", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycOtros", item.Fideicomisario_InfoPldKycOtros);


  if (item.Fideicomisario_InfoPldKycSueldos == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycSueldos", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycSueldos", item.Fideicomisario_InfoPldKycSueldos);


  if (item.Fideicomisario_InfoPldKycVenta == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycVenta", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycVenta", item.Fideicomisario_InfoPldKycVenta);


  if (item.Fideicomisario_InfoPldKycInversiones == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycInversiones", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycInversiones", item.Fideicomisario_InfoPldKycInversiones);


  if (item.Fideicomisario_InfoPldKycArrendamiento == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycArrendamiento", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycArrendamiento", item.Fideicomisario_InfoPldKycArrendamiento);


  if (item.Fideicomisario_InfoPldKycTipoPatrimonio == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycTipoPatrimonio", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycTipoPatrimonio", item.Fideicomisario_InfoPldKycTipoPatrimonio);


  if (item.Fideicomisario_InfoPldKycInstrumento == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycInstrumento", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycInstrumento", item.Fideicomisario_InfoPldKycInstrumento);


  if (item.Fideicomisario_InfoPldKycRazonApertura == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycRazonApertura", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycRazonApertura", item.Fideicomisario_InfoPldKycRazonApertura);


  if (item.Fideicomisario_InfoPldKycComentarios == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycComentarios", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycComentarios", item.Fideicomisario_InfoPldKycComentarios);


  if (item.Fideicomisario_InfoPldKycNivelRiesgo == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycNivelRiesgo", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycNivelRiesgo", item.Fideicomisario_InfoPldKycNivelRiesgo);


  if (item.Fideicomisario_InfoPldKycEstatusCalculoPld == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycEstatusCalculoPld", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycEstatusCalculoPld", item.Fideicomisario_InfoPldKycEstatusCalculoPld);


  if (item.Fideicomisario_InfoPldKycFechaVerifFircosoft == null) 
                      insertCommand.Parameters.AddWithValue("@InfoPldKycFechaVerifFircosoft", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@InfoPldKycFechaVerifFircosoft", item.Fideicomisario_InfoPldKycFechaVerifFircosoft);


  if (item.Fideicomisario_IdentificacionRfc == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionRfc", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionRfc", item.Fideicomisario_IdentificacionRfc);


  if (item.Fideicomisario_IdentificacionCurp == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionCurp", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionCurp", item.Fideicomisario_IdentificacionCurp);


  if (item.Fideicomisario_IdentificacionNoSerieEfirma == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionNoSerieEfirma", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionNoSerieEfirma", item.Fideicomisario_IdentificacionNoSerieEfirma);


  if (item.Fideicomisario_IdentificacionPaisResidFisc1 == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc1", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc1", item.Fideicomisario_IdentificacionPaisResidFisc1);


  if (item.Fideicomisario_IdentificacionPaisResidFisc2 == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc2", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc2", item.Fideicomisario_IdentificacionPaisResidFisc2);


  if (item.Fideicomisario_IdentificacionEmail == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionEmail", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionEmail", item.Fideicomisario_IdentificacionEmail);


  if (item.Fideicomisario_IdentificacionFechaConstitucion == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionFechaConstitucion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionFechaConstitucion", item.Fideicomisario_IdentificacionFechaConstitucion);


  if (item.Fideicomisario_IdentificacionSexo == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionSexo", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionSexo", item.Fideicomisario_IdentificacionSexo);


  if (item.Fideicomisario_IdentificacionPaisCasa == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisCasa", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionPaisCasa", item.Fideicomisario_IdentificacionPaisCasa);


  if (item.Fideicomisario_IdentificacionPaisOficina == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisOficina", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionPaisOficina", item.Fideicomisario_IdentificacionPaisOficina);


  if (item.Fideicomisario_IdentificacionPaisCelular == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisCelular", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionPaisCelular", item.Fideicomisario_IdentificacionPaisCelular);


  if (item.Fideicomisario_IdentificacionFechaInicioRelNeg == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionFechaInicioRelNeg", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionFechaInicioRelNeg", item.Fideicomisario_IdentificacionFechaInicioRelNeg);


  if (item.Fideicomisario_IdentificacionNoIdentificacion == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentificacion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentificacion", item.Fideicomisario_IdentificacionNoIdentificacion);


  if (item.Fideicomisario_IdentificacionComprobacionDomicilio == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionComprobacionDomicilio", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionComprobacionDomicilio", item.Fideicomisario_IdentificacionComprobacionDomicilio);


  if (item.Fideicomisario_IdentificacionActividadEmpresarial == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionActividadEmpresarial", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionActividadEmpresarial", item.Fideicomisario_IdentificacionActividadEmpresarial);


  if (item.Fideicomisario_IdentificacionNoIdentFisc1 == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc1", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc1", item.Fideicomisario_IdentificacionNoIdentFisc1);


  if (item.Fideicomisario_IdentificacionNoIdentFisc2 == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc2", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc2", item.Fideicomisario_IdentificacionNoIdentFisc2);


  if (item.Fideicomisario_IdentificacionClasificacionFatca == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionClasificacionFatca", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionClasificacionFatca", item.Fideicomisario_IdentificacionClasificacionFatca);


  if (item.Fideicomisario_IdentificacionLadaCasa == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaCasa", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionLadaCasa", item.Fideicomisario_IdentificacionLadaCasa);


  if (item.Fideicomisario_IdentificacionLadaOficina == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaOficina", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionLadaOficina", item.Fideicomisario_IdentificacionLadaOficina);


  if (item.Fideicomisario_IdentificacionLadaCelular == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaCelular", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionLadaCelular", item.Fideicomisario_IdentificacionLadaCelular);


  if (item.Fideicomisario_IdentificacionNumeroCasa == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCasa", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCasa", item.Fideicomisario_IdentificacionNumeroCasa);


  if (item.Fideicomisario_IdentificacionNumeroOficina == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroOficina", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionNumeroOficina", item.Fideicomisario_IdentificacionNumeroOficina);


  if (item.Fideicomisario_IdentificacionNumeroCelular == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCelular", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCelular", item.Fideicomisario_IdentificacionNumeroCelular);


  if (item.Fideicomisario_IdentificacionExtOficina == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionExtOficina", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionExtOficina", item.Fideicomisario_IdentificacionExtOficina);


  if (item.Fideicomisario_IdentificacionExtCelular == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionExtCelular", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionExtCelular", item.Fideicomisario_IdentificacionExtCelular);


  if (item.Fideicomisario_IdentificacionIdentOficialVig == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionIdentOficialVig", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionIdentOficialVig", item.Fideicomisario_IdentificacionIdentOficialVig);


  if (item.Fideicomisario_IdentificacionVigencia == null) 
                      insertCommand.Parameters.AddWithValue("@IdentificacionVigencia", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@IdentificacionVigencia", item.Fideicomisario_IdentificacionVigencia);


  if (item.Fideicomisario_EscrituraNoEscritura == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraNoEscritura", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraNoEscritura", item.Fideicomisario_EscrituraNoEscritura);


  if (item.Fideicomisario_EscrituraNotario == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraNotario", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraNotario", item.Fideicomisario_EscrituraNotario);


  if (item.Fideicomisario_EscrituraNoNotaria == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraNoNotaria", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraNoNotaria", item.Fideicomisario_EscrituraNoNotaria);


  if (item.Fideicomisario_EscrituraCiudad == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraCiudad", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraCiudad", item.Fideicomisario_EscrituraCiudad);


  if (item.Fideicomisario_EscrituraTelefono == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraTelefono", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraTelefono", item.Fideicomisario_EscrituraTelefono);


  if (item.Fideicomisario_EscrituraEmail == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraEmail", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraEmail", item.Fideicomisario_EscrituraEmail);


  if (item.Fideicomisario_EscrituraFecha == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraFecha", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraFecha", item.Fideicomisario_EscrituraFecha);


  if (item.Fideicomisario_EscrituraEstado == null) 
                      insertCommand.Parameters.AddWithValue("@EscrituraEstado", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@EscrituraEstado", item.Fideicomisario_EscrituraEstado);


  if (item.Fideicomisario_CuentasKYCNoCuenta1 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta1", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta1", item.Fideicomisario_CuentasKYCNoCuenta1);


  if (item.Fideicomisario_CuentasKYCTipoCuenta1 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta1", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta1", item.Fideicomisario_CuentasKYCTipoCuenta1);


  if (item.Fideicomisario_CuentasKYCNoCuenta2 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta2", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta2", item.Fideicomisario_CuentasKYCNoCuenta2);


  if (item.Fideicomisario_CuentasKYCTipoCuenta2 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta2", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta2", item.Fideicomisario_CuentasKYCTipoCuenta2);


  if (item.Fideicomisario_CuentasKYCNoCuenta3 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta3", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta3", item.Fideicomisario_CuentasKYCNoCuenta3);


  if (item.Fideicomisario_CuentasKYCTipoCuenta3 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta3", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta3", item.Fideicomisario_CuentasKYCTipoCuenta3);


  if (item.Fideicomisario_CuentasKYCNoCuenta4 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta4", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta4", item.Fideicomisario_CuentasKYCNoCuenta4);


  if (item.Fideicomisario_CuentasKYCTipoCuenta4 == null) 
                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta4", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta4", item.Fideicomisario_CuentasKYCTipoCuenta4);




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
        public Result UpdateFideicomisario(string id, Fideicomisario item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdateFideicomisario";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                                 insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@NumeroFideicomisario", item.Fideicomisario_NumeroFideicomisario);

                                    insertCommand.Parameters.AddWithValue("@TipoPersona", item.Fideicomisario_TipoPersona);

                                    insertCommand.Parameters.AddWithValue("@Participante", item.Fideicomisario_Participante);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.Fideicomisario_Fideicomiso);

                                    insertCommand.Parameters.AddWithValue("@RegimenFiscal", item.Fideicomisario_RegimenFiscal);

  if (item.Fideicomisario_GeneralesControladorFideicomiso == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesControladorFideicomiso", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesControladorFideicomiso", item.Fideicomisario_GeneralesControladorFideicomiso);

    
  if (item.Fideicomisario_GeneralesNacionalidad == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesNacionalidad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesNacionalidad", item.Fideicomisario_GeneralesNacionalidad);

    
  if (item.Fideicomisario_GeneralesPaisOrigen == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesPaisOrigen", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesPaisOrigen", item.Fideicomisario_GeneralesPaisOrigen);

    
  if (item.Fideicomisario_GeneralesActividad == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesActividad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesActividad", item.Fideicomisario_GeneralesActividad);

    
  if (item.Fideicomisario_GeneralesAportaRecursos == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesAportaRecursos", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesAportaRecursos", item.Fideicomisario_GeneralesAportaRecursos);

    
  if (item.Fideicomisario_GeneralesPaisResidencia == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesPaisResidencia", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesPaisResidencia", item.Fideicomisario_GeneralesPaisResidencia);

    
  if (item.Fideicomisario_GeneralesClienteScotiaBank == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesClienteScotiaBank", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesClienteScotiaBank", item.Fideicomisario_GeneralesClienteScotiaBank);

    
  if (item.Fideicomisario_GeneralesPep == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesPep", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesPep", item.Fideicomisario_GeneralesPep);

    
  if (item.Fideicomisario_GeneralesEstatus == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesEstatus", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesEstatus", item.Fideicomisario_GeneralesEstatus);

    
  if (item.Fideicomisario_GeneralesGrupoFilial == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesGrupoFilial", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesGrupoFilial", item.Fideicomisario_GeneralesGrupoFilial);

    
  if (item.Fideicomisario_GeneralesCalidadMigratoria == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesCalidadMigratoria", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesCalidadMigratoria", item.Fideicomisario_GeneralesCalidadMigratoria);

    
  if (item.Fideicomisario_GeneralesLugarOperacion == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesLugarOperacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesLugarOperacion", item.Fideicomisario_GeneralesLugarOperacion);

    
  if (item.Fideicomisario_GeneralesOperaCuentaTerceros == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesOperaCuentaTerceros", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesOperaCuentaTerceros", item.Fideicomisario_GeneralesOperaCuentaTerceros);

    
  if (item.Fideicomisario_GeneralesNivelParticipante == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesNivelParticipante", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesNivelParticipante", item.Fideicomisario_GeneralesNivelParticipante);

    
  if (item.Fideicomisario_GeneralesClienteRelacionPep == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesClienteRelacionPep", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesClienteRelacionPep", item.Fideicomisario_GeneralesClienteRelacionPep);

    
  if (item.Fideicomisario_GeneralesGrado == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesGrado", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesGrado", item.Fideicomisario_GeneralesGrado);

    
  if (item.Fideicomisario_InfoPldKycHonorarios == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycHonorarios", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycHonorarios", item.Fideicomisario_InfoPldKycHonorarios);

    
  if (item.Fideicomisario_InfoPldKycComisiones == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycComisiones", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycComisiones", item.Fideicomisario_InfoPldKycComisiones);

    
  if (item.Fideicomisario_InfoPldKycOtros == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycOtros", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycOtros", item.Fideicomisario_InfoPldKycOtros);

    
  if (item.Fideicomisario_InfoPldKycSueldos == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycSueldos", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycSueldos", item.Fideicomisario_InfoPldKycSueldos);

    
  if (item.Fideicomisario_InfoPldKycVenta == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycVenta", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycVenta", item.Fideicomisario_InfoPldKycVenta);

    
  if (item.Fideicomisario_InfoPldKycInversiones == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycInversiones", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycInversiones", item.Fideicomisario_InfoPldKycInversiones);

    
  if (item.Fideicomisario_InfoPldKycArrendamiento == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycArrendamiento", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycArrendamiento", item.Fideicomisario_InfoPldKycArrendamiento);

    
  if (item.Fideicomisario_InfoPldKycTipoPatrimonio == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycTipoPatrimonio", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycTipoPatrimonio", item.Fideicomisario_InfoPldKycTipoPatrimonio);

    
  if (item.Fideicomisario_InfoPldKycInstrumento == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycInstrumento", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycInstrumento", item.Fideicomisario_InfoPldKycInstrumento);

    
  if (item.Fideicomisario_InfoPldKycRazonApertura == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycRazonApertura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycRazonApertura", item.Fideicomisario_InfoPldKycRazonApertura);

    
  if (item.Fideicomisario_InfoPldKycComentarios == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycComentarios", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycComentarios", item.Fideicomisario_InfoPldKycComentarios);

    
  if (item.Fideicomisario_InfoPldKycNivelRiesgo == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycNivelRiesgo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycNivelRiesgo", item.Fideicomisario_InfoPldKycNivelRiesgo);

    
  if (item.Fideicomisario_InfoPldKycEstatusCalculoPld == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycEstatusCalculoPld", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycEstatusCalculoPld", item.Fideicomisario_InfoPldKycEstatusCalculoPld);

    
  if (item.Fideicomisario_InfoPldKycFechaVerifFircosoft == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycFechaVerifFircosoft", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycFechaVerifFircosoft", item.Fideicomisario_InfoPldKycFechaVerifFircosoft);

    
  if (item.Fideicomisario_IdentificacionRfc == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionRfc", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionRfc", item.Fideicomisario_IdentificacionRfc);

    
  if (item.Fideicomisario_IdentificacionCurp == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionCurp", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionCurp", item.Fideicomisario_IdentificacionCurp);

    
  if (item.Fideicomisario_IdentificacionNoSerieEfirma == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoSerieEfirma", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoSerieEfirma", item.Fideicomisario_IdentificacionNoSerieEfirma);

    
  if (item.Fideicomisario_IdentificacionPaisResidFisc1 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc1", item.Fideicomisario_IdentificacionPaisResidFisc1);

    
  if (item.Fideicomisario_IdentificacionPaisResidFisc2 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc2", item.Fideicomisario_IdentificacionPaisResidFisc2);

    
  if (item.Fideicomisario_IdentificacionEmail == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionEmail", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionEmail", item.Fideicomisario_IdentificacionEmail);

    
  if (item.Fideicomisario_IdentificacionFechaConstitucion == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionFechaConstitucion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionFechaConstitucion", item.Fideicomisario_IdentificacionFechaConstitucion);

    
  if (item.Fideicomisario_IdentificacionSexo == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionSexo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionSexo", item.Fideicomisario_IdentificacionSexo);

    
  if (item.Fideicomisario_IdentificacionPaisCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisCasa", item.Fideicomisario_IdentificacionPaisCasa);

    
  if (item.Fideicomisario_IdentificacionPaisOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisOficina", item.Fideicomisario_IdentificacionPaisOficina);

    
  if (item.Fideicomisario_IdentificacionPaisCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisCelular", item.Fideicomisario_IdentificacionPaisCelular);

    
  if (item.Fideicomisario_IdentificacionFechaInicioRelNeg == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionFechaInicioRelNeg", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionFechaInicioRelNeg", item.Fideicomisario_IdentificacionFechaInicioRelNeg);

    
  if (item.Fideicomisario_IdentificacionNoIdentificacion == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentificacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentificacion", item.Fideicomisario_IdentificacionNoIdentificacion);

    
  if (item.Fideicomisario_IdentificacionComprobacionDomicilio == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionComprobacionDomicilio", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionComprobacionDomicilio", item.Fideicomisario_IdentificacionComprobacionDomicilio);

    
  if (item.Fideicomisario_IdentificacionActividadEmpresarial == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionActividadEmpresarial", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionActividadEmpresarial", item.Fideicomisario_IdentificacionActividadEmpresarial);

    
  if (item.Fideicomisario_IdentificacionNoIdentFisc1 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc1", item.Fideicomisario_IdentificacionNoIdentFisc1);

    
  if (item.Fideicomisario_IdentificacionNoIdentFisc2 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc2", item.Fideicomisario_IdentificacionNoIdentFisc2);

    
  if (item.Fideicomisario_IdentificacionClasificacionFatca == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionClasificacionFatca", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionClasificacionFatca", item.Fideicomisario_IdentificacionClasificacionFatca);

    
  if (item.Fideicomisario_IdentificacionLadaCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionLadaCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaCasa", item.Fideicomisario_IdentificacionLadaCasa);

    
  if (item.Fideicomisario_IdentificacionLadaOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionLadaOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaOficina", item.Fideicomisario_IdentificacionLadaOficina);

    
  if (item.Fideicomisario_IdentificacionLadaCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionLadaCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaCelular", item.Fideicomisario_IdentificacionLadaCelular);

    
  if (item.Fideicomisario_IdentificacionNumeroCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCasa", item.Fideicomisario_IdentificacionNumeroCasa);

    
  if (item.Fideicomisario_IdentificacionNumeroOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNumeroOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroOficina", item.Fideicomisario_IdentificacionNumeroOficina);

    
  if (item.Fideicomisario_IdentificacionNumeroCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCelular", item.Fideicomisario_IdentificacionNumeroCelular);

    
  if (item.Fideicomisario_IdentificacionExtOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionExtOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionExtOficina", item.Fideicomisario_IdentificacionExtOficina);

    
  if (item.Fideicomisario_IdentificacionExtCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionExtCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionExtCelular", item.Fideicomisario_IdentificacionExtCelular);

    
  if (item.Fideicomisario_IdentificacionIdentOficialVig == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionIdentOficialVig", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionIdentOficialVig", item.Fideicomisario_IdentificacionIdentOficialVig);

    
  if (item.Fideicomisario_IdentificacionVigencia == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionVigencia", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionVigencia", item.Fideicomisario_IdentificacionVigencia);

    
  if (item.Fideicomisario_EscrituraNoEscritura == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraNoEscritura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraNoEscritura", item.Fideicomisario_EscrituraNoEscritura);

    
  if (item.Fideicomisario_EscrituraNotario == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraNotario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraNotario", item.Fideicomisario_EscrituraNotario);

    
  if (item.Fideicomisario_EscrituraNoNotaria == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraNoNotaria", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraNoNotaria", item.Fideicomisario_EscrituraNoNotaria);

    
  if (item.Fideicomisario_EscrituraCiudad == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraCiudad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraCiudad", item.Fideicomisario_EscrituraCiudad);

    
  if (item.Fideicomisario_EscrituraTelefono == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraTelefono", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraTelefono", item.Fideicomisario_EscrituraTelefono);

    
  if (item.Fideicomisario_EscrituraEmail == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraEmail", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraEmail", item.Fideicomisario_EscrituraEmail);

    
  if (item.Fideicomisario_EscrituraFecha == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraFecha", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraFecha", item.Fideicomisario_EscrituraFecha);

    
  if (item.Fideicomisario_EscrituraEstado == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraEstado", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraEstado", item.Fideicomisario_EscrituraEstado);

    
  if (item.Fideicomisario_CuentasKYCNoCuenta1 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta1", item.Fideicomisario_CuentasKYCNoCuenta1);

    
  if (item.Fideicomisario_CuentasKYCTipoCuenta1 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta1", item.Fideicomisario_CuentasKYCTipoCuenta1);

    
  if (item.Fideicomisario_CuentasKYCNoCuenta2 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta2", item.Fideicomisario_CuentasKYCNoCuenta2);

    
  if (item.Fideicomisario_CuentasKYCTipoCuenta2 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta2", item.Fideicomisario_CuentasKYCTipoCuenta2);

    
  if (item.Fideicomisario_CuentasKYCNoCuenta3 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta3", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta3", item.Fideicomisario_CuentasKYCNoCuenta3);

    
  if (item.Fideicomisario_CuentasKYCTipoCuenta3 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta3", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta3", item.Fideicomisario_CuentasKYCTipoCuenta3);

    
  if (item.Fideicomisario_CuentasKYCNoCuenta4 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta4", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta4", item.Fideicomisario_CuentasKYCNoCuenta4);

    
  if (item.Fideicomisario_CuentasKYCTipoCuenta4 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta4", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta4", item.Fideicomisario_CuentasKYCTipoCuenta4);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.Fideicomisario_ID.ToString(); 
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
        
        public Result UpdatePartialFideicomisario(string id, Fideicomisario item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);//Repositorio.ConexionActual;
            string insertProcedure = "spUpdatePartialFideicomisario";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
         
            
                                             insertCommand.Parameters.AddWithValue("@ID", id);

                                    insertCommand.Parameters.AddWithValue("@NumeroFideicomisario", item.Fideicomisario_NumeroFideicomisario);

                                    insertCommand.Parameters.AddWithValue("@TipoPersona", item.Fideicomisario_TipoPersona);

                                    insertCommand.Parameters.AddWithValue("@Participante", item.Fideicomisario_Participante);

                                    insertCommand.Parameters.AddWithValue("@Fideicomiso", item.Fideicomisario_Fideicomiso);

                                    insertCommand.Parameters.AddWithValue("@RegimenFiscal", item.Fideicomisario_RegimenFiscal);

  if (item.Fideicomisario_GeneralesControladorFideicomiso == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesControladorFideicomiso", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesControladorFideicomiso", item.Fideicomisario_GeneralesControladorFideicomiso);

    
  if (item.Fideicomisario_GeneralesNacionalidad == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesNacionalidad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesNacionalidad", item.Fideicomisario_GeneralesNacionalidad);

    
  if (item.Fideicomisario_GeneralesPaisOrigen == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesPaisOrigen", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesPaisOrigen", item.Fideicomisario_GeneralesPaisOrigen);

    
  if (item.Fideicomisario_GeneralesActividad == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesActividad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesActividad", item.Fideicomisario_GeneralesActividad);

    
  if (item.Fideicomisario_GeneralesAportaRecursos == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesAportaRecursos", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesAportaRecursos", item.Fideicomisario_GeneralesAportaRecursos);

    
  if (item.Fideicomisario_GeneralesPaisResidencia == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesPaisResidencia", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesPaisResidencia", item.Fideicomisario_GeneralesPaisResidencia);

    
  if (item.Fideicomisario_GeneralesClienteScotiaBank == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesClienteScotiaBank", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesClienteScotiaBank", item.Fideicomisario_GeneralesClienteScotiaBank);

    
  if (item.Fideicomisario_GeneralesPep == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesPep", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesPep", item.Fideicomisario_GeneralesPep);

    
  if (item.Fideicomisario_GeneralesEstatus == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesEstatus", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesEstatus", item.Fideicomisario_GeneralesEstatus);

    
  if (item.Fideicomisario_GeneralesGrupoFilial == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesGrupoFilial", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesGrupoFilial", item.Fideicomisario_GeneralesGrupoFilial);

    
  if (item.Fideicomisario_GeneralesCalidadMigratoria == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesCalidadMigratoria", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesCalidadMigratoria", item.Fideicomisario_GeneralesCalidadMigratoria);

    
  if (item.Fideicomisario_GeneralesLugarOperacion == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesLugarOperacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesLugarOperacion", item.Fideicomisario_GeneralesLugarOperacion);

    
  if (item.Fideicomisario_GeneralesOperaCuentaTerceros == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesOperaCuentaTerceros", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesOperaCuentaTerceros", item.Fideicomisario_GeneralesOperaCuentaTerceros);

    
  if (item.Fideicomisario_GeneralesNivelParticipante == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesNivelParticipante", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesNivelParticipante", item.Fideicomisario_GeneralesNivelParticipante);

    
  if (item.Fideicomisario_GeneralesClienteRelacionPep == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesClienteRelacionPep", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesClienteRelacionPep", item.Fideicomisario_GeneralesClienteRelacionPep);

    
  if (item.Fideicomisario_GeneralesGrado == null) 
                                  insertCommand.Parameters.AddWithValue("@GeneralesGrado", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@GeneralesGrado", item.Fideicomisario_GeneralesGrado);

    
  if (item.Fideicomisario_InfoPldKycHonorarios == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycHonorarios", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycHonorarios", item.Fideicomisario_InfoPldKycHonorarios);

    
  if (item.Fideicomisario_InfoPldKycComisiones == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycComisiones", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycComisiones", item.Fideicomisario_InfoPldKycComisiones);

    
  if (item.Fideicomisario_InfoPldKycOtros == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycOtros", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycOtros", item.Fideicomisario_InfoPldKycOtros);

    
  if (item.Fideicomisario_InfoPldKycSueldos == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycSueldos", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycSueldos", item.Fideicomisario_InfoPldKycSueldos);

    
  if (item.Fideicomisario_InfoPldKycVenta == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycVenta", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycVenta", item.Fideicomisario_InfoPldKycVenta);

    
  if (item.Fideicomisario_InfoPldKycInversiones == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycInversiones", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycInversiones", item.Fideicomisario_InfoPldKycInversiones);

    
  if (item.Fideicomisario_InfoPldKycArrendamiento == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycArrendamiento", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycArrendamiento", item.Fideicomisario_InfoPldKycArrendamiento);

    
  if (item.Fideicomisario_InfoPldKycTipoPatrimonio == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycTipoPatrimonio", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycTipoPatrimonio", item.Fideicomisario_InfoPldKycTipoPatrimonio);

    
  if (item.Fideicomisario_InfoPldKycInstrumento == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycInstrumento", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycInstrumento", item.Fideicomisario_InfoPldKycInstrumento);

    
  if (item.Fideicomisario_InfoPldKycRazonApertura == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycRazonApertura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycRazonApertura", item.Fideicomisario_InfoPldKycRazonApertura);

    
  if (item.Fideicomisario_InfoPldKycComentarios == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycComentarios", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycComentarios", item.Fideicomisario_InfoPldKycComentarios);

    
  if (item.Fideicomisario_InfoPldKycNivelRiesgo == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycNivelRiesgo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycNivelRiesgo", item.Fideicomisario_InfoPldKycNivelRiesgo);

    
  if (item.Fideicomisario_InfoPldKycEstatusCalculoPld == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycEstatusCalculoPld", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycEstatusCalculoPld", item.Fideicomisario_InfoPldKycEstatusCalculoPld);

    
  if (item.Fideicomisario_InfoPldKycFechaVerifFircosoft == null) 
                                  insertCommand.Parameters.AddWithValue("@InfoPldKycFechaVerifFircosoft", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@InfoPldKycFechaVerifFircosoft", item.Fideicomisario_InfoPldKycFechaVerifFircosoft);

    
  if (item.Fideicomisario_IdentificacionRfc == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionRfc", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionRfc", item.Fideicomisario_IdentificacionRfc);

    
  if (item.Fideicomisario_IdentificacionCurp == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionCurp", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionCurp", item.Fideicomisario_IdentificacionCurp);

    
  if (item.Fideicomisario_IdentificacionNoSerieEfirma == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoSerieEfirma", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoSerieEfirma", item.Fideicomisario_IdentificacionNoSerieEfirma);

    
  if (item.Fideicomisario_IdentificacionPaisResidFisc1 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc1", item.Fideicomisario_IdentificacionPaisResidFisc1);

    
  if (item.Fideicomisario_IdentificacionPaisResidFisc2 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisResidFisc2", item.Fideicomisario_IdentificacionPaisResidFisc2);

    
  if (item.Fideicomisario_IdentificacionEmail == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionEmail", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionEmail", item.Fideicomisario_IdentificacionEmail);

    
  if (item.Fideicomisario_IdentificacionFechaConstitucion == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionFechaConstitucion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionFechaConstitucion", item.Fideicomisario_IdentificacionFechaConstitucion);

    
  if (item.Fideicomisario_IdentificacionSexo == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionSexo", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionSexo", item.Fideicomisario_IdentificacionSexo);

    
  if (item.Fideicomisario_IdentificacionPaisCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisCasa", item.Fideicomisario_IdentificacionPaisCasa);

    
  if (item.Fideicomisario_IdentificacionPaisOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisOficina", item.Fideicomisario_IdentificacionPaisOficina);

    
  if (item.Fideicomisario_IdentificacionPaisCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionPaisCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionPaisCelular", item.Fideicomisario_IdentificacionPaisCelular);

    
  if (item.Fideicomisario_IdentificacionFechaInicioRelNeg == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionFechaInicioRelNeg", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionFechaInicioRelNeg", item.Fideicomisario_IdentificacionFechaInicioRelNeg);

    
  if (item.Fideicomisario_IdentificacionNoIdentificacion == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentificacion", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentificacion", item.Fideicomisario_IdentificacionNoIdentificacion);

    
  if (item.Fideicomisario_IdentificacionComprobacionDomicilio == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionComprobacionDomicilio", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionComprobacionDomicilio", item.Fideicomisario_IdentificacionComprobacionDomicilio);

    
  if (item.Fideicomisario_IdentificacionActividadEmpresarial == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionActividadEmpresarial", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionActividadEmpresarial", item.Fideicomisario_IdentificacionActividadEmpresarial);

    
  if (item.Fideicomisario_IdentificacionNoIdentFisc1 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc1", item.Fideicomisario_IdentificacionNoIdentFisc1);

    
  if (item.Fideicomisario_IdentificacionNoIdentFisc2 == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNoIdentFisc2", item.Fideicomisario_IdentificacionNoIdentFisc2);

    
  if (item.Fideicomisario_IdentificacionClasificacionFatca == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionClasificacionFatca", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionClasificacionFatca", item.Fideicomisario_IdentificacionClasificacionFatca);

    
  if (item.Fideicomisario_IdentificacionLadaCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionLadaCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaCasa", item.Fideicomisario_IdentificacionLadaCasa);

    
  if (item.Fideicomisario_IdentificacionLadaOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionLadaOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaOficina", item.Fideicomisario_IdentificacionLadaOficina);

    
  if (item.Fideicomisario_IdentificacionLadaCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionLadaCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionLadaCelular", item.Fideicomisario_IdentificacionLadaCelular);

    
  if (item.Fideicomisario_IdentificacionNumeroCasa == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCasa", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCasa", item.Fideicomisario_IdentificacionNumeroCasa);

    
  if (item.Fideicomisario_IdentificacionNumeroOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNumeroOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroOficina", item.Fideicomisario_IdentificacionNumeroOficina);

    
  if (item.Fideicomisario_IdentificacionNumeroCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionNumeroCelular", item.Fideicomisario_IdentificacionNumeroCelular);

    
  if (item.Fideicomisario_IdentificacionExtOficina == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionExtOficina", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionExtOficina", item.Fideicomisario_IdentificacionExtOficina);

    
  if (item.Fideicomisario_IdentificacionExtCelular == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionExtCelular", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionExtCelular", item.Fideicomisario_IdentificacionExtCelular);

    
  if (item.Fideicomisario_IdentificacionIdentOficialVig == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionIdentOficialVig", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionIdentOficialVig", item.Fideicomisario_IdentificacionIdentOficialVig);

    
  if (item.Fideicomisario_IdentificacionVigencia == null) 
                                  insertCommand.Parameters.AddWithValue("@IdentificacionVigencia", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@IdentificacionVigencia", item.Fideicomisario_IdentificacionVigencia);

    
  if (item.Fideicomisario_EscrituraNoEscritura == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraNoEscritura", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraNoEscritura", item.Fideicomisario_EscrituraNoEscritura);

    
  if (item.Fideicomisario_EscrituraNotario == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraNotario", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraNotario", item.Fideicomisario_EscrituraNotario);

    
  if (item.Fideicomisario_EscrituraNoNotaria == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraNoNotaria", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraNoNotaria", item.Fideicomisario_EscrituraNoNotaria);

    
  if (item.Fideicomisario_EscrituraCiudad == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraCiudad", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraCiudad", item.Fideicomisario_EscrituraCiudad);

    
  if (item.Fideicomisario_EscrituraTelefono == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraTelefono", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraTelefono", item.Fideicomisario_EscrituraTelefono);

    
  if (item.Fideicomisario_EscrituraEmail == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraEmail", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraEmail", item.Fideicomisario_EscrituraEmail);

    
  if (item.Fideicomisario_EscrituraFecha == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraFecha", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraFecha", item.Fideicomisario_EscrituraFecha);

    
  if (item.Fideicomisario_EscrituraEstado == null) 
                                  insertCommand.Parameters.AddWithValue("@EscrituraEstado", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@EscrituraEstado", item.Fideicomisario_EscrituraEstado);

    
  if (item.Fideicomisario_CuentasKYCNoCuenta1 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta1", item.Fideicomisario_CuentasKYCNoCuenta1);

    
  if (item.Fideicomisario_CuentasKYCTipoCuenta1 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta1", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta1", item.Fideicomisario_CuentasKYCTipoCuenta1);

    
  if (item.Fideicomisario_CuentasKYCNoCuenta2 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta2", item.Fideicomisario_CuentasKYCNoCuenta2);

    
  if (item.Fideicomisario_CuentasKYCTipoCuenta2 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta2", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta2", item.Fideicomisario_CuentasKYCTipoCuenta2);

    
  if (item.Fideicomisario_CuentasKYCNoCuenta3 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta3", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta3", item.Fideicomisario_CuentasKYCNoCuenta3);

    
  if (item.Fideicomisario_CuentasKYCTipoCuenta3 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta3", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta3", item.Fideicomisario_CuentasKYCTipoCuenta3);

    
  if (item.Fideicomisario_CuentasKYCNoCuenta4 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta4", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCNoCuenta4", item.Fideicomisario_CuentasKYCNoCuenta4);

    
  if (item.Fideicomisario_CuentasKYCTipoCuenta4 == null) 
                                  insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta4", DBNull.Value);
                               else
                                      insertCommand.Parameters.AddWithValue("@CuentasKYCTipoCuenta4", item.Fideicomisario_CuentasKYCTipoCuenta4);

    
          

            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idUpdate = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idUpdate > 0)
                {
                    //res.IdInserted = item.Fideicomisario_ID.ToString(); 
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
