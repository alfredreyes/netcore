//Fecha Creación:12/11/2018 02:48:01 p.m. Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface IUserData 
    {
        Result InsertUser(User item);
        
        Result UpdateUser(string id, User item);
        
        Result UpdatePartialUser(string id, User item);

        List<User> GetUsers(int page, int limit);
        
        List<User> GetUsersAndRelations(int page, int limit);

        User GetUser(string id);

        Result DeleteUser(string id);
    }
}
