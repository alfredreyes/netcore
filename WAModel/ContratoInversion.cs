//Fecha Creación:5/24/2019 6:12:53 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class ContratoInversion
    {
            public string ContratoInversion_ID  { get; set; }      
            public string ContratoInversion_Fideicomiso  { get; set; }      
            public string ContratoInversion_TipoContrato  { get; set; }      
            public string ContratoInversion_Intermediario  { get; set; }      
            public string ContratoInversion_Moneda  { get; set; }      
            public string ContratoInversion_NombreContacto1  { get; set; }      
            public string ContratoInversion_NombreContacto2  { get; set; }      
            public string ContratoInversion_ResParamLiq  { get; set; }      
            public string ContratoInversion_EnvioRecursosInv  { get; set; }      
            public string ContratoInversion_TransferenciaRecDesinver  { get; set; }      
            public string ContratoInversion_RetenerIsr  { get; set; }      
            public string ContratoInversion_Subfiso  { get; set; }      
            public DateTime? ContratoInversion_FechaVencimiento  { get; set; }      
            public string ContratoInversion_Estatus  { get; set; }      
            public string ContratoInversion_ContratoIversion  { get; set; }      
            public string ContratoInversion_ContratoOtrasInst  { get; set; }      
            public string ContratoInversion_Contacto1Lada  { get; set; }      
            public string ContratoInversion_Contacto1Telefono  { get; set; }      
            public string ContratoInversion_Contacto1Ext  { get; set; }      
            public string ContratoInversion_Contacto2Lada  { get; set; }      
            public string ContratoInversion_Contacto2Telefono  { get; set; }      
            public string ContratoInversion_Contacto2Ext  { get; set; }      
            public string ContratoInversion_Nombre  { get; set; }      
            public string ContratoInversion_Cuenta  { get; set; }      
            public string ContratoInversion_TraspasoEntreSubFiso  { get; set; }      
            public DateTime? ContratoInversion_FechaApertura  { get; set; }      
            public string ContratoInversion_OrigenRecursos  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
            public Subfiso MySubfiso2 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
