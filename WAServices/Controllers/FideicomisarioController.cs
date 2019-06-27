//Fecha Creación:5/24/2019 6:13:06 PM Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("Fiduciario/fideicomisario")]
    [ApiController]
    public class FideicomisarioController : ControllerBase
    {
        private readonly IFideicomisarioData  _repository;

        public FideicomisarioController(IFideicomisarioData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<Fideicomisario_T>> Get(int _page, int _limit)
        {
            List<Fideicomisario_T> lst = new List<Fideicomisario_T>();

            foreach(Fideicomisario it in _repository.GetFideicomisarios(_page, _limit))
            {
                lst.Add(getPoco(it));
            }
            return lst;
        }
        
        [HttpGet("{id}")]
        public ActionResult<Fideicomisario_T> GetById(string id)
        {
            var item = getPoco(_repository.GetFideicomisario(id));
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(Fideicomisario_T item)
        {
            try
            {
                Result res = new Result();
                //Transform Entities
               
                res = _repository.InsertFideicomisario(getEntity(item));
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
        public ActionResult Update(string id, Fideicomisario_T item)
        {                     
            try
            {
               
                Result res = new Result();
                res = _repository.UpdateFideicomisario(id,getEntity(item));
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
        public ActionResult UpdatePartial(string id, Fideicomisario_T item)
        {           
            try
            {
                Result res = new Result();
              
                res = _repository.UpdatePartialFideicomisario(id, getEntity(item));
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
               res = _repository.DeleteFideicomisario(id);
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
        private Fideicomisario_T getPoco(Fideicomisario it)
        {
            Fideicomisario_T poco = new Fideicomisario_T();

            
                        poco.ID = it.Fideicomisario_ID;    
                        poco.NumeroFideicomisario = it.Fideicomisario_NumeroFideicomisario;    
                        poco.TipoPersona = it.Fideicomisario_TipoPersona;    
                        poco.Participante = it.Fideicomisario_Participante;    
                        poco.FideicomisoId = it.Fideicomisario_Fideicomiso;    
                        poco.RegimenFiscal = it.Fideicomisario_RegimenFiscal;    
                        poco.GeneralesControladorFideicomiso = it.Fideicomisario_GeneralesControladorFideicomiso;    
                        poco.GeneralesNacionalidad = it.Fideicomisario_GeneralesNacionalidad;    
                        poco.GeneralesPaisOrigen = it.Fideicomisario_GeneralesPaisOrigen;    
                        poco.GeneralesActividad = it.Fideicomisario_GeneralesActividad;    
                        poco.GeneralesAportaRecursos = it.Fideicomisario_GeneralesAportaRecursos;    
                        poco.GeneralesPaisResidencia = it.Fideicomisario_GeneralesPaisResidencia;    
                        poco.GeneralesClienteScotiaBank = it.Fideicomisario_GeneralesClienteScotiaBank;    
                        poco.GeneralesPep = it.Fideicomisario_GeneralesPep;    
                        poco.GeneralesEstatus = it.Fideicomisario_GeneralesEstatus;    
                        poco.GeneralesGrupoFilial = it.Fideicomisario_GeneralesGrupoFilial;    
                        poco.GeneralesCalidadMigratoria = it.Fideicomisario_GeneralesCalidadMigratoria;    
                        poco.GeneralesLugarOperacion = it.Fideicomisario_GeneralesLugarOperacion;    
                        poco.GeneralesOperaCuentaTerceros = it.Fideicomisario_GeneralesOperaCuentaTerceros;    
                        poco.GeneralesNivelParticipante = it.Fideicomisario_GeneralesNivelParticipante;    
                        poco.GeneralesClienteRelacionPep = it.Fideicomisario_GeneralesClienteRelacionPep;    
                        poco.GeneralesGrado = it.Fideicomisario_GeneralesGrado;    
                        poco.InfoPldKycHonorarios = it.Fideicomisario_InfoPldKycHonorarios;    
                        poco.InfoPldKycComisiones = it.Fideicomisario_InfoPldKycComisiones;    
                        poco.InfoPldKycOtros = it.Fideicomisario_InfoPldKycOtros;    
                        poco.InfoPldKycSueldos = it.Fideicomisario_InfoPldKycSueldos;    
                        poco.InfoPldKycVenta = it.Fideicomisario_InfoPldKycVenta;    
                        poco.InfoPldKycInversiones = it.Fideicomisario_InfoPldKycInversiones;    
                        poco.InfoPldKycArrendamiento = it.Fideicomisario_InfoPldKycArrendamiento;    
                        poco.InfoPldKycTipoPatrimonio = it.Fideicomisario_InfoPldKycTipoPatrimonio;    
                        poco.InfoPldKycInstrumento = it.Fideicomisario_InfoPldKycInstrumento;    
                        poco.InfoPldKycRazonApertura = it.Fideicomisario_InfoPldKycRazonApertura;    
                        poco.InfoPldKycComentarios = it.Fideicomisario_InfoPldKycComentarios;    
                        poco.InfoPldKycNivelRiesgo = it.Fideicomisario_InfoPldKycNivelRiesgo;    
                        poco.InfoPldKycEstatusCalculoPld = it.Fideicomisario_InfoPldKycEstatusCalculoPld;    
                         if (it.Fideicomisario_InfoPldKycFechaVerifFircosoft != null) //&& it.Fideicomisario_InfoPldKycFechaVerifFircosoft != "")
                          poco.InfoPldKycFechaVerifFircosoft = it.Fideicomisario_InfoPldKycFechaVerifFircosoft.ToString();    
                        poco.IdentificacionRfc = it.Fideicomisario_IdentificacionRfc;    
                        poco.IdentificacionCurp = it.Fideicomisario_IdentificacionCurp;    
                        poco.IdentificacionNoSerieEfirma = it.Fideicomisario_IdentificacionNoSerieEfirma;    
                        poco.IdentificacionPaisResidFisc1 = it.Fideicomisario_IdentificacionPaisResidFisc1;    
                        poco.IdentificacionPaisResidFisc2 = it.Fideicomisario_IdentificacionPaisResidFisc2;    
                        poco.IdentificacionEmail = it.Fideicomisario_IdentificacionEmail;    
                         if (it.Fideicomisario_IdentificacionFechaConstitucion != null) //&& it.Fideicomisario_IdentificacionFechaConstitucion != "")
                          poco.IdentificacionFechaConstitucion = it.Fideicomisario_IdentificacionFechaConstitucion.ToString();    
                        poco.IdentificacionSexo = it.Fideicomisario_IdentificacionSexo;    
                        poco.IdentificacionPaisCasa = it.Fideicomisario_IdentificacionPaisCasa;    
                        poco.IdentificacionPaisOficina = it.Fideicomisario_IdentificacionPaisOficina;    
                        poco.IdentificacionPaisCelular = it.Fideicomisario_IdentificacionPaisCelular;    
                         if (it.Fideicomisario_IdentificacionFechaInicioRelNeg != null) //&& it.Fideicomisario_IdentificacionFechaInicioRelNeg != "")
                          poco.IdentificacionFechaInicioRelNeg = it.Fideicomisario_IdentificacionFechaInicioRelNeg.ToString();    
                        poco.IdentificacionNoIdentificacion = it.Fideicomisario_IdentificacionNoIdentificacion;    
                        poco.IdentificacionComprobacionDomicilio = it.Fideicomisario_IdentificacionComprobacionDomicilio;    
                        poco.IdentificacionActividadEmpresarial = it.Fideicomisario_IdentificacionActividadEmpresarial;    
                        poco.IdentificacionNoIdentFisc1 = it.Fideicomisario_IdentificacionNoIdentFisc1;    
                        poco.IdentificacionNoIdentFisc2 = it.Fideicomisario_IdentificacionNoIdentFisc2;    
                        poco.IdentificacionClasificacionFatca = it.Fideicomisario_IdentificacionClasificacionFatca;    
                        poco.IdentificacionLadaCasa = it.Fideicomisario_IdentificacionLadaCasa;    
                        poco.IdentificacionLadaOficina = it.Fideicomisario_IdentificacionLadaOficina;    
                        poco.IdentificacionLadaCelular = it.Fideicomisario_IdentificacionLadaCelular;    
                        poco.IdentificacionNumeroCasa = it.Fideicomisario_IdentificacionNumeroCasa;    
                        poco.IdentificacionNumeroOficina = it.Fideicomisario_IdentificacionNumeroOficina;    
                        poco.IdentificacionNumeroCelular = it.Fideicomisario_IdentificacionNumeroCelular;    
                        poco.IdentificacionExtOficina = it.Fideicomisario_IdentificacionExtOficina;    
                        poco.IdentificacionExtCelular = it.Fideicomisario_IdentificacionExtCelular;    
                        poco.IdentificacionIdentOficialVig = it.Fideicomisario_IdentificacionIdentOficialVig;    
                        poco.IdentificacionVigencia = it.Fideicomisario_IdentificacionVigencia;    
                        poco.EscrituraNoEscritura = it.Fideicomisario_EscrituraNoEscritura;    
                        poco.EscrituraNotario = it.Fideicomisario_EscrituraNotario;    
                        poco.EscrituraNoNotaria = it.Fideicomisario_EscrituraNoNotaria;    
                        poco.EscrituraCiudad = it.Fideicomisario_EscrituraCiudad;    
                        poco.EscrituraTelefono = it.Fideicomisario_EscrituraTelefono;    
                        poco.EscrituraEmail = it.Fideicomisario_EscrituraEmail;    
                         if (it.Fideicomisario_EscrituraFecha != null) //&& it.Fideicomisario_EscrituraFecha != "")
                          poco.EscrituraFecha = it.Fideicomisario_EscrituraFecha.ToString();    
                        poco.EscrituraEstado = it.Fideicomisario_EscrituraEstado;    
                        poco.CuentasKYCNoCuenta1 = it.Fideicomisario_CuentasKYCNoCuenta1;    
                        poco.CuentasKYCTipoCuenta1 = it.Fideicomisario_CuentasKYCTipoCuenta1;    
                        poco.CuentasKYCNoCuenta2 = it.Fideicomisario_CuentasKYCNoCuenta2;    
                        poco.CuentasKYCTipoCuenta2 = it.Fideicomisario_CuentasKYCTipoCuenta2;    
                        poco.CuentasKYCNoCuenta3 = it.Fideicomisario_CuentasKYCNoCuenta3;    
                        poco.CuentasKYCTipoCuenta3 = it.Fideicomisario_CuentasKYCTipoCuenta3;    
                        poco.CuentasKYCNoCuenta4 = it.Fideicomisario_CuentasKYCNoCuenta4;    
                        poco.CuentasKYCTipoCuenta4 = it.Fideicomisario_CuentasKYCTipoCuenta4;    

            return poco;
        }
        private Fideicomisario getEntity(Fideicomisario_T poco)
        {
            Fideicomisario ent = new Fideicomisario();

                        ent.Fideicomisario_ID = poco.ID;    
                        ent.Fideicomisario_NumeroFideicomisario = poco.NumeroFideicomisario;    
                        ent.Fideicomisario_TipoPersona = poco.TipoPersona;    
                        ent.Fideicomisario_Participante = poco.Participante;    
                        ent.Fideicomisario_Fideicomiso = poco.FideicomisoId;    
                        ent.Fideicomisario_RegimenFiscal = poco.RegimenFiscal;    
                        ent.Fideicomisario_GeneralesControladorFideicomiso = poco.GeneralesControladorFideicomiso;    
                        ent.Fideicomisario_GeneralesNacionalidad = poco.GeneralesNacionalidad;    
                        ent.Fideicomisario_GeneralesPaisOrigen = poco.GeneralesPaisOrigen;    
                        ent.Fideicomisario_GeneralesActividad = poco.GeneralesActividad;    
                        ent.Fideicomisario_GeneralesAportaRecursos = poco.GeneralesAportaRecursos;    
                        ent.Fideicomisario_GeneralesPaisResidencia = poco.GeneralesPaisResidencia;    
                        ent.Fideicomisario_GeneralesClienteScotiaBank = poco.GeneralesClienteScotiaBank;    
                        ent.Fideicomisario_GeneralesPep = poco.GeneralesPep;    
                        ent.Fideicomisario_GeneralesEstatus = poco.GeneralesEstatus;    
                        ent.Fideicomisario_GeneralesGrupoFilial = poco.GeneralesGrupoFilial;    
                        ent.Fideicomisario_GeneralesCalidadMigratoria = poco.GeneralesCalidadMigratoria;    
                        ent.Fideicomisario_GeneralesLugarOperacion = poco.GeneralesLugarOperacion;    
                        ent.Fideicomisario_GeneralesOperaCuentaTerceros = poco.GeneralesOperaCuentaTerceros;    
                        ent.Fideicomisario_GeneralesNivelParticipante = poco.GeneralesNivelParticipante;    
                        ent.Fideicomisario_GeneralesClienteRelacionPep = poco.GeneralesClienteRelacionPep;    
                        ent.Fideicomisario_GeneralesGrado = poco.GeneralesGrado;    
                        ent.Fideicomisario_InfoPldKycHonorarios = poco.InfoPldKycHonorarios;    
                        ent.Fideicomisario_InfoPldKycComisiones = poco.InfoPldKycComisiones;    
                        ent.Fideicomisario_InfoPldKycOtros = poco.InfoPldKycOtros;    
                        ent.Fideicomisario_InfoPldKycSueldos = poco.InfoPldKycSueldos;    
                        ent.Fideicomisario_InfoPldKycVenta = poco.InfoPldKycVenta;    
                        ent.Fideicomisario_InfoPldKycInversiones = poco.InfoPldKycInversiones;    
                        ent.Fideicomisario_InfoPldKycArrendamiento = poco.InfoPldKycArrendamiento;    
                        ent.Fideicomisario_InfoPldKycTipoPatrimonio = poco.InfoPldKycTipoPatrimonio;    
                        ent.Fideicomisario_InfoPldKycInstrumento = poco.InfoPldKycInstrumento;    
                        ent.Fideicomisario_InfoPldKycRazonApertura = poco.InfoPldKycRazonApertura;    
                        ent.Fideicomisario_InfoPldKycComentarios = poco.InfoPldKycComentarios;    
                        ent.Fideicomisario_InfoPldKycNivelRiesgo = poco.InfoPldKycNivelRiesgo;    
                        ent.Fideicomisario_InfoPldKycEstatusCalculoPld = poco.InfoPldKycEstatusCalculoPld;    
                         if (poco.InfoPldKycFechaVerifFircosoft != null && poco.InfoPldKycFechaVerifFircosoft != "")
                          ent.Fideicomisario_InfoPldKycFechaVerifFircosoft = getDateFromTimeStamp(Int64.Parse(poco.InfoPldKycFechaVerifFircosoft));    
                        ent.Fideicomisario_IdentificacionRfc = poco.IdentificacionRfc;    
                        ent.Fideicomisario_IdentificacionCurp = poco.IdentificacionCurp;    
                        ent.Fideicomisario_IdentificacionNoSerieEfirma = poco.IdentificacionNoSerieEfirma;    
                        ent.Fideicomisario_IdentificacionPaisResidFisc1 = poco.IdentificacionPaisResidFisc1;    
                        ent.Fideicomisario_IdentificacionPaisResidFisc2 = poco.IdentificacionPaisResidFisc2;    
                        ent.Fideicomisario_IdentificacionEmail = poco.IdentificacionEmail;    
                         if (poco.IdentificacionFechaConstitucion != null && poco.IdentificacionFechaConstitucion != "")
                          ent.Fideicomisario_IdentificacionFechaConstitucion = getDateFromTimeStamp(Int64.Parse(poco.IdentificacionFechaConstitucion));    
                        ent.Fideicomisario_IdentificacionSexo = poco.IdentificacionSexo;    
                        ent.Fideicomisario_IdentificacionPaisCasa = poco.IdentificacionPaisCasa;    
                        ent.Fideicomisario_IdentificacionPaisOficina = poco.IdentificacionPaisOficina;    
                        ent.Fideicomisario_IdentificacionPaisCelular = poco.IdentificacionPaisCelular;    
                         if (poco.IdentificacionFechaInicioRelNeg != null && poco.IdentificacionFechaInicioRelNeg != "")
                          ent.Fideicomisario_IdentificacionFechaInicioRelNeg = getDateFromTimeStamp(Int64.Parse(poco.IdentificacionFechaInicioRelNeg));    
                        ent.Fideicomisario_IdentificacionNoIdentificacion = poco.IdentificacionNoIdentificacion;    
                        ent.Fideicomisario_IdentificacionComprobacionDomicilio = poco.IdentificacionComprobacionDomicilio;    
                        ent.Fideicomisario_IdentificacionActividadEmpresarial = poco.IdentificacionActividadEmpresarial;    
                        ent.Fideicomisario_IdentificacionNoIdentFisc1 = poco.IdentificacionNoIdentFisc1;    
                        ent.Fideicomisario_IdentificacionNoIdentFisc2 = poco.IdentificacionNoIdentFisc2;    
                        ent.Fideicomisario_IdentificacionClasificacionFatca = poco.IdentificacionClasificacionFatca;    
                        ent.Fideicomisario_IdentificacionLadaCasa = poco.IdentificacionLadaCasa;    
                        ent.Fideicomisario_IdentificacionLadaOficina = poco.IdentificacionLadaOficina;    
                        ent.Fideicomisario_IdentificacionLadaCelular = poco.IdentificacionLadaCelular;    
                        ent.Fideicomisario_IdentificacionNumeroCasa = poco.IdentificacionNumeroCasa;    
                        ent.Fideicomisario_IdentificacionNumeroOficina = poco.IdentificacionNumeroOficina;    
                        ent.Fideicomisario_IdentificacionNumeroCelular = poco.IdentificacionNumeroCelular;    
                        ent.Fideicomisario_IdentificacionExtOficina = poco.IdentificacionExtOficina;    
                        ent.Fideicomisario_IdentificacionExtCelular = poco.IdentificacionExtCelular;    
                        ent.Fideicomisario_IdentificacionIdentOficialVig = poco.IdentificacionIdentOficialVig;    
                        ent.Fideicomisario_IdentificacionVigencia = poco.IdentificacionVigencia;    
                        ent.Fideicomisario_EscrituraNoEscritura = poco.EscrituraNoEscritura;    
                        ent.Fideicomisario_EscrituraNotario = poco.EscrituraNotario;    
                        ent.Fideicomisario_EscrituraNoNotaria = poco.EscrituraNoNotaria;    
                        ent.Fideicomisario_EscrituraCiudad = poco.EscrituraCiudad;    
                        ent.Fideicomisario_EscrituraTelefono = poco.EscrituraTelefono;    
                        ent.Fideicomisario_EscrituraEmail = poco.EscrituraEmail;    
                         if (poco.EscrituraFecha != null && poco.EscrituraFecha != "")
                          ent.Fideicomisario_EscrituraFecha = getDateFromTimeStamp(Int64.Parse(poco.EscrituraFecha));    
                        ent.Fideicomisario_EscrituraEstado = poco.EscrituraEstado;    
                        ent.Fideicomisario_CuentasKYCNoCuenta1 = poco.CuentasKYCNoCuenta1;    
                        ent.Fideicomisario_CuentasKYCTipoCuenta1 = poco.CuentasKYCTipoCuenta1;    
                        ent.Fideicomisario_CuentasKYCNoCuenta2 = poco.CuentasKYCNoCuenta2;    
                        ent.Fideicomisario_CuentasKYCTipoCuenta2 = poco.CuentasKYCTipoCuenta2;    
                        ent.Fideicomisario_CuentasKYCNoCuenta3 = poco.CuentasKYCNoCuenta3;    
                        ent.Fideicomisario_CuentasKYCTipoCuenta3 = poco.CuentasKYCTipoCuenta3;    
                        ent.Fideicomisario_CuentasKYCNoCuenta4 = poco.CuentasKYCNoCuenta4;    
                        ent.Fideicomisario_CuentasKYCTipoCuenta4 = poco.CuentasKYCTipoCuenta4;    

            return ent;
        }
        private DateTime getDateFromTimeStamp (long value)
        {
            var dt = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddSeconds(Math.Round(value / 1000d)).ToLocalTime();
            return dt;
        }
    }
}