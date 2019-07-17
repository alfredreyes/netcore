//Fecha Creación:6/28/2019 2:44:18 PM Template ModelClass, Author: Alfredo Reyes C., V1
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
