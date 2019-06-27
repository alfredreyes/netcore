//Fecha Creación:5/24/2019 6:13:24 PM Template DataInterface, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface IKycData 
    {
        Result InsertKyc(Kyc item);
        List<Kyc> GetKycs(int page, int limit);
        
        List<Kyc> GetKycsAndRelations(int page, int limit);

        Kyc GetKyc(string id);
    }
}
