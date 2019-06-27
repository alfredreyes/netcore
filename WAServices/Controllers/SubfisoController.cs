//Fecha Creación:5/24/2019 6:13:36 PM Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("Fiduciario/subfiso")]
    [ApiController]
    public class SubfisoController : ControllerBase
    {
        private readonly ISubfisoData  _repository;

        public SubfisoController(ISubfisoData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<Subfiso_T>> Get(int _page, int _limit)
        {
            List<Subfiso_T> lst = new List<Subfiso_T>();

            foreach(Subfiso it in _repository.GetSubfisos(_page, _limit))
            {
                lst.Add(getPoco(it));
            }
            return lst;
        }
        
        [HttpGet("{id}")]
        public ActionResult<Subfiso_T> GetById(string id)
        {
            var item = getPoco(_repository.GetSubfiso(id));
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(Subfiso_T item)
        {
            try
            {
                Result res = new Result();
                //Transform Entities
               
                res = _repository.InsertSubfiso(getEntity(item));
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
        public ActionResult Update(string id, Subfiso_T item)
        {                     
            try
            {
               
                Result res = new Result();
                res = _repository.UpdateSubfiso(id,getEntity(item));
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
        public ActionResult UpdatePartial(string id, Subfiso_T item)
        {           
            try
            {
                Result res = new Result();
              
                res = _repository.UpdatePartialSubfiso(id, getEntity(item));
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
               res = _repository.DeleteSubfiso(id);
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
        private Subfiso_T getPoco(Subfiso it)
        {
            Subfiso_T poco = new Subfiso_T();

            
                        poco.ID = it.Subfiso_ID;    
                        poco.FideicomisoId = it.Subfiso_Fideicomiso;    
                        poco.Numero = it.Subfiso_Numero;    
                        poco.Nombre = it.Subfiso_Nombre;    
                        poco.Estatus = it.Subfiso_Estatus;    
                         if (it.Subfiso_FechaRegistro != null) //&& it.Subfiso_FechaRegistro != "")
                          poco.FechaRegistro = it.Subfiso_FechaRegistro.ToString();    
                        poco.Identificador = it.Subfiso_Identificador;    

            return poco;
        }
        private Subfiso getEntity(Subfiso_T poco)
        {
            Subfiso ent = new Subfiso();

                        ent.Subfiso_ID = poco.ID;    
                        ent.Subfiso_Fideicomiso = poco.FideicomisoId;    
                        ent.Subfiso_Numero = poco.Numero;    
                        ent.Subfiso_Nombre = poco.Nombre;    
                        ent.Subfiso_Estatus = poco.Estatus;    
                         if (poco.FechaRegistro != null && poco.FechaRegistro != "")
                          ent.Subfiso_FechaRegistro = getDateFromTimeStamp(Int64.Parse(poco.FechaRegistro));    
                        ent.Subfiso_Identificador = poco.Identificador;    

            return ent;
        }
        private DateTime getDateFromTimeStamp (long value)
        {
            var dt = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddSeconds(Math.Round(value / 1000d)).ToLocalTime();
            return dt;
        }
    }
}