//Fecha Creación:12/11/2018 03:49:13 p.m. Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class Permission
    {
            public string id  { get; set; }      
            public string code  { get; set; }      
            public string description  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
