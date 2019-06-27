//Fecha Creación:5/24/2019 6:12:47 PM Template ControllerClass, Author: Alfredo Reyes C., V1
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
    [Route("Fiduciario/comitetecnico")]
    [ApiController]
    public class ComiteTecnicoController : ControllerBase
    {
        private readonly IComiteTecnicoData  _repository;

        public ComiteTecnicoController(IComiteTecnicoData repository)
        {
            _repository = repository;
                       
        }
        
        [HttpGet]
        public ActionResult<List<ComiteTecnico_T>> Get(int _page, int _limit)
        {
            List<ComiteTecnico_T> lst = new List<ComiteTecnico_T>();

            foreach(ComiteTecnico it in _repository.GetComiteTecnicos(_page, _limit))
            {
                lst.Add(getPoco(it));
            }
            return lst;
        }
        
        [HttpGet("{id}")]
        public ActionResult<ComiteTecnico_T> GetById(string id)
        {
            var item = getPoco(_repository.GetComiteTecnico(id));
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }
        
        [HttpPost]
        public ActionResult Create(ComiteTecnico_T item)
        {
            try
            {
                Result res = new Result();
                //Transform Entities
               
                res = _repository.InsertComiteTecnico(getEntity(item));
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
        public ActionResult Update(string id, ComiteTecnico_T item)
        {                     
            try
            {
               
                Result res = new Result();
                res = _repository.UpdateComiteTecnico(id,getEntity(item));
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
        public ActionResult UpdatePartial(string id, ComiteTecnico_T item)
        {           
            try
            {
                Result res = new Result();
              
                res = _repository.UpdatePartialComiteTecnico(id, getEntity(item));
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
               res = _repository.DeleteComiteTecnico(id);
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
        private ComiteTecnico_T getPoco(ComiteTecnico it)
        {
            ComiteTecnico_T poco = new ComiteTecnico_T();

            
                        poco.ID = it.ComiteTecnico_ID;    
                        poco.FideicomisoId = it.ComiteTecnico_Fideicomiso;    
                        poco.Nombre = it.ComiteTecnico_Nombre;    
                        poco.Integracion = it.ComiteTecnico_Integracion;    
                        poco.Facultades = it.ComiteTecnico_Facultades;    
                        poco.Comentarios = it.ComiteTecnico_Comentarios;    
                         if (it.ComiteTecnico_FechaConstitucion != null) //&& it.ComiteTecnico_FechaConstitucion != "")
                          poco.FechaConstitucion = it.ComiteTecnico_FechaConstitucion.ToString();    
                        poco.MiembrosQuorum = it.ComiteTecnico_MiembrosQuorum;    
                        poco.Estatus = it.ComiteTecnico_Estatus;    
                        poco.NombrePresidentePropietario = it.ComiteTecnico_NombrePresidentePropietario;    
                        poco.RfcPresidentePropietario = it.ComiteTecnico_RfcPresidentePropietario;    
                        poco.NacionalidadPresidentePropietario = it.ComiteTecnico_NacionalidadPresidentePropietario;    
                        poco.PepPresidentePropietario = it.ComiteTecnico_PepPresidentePropietario;    
                        poco.NombrePresidenteSuplente = it.ComiteTecnico_NombrePresidenteSuplente;    
                        poco.RfcPresidenteSuplente = it.ComiteTecnico_RfcPresidenteSuplente;    
                        poco.NacionalidadPresidenteSuplente = it.ComiteTecnico_NacionalidadPresidenteSuplente;    
                        poco.PepPresidenteSuplente = it.ComiteTecnico_PepPresidenteSuplente;    
                        poco.NombreSecretarioPropietario = it.ComiteTecnico_NombreSecretarioPropietario;    
                        poco.RfcSecretarioPropietario = it.ComiteTecnico_RfcSecretarioPropietario;    
                        poco.NacionalidadSecretarioPropietario = it.ComiteTecnico_NacionalidadSecretarioPropietario;    
                        poco.PepSecretarioPropietario = it.ComiteTecnico_PepSecretarioPropietario;    
                        poco.NombreSecretarioSuplente = it.ComiteTecnico_NombreSecretarioSuplente;    
                        poco.RfcSecretarioSuplente = it.ComiteTecnico_RfcSecretarioSuplente;    
                        poco.NacionalidadSecretarioSuplente = it.ComiteTecnico_NacionalidadSecretarioSuplente;    
                        poco.PepSecretarioSuplente = it.ComiteTecnico_PepSecretarioSuplente;    
                        poco.NombreVocalPropietario = it.ComiteTecnico_NombreVocalPropietario;    
                        poco.RfcVocalPropietario = it.ComiteTecnico_RfcVocalPropietario;    
                        poco.NacionalidadVocalPropietario = it.ComiteTecnico_NacionalidadVocalPropietario;    
                        poco.PepVocalPropietario = it.ComiteTecnico_PepVocalPropietario;    
                        poco.NombreVocalSuplente = it.ComiteTecnico_NombreVocalSuplente;    
                        poco.RfcVocalSuplente = it.ComiteTecnico_RfcVocalSuplente;    
                        poco.NacionalidadVocalSuplente = it.ComiteTecnico_NacionalidadVocalSuplente;    
                        poco.PepVocalSuplente = it.ComiteTecnico_PepVocalSuplente;    

            return poco;
        }
        private ComiteTecnico getEntity(ComiteTecnico_T poco)
        {
            ComiteTecnico ent = new ComiteTecnico();

                        ent.ComiteTecnico_ID = poco.ID;    
                        ent.ComiteTecnico_Fideicomiso = poco.FideicomisoId;    
                        ent.ComiteTecnico_Nombre = poco.Nombre;    
                        ent.ComiteTecnico_Integracion = poco.Integracion;    
                        ent.ComiteTecnico_Facultades = poco.Facultades;    
                        ent.ComiteTecnico_Comentarios = poco.Comentarios;    
                         if (poco.FechaConstitucion != null && poco.FechaConstitucion != "")
                          ent.ComiteTecnico_FechaConstitucion = getDateFromTimeStamp(Int64.Parse(poco.FechaConstitucion));    
                        ent.ComiteTecnico_MiembrosQuorum = poco.MiembrosQuorum;    
                        ent.ComiteTecnico_Estatus = poco.Estatus;    
                        ent.ComiteTecnico_NombrePresidentePropietario = poco.NombrePresidentePropietario;    
                        ent.ComiteTecnico_RfcPresidentePropietario = poco.RfcPresidentePropietario;    
                        ent.ComiteTecnico_NacionalidadPresidentePropietario = poco.NacionalidadPresidentePropietario;    
                        ent.ComiteTecnico_PepPresidentePropietario = poco.PepPresidentePropietario;    
                        ent.ComiteTecnico_NombrePresidenteSuplente = poco.NombrePresidenteSuplente;    
                        ent.ComiteTecnico_RfcPresidenteSuplente = poco.RfcPresidenteSuplente;    
                        ent.ComiteTecnico_NacionalidadPresidenteSuplente = poco.NacionalidadPresidenteSuplente;    
                        ent.ComiteTecnico_PepPresidenteSuplente = poco.PepPresidenteSuplente;    
                        ent.ComiteTecnico_NombreSecretarioPropietario = poco.NombreSecretarioPropietario;    
                        ent.ComiteTecnico_RfcSecretarioPropietario = poco.RfcSecretarioPropietario;    
                        ent.ComiteTecnico_NacionalidadSecretarioPropietario = poco.NacionalidadSecretarioPropietario;    
                        ent.ComiteTecnico_PepSecretarioPropietario = poco.PepSecretarioPropietario;    
                        ent.ComiteTecnico_NombreSecretarioSuplente = poco.NombreSecretarioSuplente;    
                        ent.ComiteTecnico_RfcSecretarioSuplente = poco.RfcSecretarioSuplente;    
                        ent.ComiteTecnico_NacionalidadSecretarioSuplente = poco.NacionalidadSecretarioSuplente;    
                        ent.ComiteTecnico_PepSecretarioSuplente = poco.PepSecretarioSuplente;    
                        ent.ComiteTecnico_NombreVocalPropietario = poco.NombreVocalPropietario;    
                        ent.ComiteTecnico_RfcVocalPropietario = poco.RfcVocalPropietario;    
                        ent.ComiteTecnico_NacionalidadVocalPropietario = poco.NacionalidadVocalPropietario;    
                        ent.ComiteTecnico_PepVocalPropietario = poco.PepVocalPropietario;    
                        ent.ComiteTecnico_NombreVocalSuplente = poco.NombreVocalSuplente;    
                        ent.ComiteTecnico_RfcVocalSuplente = poco.RfcVocalSuplente;    
                        ent.ComiteTecnico_NacionalidadVocalSuplente = poco.NacionalidadVocalSuplente;    
                        ent.ComiteTecnico_PepVocalSuplente = poco.PepVocalSuplente;    

            return ent;
        }
        private DateTime getDateFromTimeStamp (long value)
        {
            var dt = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddSeconds(Math.Round(value / 1000d)).ToLocalTime();
            return dt;
        }
    }
}