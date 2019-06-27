//Fecha Creación:5/24/2019 6:13:24 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class Kyc
    {
            public string Kyc_ID  { get; set; }      
            public string Kyc_Fideicomiso  { get; set; }      
            public string Kyc_Nombre  { get; set; }      
            public string Kyc_NumRegistro  { get; set; }      
            public string Kyc_Oficina  { get; set; }      
            public string Kyc_ConceptoImpresion  { get; set; }      
            public string Kyc_CrBanca  { get; set; }      
            public string Kyc_Folio  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
