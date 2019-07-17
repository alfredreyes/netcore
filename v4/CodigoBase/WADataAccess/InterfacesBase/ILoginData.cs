using System;
using System.Collections.Generic;
using System.Text;
using WAModel;
namespace WADataAccess.Interfaces
{
    public interface ILoginData
    {
        User ValidateUser(string email, string pwd);

    }
}
