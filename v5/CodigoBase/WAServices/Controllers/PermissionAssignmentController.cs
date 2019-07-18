//Fecha Creación:12/11/2018 03:57:49 p.m. Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("auth/permissionassignment")]
    [ApiController]
    public class PermissionAssignmentController : ControllerBase
    {
        private readonly IPermissionAssignmentData  _repository;

        public PermissionAssignmentController(IPermissionAssignmentData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<PermissionAssignment>> Get(int _page, int _limit)
        {
            return _repository.GetPermissionAssignments( _page,  _limit);
        }
        
        [HttpGet("{id}")]
        public ActionResult<PermissionAssignment> GetById(string id)
        {
            var item = _repository.GetPermissionAssignment(id);
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(PermissionAssignment item)
        {
            try
            {
                Result res = new Result();
                res = _repository.InsertPermissionAssignment(item);

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
        public ActionResult Update(string id, PermissionAssignment item)
        {
                     
            try
            {
                Result res = new Result();
                res = _repository.UpdatePermissionAssignment(id,item);

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
               res = _repository.DeletePermissionAssignment(id);

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
        public ActionResult UpdatePartial(string id, PermissionAssignment item)
        {           
            try
            {
                Result res = new Result();
                res = _repository.UpdatePartialPermissionAssignment(id, item);

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