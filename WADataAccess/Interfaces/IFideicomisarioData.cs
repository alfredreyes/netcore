//Fecha Creación:5/24/2019 6:13:06 PM Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface IFideicomisarioData 
    {
        Result InsertFideicomisario(Fideicomisario item);
        Result UpdateFideicomisario(string id, Fideicomisario item);
        
        Result UpdatePartialFideicomisario(string id, Fideicomisario item);
        List<Fideicomisario> GetFideicomisarios(int page, int limit);
        
        List<Fideicomisario> GetFideicomisariosAndRelations(int page, int limit);

        Fideicomisario GetFideicomisario(string id);
        Result DeleteFideicomisario(string id);
    }
}
