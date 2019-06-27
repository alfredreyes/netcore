//Fecha Creación:5/24/2019 6:13:30 PM Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("Fiduciario/parametroscomisiones")]
    [ApiController]
    public class ParametrosComisionesController : ControllerBase
    {
        private readonly IParametrosComisionesData  _repository;

        public ParametrosComisionesController(IParametrosComisionesData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<ParametrosComisiones_T>> Get(int _page, int _limit)
        {
            List<ParametrosComisiones_T> lst = new List<ParametrosComisiones_T>();

            foreach(ParametrosComisiones it in _repository.GetParametrosComisioness(_page, _limit))
            {
                lst.Add(getPoco(it));
            }
            return lst;
        }
        
        [HttpGet("{id}")]
        public ActionResult<ParametrosComisiones_T> GetById(string id)
        {
            var item = getPoco(_repository.GetParametrosComisiones(id));
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(ParametrosComisiones_T item)
        {
            try
            {
                Result res = new Result();
                //Transform Entities
               
                res = _repository.InsertParametrosComisiones(getEntity(item));
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
        public ActionResult Update(string id, ParametrosComisiones_T item)
        {                     
            try
            {
               
                Result res = new Result();
                res = _repository.UpdateParametrosComisiones(id,getEntity(item));
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
        public ActionResult UpdatePartial(string id, ParametrosComisiones_T item)
        {           
            try
            {
                Result res = new Result();
              
                res = _repository.UpdatePartialParametrosComisiones(id, getEntity(item));
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
               res = _repository.DeleteParametrosComisiones(id);
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
        private ParametrosComisiones_T getPoco(ParametrosComisiones it)
        {
            ParametrosComisiones_T poco = new ParametrosComisiones_T();

            
                        poco.ID = it.ParametrosComisiones_ID;    
                        poco.FideicomisoId = it.ParametrosComisiones_Fideicomiso;    
                        poco.TipoCalculo = it.ParametrosComisiones_TipoCalculo;    
                        poco.AQuienSeCobra = it.ParametrosComisiones_AQuienSeCobra;    
                        poco.MontoAceptacion = it.ParametrosComisiones_MontoAceptacion;    
                        poco.ImporteAnualizado = it.ParametrosComisiones_ImporteAnualizado;    
                        poco.Periodicidad = it.ParametrosComisiones_Periodicidad;    
                        poco.CalculoAlDiaPrimero = it.ParametrosComisiones_CalculoAlDiaPrimero;    
                        poco.Reevaluacion = it.ParametrosComisiones_Reevaluacion;    
                         if (it.ParametrosComisiones_FechaConstitucion != null) //&& it.ParametrosComisiones_FechaConstitucion != "")
                          poco.FechaConstitucion = it.ParametrosComisiones_FechaConstitucion.ToString();    
                         if (it.ParametrosComisiones_FechaPivote != null) //&& it.ParametrosComisiones_FechaPivote != "")
                          poco.FechaPivote = it.ParametrosComisiones_FechaPivote.ToString();    
                         if (it.ParametrosComisiones_FechaProxCalculo != null) //&& it.ParametrosComisiones_FechaProxCalculo != "")
                          poco.FechaProxCalculo = it.ParametrosComisiones_FechaProxCalculo.ToString();    
                        poco.MetodoPago = it.ParametrosComisiones_MetodoPago;    
                        poco.AQuienFactura = it.ParametrosComisiones_AQuienFactura;    
                        poco.Nombre = it.ParametrosComisiones_Nombre;    
                        poco.Comentario = it.ParametrosComisiones_Comentario;    
                        poco.Estatus = it.ParametrosComisiones_Estatus;    
                        poco.PenasConvencionales = it.ParametrosComisiones_PenasConvencionales;    
                        poco.Moneda = it.ParametrosComisiones_Moneda;    
                        poco.Interes = it.ParametrosComisiones_Interes;    
                        poco.TipoIva = it.ParametrosComisiones_TipoIva;    
                        poco.DiaCorte = it.ParametrosComisiones_DiaCorte;    
                         if (it.ParametrosComisiones_FechaPrimerCalculo != null) //&& it.ParametrosComisiones_FechaPrimerCalculo != "")
                          poco.FechaPrimerCalculo = it.ParametrosComisiones_FechaPrimerCalculo.ToString();    
                         if (it.ParametrosComisiones_FechaUltimoCalculo != null) //&& it.ParametrosComisiones_FechaUltimoCalculo != "")
                          poco.FechaUltimoCalculo = it.ParametrosComisiones_FechaUltimoCalculo.ToString();    
                        poco.CuentaPago = it.ParametrosComisiones_CuentaPago;    
                        poco.Numero = it.ParametrosComisiones_Numero;    
                        poco.SituacionMorosidad = it.ParametrosComisiones_SituacionMorosidad;    

            return poco;
        }
        private ParametrosComisiones getEntity(ParametrosComisiones_T poco)
        {
            ParametrosComisiones ent = new ParametrosComisiones();

                        ent.ParametrosComisiones_ID = poco.ID;    
                        ent.ParametrosComisiones_Fideicomiso = poco.FideicomisoId;    
                        ent.ParametrosComisiones_TipoCalculo = poco.TipoCalculo;    
                        ent.ParametrosComisiones_AQuienSeCobra = poco.AQuienSeCobra;    
                        ent.ParametrosComisiones_MontoAceptacion = poco.MontoAceptacion;    
                        ent.ParametrosComisiones_ImporteAnualizado = poco.ImporteAnualizado;    
                        ent.ParametrosComisiones_Periodicidad = poco.Periodicidad;    
                        ent.ParametrosComisiones_CalculoAlDiaPrimero = poco.CalculoAlDiaPrimero;    
                        ent.ParametrosComisiones_Reevaluacion = poco.Reevaluacion;    
                         if (poco.FechaConstitucion != null && poco.FechaConstitucion != "")
                          ent.ParametrosComisiones_FechaConstitucion = getDateFromTimeStamp(Int64.Parse(poco.FechaConstitucion));    
                         if (poco.FechaPivote != null && poco.FechaPivote != "")
                          ent.ParametrosComisiones_FechaPivote = getDateFromTimeStamp(Int64.Parse(poco.FechaPivote));    
                         if (poco.FechaProxCalculo != null && poco.FechaProxCalculo != "")
                          ent.ParametrosComisiones_FechaProxCalculo = getDateFromTimeStamp(Int64.Parse(poco.FechaProxCalculo));    
                        ent.ParametrosComisiones_MetodoPago = poco.MetodoPago;    
                        ent.ParametrosComisiones_AQuienFactura = poco.AQuienFactura;    
                        ent.ParametrosComisiones_Nombre = poco.Nombre;    
                        ent.ParametrosComisiones_Comentario = poco.Comentario;    
                        ent.ParametrosComisiones_Estatus = poco.Estatus;    
                        ent.ParametrosComisiones_PenasConvencionales = poco.PenasConvencionales;    
                        ent.ParametrosComisiones_Moneda = poco.Moneda;    
                        ent.ParametrosComisiones_Interes = poco.Interes;    
                        ent.ParametrosComisiones_TipoIva = poco.TipoIva;    
                        ent.ParametrosComisiones_DiaCorte = poco.DiaCorte;    
                         if (poco.FechaPrimerCalculo != null && poco.FechaPrimerCalculo != "")
                          ent.ParametrosComisiones_FechaPrimerCalculo = getDateFromTimeStamp(Int64.Parse(poco.FechaPrimerCalculo));    
                         if (poco.FechaUltimoCalculo != null && poco.FechaUltimoCalculo != "")
                          ent.ParametrosComisiones_FechaUltimoCalculo = getDateFromTimeStamp(Int64.Parse(poco.FechaUltimoCalculo));    
                        ent.ParametrosComisiones_CuentaPago = poco.CuentaPago;    
                        ent.ParametrosComisiones_Numero = poco.Numero;    
                        ent.ParametrosComisiones_SituacionMorosidad = poco.SituacionMorosidad;    

            return ent;
        }
        private DateTime getDateFromTimeStamp (long value)
        {
            var dt = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddSeconds(Math.Round(value / 1000d)).ToLocalTime();
            return dt;
        }
    }
}