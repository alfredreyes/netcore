//Fecha Creación:5/24/2019 6:13:00 PM Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("Fiduciario/cuentacheques")]
    [ApiController]
    public class CuentaChequesController : ControllerBase
    {
        private readonly ICuentaChequesData  _repository;

        public CuentaChequesController(ICuentaChequesData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<CuentaCheques_T>> Get(int _page, int _limit)
        {
            List<CuentaCheques_T> lst = new List<CuentaCheques_T>();

            foreach(CuentaCheques it in _repository.GetCuentaChequess(_page, _limit))
            {
                lst.Add(getPoco(it));
            }
            return lst;
        }
        
        [HttpGet("{id}")]
        public ActionResult<CuentaCheques_T> GetById(string id)
        {
            var item = getPoco(_repository.GetCuentaCheques(id));
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(CuentaCheques_T item)
        {
            try
            {
                Result res = new Result();
                //Transform Entities
               
                res = _repository.InsertCuentaCheques(getEntity(item));
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
        public ActionResult Update(string id, CuentaCheques_T item)
        {                     
            try
            {
               
                Result res = new Result();
                res = _repository.UpdateCuentaCheques(id,getEntity(item));
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
        public ActionResult UpdatePartial(string id, CuentaCheques_T item)
        {           
            try
            {
                Result res = new Result();
              
                res = _repository.UpdatePartialCuentaCheques(id, getEntity(item));
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
               res = _repository.DeleteCuentaCheques(id);
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
        private CuentaCheques_T getPoco(CuentaCheques it)
        {
            CuentaCheques_T poco = new CuentaCheques_T();

            
                        poco.ID = it.CuentaCheques_ID;    
                        poco.FideicomisoId = it.CuentaCheques_Fideicomiso;    
                        poco.TipoPersona = it.CuentaCheques_TipoPersona;    
                        poco.FideicomitenteId = it.CuentaCheques_Fideicomitente;    
                        poco.TipoCuenta = it.CuentaCheques_TipoCuenta;    
                        poco.TipoPago = it.CuentaCheques_TipoPago;    
                        poco.BancoSpei = it.CuentaCheques_BancoSpei;    
                        poco.Banco = it.CuentaCheques_Banco;    
                        poco.DomBanco = it.CuentaCheques_DomBanco;    
                        poco.Moneda = it.CuentaCheques_Moneda;    
                        poco.ClaveVostro = it.CuentaCheques_ClaveVostro;    
                        poco.NumCuenta = it.CuentaCheques_NumCuenta;    
                        poco.DomBeneficiario = it.CuentaCheques_DomBeneficiario;    
                        poco.PlazaInternacional = it.CuentaCheques_PlazaInternacional;    
                        poco.Pais = it.CuentaCheques_Pais;    
                        poco.ClaveSiacInst = it.CuentaCheques_ClaveSiacInst;    
                        poco.ConvenioCieDie = it.CuentaCheques_ConvenioCieDie;    
                        poco.Estatus = it.CuentaCheques_Estatus;    
                        poco.Clabe = it.CuentaCheques_Clabe;    
                        poco.CuentaChequera = it.CuentaCheques_CuentaChequera;    
                        poco.FechaVence = it.CuentaCheques_FechaVence;    
                        poco.NumAbbasSwift = it.CuentaCheques_NumAbbasSwift;    
                        poco.ConceptoSiac = it.CuentaCheques_ConceptoSiac;    
                        poco.RefCieDie = it.CuentaCheques_RefCieDie;    
                        poco.Autorizacion = it.CuentaCheques_Autorizacion;    

            return poco;
        }
        private CuentaCheques getEntity(CuentaCheques_T poco)
        {
            CuentaCheques ent = new CuentaCheques();

                        ent.CuentaCheques_ID = poco.ID;    
                        ent.CuentaCheques_Fideicomiso = poco.FideicomisoId;    
                        ent.CuentaCheques_TipoPersona = poco.TipoPersona;    
                        ent.CuentaCheques_Fideicomitente = poco.FideicomitenteId;    
                        ent.CuentaCheques_TipoCuenta = poco.TipoCuenta;    
                        ent.CuentaCheques_TipoPago = poco.TipoPago;    
                        ent.CuentaCheques_BancoSpei = poco.BancoSpei;    
                        ent.CuentaCheques_Banco = poco.Banco;    
                        ent.CuentaCheques_DomBanco = poco.DomBanco;    
                        ent.CuentaCheques_Moneda = poco.Moneda;    
                        ent.CuentaCheques_ClaveVostro = poco.ClaveVostro;    
                        ent.CuentaCheques_NumCuenta = poco.NumCuenta;    
                        ent.CuentaCheques_DomBeneficiario = poco.DomBeneficiario;    
                        ent.CuentaCheques_PlazaInternacional = poco.PlazaInternacional;    
                        ent.CuentaCheques_Pais = poco.Pais;    
                        ent.CuentaCheques_ClaveSiacInst = poco.ClaveSiacInst;    
                        ent.CuentaCheques_ConvenioCieDie = poco.ConvenioCieDie;    
                        ent.CuentaCheques_Estatus = poco.Estatus;    
                        ent.CuentaCheques_Clabe = poco.Clabe;    
                        ent.CuentaCheques_CuentaChequera = poco.CuentaChequera;    
                        ent.CuentaCheques_FechaVence = poco.FechaVence;    
                        ent.CuentaCheques_NumAbbasSwift = poco.NumAbbasSwift;    
                        ent.CuentaCheques_ConceptoSiac = poco.ConceptoSiac;    
                        ent.CuentaCheques_RefCieDie = poco.RefCieDie;    
                        ent.CuentaCheques_Autorizacion = poco.Autorizacion;    

            return ent;
        }
    }
}