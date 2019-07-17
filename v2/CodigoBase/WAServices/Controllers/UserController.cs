//Fecha Creación:12/11/2018 02:48:01 p.m. Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("auth/user")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserData  _repository;

        public UserController(IUserData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<User>> Get(int _page, int _limit)
        {
            return _repository.GetUsers( _page,  _limit);
        }
        
        [HttpGet("{id}")]
        public ActionResult<User> GetById(string id)
        {
            var item = _repository.GetUser(id);
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(User item)
        {
            try
            {
                Result res = new Result();
                res = _repository.InsertUser(item);

                return Ok();
            }
            catch (Exception ex)
            {
                //_logger.LogError($"Something went wrong: {ex}");
                return StatusCode(500, "Internal server error " + ex.Message );
            }
        }

        // PUT: api/Test/5
        [HttpPut("{id}")]
        public ActionResult Update(string id, User item)
        {
                     
            try
            {
                Result res = new Result();
                res = _repository.UpdateUser(id,item);

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
               res = _repository.DeleteUser(id);

               return Ok();
            }
            catch (Exception ex)
            {
                //_logger.LogError($"Something went wrong: {ex}");
                return StatusCode(500, "Internal server error " +  ex.Message);
            }
        }
        
         // PUT: api/Test/5
        [HttpPatch("{id}")]
        public ActionResult UpdatePartial(string id, User item)
        {           
            try
            {
                Result res = new Result();
                res = _repository.UpdatePartialUser(id, item);

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