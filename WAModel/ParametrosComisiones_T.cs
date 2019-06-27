//Fecha Creación:5/24/2019 6:13:30 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class ParametrosComisiones_T
    {
      
            public string ID  { get; set; }      
      
            public string FideicomisoId  { get; set; }      
      
            public string TipoCalculo  { get; set; }      
      
            public string AQuienSeCobra  { get; set; }      
      
            public double? MontoAceptacion  { get; set; }      
      
            public string ImporteAnualizado  { get; set; }      
      
            public string Periodicidad  { get; set; }      
      
            public string CalculoAlDiaPrimero  { get; set; }      
      
            public string Reevaluacion  { get; set; }      
      
            public string FechaConstitucion  { get; set; }      
      
            public string FechaPivote  { get; set; }      
      
            public string FechaProxCalculo  { get; set; }      
      
            public string MetodoPago  { get; set; }      
      
            public string AQuienFactura  { get; set; }      
      
            public string Nombre  { get; set; }      
      
            public string Comentario  { get; set; }      
      
            public string Estatus  { get; set; }      
      
            public string PenasConvencionales  { get; set; }      
      
            public string Moneda  { get; set; }      
      
            public string Interes  { get; set; }      
      
            public string TipoIva  { get; set; }      
      
            public int? DiaCorte  { get; set; }      
      
            public string FechaPrimerCalculo  { get; set; }      
      
            public string FechaUltimoCalculo  { get; set; }      
      
            public string CuentaPago  { get; set; }      
      
            public string Numero  { get; set; }      
      
            public string SituacionMorosidad  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
