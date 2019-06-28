using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using WAModel;
using WADataAccess.Interfaces;

namespace WAServices.Controllers
{
    [Route("auth/login")]
    [ApiController]
    public class LoginController : ControllerBase
    {
       

        private readonly ILoginData _repository;
        private IConfiguration _config;

        public LoginController(ILoginData repository, IConfiguration config)
        {
            _repository = repository;
            _config = config;

        }
        [AllowAnonymous]
        [HttpPost]
        public IActionResult Login([FromBody]User login)
        {
            IActionResult response = Unauthorized();

            if (login.email == "" || login.password == "")
                return response;

            var user = AuthenticateUser(login);

            if (user != null)
            {
                var tokenString = GenerateJSONWebToken(user);
                response = Ok(new { access_token = tokenString });
            }
            else
            {
                //no se autentico el usuario
                //response = Unauthorized;
            }

            return response;
        }
        private string GenerateJSONWebToken(User userInfo)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            var now = DateTime.UtcNow;
            var claims = new[] {
                new Claim(JwtRegisteredClaimNames.Sub, userInfo.username ),
                new Claim("user_enabled", userInfo.enabled.ToString()),
                 new Claim("role", userInfo.Role.name),
                 new Claim("role_enabled", userInfo.Role.enabled.ToString()),
                new Claim("display_name", userInfo.display_name),
                 new Claim("username", userInfo.username),
                 new Claim("email2", userInfo.email),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Email, userInfo.email),
                new Claim(JwtRegisteredClaimNames.Iat,  ToUnixEpochDate(now).ToString(), ClaimValueTypes.Integer64),
        };

            //var access_token = new JwtSecurityToken(_config["Jwt:Issuer"],
            //  _config["Jwt:Issuer"],
            //  null,
            //  expires: DateTime.Now.AddMinutes(120),
            //  signingCredentials: credentials);

            var access_token = new JwtSecurityToken(_config["Jwt:Issuer"],
             _config["Jwt:Issuer"],
             claims,
             //expires: DateTime.Now.AddMinutes(120),
             expires: DateTime.Now.AddMinutes(GetExpirationMinutes()),
             signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(access_token);
        }

        private double GetExpirationMinutes()
        {
            double res = 60;

            var time = _config["Jwt:ExpirationMinutes"];
            if (!String.IsNullOrEmpty(time))
                res = Double.Parse(time);

            return res;
        }

        private User AuthenticateUser(User login)
        {
            User user = null;

            //Validate the User Credentials  
            //Demo Purpose, I have Passed HardCoded User Information  
            //if (login.email == "alfred")
            //{
            //    user = new User { username = "Alfredo", email = "alfredo.reyes@gmail.com" };
            //}

            user = _repository.ValidateUser(login.email, login.password);


            return user;
        }
        public static long ToUnixEpochDate(DateTime date)
                   => (long)Math.Round((date.ToUniversalTime() - new DateTimeOffset(1970, 1, 1, 0, 0, 0, TimeSpan.Zero)).TotalSeconds);
    }
}