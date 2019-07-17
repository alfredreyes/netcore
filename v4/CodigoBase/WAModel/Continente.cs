//Fecha Creación:7/17/2019 4:53:12 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class Continente
    {
            public string IdContinente  { get; set; }      
            public string NombreContinente  { get; set; }      
            public bool Activo  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
