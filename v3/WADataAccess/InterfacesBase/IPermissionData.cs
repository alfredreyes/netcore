//Fecha Creación:12/11/2018 03:49:13 p.m. Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface IPermissionData 
    {
        Result InsertPermission(Permission item);
        
        Result UpdatePermission(string id, Permission item);
        
        Result UpdatePartialPermission(string id, Permission item);

        List<Permission> GetPermissions(int page, int limit);
        
        List<Permission> GetPermissionsAndRelations(int page, int limit);

        Permission GetPermission(string id);

        Result DeletePermission(string id);
    }
}
