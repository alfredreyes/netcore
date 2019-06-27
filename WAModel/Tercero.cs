//Fecha Creación:5/24/2019 6:13:42 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class Tercero
    {
            public string Tercero_ID  { get; set; }      
            public string Tercero_Fideicomiso  { get; set; }      
            public int Tercero_NoTercero  { get; set; }      
            public string Tercero_RazonSocial  { get; set; }      
            public string Tercero_Nacionalidad  { get; set; }      
            public string Tercero_ActividadEconomica  { get; set; }      
            public string Tercero_LadaCasa  { get; set; }      
            public string Tercero_LadaOficina  { get; set; }      
            public string Tercero_LadaFax  { get; set; }      
            public string Tercero_TelefonoCasa  { get; set; }      
            public string Tercero_TelefonoOficina  { get; set; }      
            public string Tercero_TelefonoFax  { get; set; }      
            public string Tercero_ExtOficina  { get; set; }      
            public string Tercero_ExtFax  { get; set; }      
            public string Tercero_Estatus  { get; set; }      
            public DateTime? Tercero_FechaVerFircosoft  { get; set; }      
            public string Tercero_TipoPersona  { get; set; }      
            public string Tercero_Rfc  { get; set; }      
            public string Tercero_Correo  { get; set; }      
            public string Tercero_CalidaMigratoria  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
