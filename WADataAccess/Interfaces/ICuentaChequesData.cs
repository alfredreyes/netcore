//Fecha Creación:5/24/2019 6:13:00 PM Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface ICuentaChequesData 
    {
        Result InsertCuentaCheques(CuentaCheques item);
        Result UpdateCuentaCheques(string id, CuentaCheques item);
        
        Result UpdatePartialCuentaCheques(string id, CuentaCheques item);
        List<CuentaCheques> GetCuentaChequess(int page, int limit);
        
        List<CuentaCheques> GetCuentaChequessAndRelations(int page, int limit);

        CuentaCheques GetCuentaCheques(string id);
        Result DeleteCuentaCheques(string id);
    }
}
