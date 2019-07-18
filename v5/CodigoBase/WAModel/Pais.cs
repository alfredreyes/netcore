//Fecha Creación:7/18/2019 10:39:25 AM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class Pais
    {
            public string IdPais  { get; set; }      
            public string NombrePais  { get; set; }      
            public double? Habitantes  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
