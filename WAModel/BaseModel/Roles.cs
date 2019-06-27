//Fecha Creación:12/11/2018 03:37:26 p.m. Template ModelClass, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;

namespace WAModel
{
    public class Roles
    {
            public string id  { get; set; }      
            public string name  { get; set; }      
            public string description  { get; set; }      
            public bool enabled  { get; set; }

        //Relationships with other entities, i use a number to diferentiate entites with the same name       
        public List<Permission> Permissions { get; set; }

                                           //To manage search paged
        public int TotalRecords { get; set; }
    
    }
}
