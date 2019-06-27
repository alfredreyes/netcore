//Fecha Creación:5/24/2019 6:13:36 PM Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface ISubfisoData 
    {
        Result InsertSubfiso(Subfiso item);
        Result UpdateSubfiso(string id, Subfiso item);
        
        Result UpdatePartialSubfiso(string id, Subfiso item);
        List<Subfiso> GetSubfisos(int page, int limit);
        
        List<Subfiso> GetSubfisosAndRelations(int page, int limit);

        Subfiso GetSubfiso(string id);
        Result DeleteSubfiso(string id);
    }
}
