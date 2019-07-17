//Fecha Creación:12/11/2018 03:37:26 p.m. Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface IRoleData 
    {
        Result InsertRole(Role item);
        
        Result UpdateRole(string id, Role item);
        
        Result UpdatePartialRole(string id, Role item);

        List<Role> GetRoles(int page, int limit);
        
        List<Role> GetRolesAndRelations(int page, int limit);

        Role GetRole(string id);

        Role GetRolePemissions(string id);

        Result DeleteRole(string id);
    }
}
