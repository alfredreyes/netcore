//Fecha Creación:5/24/2019 6:13:24 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class Kyc_T
    {
      
            public string ID  { get; set; }      
      
            public string FideicomisoId  { get; set; }      
      
            public string Nombre  { get; set; }      
      
            public string NumRegistro  { get; set; }      
      
            public string Oficina  { get; set; }      
      
            public string ConceptoImpresion  { get; set; }      
      
            public string CrBanca  { get; set; }      
      
            public string Folio  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
