using System;
using System.Collections.Generic;
using System.Text;
using WAModel.BaseModel;

namespace WADataAccess.BaseDataAccess
{
    public interface IAccessHelperData
    {
        Result ValidatePermission(string email, string permission);
    }
}
