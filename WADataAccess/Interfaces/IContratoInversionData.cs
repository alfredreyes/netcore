//Fecha Creación:5/24/2019 6:12:53 PM Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface IContratoInversionData 
    {
        Result InsertContratoInversion(ContratoInversion item);
        Result UpdateContratoInversion(string id, ContratoInversion item);
        
        Result UpdatePartialContratoInversion(string id, ContratoInversion item);
        List<ContratoInversion> GetContratoInversions(int page, int limit);
        
        List<ContratoInversion> GetContratoInversionsAndRelations(int page, int limit);

        ContratoInversion GetContratoInversion(string id);
    }
}
