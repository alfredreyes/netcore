//Fecha Creación:5/24/2019 6:12:53 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class ContratoInversion_T
    {
      
            public string ID  { get; set; }      
      
            public string FideicomisoId  { get; set; }      
      
            public string TipoContrato  { get; set; }      
      
            public string Intermediario  { get; set; }      
      
            public string Moneda  { get; set; }      
      
            public string NombreContacto1  { get; set; }      
      
            public string NombreContacto2  { get; set; }      
      
            public string ResParamLiq  { get; set; }      
      
            public string EnvioRecursosInv  { get; set; }      
      
            public string TransferenciaRecDesinver  { get; set; }      
      
            public string RetenerIsr  { get; set; }      
      
            public string SubfisoId  { get; set; }      
      
            public string FechaVencimiento  { get; set; }      
      
            public string Estatus  { get; set; }      
      
            public string ContratoIversion  { get; set; }      
      
            public string ContratoOtrasInst  { get; set; }      
      
            public string Contacto1Lada  { get; set; }      
      
            public string Contacto1Telefono  { get; set; }      
      
            public string Contacto1Ext  { get; set; }      
      
            public string Contacto2Lada  { get; set; }      
      
            public string Contacto2Telefono  { get; set; }      
      
            public string Contacto2Ext  { get; set; }      
      
            public string Nombre  { get; set; }      
      
            public string Cuenta  { get; set; }      
      
            public string TraspasoEntreSubFiso  { get; set; }      
      
            public string FechaApertura  { get; set; }      
      
            public string OrigenRecursos  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
            public Subfiso MySubfiso2 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
