//Fecha Creación:5/24/2019 6:13:36 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class Subfiso
    {
            public string Subfiso_ID  { get; set; }      
            public string Subfiso_Fideicomiso  { get; set; }      
            public int Subfiso_Numero  { get; set; }      
            public string Subfiso_Nombre  { get; set; }      
            public string Subfiso_Estatus  { get; set; }      
            public DateTime Subfiso_FechaRegistro  { get; set; }      
            public string Subfiso_Identificador  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
