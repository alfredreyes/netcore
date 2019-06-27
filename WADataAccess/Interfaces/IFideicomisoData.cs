//Fecha Creación:5/24/2019 6:13:12 PM Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface IFideicomisoData 
    {
        Result InsertFideicomiso(Fideicomiso item);
        Result UpdateFideicomiso(string id, Fideicomiso item);
        
        Result UpdatePartialFideicomiso(string id, Fideicomiso item);
        List<Fideicomiso> GetFideicomisos(int page, int limit);
        
        List<Fideicomiso> GetFideicomisosAndRelations(int page, int limit);

        Fideicomiso GetFideicomiso(string id);
        Result DeleteFideicomiso(string id);
    }
}
