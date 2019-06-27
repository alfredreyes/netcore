//Fecha Creación:5/24/2019 6:12:47 PM Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface IComiteTecnicoData 
    {
        Result InsertComiteTecnico(ComiteTecnico item);
        Result UpdateComiteTecnico(string id, ComiteTecnico item);
        
        Result UpdatePartialComiteTecnico(string id, ComiteTecnico item);
        List<ComiteTecnico> GetComiteTecnicos(int page, int limit);
        
        List<ComiteTecnico> GetComiteTecnicosAndRelations(int page, int limit);

        ComiteTecnico GetComiteTecnico(string id);
        Result DeleteComiteTecnico(string id);
    }
}
