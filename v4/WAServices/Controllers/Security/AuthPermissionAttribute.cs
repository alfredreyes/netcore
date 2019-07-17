using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using System.Security.Claims;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WADataAccess.BaseDataAccess;
using WAModel.BaseModel;

namespace WAServices.Controllers.Security
{
    public class AuthPermissionAttribute : ActionFilterAttribute, IActionFilter
    {
        private IAccessHelperData _accesshelper;
        public string CurrentPermission { get; set; }

        public AuthPermissionAttribute(IAccessHelperData accesshelper)
        {
            _accesshelper = accesshelper;
        }
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            base.OnActionExecuting(filterContext);

            var identity = filterContext.HttpContext.User;
        
            if (identity != null && identity.Identity.IsAuthenticated)
            {
                
                string email = identity.FindFirst("email2").Value;
                if (email != "")
                {
                    Result res = new Result();
                    res = _accesshelper.ValidatePermission(this.CurrentPermission, email);
                   if ( !res.Exito)
                        filterContext.Result = new UnauthorizedResult();
                    //if (!AccessHelper.HasPermission())
                    //{
                        
                    //}
                   
                }
                else
                {
                    filterContext.Result = new UnauthorizedResult();
                }
               
            }
            else
                filterContext.Result = new  UnauthorizedResult();
                      

           
        }
    }
}
