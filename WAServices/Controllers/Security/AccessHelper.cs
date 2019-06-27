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
using WADataAccess.BaseDataAccess;


namespace WAServices.Controllers.Security
{
    public class AccessHelper
    {
        private readonly IAccessHelperData _repository;

        public AccessHelper(IAccessHelperData repository)
        {
            _repository = repository;

        }


        public static bool HasPermission(string permission, string email)
        {
           
            Result res = new Result();
         
            res = ValidaAccionRol(permission, email);
            if (!res.Exito)
                return false;
            else
                return true;

        }

        private static Result ValidaAccionRol(string permission, string email)
        {
            Result resp = new Result();
            
           // resp = _repository.ValidatePermission(permission, email);
            
            return resp;
        }
        //public static RespuestaServicio ValidaAccionRol(EntryAuthAction ent)
        //{
        //    string strURL = ConfigurationManager.AppSettings["urlCoreService"];

        //    string userName = ConfigurationManager.AppSettings["appid"];
        //    string userPassword = ConfigurationManager.AppSettings["pwd"];
        //    string authInfo = userName + ":" + userPassword;
        //    authInfo = Convert.ToBase64String(Encoding.Default.GetBytes(authInfo));

        //    RespuestaServicio resp = new RespuestaServicio();
        //    try
        //    {
        //        DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(EntryAuthAction));
        //        MemoryStream mem = new MemoryStream();
        //        ser.WriteObject(mem, ent);
        //        string data = Encoding.UTF8.GetString(mem.ToArray(), 0, (int)mem.Length);
        //        WebClient webClient = new WebClient();
        //        webClient.Headers["Content-type"] = "application/json";
        //        webClient.Headers.Add("Authorization", "Basic " + authInfo); //ARC nuevo
        //        webClient.Encoding = Encoding.UTF8;
        //        string res = webClient.UploadString(strURL + "ValidateActionRol", "POST", data);

        //        var javascriptJSON = new JavaScriptSerializer();
        //        resp = javascriptJSON.Deserialize<RespuestaServicio>(res);
        //    }
        //    catch (Exception ex)
        //    {
        //        resp.Error = ex.Message;
        //        resp.Exitosa = false;
        //    }

        //    return resp;
        //}

    }
}
