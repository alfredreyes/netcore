//Fecha Creación:5/24/2019 6:13:18 PM Template ControllerClass, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WAModel;
using WAModel.BaseModel;
using WADataAccess.Interfaces;
using Microsoft.AspNetCore.Authorization;

namespace WAServices.Controllers
{
    [Authorize]
    [Route("Fiduciario/fideicomitente")]
    [ApiController]
    public class FideicomitenteController : ControllerBase
    {
        private readonly IFideicomitenteData  _repository;

        public FideicomitenteController(IFideicomitenteData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<Fideicomitente_T>> Get(int _page, int _limit)
        {
            List<Fideicomitente_T> lst = new List<Fideicomitente_T>();

            foreach(Fideicomitente it in _repository.GetFideicomitentes(_page, _limit))
            {
                lst.Add(getPoco(it));
            }
            return lst;
        }
        
        [HttpGet("{id}")]
        public ActionResult<Fideicomitente_T> GetById(string id)
        {
            var item = getPoco(_repository.GetFideicomitente(id));
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(Fideicomitente_T item)
        {
            try
            {
                Result res = new Result();
                //Transform Entities
               
                res = _repository.InsertFideicomitente(getEntity(item));
                if (!res.Exito)
                {
                    return StatusCode(500, "Internal server error");
                }
                //return Ok();
                return StatusCode(201); //se agrego
            }
            catch (Exception ex)
            {
                //_logger.LogError($"Something went wrong: {ex}");
                return StatusCode(500, "Internal server error " + ex.Message);
            }
        }
        // PUT: api/Test/5
        [HttpPut("{id}")]
        public ActionResult Update(string id, Fideicomitente_T item)
        {                     
            try
            {
               
                Result res = new Result();
                res = _repository.UpdateFideicomitente(id,getEntity(item));
                if (!res.Exito)
                {
                    return StatusCode(500, "Internal server error");
                }
                return Ok();
            }
            catch (Exception ex)
            {
                //_logger.LogError($"Something went wrong: {ex}");
                return StatusCode(500, "Internal server error " + ex.Message);
            }
        }
         // PUT: api/Test/5
        [HttpPatch("{id}")]
        public ActionResult UpdatePartial(string id, Fideicomitente_T item)
        {           
            try
            {
                Result res = new Result();
              
                res = _repository.UpdatePartialFideicomitente(id, getEntity(item));
                if (!res.Exito)
                {
                    return StatusCode(500, "Internal server error");
                }
                return Ok();
            }
            catch (Exception ex)
            {
                //_logger.LogError($"Something went wrong: {ex}");
                return StatusCode(500, "Internal server error " + ex.Message);
            }
        }
        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public ActionResult Delete(string id)
        {          
            try
            {
               Result res = new Result();
               res = _repository.DeleteFideicomitente(id);
               if (!res.Exito)
               {
                  return StatusCode(500, "Internal server error");
               }
               return Ok();
            }
            catch (Exception ex)
            {
                //_logger.LogError($"Something went wrong: {ex}");
                return StatusCode(500, "Internal server error " + ex.Message);
            }
        }
        private Fideicomitente_T getPoco(Fideicomitente it)
        {
            Fideicomitente_T poco = new Fideicomitente_T();

            
                        poco.ID = it.Fideicomitente_ID;    
                        poco.NumeroFideicomitente = it.Fideicomitente_NumeroFideicomitente;    
                        poco.TipoPersona = it.Fideicomitente_TipoPersona;    
                        poco.Participante = it.Fideicomitente_Participante;    
                        poco.FideicomisoId = it.Fideicomitente_Fideicomiso;    
                        poco.RegimenFiscal = it.Fideicomitente_RegimenFiscal;    
                        poco.GeneralesControladorFideicomiso = it.Fideicomitente_GeneralesControladorFideicomiso;    
                        poco.GeneralesNacionalidad = it.Fideicomitente_GeneralesNacionalidad;    
                        poco.GeneralesPaisOrigen = it.Fideicomitente_GeneralesPaisOrigen;    
                        poco.GeneralesActividad = it.Fideicomitente_GeneralesActividad;    
                        poco.GeneralesAportaRecursos = it.Fideicomitente_GeneralesAportaRecursos;    
                        poco.GeneralesPaisResidencia = it.Fideicomitente_GeneralesPaisResidencia;    
                        poco.GeneralesClienteScotiaBank = it.Fideicomitente_GeneralesClienteScotiaBank;    
                        poco.GeneralesPep = it.Fideicomitente_GeneralesPep;    
                        poco.GeneralesEstatus = it.Fideicomitente_GeneralesEstatus;    
                        poco.GeneralesGrupoFilial = it.Fideicomitente_GeneralesGrupoFilial;    
                        poco.GeneralesCalidadMigratoria = it.Fideicomitente_GeneralesCalidadMigratoria;    
                        poco.GeneralesLugarOperacion = it.Fideicomitente_GeneralesLugarOperacion;    
                        poco.GeneralesOperaCuentaTerceros = it.Fideicomitente_GeneralesOperaCuentaTerceros;    
                        poco.GeneralesNivelParticipante = it.Fideicomitente_GeneralesNivelParticipante;    
                        poco.GeneralesClienteRelacionPep = it.Fideicomitente_GeneralesClienteRelacionPep;    
                        poco.GeneralesGrado = it.Fideicomitente_GeneralesGrado;    
                        poco.InfoPldKycHonorarios = it.Fideicomitente_InfoPldKycHonorarios;    
                        poco.InfoPldKycComisiones = it.Fideicomitente_InfoPldKycComisiones;    
                        poco.InfoPldKycOtros = it.Fideicomitente_InfoPldKycOtros;    
                        poco.InfoPldKycSueldos = it.Fideicomitente_InfoPldKycSueldos;    
                        poco.InfoPldKycVenta = it.Fideicomitente_InfoPldKycVenta;    
                        poco.InfoPldKycInversiones = it.Fideicomitente_InfoPldKycInversiones;    
                        poco.InfoPldKycArrendamiento = it.Fideicomitente_InfoPldKycArrendamiento;    
                        poco.InfoPldKycTipoPatrimonio = it.Fideicomitente_InfoPldKycTipoPatrimonio;    
                        poco.InfoPldKycInstrumento = it.Fideicomitente_InfoPldKycInstrumento;    
                        poco.InfoPldKycRazonApertura = it.Fideicomitente_InfoPldKycRazonApertura;    
                        poco.InfoPldKycComentarios = it.Fideicomitente_InfoPldKycComentarios;    
                        poco.InfoPldKycNivelRiesgo = it.Fideicomitente_InfoPldKycNivelRiesgo;    
                        poco.InfoPldKycEstatusCalculoPld = it.Fideicomitente_InfoPldKycEstatusCalculoPld;    
                         if (it.Fideicomitente_InfoPldKycFechaVerifFircosoft != null) //&& it.Fideicomitente_InfoPldKycFechaVerifFircosoft != "")
                          poco.InfoPldKycFechaVerifFircosoft = it.Fideicomitente_InfoPldKycFechaVerifFircosoft.ToString();    
                        poco.IdentificacionRfc = it.Fideicomitente_IdentificacionRfc;    
                        poco.IdentificacionCurp = it.Fideicomitente_IdentificacionCurp;    
                        poco.IdentificacionNoSerieEfirma = it.Fideicomitente_IdentificacionNoSerieEfirma;    
                        poco.IdentificacionPaisResidFisc1 = it.Fideicomitente_IdentificacionPaisResidFisc1;    
                        poco.IdentificacionPaisResidFisc2 = it.Fideicomitente_IdentificacionPaisResidFisc2;    
                        poco.IdentificacionEmail = it.Fideicomitente_IdentificacionEmail;    
                         if (it.Fideicomitente_IdentificacionFechaConstitucion != null) //&& it.Fideicomitente_IdentificacionFechaConstitucion != "")
                          poco.IdentificacionFechaConstitucion = it.Fideicomitente_IdentificacionFechaConstitucion.ToString();    
                        poco.IdentificacionSexo = it.Fideicomitente_IdentificacionSexo;    
                        poco.IdentificacionPaisCasa = it.Fideicomitente_IdentificacionPaisCasa;    
                        poco.IdentificacionPaisOficina = it.Fideicomitente_IdentificacionPaisOficina;    
                        poco.IdentificacionPaisCelular = it.Fideicomitente_IdentificacionPaisCelular;    
                         if (it.Fideicomitente_IdentificacionFechaInicioRelNeg != null) //&& it.Fideicomitente_IdentificacionFechaInicioRelNeg != "")
                          poco.IdentificacionFechaInicioRelNeg = it.Fideicomitente_IdentificacionFechaInicioRelNeg.ToString();    
                        poco.IdentificacionNoIdentificacion = it.Fideicomitente_IdentificacionNoIdentificacion;    
                        poco.IdentificacionComprobacionDomicilio = it.Fideicomitente_IdentificacionComprobacionDomicilio;    
                        poco.IdentificacionActividadEmpresarial = it.Fideicomitente_IdentificacionActividadEmpresarial;    
                        poco.IdentificacionNoIdentFisc1 = it.Fideicomitente_IdentificacionNoIdentFisc1;    
                        poco.IdentificacionNoIdentFisc2 = it.Fideicomitente_IdentificacionNoIdentFisc2;    
                        poco.IdentificacionClasificacionFatca = it.Fideicomitente_IdentificacionClasificacionFatca;    
                        poco.IdentificacionLadaCasa = it.Fideicomitente_IdentificacionLadaCasa;    
                        poco.IdentificacionLadaOficina = it.Fideicomitente_IdentificacionLadaOficina;    
                        poco.IdentificacionLadaCelular = it.Fideicomitente_IdentificacionLadaCelular;    
                        poco.IdentificacionNumeroCasa = it.Fideicomitente_IdentificacionNumeroCasa;    
                        poco.IdentificacionNumeroOficina = it.Fideicomitente_IdentificacionNumeroOficina;    
                        poco.IdentificacionNumeroCelular = it.Fideicomitente_IdentificacionNumeroCelular;    
                        poco.IdentificacionExtOficina = it.Fideicomitente_IdentificacionExtOficina;    
                        poco.IdentificacionExtCelular = it.Fideicomitente_IdentificacionExtCelular;    
                        poco.IdentificacionIdentOficialVig = it.Fideicomitente_IdentificacionIdentOficialVig;    
                        poco.IdentificacionVigencia = it.Fideicomitente_IdentificacionVigencia;    
                        poco.EscrituraNoEscritura = it.Fideicomitente_EscrituraNoEscritura;    
                        poco.EscrituraNotario = it.Fideicomitente_EscrituraNotario;    
                        poco.EscrituraNoNotaria = it.Fideicomitente_EscrituraNoNotaria;    
                        poco.EscrituraCiudad = it.Fideicomitente_EscrituraCiudad;    
                        poco.EscrituraTelefono = it.Fideicomitente_EscrituraTelefono;    
                        poco.EscrituraEmail = it.Fideicomitente_EscrituraEmail;    
                         if (it.Fideicomitente_EscrituraFecha != null) //&& it.Fideicomitente_EscrituraFecha != "")
                          poco.EscrituraFecha = it.Fideicomitente_EscrituraFecha.ToString();    
                        poco.EscrituraEstado = it.Fideicomitente_EscrituraEstado;    
                        poco.CuentasKYCNoCuenta1 = it.Fideicomitente_CuentasKYCNoCuenta1;    
                        poco.CuentasKYCTipoCuenta1 = it.Fideicomitente_CuentasKYCTipoCuenta1;    
                        poco.CuentasKYCNoCuenta2 = it.Fideicomitente_CuentasKYCNoCuenta2;    
                        poco.CuentasKYCTipoCuenta2 = it.Fideicomitente_CuentasKYCTipoCuenta2;    
                        poco.CuentasKYCNoCuenta3 = it.Fideicomitente_CuentasKYCNoCuenta3;    
                        poco.CuentasKYCTipoCuenta3 = it.Fideicomitente_CuentasKYCTipoCuenta3;    
                        poco.CuentasKYCNoCuenta4 = it.Fideicomitente_CuentasKYCNoCuenta4;    
                        poco.CuentasKYCTipoCuenta4 = it.Fideicomitente_CuentasKYCTipoCuenta4;    

            return poco;
        }
        private Fideicomitente getEntity(Fideicomitente_T poco)
        {
            Fideicomitente ent = new Fideicomitente();

                        ent.Fideicomitente_ID = poco.ID;    
                        ent.Fideicomitente_NumeroFideicomitente = poco.NumeroFideicomitente;    
                        ent.Fideicomitente_TipoPersona = poco.TipoPersona;    
                        ent.Fideicomitente_Participante = poco.Participante;    
                        ent.Fideicomitente_Fideicomiso = poco.FideicomisoId;    
                        ent.Fideicomitente_RegimenFiscal = poco.RegimenFiscal;    
                        ent.Fideicomitente_GeneralesControladorFideicomiso = poco.GeneralesControladorFideicomiso;    
                        ent.Fideicomitente_GeneralesNacionalidad = poco.GeneralesNacionalidad;    
                        ent.Fideicomitente_GeneralesPaisOrigen = poco.GeneralesPaisOrigen;    
                        ent.Fideicomitente_GeneralesActividad = poco.GeneralesActividad;    
                        ent.Fideicomitente_GeneralesAportaRecursos = poco.GeneralesAportaRecursos;    
                        ent.Fideicomitente_GeneralesPaisResidencia = poco.GeneralesPaisResidencia;    
                        ent.Fideicomitente_GeneralesClienteScotiaBank = poco.GeneralesClienteScotiaBank;    
                        ent.Fideicomitente_GeneralesPep = poco.GeneralesPep;    
                        ent.Fideicomitente_GeneralesEstatus = poco.GeneralesEstatus;    
                        ent.Fideicomitente_GeneralesGrupoFilial = poco.GeneralesGrupoFilial;    
                        ent.Fideicomitente_GeneralesCalidadMigratoria = poco.GeneralesCalidadMigratoria;    
                        ent.Fideicomitente_GeneralesLugarOperacion = poco.GeneralesLugarOperacion;    
                        ent.Fideicomitente_GeneralesOperaCuentaTerceros = poco.GeneralesOperaCuentaTerceros;    
                        ent.Fideicomitente_GeneralesNivelParticipante = poco.GeneralesNivelParticipante;    
                        ent.Fideicomitente_GeneralesClienteRelacionPep = poco.GeneralesClienteRelacionPep;    
                        ent.Fideicomitente_GeneralesGrado = poco.GeneralesGrado;    
                        ent.Fideicomitente_InfoPldKycHonorarios = poco.InfoPldKycHonorarios;    
                        ent.Fideicomitente_InfoPldKycComisiones = poco.InfoPldKycComisiones;    
                        ent.Fideicomitente_InfoPldKycOtros = poco.InfoPldKycOtros;    
                        ent.Fideicomitente_InfoPldKycSueldos = poco.InfoPldKycSueldos;    
                        ent.Fideicomitente_InfoPldKycVenta = poco.InfoPldKycVenta;    
                        ent.Fideicomitente_InfoPldKycInversiones = poco.InfoPldKycInversiones;    
                        ent.Fideicomitente_InfoPldKycArrendamiento = poco.InfoPldKycArrendamiento;    
                        ent.Fideicomitente_InfoPldKycTipoPatrimonio = poco.InfoPldKycTipoPatrimonio;    
                        ent.Fideicomitente_InfoPldKycInstrumento = poco.InfoPldKycInstrumento;    
                        ent.Fideicomitente_InfoPldKycRazonApertura = poco.InfoPldKycRazonApertura;    
                        ent.Fideicomitente_InfoPldKycComentarios = poco.InfoPldKycComentarios;    
                        ent.Fideicomitente_InfoPldKycNivelRiesgo = poco.InfoPldKycNivelRiesgo;    
                        ent.Fideicomitente_InfoPldKycEstatusCalculoPld = poco.InfoPldKycEstatusCalculoPld;    
                         if (poco.InfoPldKycFechaVerifFircosoft != null && poco.InfoPldKycFechaVerifFircosoft != "")
                          ent.Fideicomitente_InfoPldKycFechaVerifFircosoft = getDateFromTimeStamp(Int64.Parse(poco.InfoPldKycFechaVerifFircosoft));    
                        ent.Fideicomitente_IdentificacionRfc = poco.IdentificacionRfc;    
                        ent.Fideicomitente_IdentificacionCurp = poco.IdentificacionCurp;    
                        ent.Fideicomitente_IdentificacionNoSerieEfirma = poco.IdentificacionNoSerieEfirma;    
                        ent.Fideicomitente_IdentificacionPaisResidFisc1 = poco.IdentificacionPaisResidFisc1;    
                        ent.Fideicomitente_IdentificacionPaisResidFisc2 = poco.IdentificacionPaisResidFisc2;    
                        ent.Fideicomitente_IdentificacionEmail = poco.IdentificacionEmail;    
                         if (poco.IdentificacionFechaConstitucion != null && poco.IdentificacionFechaConstitucion != "")
                          ent.Fideicomitente_IdentificacionFechaConstitucion = getDateFromTimeStamp(Int64.Parse(poco.IdentificacionFechaConstitucion));    
                        ent.Fideicomitente_IdentificacionSexo = poco.IdentificacionSexo;    
                        ent.Fideicomitente_IdentificacionPaisCasa = poco.IdentificacionPaisCasa;    
                        ent.Fideicomitente_IdentificacionPaisOficina = poco.IdentificacionPaisOficina;    
                        ent.Fideicomitente_IdentificacionPaisCelular = poco.IdentificacionPaisCelular;    
                         if (poco.IdentificacionFechaInicioRelNeg != null && poco.IdentificacionFechaInicioRelNeg != "")
                          ent.Fideicomitente_IdentificacionFechaInicioRelNeg = getDateFromTimeStamp(Int64.Parse(poco.IdentificacionFechaInicioRelNeg));    
                        ent.Fideicomitente_IdentificacionNoIdentificacion = poco.IdentificacionNoIdentificacion;    
                        ent.Fideicomitente_IdentificacionComprobacionDomicilio = poco.IdentificacionComprobacionDomicilio;    
                        ent.Fideicomitente_IdentificacionActividadEmpresarial = poco.IdentificacionActividadEmpresarial;    
                        ent.Fideicomitente_IdentificacionNoIdentFisc1 = poco.IdentificacionNoIdentFisc1;    
                        ent.Fideicomitente_IdentificacionNoIdentFisc2 = poco.IdentificacionNoIdentFisc2;    
                        ent.Fideicomitente_IdentificacionClasificacionFatca = poco.IdentificacionClasificacionFatca;    
                        ent.Fideicomitente_IdentificacionLadaCasa = poco.IdentificacionLadaCasa;    
                        ent.Fideicomitente_IdentificacionLadaOficina = poco.IdentificacionLadaOficina;    
                        ent.Fideicomitente_IdentificacionLadaCelular = poco.IdentificacionLadaCelular;    
                        ent.Fideicomitente_IdentificacionNumeroCasa = poco.IdentificacionNumeroCasa;    
                        ent.Fideicomitente_IdentificacionNumeroOficina = poco.IdentificacionNumeroOficina;    
                        ent.Fideicomitente_IdentificacionNumeroCelular = poco.IdentificacionNumeroCelular;    
                        ent.Fideicomitente_IdentificacionExtOficina = poco.IdentificacionExtOficina;    
                        ent.Fideicomitente_IdentificacionExtCelular = poco.IdentificacionExtCelular;    
                        ent.Fideicomitente_IdentificacionIdentOficialVig = poco.IdentificacionIdentOficialVig;    
                        ent.Fideicomitente_IdentificacionVigencia = poco.IdentificacionVigencia;    
                        ent.Fideicomitente_EscrituraNoEscritura = poco.EscrituraNoEscritura;    
                        ent.Fideicomitente_EscrituraNotario = poco.EscrituraNotario;    
                        ent.Fideicomitente_EscrituraNoNotaria = poco.EscrituraNoNotaria;    
                        ent.Fideicomitente_EscrituraCiudad = poco.EscrituraCiudad;    
                        ent.Fideicomitente_EscrituraTelefono = poco.EscrituraTelefono;    
                        ent.Fideicomitente_EscrituraEmail = poco.EscrituraEmail;    
                         if (poco.EscrituraFecha != null && poco.EscrituraFecha != "")
                          ent.Fideicomitente_EscrituraFecha = getDateFromTimeStamp(Int64.Parse(poco.EscrituraFecha));    
                        ent.Fideicomitente_EscrituraEstado = poco.EscrituraEstado;    
                        ent.Fideicomitente_CuentasKYCNoCuenta1 = poco.CuentasKYCNoCuenta1;    
                        ent.Fideicomitente_CuentasKYCTipoCuenta1 = poco.CuentasKYCTipoCuenta1;    
                        ent.Fideicomitente_CuentasKYCNoCuenta2 = poco.CuentasKYCNoCuenta2;    
                        ent.Fideicomitente_CuentasKYCTipoCuenta2 = poco.CuentasKYCTipoCuenta2;    
                        ent.Fideicomitente_CuentasKYCNoCuenta3 = poco.CuentasKYCNoCuenta3;    
                        ent.Fideicomitente_CuentasKYCTipoCuenta3 = poco.CuentasKYCTipoCuenta3;    
                        ent.Fideicomitente_CuentasKYCNoCuenta4 = poco.CuentasKYCNoCuenta4;    
                        ent.Fideicomitente_CuentasKYCTipoCuenta4 = poco.CuentasKYCTipoCuenta4;    

            return ent;
        }
        private DateTime getDateFromTimeStamp (long value)
        {
            var dt = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddSeconds(Math.Round(value / 1000d)).ToLocalTime();
            return dt;
        }
    }
}