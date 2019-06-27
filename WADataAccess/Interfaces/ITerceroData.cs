//Fecha Creación:5/24/2019 6:13:42 PM Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface ITerceroData 
    {
        Result InsertTercero(Tercero item);
        Result UpdateTercero(string id, Tercero item);
        
        Result UpdatePartialTercero(string id, Tercero item);
        List<Tercero> GetTerceros(int page, int limit);
        
        List<Tercero> GetTercerosAndRelations(int page, int limit);

        Tercero GetTercero(string id);
        Result DeleteTercero(string id);
    }
}
