//Fecha Creación:7/18/2019 11:13:46 AM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class Continente_T
    {
            public string idcontinente  { get; set; }      
            public string nombrecontinente  { get; set; }      
            public bool activo  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
