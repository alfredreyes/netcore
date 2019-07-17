//Fecha Creación:12/11/2018 03:37:26 p.m. Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("auth/role")]
    [ApiController]
    public class RoleController : ControllerBase
    {
        private readonly IRoleData  _repository;

        public RoleController(IRoleData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<Role>> Get(int _page, int _limit)
        {
            return _repository.GetRoles( _page,  _limit);
        }
        
        [HttpGet("{id}")]
        public ActionResult<Role> GetById(string id)
        {
            var item = _repository.GetRole(id);
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        [HttpGet()]
        [Route("getRolesPermissionsById/{id}")]
        public ActionResult<Role> GetRolesPermissionsById(string id)
        {
            var item = _repository.GetRolePemissions(id);
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }

        [HttpPost]
        public ActionResult Create(Role item)
        {
            try
            {
                Result res = new Result();
                res = _repository.InsertRole(item);

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
        public ActionResult Update(string id, Role item)
        {
                     
            try
            {
                Result res = new Result();
                res = _repository.UpdateRole(id,item);

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
               res = _repository.DeleteRole(id);

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
        public ActionResult UpdatePartial(string id, Role item)
        {           
            try
            {
                Result res = new Result();
                res = _repository.UpdatePartialRole(id, item);

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