using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WAModel;
using WAModel.BaseModel;
using WADataAccess.Interfaces;
using System.Security.Claims;

namespace WAServices.Controllers
{
    //[Authorize]
    [Route("auth/profile")]
    [ApiController]
    public class ProfileController : ControllerBase
    {
        private readonly IProfileData _repository;

        public ProfileController(IProfileData repository)
        {
            _repository = repository;

        }

        [HttpGet]
        public ActionResult<Profile> Get()
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                //IEnumerable<Claim> claims = identity.Claims;
                // or
                string email = identity.FindFirst("email2").Value;
               
                return _repository.GetProfile(email);
            }
           
            return null;
            //string email = "normaysel.carbajal@softtek.com";
           
        }
    }
}