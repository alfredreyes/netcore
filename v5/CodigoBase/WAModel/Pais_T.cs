//Fecha Creación:7/18/2019 11:20:19 AM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class Pais_T
    {
            public string idpais  { get; set; }      
            public string nombrepais  { get; set; }      
            public double? habitantes  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
