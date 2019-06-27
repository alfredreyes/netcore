//Fecha Creación:5/24/2019 6:13:36 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class Subfiso_T
    {
      
            public string ID  { get; set; }      
      
            public string FideicomisoId  { get; set; }      
      
            public int Numero  { get; set; }      
      
            public string Nombre  { get; set; }      
      
            public string Estatus  { get; set; }      
      
            public string FechaRegistro  { get; set; }      
      
            public string Identificador  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
