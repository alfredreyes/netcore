//Fecha Creación:7/17/2019 4:56:19 PM Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface IContinenteData 
    {
        Result InsertContinente(Continente item);
        Result UpdateContinente(string id, Continente item);
        
        Result UpdatePartialContinente(string id, Continente item);
        List<Continente> GetContinentes(int page, int limit);
        
        List<Continente> GetContinentesAndRelations(int page, int limit);

        Continente GetContinente(string id);
        Result DeleteContinente(string id);
    }
}
