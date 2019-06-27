//Fecha Creación:5/24/2019 6:13:30 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class ParametrosComisiones
    {
            public string ParametrosComisiones_ID  { get; set; }      
            public string ParametrosComisiones_Fideicomiso  { get; set; }      
            public string ParametrosComisiones_TipoCalculo  { get; set; }      
            public string ParametrosComisiones_AQuienSeCobra  { get; set; }      
            public double? ParametrosComisiones_MontoAceptacion  { get; set; }      
            public string ParametrosComisiones_ImporteAnualizado  { get; set; }      
            public string ParametrosComisiones_Periodicidad  { get; set; }      
            public string ParametrosComisiones_CalculoAlDiaPrimero  { get; set; }      
            public string ParametrosComisiones_Reevaluacion  { get; set; }      
            public DateTime? ParametrosComisiones_FechaConstitucion  { get; set; }      
            public DateTime? ParametrosComisiones_FechaPivote  { get; set; }      
            public DateTime? ParametrosComisiones_FechaProxCalculo  { get; set; }      
            public string ParametrosComisiones_MetodoPago  { get; set; }      
            public string ParametrosComisiones_AQuienFactura  { get; set; }      
            public string ParametrosComisiones_Nombre  { get; set; }      
            public string ParametrosComisiones_Comentario  { get; set; }      
            public string ParametrosComisiones_Estatus  { get; set; }      
            public string ParametrosComisiones_PenasConvencionales  { get; set; }      
            public string ParametrosComisiones_Moneda  { get; set; }      
            public string ParametrosComisiones_Interes  { get; set; }      
            public string ParametrosComisiones_TipoIva  { get; set; }      
            public int? ParametrosComisiones_DiaCorte  { get; set; }      
            public DateTime? ParametrosComisiones_FechaPrimerCalculo  { get; set; }      
            public DateTime? ParametrosComisiones_FechaUltimoCalculo  { get; set; }      
            public string ParametrosComisiones_CuentaPago  { get; set; }      
            public string ParametrosComisiones_Numero  { get; set; }      
            public string ParametrosComisiones_SituacionMorosidad  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
