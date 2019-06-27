//Fecha Creación:5/24/2019 6:13:42 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class Tercero_T
    {
      
            public string ID  { get; set; }      
      
            public string FideicomisoId  { get; set; }      
      
            public int NoTercero  { get; set; }      
      
            public string RazonSocial  { get; set; }      
      
            public string Nacionalidad  { get; set; }      
      
            public string ActividadEconomica  { get; set; }      
      
            public string LadaCasa  { get; set; }      
      
            public string LadaOficina  { get; set; }      
      
            public string LadaFax  { get; set; }      
      
            public string TelefonoCasa  { get; set; }      
      
            public string TelefonoOficina  { get; set; }      
      
            public string TelefonoFax  { get; set; }      
      
            public string ExtOficina  { get; set; }      
      
            public string ExtFax  { get; set; }      
      
            public string Estatus  { get; set; }      
      
            public string FechaVerFircosoft  { get; set; }      
      
            public string TipoPersona  { get; set; }      
      
            public string Rfc  { get; set; }      
      
            public string Correo  { get; set; }      
      
            public string CalidaMigratoria  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
