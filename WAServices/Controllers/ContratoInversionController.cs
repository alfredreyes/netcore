//Fecha Creación:5/24/2019 6:12:54 PM Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("Fiduciario/contratoinversion")]
    [ApiController]
    public class ContratoInversionController : ControllerBase
    {
        private readonly IContratoInversionData  _repository;

        public ContratoInversionController(IContratoInversionData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<ContratoInversion_T>> Get(int _page, int _limit)
        {
            List<ContratoInversion_T> lst = new List<ContratoInversion_T>();

            foreach(ContratoInversion it in _repository.GetContratoInversions(_page, _limit))
            {
                lst.Add(getPoco(it));
            }
            return lst;
        }
        
        [HttpGet("{id}")]
        public ActionResult<ContratoInversion_T> GetById(string id)
        {
            var item = getPoco(_repository.GetContratoInversion(id));
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(ContratoInversion_T item)
        {
            try
            {
                Result res = new Result();
                //Transform Entities
               
                res = _repository.InsertContratoInversion(getEntity(item));
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
        public ActionResult Update(string id, ContratoInversion_T item)
        {                     
            try
            {
               
                Result res = new Result();
                res = _repository.UpdateContratoInversion(id,getEntity(item));
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
        public ActionResult UpdatePartial(string id, ContratoInversion_T item)
        {           
            try
            {
                Result res = new Result();
              
                res = _repository.UpdatePartialContratoInversion(id, getEntity(item));
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
        private ContratoInversion_T getPoco(ContratoInversion it)
        {
            ContratoInversion_T poco = new ContratoInversion_T();

            
                        poco.ID = it.ContratoInversion_ID;    
                        poco.FideicomisoId = it.ContratoInversion_Fideicomiso;    
                        poco.TipoContrato = it.ContratoInversion_TipoContrato;    
                        poco.Intermediario = it.ContratoInversion_Intermediario;    
                        poco.Moneda = it.ContratoInversion_Moneda;    
                        poco.NombreContacto1 = it.ContratoInversion_NombreContacto1;    
                        poco.NombreContacto2 = it.ContratoInversion_NombreContacto2;    
                        poco.ResParamLiq = it.ContratoInversion_ResParamLiq;    
                        poco.EnvioRecursosInv = it.ContratoInversion_EnvioRecursosInv;    
                        poco.TransferenciaRecDesinver = it.ContratoInversion_TransferenciaRecDesinver;    
                        poco.RetenerIsr = it.ContratoInversion_RetenerIsr;    
                        poco.SubfisoId = it.ContratoInversion_Subfiso;    
                         if (it.ContratoInversion_FechaVencimiento != null) //&& it.ContratoInversion_FechaVencimiento != "")
                          poco.FechaVencimiento = it.ContratoInversion_FechaVencimiento.ToString();    
                        poco.Estatus = it.ContratoInversion_Estatus;    
                        poco.ContratoIversion = it.ContratoInversion_ContratoIversion;    
                        poco.ContratoOtrasInst = it.ContratoInversion_ContratoOtrasInst;    
                        poco.Contacto1Lada = it.ContratoInversion_Contacto1Lada;    
                        poco.Contacto1Telefono = it.ContratoInversion_Contacto1Telefono;    
                        poco.Contacto1Ext = it.ContratoInversion_Contacto1Ext;    
                        poco.Contacto2Lada = it.ContratoInversion_Contacto2Lada;    
                        poco.Contacto2Telefono = it.ContratoInversion_Contacto2Telefono;    
                        poco.Contacto2Ext = it.ContratoInversion_Contacto2Ext;    
                        poco.Nombre = it.ContratoInversion_Nombre;    
                        poco.Cuenta = it.ContratoInversion_Cuenta;    
                        poco.TraspasoEntreSubFiso = it.ContratoInversion_TraspasoEntreSubFiso;    
                         if (it.ContratoInversion_FechaApertura != null) //&& it.ContratoInversion_FechaApertura != "")
                          poco.FechaApertura = it.ContratoInversion_FechaApertura.ToString();    
                        poco.OrigenRecursos = it.ContratoInversion_OrigenRecursos;    

            return poco;
        }
        private ContratoInversion getEntity(ContratoInversion_T poco)
        {
            ContratoInversion ent = new ContratoInversion();

                        ent.ContratoInversion_ID = poco.ID;    
                        ent.ContratoInversion_Fideicomiso = poco.FideicomisoId;    
                        ent.ContratoInversion_TipoContrato = poco.TipoContrato;    
                        ent.ContratoInversion_Intermediario = poco.Intermediario;    
                        ent.ContratoInversion_Moneda = poco.Moneda;    
                        ent.ContratoInversion_NombreContacto1 = poco.NombreContacto1;    
                        ent.ContratoInversion_NombreContacto2 = poco.NombreContacto2;    
                        ent.ContratoInversion_ResParamLiq = poco.ResParamLiq;    
                        ent.ContratoInversion_EnvioRecursosInv = poco.EnvioRecursosInv;    
                        ent.ContratoInversion_TransferenciaRecDesinver = poco.TransferenciaRecDesinver;    
                        ent.ContratoInversion_RetenerIsr = poco.RetenerIsr;    
                        ent.ContratoInversion_Subfiso = poco.SubfisoId;    
                         if (poco.FechaVencimiento != null && poco.FechaVencimiento != "")
                          ent.ContratoInversion_FechaVencimiento = getDateFromTimeStamp(Int64.Parse(poco.FechaVencimiento));    
                        ent.ContratoInversion_Estatus = poco.Estatus;    
                        ent.ContratoInversion_ContratoIversion = poco.ContratoIversion;    
                        ent.ContratoInversion_ContratoOtrasInst = poco.ContratoOtrasInst;    
                        ent.ContratoInversion_Contacto1Lada = poco.Contacto1Lada;    
                        ent.ContratoInversion_Contacto1Telefono = poco.Contacto1Telefono;    
                        ent.ContratoInversion_Contacto1Ext = poco.Contacto1Ext;    
                        ent.ContratoInversion_Contacto2Lada = poco.Contacto2Lada;    
                        ent.ContratoInversion_Contacto2Telefono = poco.Contacto2Telefono;    
                        ent.ContratoInversion_Contacto2Ext = poco.Contacto2Ext;    
                        ent.ContratoInversion_Nombre = poco.Nombre;    
                        ent.ContratoInversion_Cuenta = poco.Cuenta;    
                        ent.ContratoInversion_TraspasoEntreSubFiso = poco.TraspasoEntreSubFiso;    
                         if (poco.FechaApertura != null && poco.FechaApertura != "")
                          ent.ContratoInversion_FechaApertura = getDateFromTimeStamp(Int64.Parse(poco.FechaApertura));    
                        ent.ContratoInversion_OrigenRecursos = poco.OrigenRecursos;    

            return ent;
        }
        private DateTime getDateFromTimeStamp (long value)
        {
            var dt = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddSeconds(Math.Round(value / 1000d)).ToLocalTime();
            return dt;
        }
    }
}