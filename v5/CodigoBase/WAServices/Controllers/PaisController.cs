//Fecha Creación:7/18/2019 11:13:53 AM Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("/pais")]
    [ApiController]
    public class PaisController : ControllerBase
    {
        private readonly IPaisData  _repository;

        public PaisController(IPaisData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<Pais_T>> Get(int _page, int _limit)
        {
            List<Pais_T> lst = new List<Pais_T>();

            foreach(Pais it in _repository.GetPaiss(_page, _limit))
            {
                lst.Add(getPoco(it));
            }
            return lst;
        }
        
        [HttpGet("{id}")]
        public ActionResult<Pais_T> GetById(string id)
        {
            var item = getPoco(_repository.GetPais(id));
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(Pais_T item)
        {
            try
            {
                Result res = new Result();
                //Transform Entities
               
                res = _repository.InsertPais(getEntity(item));
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
        public ActionResult Update(string id, Pais_T item)
        {                     
            try
            {
               
                Result res = new Result();
                res = _repository.UpdatePais(id,getEntity(item));
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
        public ActionResult UpdatePartial(string id, Pais_T item)
        {           
            try
            {
                Result res = new Result();
              
                res = _repository.UpdatePartialPais(id, getEntity(item));
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
               res = _repository.DeletePais(id);
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
        private Pais_T getPoco(Pais it)
        {
            Pais_T poco = new Pais_T();

            
                        poco.idpais = it.IdPais;    
                        poco.nombrepais = it.NombrePais;    
                        poco.habitantes = it.Habitantes;    

            return poco;
        }
        private Pais getEntity(Pais_T poco)
        {
            Pais ent = new Pais();

                        ent.IdPais = poco.idpais;    
                        ent.NombrePais = poco.nombrepais;    
                        ent.Habitantes = poco.habitantes;    

            return ent;
        }
    }
}