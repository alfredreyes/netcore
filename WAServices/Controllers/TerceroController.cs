//Fecha Creación:5/24/2019 6:13:42 PM Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("Fiduciario/tercero")]
    [ApiController]
    public class TerceroController : ControllerBase
    {
        private readonly ITerceroData  _repository;

        public TerceroController(ITerceroData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<Tercero_T>> Get(int _page, int _limit)
        {
            List<Tercero_T> lst = new List<Tercero_T>();

            foreach(Tercero it in _repository.GetTerceros(_page, _limit))
            {
                lst.Add(getPoco(it));
            }
            return lst;
        }
        
        [HttpGet("{id}")]
        public ActionResult<Tercero_T> GetById(string id)
        {
            var item = getPoco(_repository.GetTercero(id));
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(Tercero_T item)
        {
            try
            {
                Result res = new Result();
                //Transform Entities
               
                res = _repository.InsertTercero(getEntity(item));
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
        public ActionResult Update(string id, Tercero_T item)
        {                     
            try
            {
               
                Result res = new Result();
                res = _repository.UpdateTercero(id,getEntity(item));
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
        public ActionResult UpdatePartial(string id, Tercero_T item)
        {           
            try
            {
                Result res = new Result();
              
                res = _repository.UpdatePartialTercero(id, getEntity(item));
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
               res = _repository.DeleteTercero(id);
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
        private Tercero_T getPoco(Tercero it)
        {
            Tercero_T poco = new Tercero_T();

            
                        poco.ID = it.Tercero_ID;    
                        poco.FideicomisoId = it.Tercero_Fideicomiso;    
                        poco.NoTercero = it.Tercero_NoTercero;    
                        poco.RazonSocial = it.Tercero_RazonSocial;    
                        poco.Nacionalidad = it.Tercero_Nacionalidad;    
                        poco.ActividadEconomica = it.Tercero_ActividadEconomica;    
                        poco.LadaCasa = it.Tercero_LadaCasa;    
                        poco.LadaOficina = it.Tercero_LadaOficina;    
                        poco.LadaFax = it.Tercero_LadaFax;    
                        poco.TelefonoCasa = it.Tercero_TelefonoCasa;    
                        poco.TelefonoOficina = it.Tercero_TelefonoOficina;    
                        poco.TelefonoFax = it.Tercero_TelefonoFax;    
                        poco.ExtOficina = it.Tercero_ExtOficina;    
                        poco.ExtFax = it.Tercero_ExtFax;    
                        poco.Estatus = it.Tercero_Estatus;    
                         if (it.Tercero_FechaVerFircosoft != null) //&& it.Tercero_FechaVerFircosoft != "")
                          poco.FechaVerFircosoft = it.Tercero_FechaVerFircosoft.ToString();    
                        poco.TipoPersona = it.Tercero_TipoPersona;    
                        poco.Rfc = it.Tercero_Rfc;    
                        poco.Correo = it.Tercero_Correo;    
                        poco.CalidaMigratoria = it.Tercero_CalidaMigratoria;    

            return poco;
        }
        private Tercero getEntity(Tercero_T poco)
        {
            Tercero ent = new Tercero();

                        ent.Tercero_ID = poco.ID;    
                        ent.Tercero_Fideicomiso = poco.FideicomisoId;    
                        ent.Tercero_NoTercero = poco.NoTercero;    
                        ent.Tercero_RazonSocial = poco.RazonSocial;    
                        ent.Tercero_Nacionalidad = poco.Nacionalidad;    
                        ent.Tercero_ActividadEconomica = poco.ActividadEconomica;    
                        ent.Tercero_LadaCasa = poco.LadaCasa;    
                        ent.Tercero_LadaOficina = poco.LadaOficina;    
                        ent.Tercero_LadaFax = poco.LadaFax;    
                        ent.Tercero_TelefonoCasa = poco.TelefonoCasa;    
                        ent.Tercero_TelefonoOficina = poco.TelefonoOficina;    
                        ent.Tercero_TelefonoFax = poco.TelefonoFax;    
                        ent.Tercero_ExtOficina = poco.ExtOficina;    
                        ent.Tercero_ExtFax = poco.ExtFax;    
                        ent.Tercero_Estatus = poco.Estatus;    
                         if (poco.FechaVerFircosoft != null && poco.FechaVerFircosoft != "")
                          ent.Tercero_FechaVerFircosoft = getDateFromTimeStamp(Int64.Parse(poco.FechaVerFircosoft));    
                        ent.Tercero_TipoPersona = poco.TipoPersona;    
                        ent.Tercero_Rfc = poco.Rfc;    
                        ent.Tercero_Correo = poco.Correo;    
                        ent.Tercero_CalidaMigratoria = poco.CalidaMigratoria;    

            return ent;
        }
        private DateTime getDateFromTimeStamp (long value)
        {
            var dt = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddSeconds(Math.Round(value / 1000d)).ToLocalTime();
            return dt;
        }
    }
}