﻿//Fecha Creación:7/18/2019 11:20:20 AM Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface IPaisData 
    {
        Result InsertPais(Pais item);
        Result UpdatePais(string id, Pais item);
        
        Result UpdatePartialPais(string id, Pais item);
        List<Pais> GetPaiss(int page, int limit);
        
        List<Pais> GetPaissAndRelations(int page, int limit);

        Pais GetPais(string id);
        Result DeletePais(string id);
    }
}
