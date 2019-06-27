//Fecha Creación:5/24/2019 6:13:12 PM Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("Fiduciario/fideicomiso")]
    [ApiController]
    public class FideicomisoController : ControllerBase
    {
        private readonly IFideicomisoData  _repository;

        public FideicomisoController(IFideicomisoData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<Fideicomiso_T>> Get(int _page, int _limit)
        {
            List<Fideicomiso_T> lst = new List<Fideicomiso_T>();

            foreach(Fideicomiso it in _repository.GetFideicomisos(_page, _limit))
            {
                lst.Add(getPoco(it));
            }
            return lst;
        }
        
        [HttpGet("{id}")]
        public ActionResult<Fideicomiso_T> GetById(string id)
        {
            var item = getPoco(_repository.GetFideicomiso(id));
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(Fideicomiso_T item)
        {
            try
            {
                Result res = new Result();
                //Transform Entities
               
                res = _repository.InsertFideicomiso(getEntity(item));
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
        public ActionResult Update(string id, Fideicomiso_T item)
        {                     
            try
            {
               
                Result res = new Result();
                res = _repository.UpdateFideicomiso(id,getEntity(item));
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
        public ActionResult UpdatePartial(string id, Fideicomiso_T item)
        {           
            try
            {
                Result res = new Result();
              
                res = _repository.UpdatePartialFideicomiso(id, getEntity(item));
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
               res = _repository.DeleteFideicomiso(id);
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
        private Fideicomiso_T getPoco(Fideicomiso it)
        {
            Fideicomiso_T poco = new Fideicomiso_T();

            
                        poco.ID = it.Fideicomiso_ID;    
                        poco.generalesnumero = it.Fideicomiso_GeneralesNumero;    
                        poco.GeneralesNombre = it.Fideicomiso_GeneralesNombre;    
                        poco.GeneralesAdministrador = it.Fideicomiso_GeneralesAdministrador;    
                        poco.GeneralesPromotor = it.Fideicomiso_GeneralesPromotor;    
                        poco.CaracteristicasFormaManejo = it.Fideicomiso_CaracteristicasFormaManejo;    
                        poco.CaracteristicasTipoNegocio = it.Fideicomiso_CaracteristicasTipoNegocio;    
                        poco.CaracteristicasClasificacionProducto = it.Fideicomiso_CaracteristicasClasificacionProducto;    
                        poco.CaracteristicasProductoEstandar = it.Fideicomiso_CaracteristicasProductoEstandar;    
                        poco.CaracteristicasProducto = it.Fideicomiso_CaracteristicasProducto;    
                        poco.CaracteristicasValFatca = it.Fideicomiso_CaracteristicasValFatca;    
                        poco.CaracteristicasMontoApertura = it.Fideicomiso_CaracteristicasMontoApertura;    
                        poco.CaracteristicasManejoSubFisos = it.Fideicomiso_CaracteristicasManejoSubFisos;    
                        poco.CaracteristicasSujetoArt151 = it.Fideicomiso_CaracteristicasSujetoArt151;    
                        poco.CaracteristicasCerrado = it.Fideicomiso_CaracteristicasCerrado;    
                        poco.CaracteristicasRevocable = it.Fideicomiso_CaracteristicasRevocable;    
                        poco.CaracteristicasEsContratoEje = it.Fideicomiso_CaracteristicasEsContratoEje;    
                        poco.CaracteristicasComiteTecnico = it.Fideicomiso_CaracteristicasComiteTecnico;    
                        poco.CaracteristicasOfiBanxico = it.Fideicomiso_CaracteristicasOfiBanxico;    
                        poco.CaracteristicasManejaMonExt = it.Fideicomiso_CaracteristicasManejaMonExt;    
                        poco.CaracteristicasIvaFronterizo = it.Fideicomiso_CaracteristicasIvaFronterizo;    
                         if (it.Fideicomiso_CaracteristicasFechaAlta != null) //&& it.Fideicomiso_CaracteristicasFechaAlta != "")
                          poco.CaracteristicasFechaAlta = it.Fideicomiso_CaracteristicasFechaAlta.ToString();    
                         if (it.Fideicomiso_CaracteristicasFechaConstitucion != null) //&& it.Fideicomiso_CaracteristicasFechaConstitucion != "")
                          poco.CaracteristicasFechaConstitucion = it.Fideicomiso_CaracteristicasFechaConstitucion.ToString();    
                         if (it.Fideicomiso_CaracteristicasFechaAprobacion != null) //&& it.Fideicomiso_CaracteristicasFechaAprobacion != "")
                          poco.CaracteristicasFechaAprobacion = it.Fideicomiso_CaracteristicasFechaAprobacion.ToString();    
                        poco.CaracteristicasEstado = it.Fideicomiso_CaracteristicasEstado;    
                        poco.AdicionalesTipo = it.Fideicomiso_AdicionalesTipo;    
                        poco.AdicionalesTipoPersona = it.Fideicomiso_AdicionalesTipoPersona;    
                        poco.AdicionalesConActividadEmpresarial = it.Fideicomiso_AdicionalesConActividadEmpresarial;    
                        poco.AdicionalesPermisoSre = it.Fideicomiso_AdicionalesPermisoSre;    
                         if (it.Fideicomiso_AdicionalesFechaPermisoSre != null) //&& it.Fideicomiso_AdicionalesFechaPermisoSre != "")
                          poco.AdicionalesFechaPermisoSre = it.Fideicomiso_AdicionalesFechaPermisoSre.ToString();    
                        poco.AdicionalesProvSustFiduciaria = it.Fideicomiso_AdicionalesProvSustFiduciaria;    
                        poco.AdicionalesFondosInterfaseAfore = it.Fideicomiso_AdicionalesFondosInterfaseAfore;    
                        poco.AdicionalesRegNalInvExt = it.Fideicomiso_AdicionalesRegNalInvExt;    
                         if (it.Fideicomiso_AdicionalesFechaInscripcion != null) //&& it.Fideicomiso_AdicionalesFechaInscripcion != "")
                          poco.AdicionalesFechaInscripcion = it.Fideicomiso_AdicionalesFechaInscripcion.ToString();    
                        poco.AdicionalesFormalizacionContrato = it.Fideicomiso_AdicionalesFormalizacionContrato;    
                        poco.AdicionalesNoEscritura = it.Fideicomiso_AdicionalesNoEscritura;    
                         if (it.Fideicomiso_AdicionalesFechaEscritura != null) //&& it.Fideicomiso_AdicionalesFechaEscritura != "")
                          poco.AdicionalesFechaEscritura = it.Fideicomiso_AdicionalesFechaEscritura.ToString();    
                        poco.AdicionalesNombreNotario = it.Fideicomiso_AdicionalesNombreNotario;    
                        poco.AdicionalesNoNotario = it.Fideicomiso_AdicionalesNoNotario;    
                        poco.AdicionalesCiudadNotario = it.Fideicomiso_AdicionalesCiudadNotario;    
                        poco.AdicionalesEstadoNotario = it.Fideicomiso_AdicionalesEstadoNotario;    
                        poco.AdicionalesPaisNotario = it.Fideicomiso_AdicionalesPaisNotario;    
                        poco.AdicionalesFolioRegistroPublico = it.Fideicomiso_AdicionalesFolioRegistroPublico;    
                         if (it.Fideicomiso_AdicionalesFechaInscripcionRegPublico != null) //&& it.Fideicomiso_AdicionalesFechaInscripcionRegPublico != "")
                          poco.AdicionalesFechaInscripcionRegPublico = it.Fideicomiso_AdicionalesFechaInscripcionRegPublico.ToString();    
                        poco.AdicionalesAdministracion = it.Fideicomiso_AdicionalesAdministracion;    
                        poco.AdicionalesContabilidadDelegada = it.Fideicomiso_AdicionalesContabilidadDelegada;    
                        poco.DatosBanxicoActividadEconomica = it.Fideicomiso_DatosBanxicoActividadEconomica;    
                        poco.DatosBanxicoFiducuario = it.Fideicomiso_DatosBanxicoFiducuario;    
                        poco.DatosBanxicoSectorBancario = it.Fideicomiso_DatosBanxicoSectorBancario;    
                        poco.DatosBanxicoLocalidad = it.Fideicomiso_DatosBanxicoLocalidad;    
                        poco.DatosBanxicoCentroResp = it.Fideicomiso_DatosBanxicoCentroResp;    
                        poco.DatosBanxicoNoCr = it.Fideicomiso_DatosBanxicoNoCr;    
                        poco.DatosBanxicoRfcContrato = it.Fideicomiso_DatosBanxicoRfcContrato;    
                        poco.DatosBanxicoNumeroCliente = it.Fideicomiso_DatosBanxicoNumeroCliente;    

            return poco;
        }
        private Fideicomiso getEntity(Fideicomiso_T poco)
        {
            Fideicomiso ent = new Fideicomiso();

                        ent.Fideicomiso_ID = poco.ID;    
                        ent.Fideicomiso_GeneralesNumero = poco.generalesnumero;    
                        ent.Fideicomiso_GeneralesNombre = poco.GeneralesNombre;    
                        ent.Fideicomiso_GeneralesAdministrador = poco.GeneralesAdministrador;    
                        ent.Fideicomiso_GeneralesPromotor = poco.GeneralesPromotor;    
                        ent.Fideicomiso_CaracteristicasFormaManejo = poco.CaracteristicasFormaManejo;    
                        ent.Fideicomiso_CaracteristicasTipoNegocio = poco.CaracteristicasTipoNegocio;    
                        ent.Fideicomiso_CaracteristicasClasificacionProducto = poco.CaracteristicasClasificacionProducto;    
                        ent.Fideicomiso_CaracteristicasProductoEstandar = poco.CaracteristicasProductoEstandar;    
                        ent.Fideicomiso_CaracteristicasProducto = poco.CaracteristicasProducto;    
                        ent.Fideicomiso_CaracteristicasValFatca = poco.CaracteristicasValFatca;    
                        ent.Fideicomiso_CaracteristicasMontoApertura = poco.CaracteristicasMontoApertura;    
                        ent.Fideicomiso_CaracteristicasManejoSubFisos = poco.CaracteristicasManejoSubFisos;    
                        ent.Fideicomiso_CaracteristicasSujetoArt151 = poco.CaracteristicasSujetoArt151;    
                        ent.Fideicomiso_CaracteristicasCerrado = poco.CaracteristicasCerrado;    
                        ent.Fideicomiso_CaracteristicasRevocable = poco.CaracteristicasRevocable;    
                        ent.Fideicomiso_CaracteristicasEsContratoEje = poco.CaracteristicasEsContratoEje;    
                        ent.Fideicomiso_CaracteristicasComiteTecnico = poco.CaracteristicasComiteTecnico;    
                        ent.Fideicomiso_CaracteristicasOfiBanxico = poco.CaracteristicasOfiBanxico;    
                        ent.Fideicomiso_CaracteristicasManejaMonExt = poco.CaracteristicasManejaMonExt;    
                        ent.Fideicomiso_CaracteristicasIvaFronterizo = poco.CaracteristicasIvaFronterizo;    
                         if (poco.CaracteristicasFechaAlta != null && poco.CaracteristicasFechaAlta != "")
                          ent.Fideicomiso_CaracteristicasFechaAlta = getDateFromTimeStamp(Int64.Parse(poco.CaracteristicasFechaAlta));    
                         if (poco.CaracteristicasFechaConstitucion != null && poco.CaracteristicasFechaConstitucion != "")
                          ent.Fideicomiso_CaracteristicasFechaConstitucion = getDateFromTimeStamp(Int64.Parse(poco.CaracteristicasFechaConstitucion));    
                         if (poco.CaracteristicasFechaAprobacion != null && poco.CaracteristicasFechaAprobacion != "")
                          ent.Fideicomiso_CaracteristicasFechaAprobacion = getDateFromTimeStamp(Int64.Parse(poco.CaracteristicasFechaAprobacion));    
                        ent.Fideicomiso_CaracteristicasEstado = poco.CaracteristicasEstado;    
                        ent.Fideicomiso_AdicionalesTipo = poco.AdicionalesTipo;    
                        ent.Fideicomiso_AdicionalesTipoPersona = poco.AdicionalesTipoPersona;    
                        ent.Fideicomiso_AdicionalesConActividadEmpresarial = poco.AdicionalesConActividadEmpresarial;    
                        ent.Fideicomiso_AdicionalesPermisoSre = poco.AdicionalesPermisoSre;    
                         if (poco.AdicionalesFechaPermisoSre != null && poco.AdicionalesFechaPermisoSre != "")
                          ent.Fideicomiso_AdicionalesFechaPermisoSre = getDateFromTimeStamp(Int64.Parse(poco.AdicionalesFechaPermisoSre));    
                        ent.Fideicomiso_AdicionalesProvSustFiduciaria = poco.AdicionalesProvSustFiduciaria;    
                        ent.Fideicomiso_AdicionalesFondosInterfaseAfore = poco.AdicionalesFondosInterfaseAfore;    
                        ent.Fideicomiso_AdicionalesRegNalInvExt = poco.AdicionalesRegNalInvExt;    
                         if (poco.AdicionalesFechaInscripcion != null && poco.AdicionalesFechaInscripcion != "")
                          ent.Fideicomiso_AdicionalesFechaInscripcion = getDateFromTimeStamp(Int64.Parse(poco.AdicionalesFechaInscripcion));    
                        ent.Fideicomiso_AdicionalesFormalizacionContrato = poco.AdicionalesFormalizacionContrato;    
                        ent.Fideicomiso_AdicionalesNoEscritura = poco.AdicionalesNoEscritura;    
                         if (poco.AdicionalesFechaEscritura != null && poco.AdicionalesFechaEscritura != "")
                          ent.Fideicomiso_AdicionalesFechaEscritura = getDateFromTimeStamp(Int64.Parse(poco.AdicionalesFechaEscritura));    
                        ent.Fideicomiso_AdicionalesNombreNotario = poco.AdicionalesNombreNotario;    
                        ent.Fideicomiso_AdicionalesNoNotario = poco.AdicionalesNoNotario;    
                        ent.Fideicomiso_AdicionalesCiudadNotario = poco.AdicionalesCiudadNotario;    
                        ent.Fideicomiso_AdicionalesEstadoNotario = poco.AdicionalesEstadoNotario;    
                        ent.Fideicomiso_AdicionalesPaisNotario = poco.AdicionalesPaisNotario;    
                        ent.Fideicomiso_AdicionalesFolioRegistroPublico = poco.AdicionalesFolioRegistroPublico;    
                         if (poco.AdicionalesFechaInscripcionRegPublico != null && poco.AdicionalesFechaInscripcionRegPublico != "")
                          ent.Fideicomiso_AdicionalesFechaInscripcionRegPublico = getDateFromTimeStamp(Int64.Parse(poco.AdicionalesFechaInscripcionRegPublico));    
                        ent.Fideicomiso_AdicionalesAdministracion = poco.AdicionalesAdministracion;    
                        ent.Fideicomiso_AdicionalesContabilidadDelegada = poco.AdicionalesContabilidadDelegada;    
                        ent.Fideicomiso_DatosBanxicoActividadEconomica = poco.DatosBanxicoActividadEconomica;    
                        ent.Fideicomiso_DatosBanxicoFiducuario = poco.DatosBanxicoFiducuario;    
                        ent.Fideicomiso_DatosBanxicoSectorBancario = poco.DatosBanxicoSectorBancario;    
                        ent.Fideicomiso_DatosBanxicoLocalidad = poco.DatosBanxicoLocalidad;    
                        ent.Fideicomiso_DatosBanxicoCentroResp = poco.DatosBanxicoCentroResp;    
                        ent.Fideicomiso_DatosBanxicoNoCr = poco.DatosBanxicoNoCr;    
                        ent.Fideicomiso_DatosBanxicoRfcContrato = poco.DatosBanxicoRfcContrato;    
                        ent.Fideicomiso_DatosBanxicoNumeroCliente = poco.DatosBanxicoNumeroCliente;    

            return ent;
        }
        private DateTime getDateFromTimeStamp (long value)
        {
            var dt = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddSeconds(Math.Round(value / 1000d)).ToLocalTime();
            return dt;
        }
    }
}