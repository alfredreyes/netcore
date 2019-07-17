//Fecha Creación:12/11/2018 03:57:49 p.m. Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface IPermissionAssignmentData 
    {
        Result InsertPermissionAssignment(PermissionAssignment item);
        
        Result UpdatePermissionAssignment(string id, PermissionAssignment item);
        
        Result UpdatePartialPermissionAssignment(string id, PermissionAssignment item);

        List<PermissionAssignment> GetPermissionAssignments(int page, int limit);
        
        List<PermissionAssignment> GetPermissionAssignmentsAndRelations(int page, int limit);

        PermissionAssignment GetPermissionAssignment(string id);

        Result DeletePermissionAssignment(string id);
    }
}
