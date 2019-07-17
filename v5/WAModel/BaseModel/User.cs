//Fecha Creación:12/11/2018 02:48:00 p.m. Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class User
    {
            public string id  { get; set; }      
            public string username  { get; set; }      
            public string display_name  { get; set; }      
            public string email  { get; set; }      
            public string password  { get; set; }      
            public bool enabled  { get; set; }      
            public string roleId  { get; set; }

        //Relationships with other entities, i use a number to diferentiate entites with the same name       
        public Role Role { get; set; }

                                           //To manage search paged
        public int TotalRecords { get; set; }
    
    }
}
