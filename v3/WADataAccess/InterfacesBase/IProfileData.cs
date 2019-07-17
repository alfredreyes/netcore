using System;
using System.Collections.Generic;
using System.Text;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess.Interfaces
{
    public interface IProfileData
    {
        Profile GetProfile(string email);
    }
}
