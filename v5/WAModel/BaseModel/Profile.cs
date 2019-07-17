using System;
using System.Collections.Generic;
using System.Text;

namespace WAModel
{
    public class Profile
    {
        public User User { get; set; }

        public List<Permission> Permissions { get; set; }
    }
}
