//Fecha Creación:12/11/2018 03:49:13 p.m. Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("auth/permission")]
    [ApiController]
    public class PermissionController : ControllerBase
    {
        private readonly IPermissionData  _repository;

        public PermissionController(IPermissionData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<Permission>> Get(int _page, int _limit)
        {
            return _repository.GetPermissions( _page,  _limit);
        }
        
        [HttpGet("{id}")]
        public ActionResult<Permission> GetById(string id)
        {
            var item = _repository.GetPermission(id);
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(Permission item)
        {
            try
            {
                Result res = new Result();
                res = _repository.InsertPermission(item);

                return Ok();
            }
            catch (Exception ex)
            {
                //_logger.LogError($"Something went wrong: {ex}");
                return StatusCode(500, "Internal server error " + ex.Message);
            }
        }

        // PUT: api/Test/5
        [HttpPut("{id}")]
        public ActionResult Update(string id, Permission item)
        {
                     
            try
            {
                Result res = new Result();
                res = _repository.UpdatePermission(id,item);

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
               res = _repository.DeletePermission(id);

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
        public ActionResult UpdatePartial(string id, Permission item)
        {           
            try
            {
                Result res = new Result();
                res = _repository.UpdatePartialPermission(id, item);

                return Ok();
            }
            catch (Exception ex)
            {
                //_logger.LogError($"Something went wrong: {ex}");
                return StatusCode(500, "Internal server error " + ex.Message);
            }
        }
    }
}