//modificada 11 Marzo
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using WADataAccess.Interfaces;
using WADataAccess;
using WADataAccess.BaseDataAccess;

using Swashbuckle.AspNetCore.Swagger;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using System.Reflection;
using System.IO;

using WAServices.Controllers.Security;

namespace WAServices
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //services.AddCors();
            services.AddCors(o => o.AddPolicy("StkPolicy", builder =>
            {
                builder.AllowAnyOrigin()
                       .AllowAnyMethod()
                       .AllowAnyHeader();
            }));
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
             .AddJwtBearer(options =>
             {
                 options.TokenValidationParameters = new TokenValidationParameters
                 {
                     ValidateIssuer = true,
                     ValidateAudience = true,
                     ValidateLifetime = true,
                     ValidateIssuerSigningKey = true,
                     ValidIssuer = Configuration["Jwt:Issuer"],
                     ValidAudience = Configuration["Jwt:Issuer"],
                     IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["Jwt:Key"]))
                 };
             });

            var connectionString = Configuration["Data:ConnectionString"];
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
            services.AddScoped<ValidationFilterAttribute>();
            //Core No se mueve ---------------------------
            services.AddSingleton<ILoginData, LoginData>(serviceProvider =>
            {
                return new LoginData(connectionString);
            });
            services.AddSingleton<IAccessHelperData, AccessHelperData>(serviceProvider =>
            {
                return new AccessHelperData(connectionString);
            });
            //-------------------------------------------------------
            //-------------------------><----------------------------------------
            //Esto es de la base para la seguridad ------------CORE
            services.AddSingleton<IUserData, UserData>(serviceProvider =>
            {
                return new UserData(connectionString);
            });

            services.AddSingleton<IRoleData, RoleData>(serviceProvider =>
            {
                return new RoleData(connectionString);
            });
            services.AddSingleton<IPermissionData, PermissionData>(serviceProvider =>
            {
                return new PermissionData(connectionString);
            });
            services.AddSingleton<IPermissionAssignmentData, PermissionAssignmentData>(serviceProvider =>
            {
                return new PermissionAssignmentData(connectionString);
            });
            services.AddSingleton<IRolesData, RolesData>(serviceProvider =>
            {
                return new RolesData(connectionString);
            });
            services.AddSingleton<IProfileData, ProfileData>(serviceProvider =>
            {
                return new ProfileData(connectionString);
            });
            //Fidu -----------------------------------------------
            services.AddSingleton<IComiteTecnicoData, ComiteTecnicoData>(serviceProvider =>
            {
                return new ComiteTecnicoData(connectionString);
            });
            services.AddSingleton<IContratoInversionData, ContratoInversionData>(serviceProvider =>
            {
                return new ContratoInversionData(connectionString);
            });
            services.AddSingleton<ICuentaChequesData, CuentaChequesData>(serviceProvider =>
            {
                return new CuentaChequesData(connectionString);
            });
            services.AddSingleton<IFideicomisarioData, FideicomisarioData>(serviceProvider =>
            {
                return new FideicomisarioData(connectionString);
            });
            services.AddSingleton<IFideicomisoData, FideicomisoData>(serviceProvider =>
            {
                return new FideicomisoData(connectionString);
            });
            services.AddSingleton<IFideicomitenteData, FideicomitenteData>(serviceProvider =>
            {
                return new FideicomitenteData(connectionString);
            });
            services.AddSingleton<IKycData, KycData>(serviceProvider =>
            {
                return new KycData(connectionString);
            });
            services.AddSingleton<IParametrosComisionesData, ParametrosComisionesData>(serviceProvider =>
            {
                return new ParametrosComisionesData(connectionString);
            });
            services.AddSingleton<ISubfisoData, SubfisoData>(serviceProvider =>
            {
                return new SubfisoData(connectionString);
            });
            services.AddSingleton<ITerceroData, TerceroData>(serviceProvider =>
            {
                return new TerceroData(connectionString);
            });
            //AdminContenido
            //services.AddSingleton<ICertificacionData, CertificacionData>(serviceProvider =>
            //{
            //    return new CertificacionData(connectionString);
            //});
            //services.AddSingleton<IEventoData, EventoData>(serviceProvider =>
            //{
            //    return new EventoData(connectionString);
            //});
            //services.AddSingleton<IEstudianteData, EstudianteData>(serviceProvider =>
            //{
            //    return new EstudianteData(connectionString);
            //});
            //services.AddSingleton<IExamenData, ExamenData>(serviceProvider =>
            //{
            //    return new ExamenData(connectionString);
            //});
            //services.AddSingleton<IGrupoAData, GrupoAData>(serviceProvider =>
            //{
            //    return new GrupoAData(connectionString);
            //});
            //services.AddSingleton<IInstitucionData, InstitucionData>(serviceProvider =>
            //{
            //    return new InstitucionData(connectionString);
            //});
            //services.AddSingleton<IOpcionData, OpcionData>(serviceProvider =>
            //{
            //    return new OpcionData(connectionString);
            //});
            //services.AddSingleton<IPreguntaData, PreguntaData>(serviceProvider =>
            //{
            //    return new PreguntaData(connectionString);
            //});

            //services.AddSingleton<IProfesorData, ProfesorData>(serviceProvider =>
            //{
            //    return new ProfesorData(connectionString);
            //});
            //services.AddSingleton<IProgramaData, ProgramaData>(serviceProvider =>
            //{
            //    return new ProgramaData(connectionString);
            //});
            //services.AddSingleton<IPublicacionData, PublicacionData>(serviceProvider =>
            //{
            //    return new PublicacionData(connectionString);
            //});
            //services.AddSingleton<IRecursoData, RecursoData>(serviceProvider =>
            //{
            //    return new RecursoData(connectionString);
            //});
            //services.AddSingleton<IRegistroData, RegistroData>(serviceProvider =>
            //{
            //    return new RegistroData(connectionString);
            //});
            //services.AddSingleton<IUnidadData, UnidadData>(serviceProvider =>
            //{
            //    return new UnidadData(connectionString);
            //});
            //--------------------------------------------------------
            //services.AddSingleton<ISubProcesoData, SubProcesoData>(serviceProvider =>
            //{              
            //    return new SubProcesoData(connectionString);
            //});

            //services.AddSingleton<IPaisData, PaisData>(serviceProvider =>
            //{
            //    return new PaisData(connectionString);
            //});

            //services.AddSingleton<IContinenteData, ContinenteData>(serviceProvider =>
            //{
            //    return new ContinenteData(connectionString);
            //});

            //services.AddSingleton<IProcesoData, ProcesoData>(serviceProvider =>
            //{
            //    return new ProcesoData(connectionString);
            //});

            //services.AddSingleton<IDireccionData, DireccionData>(serviceProvider =>
            //{
            //    return new DireccionData(connectionString);
            //});




            // Register the Swagger generator, defining 1 or more Swagger documents
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new Info {
                    Title = "Net Core Web API",
                    Version = "v1",
                    Description = ".NET Core Web API Specification",
                    Contact = new Contact
                    {
                        Name = "Alfredo Reyes C",
                        Email = "alfredo.reyes@softtek.com",
                        Url = "https://www.psg.com/"
                    },
                    License = new License
                    {
                        Name = "Softtek´ Rigths Reserver",
                        Url = "https://www.softtek.com"
                    }
                });

                // Set the comments path for the Swagger JSON and UI.
                var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
                c.IncludeXmlComments(xmlPath);
               
            });

           

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseHsts();
            }

            // Enable middleware to serve generated Swagger as a JSON endpoint.
            app.UseSwagger();

            // Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.), 
            // specifying the Swagger JSON endpoint.
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", ".Net Core Web API V1");
            });

            //app.UseCors();
            //app.UseCors(builder =>
            //    builder.WithOrigins("http://localhost:55294"));
            app.UseCors("StkPolicy");

            app.UseAuthentication();

            app.UseHttpsRedirection();
            app.UseMvc();
        }
    }
}
