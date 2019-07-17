//Fecha Creación:7/17/2019 4:53:13 PM Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("/continente")]
    [ApiController]
    public class ContinenteController : ControllerBase
    {
        private readonly IContinenteData  _repository;

        public ContinenteController(IContinenteData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<Continente_T>> Get(int _page, int _limit)
        {
            List<Continente_T> lst = new List<Continente_T>();

            foreach(Continente it in _repository.GetContinentes(_page, _limit))
            {
                lst.Add(getPoco(it));
            }
            return lst;
        }
        
        [HttpGet("{id}")]
        public ActionResult<Continente_T> GetById(string id)
        {
            var item = getPoco(_repository.GetContinente(id));
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(Continente_T item)
        {
            try
            {
                Result res = new Result();
                //Transform Entities
               
                res = _repository.InsertContinente(getEntity(item));
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
        public ActionResult Update(string id, Continente_T item)
        {                     
            try
            {
               
                Result res = new Result();
                res = _repository.UpdateContinente(id,getEntity(item));
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
        public ActionResult UpdatePartial(string id, Continente_T item)
        {           
            try
            {
                Result res = new Result();
              
                res = _repository.UpdatePartialContinente(id, getEntity(item));
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
               res = _repository.DeleteContinente(id);
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
        private Continente_T getPoco(Continente it)
        {
            Continente_T poco = new Continente_T();

            
                        poco.idcontinente = it.IdContinente;    
                        poco.nombrecontinente = it.NombreContinente;    
                        poco.activo = it.Activo;    

            return poco;
        }
        private Continente getEntity(Continente_T poco)
        {
            Continente ent = new Continente();

                        ent.IdContinente = poco.idcontinente;    
                        ent.NombreContinente = poco.nombrecontinente;    
                        ent.Activo = poco.activo;    

            return ent;
        }
    }
}