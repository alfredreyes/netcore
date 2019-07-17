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
    [Route("auth/roles")]
    [ApiController]
    public class RolesController : ControllerBase
    {
        private readonly IRolesData _repository;

        public RolesController(IRolesData repository)
        {
            _repository = repository;

        }

        [HttpGet()]
        [Route("{id}/permissions")]
        public ActionResult<Role> GetRolesPermissionsById(string id)
        {
            //string id = "sds";
            var item = _repository.GetRolePemissions(id);
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
    }
}