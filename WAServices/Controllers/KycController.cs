//Fecha Creación:5/24/2019 6:13:24 PM Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("Fiduciario/kyc")]
    [ApiController]
    public class KycController : ControllerBase
    {
        private readonly IKycData  _repository;

        public KycController(IKycData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<Kyc_T>> Get(int _page, int _limit)
        {
            List<Kyc_T> lst = new List<Kyc_T>();

            foreach(Kyc it in _repository.GetKycs(_page, _limit))
            {
                lst.Add(getPoco(it));
            }
            return lst;
        }
        
        [HttpGet("{id}")]
        public ActionResult<Kyc_T> GetById(string id)
        {
            var item = getPoco(_repository.GetKyc(id));
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(Kyc_T item)
        {
            try
            {
                Result res = new Result();
                //Transform Entities
               
                res = _repository.InsertKyc(getEntity(item));
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
        private Kyc_T getPoco(Kyc it)
        {
            Kyc_T poco = new Kyc_T();

            
                        poco.ID = it.Kyc_ID;    
                        poco.FideicomisoId = it.Kyc_Fideicomiso;    
                        poco.Nombre = it.Kyc_Nombre;    
                        poco.NumRegistro = it.Kyc_NumRegistro;    
                        poco.Oficina = it.Kyc_Oficina;    
                        poco.ConceptoImpresion = it.Kyc_ConceptoImpresion;    
                        poco.CrBanca = it.Kyc_CrBanca;    
                        poco.Folio = it.Kyc_Folio;    

            return poco;
        }
        private Kyc getEntity(Kyc_T poco)
        {
            Kyc ent = new Kyc();

                        ent.Kyc_ID = poco.ID;    
                        ent.Kyc_Fideicomiso = poco.FideicomisoId;    
                        ent.Kyc_Nombre = poco.Nombre;    
                        ent.Kyc_NumRegistro = poco.NumRegistro;    
                        ent.Kyc_Oficina = poco.Oficina;    
                        ent.Kyc_ConceptoImpresion = poco.ConceptoImpresion;    
                        ent.Kyc_CrBanca = poco.CrBanca;    
                        ent.Kyc_Folio = poco.Folio;    

            return ent;
        }
    }
}