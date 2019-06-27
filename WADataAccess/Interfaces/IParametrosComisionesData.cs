//Fecha Creación:5/24/2019 6:13:30 PM Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface IParametrosComisionesData 
    {
        Result InsertParametrosComisiones(ParametrosComisiones item);
        Result UpdateParametrosComisiones(string id, ParametrosComisiones item);
        
        Result UpdatePartialParametrosComisiones(string id, ParametrosComisiones item);
        List<ParametrosComisiones> GetParametrosComisioness(int page, int limit);
        
        List<ParametrosComisiones> GetParametrosComisionessAndRelations(int page, int limit);

        ParametrosComisiones GetParametrosComisiones(string id);
        Result DeleteParametrosComisiones(string id);
    }
}
