//Fecha Creación:6/28/2019 2:44:22 PM Template ModelClass, Author: Alfredo Reyes C., V1
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
