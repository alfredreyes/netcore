//Fecha Creación:5/24/2019 6:13:18 PM Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface IFideicomitenteData 
    {
        Result InsertFideicomitente(Fideicomitente item);
        Result UpdateFideicomitente(string id, Fideicomitente item);
        
        Result UpdatePartialFideicomitente(string id, Fideicomitente item);
        List<Fideicomitente> GetFideicomitentes(int page, int limit);
        
        List<Fideicomitente> GetFideicomitentesAndRelations(int page, int limit);

        Fideicomitente GetFideicomitente(string id);
        Result DeleteFideicomitente(string id);
    }
}
