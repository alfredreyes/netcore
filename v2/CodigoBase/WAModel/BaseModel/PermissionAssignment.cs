//Fecha Creación:12/11/2018 03:57:49 p.m. Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class PermissionAssignment
    {
            public string id  { get; set; }      
            public string roleId  { get; set; }      
            public string permissionId  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
