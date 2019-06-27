      

--Fecha Creación:5/24/2019 6:13:12 PM Template TableAndStoreds, Author: Alfredo Reyes C., V1

IF OBJECT_ID('[dbo].[Fideicomiso]', 'U') IS NOT NULL 
Drop Table [dbo].[Fideicomiso]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteFideicomiso]') AND type in (N'P', N'PC'))
    Drop Procedure spDeleteFideicomiso
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateFideicomiso]') AND type in (N'P', N'PC'))
    Drop Procedure spUpdateFideicomiso
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdatePartialFideicomiso]') AND type in (N'P', N'PC'))
    Drop Procedure spUpdatePartialFideicomiso
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertFideicomiso]') AND type in (N'P', N'PC'))
    Drop Procedure spInsertFideicomiso
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetListFideicomisoPaged]') AND type in (N'P', N'PC'))
    Drop Procedure spGetListFideicomisoPaged
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetListFideicomisoAndRelationsPaged]') AND type in (N'P', N'PC'))
    Drop Procedure spGetListFideicomisoAndRelationsPaged
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetFideicomisoByID]') AND type in (N'P', N'PC'))
    Drop Procedure spGetFideicomisoByID
GO


-------------------------------------------------//////////////////--------------------------------------------------------------------
----Datos para la seguridad de los servicios
-----------------------------------------------------

-------------------------------------------------//////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:12 PM
--Add Columns to Table must be null 



-------------------------------------------------/////////CREAR TABLA/////////--------------------------------------------------------------------
-------------------------------------------------//////////////////--------------------------------------------------------------------
--CRUD Tabla SQL
Create Table [dbo].[Fideicomiso](
                        [ID] int--%>
                        IDENTITY (1,1)  ,
            
                   
 [GeneralesNumero] int
                NOT NULL ,
       
 [GeneralesNombre] varchar(250)
                NOT NULL ,
       
 [GeneralesAdministrador] varchar(250)
                NOT NULL ,
       
 [GeneralesPromotor] varchar(250)
                NOT NULL ,
       
 [CaracteristicasFormaManejo] varchar(250)
                NOT NULL ,
       
 [CaracteristicasTipoNegocio] varchar(250)
                NOT NULL ,
       
 [CaracteristicasClasificacionProducto] varchar(250)
                NOT NULL ,
       
 [CaracteristicasProductoEstandar] varchar(250)
                NOT NULL ,
       
 [CaracteristicasProducto] varchar(250)
                NOT NULL ,
       
 [CaracteristicasValFatca] varchar(250)
                NOT NULL ,
       
 [CaracteristicasMontoApertura] float
                NULL ,
       
 [CaracteristicasManejoSubFisos] varchar(250)
                NULL ,
       
 [CaracteristicasSujetoArt151] varchar(250)
                NULL ,
       
 [CaracteristicasCerrado] varchar(250)
                NULL ,
       
 [CaracteristicasRevocable] varchar(250)
                NULL ,
       
 [CaracteristicasEsContratoEje] varchar(250)
                NULL ,
       
 [CaracteristicasComiteTecnico] varchar(250)
                NULL ,
       
 [CaracteristicasOfiBanxico] varchar(250)
                NULL ,
       
 [CaracteristicasManejaMonExt] varchar(250)
                NULL ,
       
 [CaracteristicasIvaFronterizo] varchar(250)
                NULL ,
       
 [CaracteristicasFechaAlta] date
                NULL ,
       
 [CaracteristicasFechaConstitucion] date
                NULL ,
       
 [CaracteristicasFechaAprobacion] date
                NULL ,
       
 [CaracteristicasEstado] varchar(250)
                NOT NULL ,
       
 [AdicionalesTipo] varchar(250)
                NULL ,
       
 [AdicionalesTipoPersona] varchar(250)
                NOT NULL ,
       
 [AdicionalesConActividadEmpresarial] varchar(250)
                NULL ,
       
 [AdicionalesPermisoSre] varchar(250)
                NULL ,
       
 [AdicionalesFechaPermisoSre] date
                NULL ,
       
 [AdicionalesProvSustFiduciaria] varchar(250)
                NULL ,
       
 [AdicionalesFondosInterfaseAfore] varchar(250)
                NULL ,
       
 [AdicionalesRegNalInvExt] varchar(250)
                NULL ,
       
 [AdicionalesFechaInscripcion] date
                NULL ,
       
 [AdicionalesFormalizacionContrato] varchar(250)
                NULL ,
       
 [AdicionalesNoEscritura] varchar(250)
                NULL ,
       
 [AdicionalesFechaEscritura] date
                NULL ,
       
 [AdicionalesNombreNotario] varchar(250)
                NULL ,
       
 [AdicionalesNoNotario] varchar(250)
                NULL ,
       
 [AdicionalesCiudadNotario] varchar(250)
                NULL ,
       
 [AdicionalesEstadoNotario] varchar(250)
                NULL ,
       
 [AdicionalesPaisNotario] varchar(250)
                NULL ,
       
 [AdicionalesFolioRegistroPublico] varchar(250)
                NULL ,
       
 [AdicionalesFechaInscripcionRegPublico] date
                NULL ,
       
 [AdicionalesAdministracion] varchar(250)
                NOT NULL ,
       
 [AdicionalesContabilidadDelegada] varchar(250)
                NOT NULL ,
       
 [DatosBanxicoActividadEconomica] varchar(250)
                NULL ,
       
 [DatosBanxicoFiducuario] varchar(250)
                NULL ,
       
 [DatosBanxicoSectorBancario] varchar(250)
                NULL ,
       
 [DatosBanxicoLocalidad] varchar(250)
                NULL ,
       
 [DatosBanxicoCentroResp] varchar(250)
                NULL ,
       
 [DatosBanxicoNoCr] varchar(250)
                NULL ,
       
 [DatosBanxicoRfcContrato] varchar(250)
                NULL ,
       
 [DatosBanxicoNumeroCliente] varchar(250)
                NULL 
       
    CONSTRAINT [PK_Fideicomiso] PRIMARY KEY CLUSTERED
    (
    [ID] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]

GO


---Añadimos lo constraints de ForeignKeys 


-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////////DELETE SP//////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:12 PM
--CRUD Stored Procedures

Create Procedure [dbo].[spDeleteFideicomiso]
    @ID int,
    @ReturnValue int output,
    @numhijos int output
AS
BEGIN
    SET NOCOUNT ON;
    set @numhijos = 0;
                select @numhijos = @numhijos + count(*) from Fideicomisario where Fideicomisario_ID = @ID;
            
      
                select @numhijos = @numhijos + count(*) from Tercero where Tercero_ID = @ID;
            
      
                select @numhijos = @numhijos + count(*) from Subfiso where Subfiso_ID = @ID;
            
      
                select @numhijos = @numhijos + count(*) from ContratoInversion where ContratoInversion_ID = @ID;
            
      
                select @numhijos = @numhijos + count(*) from CuentaCheques where CuentaCheques_ID = @ID;
            
      
        
    if @numhijos > 0
	Begin
		select @ReturnValue = 0;	
	End
	else
		BEGIN TRY
			 delete from Fideicomiso where ID = @ID;
				select @ReturnValue = 1;	
		END TRY
        BEGIN CATCH
        if ERROR_NUMBER()  = 547
    	begin 
    		select @ReturnValue = 0;
            select @numhijos = 1;
    	end
    	else
    		THROW;
	
	
        END CATCH;
        
END

GO
-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------/////////Insert SP/////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:12 PM
-- CRUD Stored Procedures
Create Procedure [dbo].[spInsertFideicomiso]
      @GeneralesNumero int  ,
@GeneralesNombre varchar(250)  ,
@GeneralesAdministrador varchar(250)  ,
@GeneralesPromotor varchar(250)  ,
@CaracteristicasFormaManejo varchar(250)  ,
@CaracteristicasTipoNegocio varchar(250)  ,
@CaracteristicasClasificacionProducto varchar(250)  ,
@CaracteristicasProductoEstandar varchar(250)  ,
@CaracteristicasProducto varchar(250)  ,
@CaracteristicasValFatca varchar(250)  ,
@CaracteristicasMontoApertura float NULL ,
@CaracteristicasManejoSubFisos varchar(250) NULL ,
@CaracteristicasSujetoArt151 varchar(250) NULL ,
@CaracteristicasCerrado varchar(250) NULL ,
@CaracteristicasRevocable varchar(250) NULL ,
@CaracteristicasEsContratoEje varchar(250) NULL ,
@CaracteristicasComiteTecnico varchar(250) NULL ,
@CaracteristicasOfiBanxico varchar(250) NULL ,
@CaracteristicasManejaMonExt varchar(250) NULL ,
@CaracteristicasIvaFronterizo varchar(250) NULL ,
@CaracteristicasFechaAlta date NULL ,
@CaracteristicasFechaConstitucion date NULL ,
@CaracteristicasFechaAprobacion date NULL ,
@CaracteristicasEstado varchar(250)  ,
@AdicionalesTipo varchar(250) NULL ,
@AdicionalesTipoPersona varchar(250)  ,
@AdicionalesConActividadEmpresarial varchar(250) NULL ,
@AdicionalesPermisoSre varchar(250) NULL ,
@AdicionalesFechaPermisoSre date NULL ,
@AdicionalesProvSustFiduciaria varchar(250) NULL ,
@AdicionalesFondosInterfaseAfore varchar(250) NULL ,
@AdicionalesRegNalInvExt varchar(250) NULL ,
@AdicionalesFechaInscripcion date NULL ,
@AdicionalesFormalizacionContrato varchar(250) NULL ,
@AdicionalesNoEscritura varchar(250) NULL ,
@AdicionalesFechaEscritura date NULL ,
@AdicionalesNombreNotario varchar(250) NULL ,
@AdicionalesNoNotario varchar(250) NULL ,
@AdicionalesCiudadNotario varchar(250) NULL ,
@AdicionalesEstadoNotario varchar(250) NULL ,
@AdicionalesPaisNotario varchar(250) NULL ,
@AdicionalesFolioRegistroPublico varchar(250) NULL ,
@AdicionalesFechaInscripcionRegPublico date NULL ,
@AdicionalesAdministracion varchar(250)  ,
@AdicionalesContabilidadDelegada varchar(250)  ,
@DatosBanxicoActividadEconomica varchar(250) NULL ,
@DatosBanxicoFiducuario varchar(250) NULL ,
@DatosBanxicoSectorBancario varchar(250) NULL ,
@DatosBanxicoLocalidad varchar(250) NULL ,
@DatosBanxicoCentroResp varchar(250) NULL ,
@DatosBanxicoNoCr varchar(250) NULL ,
@DatosBanxicoRfcContrato varchar(250) NULL ,
@DatosBanxicoNumeroCliente varchar(250) NULL ,
    @ReturnValue int output
AS
BEGIN
   
    SET NOCOUNT ON;
    Insert into Fideicomiso (
     GeneralesNumero,GeneralesNombre,GeneralesAdministrador,GeneralesPromotor,CaracteristicasFormaManejo,CaracteristicasTipoNegocio,CaracteristicasClasificacionProducto,CaracteristicasProductoEstandar,CaracteristicasProducto,CaracteristicasValFatca,CaracteristicasMontoApertura,CaracteristicasManejoSubFisos,CaracteristicasSujetoArt151,CaracteristicasCerrado,CaracteristicasRevocable,CaracteristicasEsContratoEje,CaracteristicasComiteTecnico,CaracteristicasOfiBanxico,CaracteristicasManejaMonExt,CaracteristicasIvaFronterizo,CaracteristicasFechaAlta,CaracteristicasFechaConstitucion,CaracteristicasFechaAprobacion,CaracteristicasEstado,AdicionalesTipo,AdicionalesTipoPersona,AdicionalesConActividadEmpresarial,AdicionalesPermisoSre,AdicionalesFechaPermisoSre,AdicionalesProvSustFiduciaria,AdicionalesFondosInterfaseAfore,AdicionalesRegNalInvExt,AdicionalesFechaInscripcion,AdicionalesFormalizacionContrato,AdicionalesNoEscritura,AdicionalesFechaEscritura,AdicionalesNombreNotario,AdicionalesNoNotario,AdicionalesCiudadNotario,AdicionalesEstadoNotario,AdicionalesPaisNotario,AdicionalesFolioRegistroPublico,AdicionalesFechaInscripcionRegPublico,AdicionalesAdministracion,AdicionalesContabilidadDelegada,DatosBanxicoActividadEconomica,DatosBanxicoFiducuario,DatosBanxicoSectorBancario,DatosBanxicoLocalidad,DatosBanxicoCentroResp,DatosBanxicoNoCr,DatosBanxicoRfcContrato,DatosBanxicoNumeroCliente
    )     
    values (  
    @GeneralesNumero,@GeneralesNombre,@GeneralesAdministrador,@GeneralesPromotor,@CaracteristicasFormaManejo,@CaracteristicasTipoNegocio,@CaracteristicasClasificacionProducto,@CaracteristicasProductoEstandar,@CaracteristicasProducto,@CaracteristicasValFatca,@CaracteristicasMontoApertura,@CaracteristicasManejoSubFisos,@CaracteristicasSujetoArt151,@CaracteristicasCerrado,@CaracteristicasRevocable,@CaracteristicasEsContratoEje,@CaracteristicasComiteTecnico,@CaracteristicasOfiBanxico,@CaracteristicasManejaMonExt,@CaracteristicasIvaFronterizo,@CaracteristicasFechaAlta,@CaracteristicasFechaConstitucion,@CaracteristicasFechaAprobacion,@CaracteristicasEstado,@AdicionalesTipo,@AdicionalesTipoPersona,@AdicionalesConActividadEmpresarial,@AdicionalesPermisoSre,@AdicionalesFechaPermisoSre,@AdicionalesProvSustFiduciaria,@AdicionalesFondosInterfaseAfore,@AdicionalesRegNalInvExt,@AdicionalesFechaInscripcion,@AdicionalesFormalizacionContrato,@AdicionalesNoEscritura,@AdicionalesFechaEscritura,@AdicionalesNombreNotario,@AdicionalesNoNotario,@AdicionalesCiudadNotario,@AdicionalesEstadoNotario,@AdicionalesPaisNotario,@AdicionalesFolioRegistroPublico,@AdicionalesFechaInscripcionRegPublico,@AdicionalesAdministracion,@AdicionalesContabilidadDelegada,@DatosBanxicoActividadEconomica,@DatosBanxicoFiducuario,@DatosBanxicoSectorBancario,@DatosBanxicoLocalidad,@DatosBanxicoCentroResp,@DatosBanxicoNoCr,@DatosBanxicoRfcContrato,@DatosBanxicoNumeroCliente
    );

		--select @ReturnValue = Max(ID) from Fideicomiso;
        select @ReturnValue = 1;
END

GO

-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////////Update SP//////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:12 PM
-- CRUD Stored Procedures
Create Procedure [dbo].[spUpdateFideicomiso]
      @ID int ,
@GeneralesNumero int ,
@GeneralesNombre varchar(250) ,
@GeneralesAdministrador varchar(250) ,
@GeneralesPromotor varchar(250) ,
@CaracteristicasFormaManejo varchar(250) ,
@CaracteristicasTipoNegocio varchar(250) ,
@CaracteristicasClasificacionProducto varchar(250) ,
@CaracteristicasProductoEstandar varchar(250) ,
@CaracteristicasProducto varchar(250) ,
@CaracteristicasValFatca varchar(250) ,
@CaracteristicasMontoApertura float NULL,
@CaracteristicasManejoSubFisos varchar(250) NULL,
@CaracteristicasSujetoArt151 varchar(250) NULL,
@CaracteristicasCerrado varchar(250) NULL,
@CaracteristicasRevocable varchar(250) NULL,
@CaracteristicasEsContratoEje varchar(250) NULL,
@CaracteristicasComiteTecnico varchar(250) NULL,
@CaracteristicasOfiBanxico varchar(250) NULL,
@CaracteristicasManejaMonExt varchar(250) NULL,
@CaracteristicasIvaFronterizo varchar(250) NULL,
@CaracteristicasFechaAlta date NULL,
@CaracteristicasFechaConstitucion date NULL,
@CaracteristicasFechaAprobacion date NULL,
@CaracteristicasEstado varchar(250) ,
@AdicionalesTipo varchar(250) NULL,
@AdicionalesTipoPersona varchar(250) ,
@AdicionalesConActividadEmpresarial varchar(250) NULL,
@AdicionalesPermisoSre varchar(250) NULL,
@AdicionalesFechaPermisoSre date NULL,
@AdicionalesProvSustFiduciaria varchar(250) NULL,
@AdicionalesFondosInterfaseAfore varchar(250) NULL,
@AdicionalesRegNalInvExt varchar(250) NULL,
@AdicionalesFechaInscripcion date NULL,
@AdicionalesFormalizacionContrato varchar(250) NULL,
@AdicionalesNoEscritura varchar(250) NULL,
@AdicionalesFechaEscritura date NULL,
@AdicionalesNombreNotario varchar(250) NULL,
@AdicionalesNoNotario varchar(250) NULL,
@AdicionalesCiudadNotario varchar(250) NULL,
@AdicionalesEstadoNotario varchar(250) NULL,
@AdicionalesPaisNotario varchar(250) NULL,
@AdicionalesFolioRegistroPublico varchar(250) NULL,
@AdicionalesFechaInscripcionRegPublico date NULL,
@AdicionalesAdministracion varchar(250) ,
@AdicionalesContabilidadDelegada varchar(250) ,
@DatosBanxicoActividadEconomica varchar(250) NULL,
@DatosBanxicoFiducuario varchar(250) NULL,
@DatosBanxicoSectorBancario varchar(250) NULL,
@DatosBanxicoLocalidad varchar(250) NULL,
@DatosBanxicoCentroResp varchar(250) NULL,
@DatosBanxicoNoCr varchar(250) NULL,
@DatosBanxicoRfcContrato varchar(250) NULL,
@DatosBanxicoNumeroCliente varchar(250) NULL,
    @ReturnValue int output
AS
BEGIN
    SET NOCOUNT ON;
    Update Fideicomiso set 
        GeneralesNumero = @GeneralesNumero,GeneralesNombre = @GeneralesNombre,GeneralesAdministrador = @GeneralesAdministrador,GeneralesPromotor = @GeneralesPromotor,CaracteristicasFormaManejo = @CaracteristicasFormaManejo,CaracteristicasTipoNegocio = @CaracteristicasTipoNegocio,CaracteristicasClasificacionProducto = @CaracteristicasClasificacionProducto,CaracteristicasProductoEstandar = @CaracteristicasProductoEstandar,CaracteristicasProducto = @CaracteristicasProducto,CaracteristicasValFatca = @CaracteristicasValFatca,CaracteristicasMontoApertura = @CaracteristicasMontoApertura,CaracteristicasManejoSubFisos = @CaracteristicasManejoSubFisos,CaracteristicasSujetoArt151 = @CaracteristicasSujetoArt151,CaracteristicasCerrado = @CaracteristicasCerrado,CaracteristicasRevocable = @CaracteristicasRevocable,CaracteristicasEsContratoEje = @CaracteristicasEsContratoEje,CaracteristicasComiteTecnico = @CaracteristicasComiteTecnico,CaracteristicasOfiBanxico = @CaracteristicasOfiBanxico,CaracteristicasManejaMonExt = @CaracteristicasManejaMonExt,CaracteristicasIvaFronterizo = @CaracteristicasIvaFronterizo,CaracteristicasFechaAlta = @CaracteristicasFechaAlta,CaracteristicasFechaConstitucion = @CaracteristicasFechaConstitucion,CaracteristicasFechaAprobacion = @CaracteristicasFechaAprobacion,CaracteristicasEstado = @CaracteristicasEstado,AdicionalesTipo = @AdicionalesTipo,AdicionalesTipoPersona = @AdicionalesTipoPersona,AdicionalesConActividadEmpresarial = @AdicionalesConActividadEmpresarial,AdicionalesPermisoSre = @AdicionalesPermisoSre,AdicionalesFechaPermisoSre = @AdicionalesFechaPermisoSre,AdicionalesProvSustFiduciaria = @AdicionalesProvSustFiduciaria,AdicionalesFondosInterfaseAfore = @AdicionalesFondosInterfaseAfore,AdicionalesRegNalInvExt = @AdicionalesRegNalInvExt,AdicionalesFechaInscripcion = @AdicionalesFechaInscripcion,AdicionalesFormalizacionContrato = @AdicionalesFormalizacionContrato,AdicionalesNoEscritura = @AdicionalesNoEscritura,AdicionalesFechaEscritura = @AdicionalesFechaEscritura,AdicionalesNombreNotario = @AdicionalesNombreNotario,AdicionalesNoNotario = @AdicionalesNoNotario,AdicionalesCiudadNotario = @AdicionalesCiudadNotario,AdicionalesEstadoNotario = @AdicionalesEstadoNotario,AdicionalesPaisNotario = @AdicionalesPaisNotario,AdicionalesFolioRegistroPublico = @AdicionalesFolioRegistroPublico,AdicionalesFechaInscripcionRegPublico = @AdicionalesFechaInscripcionRegPublico,AdicionalesAdministracion = @AdicionalesAdministracion,AdicionalesContabilidadDelegada = @AdicionalesContabilidadDelegada,DatosBanxicoActividadEconomica = @DatosBanxicoActividadEconomica,DatosBanxicoFiducuario = @DatosBanxicoFiducuario,DatosBanxicoSectorBancario = @DatosBanxicoSectorBancario,DatosBanxicoLocalidad = @DatosBanxicoLocalidad,DatosBanxicoCentroResp = @DatosBanxicoCentroResp,DatosBanxicoNoCr = @DatosBanxicoNoCr,DatosBanxicoRfcContrato = @DatosBanxicoRfcContrato,DatosBanxicoNumeroCliente = @DatosBanxicoNumeroCliente
    where ID = @ID;

		select @ReturnValue = 1;
END

GO
-------------------------------------------------/////////////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------/////////////Update SP Partial///////////--------------------------------------------------------------------
-------------------------------------------------////////////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:12 PM
-- CRUD Stored Procedures
Create Procedure [dbo].[spUpdatePartialFideicomiso]
      @ID int ,
@GeneralesNumero int ,
@GeneralesNombre varchar(250) ,
@GeneralesAdministrador varchar(250) ,
@GeneralesPromotor varchar(250) ,
@CaracteristicasFormaManejo varchar(250) ,
@CaracteristicasTipoNegocio varchar(250) ,
@CaracteristicasClasificacionProducto varchar(250) ,
@CaracteristicasProductoEstandar varchar(250) ,
@CaracteristicasProducto varchar(250) ,
@CaracteristicasValFatca varchar(250) ,
@CaracteristicasMontoApertura float NULL,
@CaracteristicasManejoSubFisos varchar(250) NULL,
@CaracteristicasSujetoArt151 varchar(250) NULL,
@CaracteristicasCerrado varchar(250) NULL,
@CaracteristicasRevocable varchar(250) NULL,
@CaracteristicasEsContratoEje varchar(250) NULL,
@CaracteristicasComiteTecnico varchar(250) NULL,
@CaracteristicasOfiBanxico varchar(250) NULL,
@CaracteristicasManejaMonExt varchar(250) NULL,
@CaracteristicasIvaFronterizo varchar(250) NULL,
@CaracteristicasFechaAlta date NULL,
@CaracteristicasFechaConstitucion date NULL,
@CaracteristicasFechaAprobacion date NULL,
@CaracteristicasEstado varchar(250) ,
@AdicionalesTipo varchar(250) NULL,
@AdicionalesTipoPersona varchar(250) ,
@AdicionalesConActividadEmpresarial varchar(250) NULL,
@AdicionalesPermisoSre varchar(250) NULL,
@AdicionalesFechaPermisoSre date NULL,
@AdicionalesProvSustFiduciaria varchar(250) NULL,
@AdicionalesFondosInterfaseAfore varchar(250) NULL,
@AdicionalesRegNalInvExt varchar(250) NULL,
@AdicionalesFechaInscripcion date NULL,
@AdicionalesFormalizacionContrato varchar(250) NULL,
@AdicionalesNoEscritura varchar(250) NULL,
@AdicionalesFechaEscritura date NULL,
@AdicionalesNombreNotario varchar(250) NULL,
@AdicionalesNoNotario varchar(250) NULL,
@AdicionalesCiudadNotario varchar(250) NULL,
@AdicionalesEstadoNotario varchar(250) NULL,
@AdicionalesPaisNotario varchar(250) NULL,
@AdicionalesFolioRegistroPublico varchar(250) NULL,
@AdicionalesFechaInscripcionRegPublico date NULL,
@AdicionalesAdministracion varchar(250) ,
@AdicionalesContabilidadDelegada varchar(250) ,
@DatosBanxicoActividadEconomica varchar(250) NULL,
@DatosBanxicoFiducuario varchar(250) NULL,
@DatosBanxicoSectorBancario varchar(250) NULL,
@DatosBanxicoLocalidad varchar(250) NULL,
@DatosBanxicoCentroResp varchar(250) NULL,
@DatosBanxicoNoCr varchar(250) NULL,
@DatosBanxicoRfcContrato varchar(250) NULL,
@DatosBanxicoNumeroCliente varchar(250) NULL,
    @ReturnValue int output
AS
BEGIN
    SET NOCOUNT ON;
    Update Fideicomiso set 
        GeneralesNumero = @GeneralesNumero,GeneralesNombre = @GeneralesNombre,GeneralesAdministrador = @GeneralesAdministrador,GeneralesPromotor = @GeneralesPromotor,CaracteristicasFormaManejo = @CaracteristicasFormaManejo,CaracteristicasTipoNegocio = @CaracteristicasTipoNegocio,CaracteristicasClasificacionProducto = @CaracteristicasClasificacionProducto,CaracteristicasProductoEstandar = @CaracteristicasProductoEstandar,CaracteristicasProducto = @CaracteristicasProducto,CaracteristicasValFatca = @CaracteristicasValFatca,CaracteristicasMontoApertura = @CaracteristicasMontoApertura,CaracteristicasManejoSubFisos = @CaracteristicasManejoSubFisos,CaracteristicasSujetoArt151 = @CaracteristicasSujetoArt151,CaracteristicasCerrado = @CaracteristicasCerrado,CaracteristicasRevocable = @CaracteristicasRevocable,CaracteristicasEsContratoEje = @CaracteristicasEsContratoEje,CaracteristicasComiteTecnico = @CaracteristicasComiteTecnico,CaracteristicasOfiBanxico = @CaracteristicasOfiBanxico,CaracteristicasManejaMonExt = @CaracteristicasManejaMonExt,CaracteristicasIvaFronterizo = @CaracteristicasIvaFronterizo,CaracteristicasFechaAlta = @CaracteristicasFechaAlta,CaracteristicasFechaConstitucion = @CaracteristicasFechaConstitucion,CaracteristicasFechaAprobacion = @CaracteristicasFechaAprobacion,CaracteristicasEstado = @CaracteristicasEstado,AdicionalesTipo = @AdicionalesTipo,AdicionalesTipoPersona = @AdicionalesTipoPersona,AdicionalesConActividadEmpresarial = @AdicionalesConActividadEmpresarial,AdicionalesPermisoSre = @AdicionalesPermisoSre,AdicionalesFechaPermisoSre = @AdicionalesFechaPermisoSre,AdicionalesProvSustFiduciaria = @AdicionalesProvSustFiduciaria,AdicionalesFondosInterfaseAfore = @AdicionalesFondosInterfaseAfore,AdicionalesRegNalInvExt = @AdicionalesRegNalInvExt,AdicionalesFechaInscripcion = @AdicionalesFechaInscripcion,AdicionalesFormalizacionContrato = @AdicionalesFormalizacionContrato,AdicionalesNoEscritura = @AdicionalesNoEscritura,AdicionalesFechaEscritura = @AdicionalesFechaEscritura,AdicionalesNombreNotario = @AdicionalesNombreNotario,AdicionalesNoNotario = @AdicionalesNoNotario,AdicionalesCiudadNotario = @AdicionalesCiudadNotario,AdicionalesEstadoNotario = @AdicionalesEstadoNotario,AdicionalesPaisNotario = @AdicionalesPaisNotario,AdicionalesFolioRegistroPublico = @AdicionalesFolioRegistroPublico,AdicionalesFechaInscripcionRegPublico = @AdicionalesFechaInscripcionRegPublico,AdicionalesAdministracion = @AdicionalesAdministracion,AdicionalesContabilidadDelegada = @AdicionalesContabilidadDelegada,DatosBanxicoActividadEconomica = @DatosBanxicoActividadEconomica,DatosBanxicoFiducuario = @DatosBanxicoFiducuario,DatosBanxicoSectorBancario = @DatosBanxicoSectorBancario,DatosBanxicoLocalidad = @DatosBanxicoLocalidad,DatosBanxicoCentroResp = @DatosBanxicoCentroResp,DatosBanxicoNoCr = @DatosBanxicoNoCr,DatosBanxicoRfcContrato = @DatosBanxicoRfcContrato,DatosBanxicoNumeroCliente = @DatosBanxicoNumeroCliente
    where ID = @ID;

		select @ReturnValue = 1;
END

GO
-------------------------------------------------////////////////////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad Rwlations SP//////////--------------------------------------------------------------------
-------------------------------------------------////////////////////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:12 PM
-- CRUD Stored Procedures spGetListEntidadSQLAndRelationsPaged
Create Procedure [dbo].[spGetListFideicomisoAndRelationsPaged]
     @pagNo int, 
    @pageSize int,
    @sort varchar(50) = '',
	@sortdir varchar(10) = ''
AS
BEGIN

  SET NOCOUNT ON;
   declare @ReturnCount int;
    select @ReturnCount = count(ID) from Fideicomiso;
    
            if @sort = 'Fideicomiso_ID' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.ID
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_ID' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.ID desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
                
            if @sort = '' 
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.ID
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
                 
            if @sort = 'Fideicomiso_GeneralesNumero' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.GeneralesNumero
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_GeneralesNumero' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.GeneralesNumero desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_GeneralesNombre' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.GeneralesNombre
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_GeneralesNombre' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.GeneralesNombre desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_GeneralesAdministrador' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.GeneralesAdministrador
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_GeneralesAdministrador' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.GeneralesAdministrador desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_GeneralesPromotor' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.GeneralesPromotor
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_GeneralesPromotor' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.GeneralesPromotor desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasFormaManejo' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasFormaManejo
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasFormaManejo' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasFormaManejo desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasTipoNegocio' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasTipoNegocio
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasTipoNegocio' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasTipoNegocio desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasClasificacionProducto' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasClasificacionProducto
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasClasificacionProducto' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasClasificacionProducto desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasProductoEstandar' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasProductoEstandar
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasProductoEstandar' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasProductoEstandar desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasProducto' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasProducto
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasProducto' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasProducto desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasValFatca' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasValFatca
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasValFatca' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasValFatca desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasMontoApertura' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasMontoApertura
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasMontoApertura' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasMontoApertura desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasManejoSubFisos' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasManejoSubFisos
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasManejoSubFisos' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasManejoSubFisos desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasSujetoArt151' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasSujetoArt151
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasSujetoArt151' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasSujetoArt151 desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasCerrado' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasCerrado
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasCerrado' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasCerrado desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasRevocable' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasRevocable
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasRevocable' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasRevocable desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasEsContratoEje' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasEsContratoEje
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasEsContratoEje' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasEsContratoEje desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasComiteTecnico' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasComiteTecnico
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasComiteTecnico' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasComiteTecnico desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasOfiBanxico' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasOfiBanxico
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasOfiBanxico' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasOfiBanxico desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasManejaMonExt' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasManejaMonExt
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasManejaMonExt' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasManejaMonExt desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasIvaFronterizo' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasIvaFronterizo
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasIvaFronterizo' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasIvaFronterizo desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasFechaAlta' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasFechaAlta
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasFechaAlta' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasFechaAlta desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasFechaConstitucion' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasFechaConstitucion
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasFechaConstitucion' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasFechaConstitucion desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasFechaAprobacion' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasFechaAprobacion
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasFechaAprobacion' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasFechaAprobacion desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasEstado' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasEstado
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasEstado' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.CaracteristicasEstado desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesTipo' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesTipo
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesTipo' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesTipo desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesTipoPersona' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesTipoPersona
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesTipoPersona' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesTipoPersona desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesConActividadEmpresarial' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesConActividadEmpresarial
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesConActividadEmpresarial' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesConActividadEmpresarial desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesPermisoSre' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesPermisoSre
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesPermisoSre' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesPermisoSre desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesFechaPermisoSre' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesFechaPermisoSre
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesFechaPermisoSre' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesFechaPermisoSre desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesProvSustFiduciaria' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesProvSustFiduciaria
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesProvSustFiduciaria' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesProvSustFiduciaria desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesFondosInterfaseAfore' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesFondosInterfaseAfore
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesFondosInterfaseAfore' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesFondosInterfaseAfore desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesRegNalInvExt' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesRegNalInvExt
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesRegNalInvExt' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesRegNalInvExt desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesFechaInscripcion' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesFechaInscripcion
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesFechaInscripcion' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesFechaInscripcion desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesFormalizacionContrato' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesFormalizacionContrato
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesFormalizacionContrato' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesFormalizacionContrato desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesNoEscritura' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesNoEscritura
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesNoEscritura' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesNoEscritura desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesFechaEscritura' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesFechaEscritura
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesFechaEscritura' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesFechaEscritura desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesNombreNotario' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesNombreNotario
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesNombreNotario' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesNombreNotario desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesNoNotario' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesNoNotario
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesNoNotario' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesNoNotario desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesCiudadNotario' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesCiudadNotario
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesCiudadNotario' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesCiudadNotario desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesEstadoNotario' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesEstadoNotario
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesEstadoNotario' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesEstadoNotario desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesPaisNotario' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesPaisNotario
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesPaisNotario' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesPaisNotario desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesFolioRegistroPublico' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesFolioRegistroPublico
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesFolioRegistroPublico' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesFolioRegistroPublico desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesFechaInscripcionRegPublico' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesFechaInscripcionRegPublico
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesFechaInscripcionRegPublico' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesFechaInscripcionRegPublico desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesAdministracion' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesAdministracion
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesAdministracion' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesAdministracion desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesContabilidadDelegada' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesContabilidadDelegada
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesContabilidadDelegada' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.AdicionalesContabilidadDelegada desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoActividadEconomica' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoActividadEconomica
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoActividadEconomica' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoActividadEconomica desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoFiducuario' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoFiducuario
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoFiducuario' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoFiducuario desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoSectorBancario' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoSectorBancario
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoSectorBancario' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoSectorBancario desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoLocalidad' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoLocalidad
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoLocalidad' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoLocalidad desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoCentroResp' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoCentroResp
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoCentroResp' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoCentroResp desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoNoCr' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoNoCr
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoNoCr' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoNoCr desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoRfcContrato' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoRfcContrato
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoRfcContrato' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoRfcContrato desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoNumeroCliente' and @sortdir = 'ASC'
            Begin
               SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoNumeroCliente
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoNumeroCliente' and @sortdir <> 'ASC'
            Begin
                SELECT Fideicomiso.ID,Fideicomiso.GeneralesNumero,Fideicomiso.GeneralesNombre,Fideicomiso.GeneralesAdministrador,Fideicomiso.GeneralesPromotor,Fideicomiso.CaracteristicasFormaManejo,Fideicomiso.CaracteristicasTipoNegocio,Fideicomiso.CaracteristicasClasificacionProducto,Fideicomiso.CaracteristicasProductoEstandar,Fideicomiso.CaracteristicasProducto,Fideicomiso.CaracteristicasValFatca,Fideicomiso.CaracteristicasMontoApertura,Fideicomiso.CaracteristicasManejoSubFisos,Fideicomiso.CaracteristicasSujetoArt151,Fideicomiso.CaracteristicasCerrado,Fideicomiso.CaracteristicasRevocable,Fideicomiso.CaracteristicasEsContratoEje,Fideicomiso.CaracteristicasComiteTecnico,Fideicomiso.CaracteristicasOfiBanxico,Fideicomiso.CaracteristicasManejaMonExt,Fideicomiso.CaracteristicasIvaFronterizo,Fideicomiso.CaracteristicasFechaAlta,Fideicomiso.CaracteristicasFechaConstitucion,Fideicomiso.CaracteristicasFechaAprobacion,Fideicomiso.CaracteristicasEstado,Fideicomiso.AdicionalesTipo,Fideicomiso.AdicionalesTipoPersona,Fideicomiso.AdicionalesConActividadEmpresarial,Fideicomiso.AdicionalesPermisoSre,Fideicomiso.AdicionalesFechaPermisoSre,Fideicomiso.AdicionalesProvSustFiduciaria,Fideicomiso.AdicionalesFondosInterfaseAfore,Fideicomiso.AdicionalesRegNalInvExt,Fideicomiso.AdicionalesFechaInscripcion,Fideicomiso.AdicionalesFormalizacionContrato,Fideicomiso.AdicionalesNoEscritura,Fideicomiso.AdicionalesFechaEscritura,Fideicomiso.AdicionalesNombreNotario,Fideicomiso.AdicionalesNoNotario,Fideicomiso.AdicionalesCiudadNotario,Fideicomiso.AdicionalesEstadoNotario,Fideicomiso.AdicionalesPaisNotario,Fideicomiso.AdicionalesFolioRegistroPublico,Fideicomiso.AdicionalesFechaInscripcionRegPublico,Fideicomiso.AdicionalesAdministracion,Fideicomiso.AdicionalesContabilidadDelegada,Fideicomiso.DatosBanxicoActividadEconomica,Fideicomiso.DatosBanxicoFiducuario,Fideicomiso.DatosBanxicoSectorBancario,Fideicomiso.DatosBanxicoLocalidad,Fideicomiso.DatosBanxicoCentroResp,Fideicomiso.DatosBanxicoNoCr,Fideicomiso.DatosBanxicoRfcContrato,Fideicomiso.DatosBanxicoNumeroCliente,@ReturnCount as TotalRecords
                FROM Fideicomiso 
                ORDER BY Fideicomiso.DatosBanxicoNumeroCliente desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
 
      
        
END

GO
-------------------------------------------------///////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad//////////--------------------------------------------------------------------
-------------------------------------------------//////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:12 PM
-- CRUD Stored Procedures spGetListEntidadSQLPaged
Create Procedure [dbo].[spGetListFideicomisoPaged]
     @pagNo int, 
    @pageSize int,
    @sort varchar(50) = '',
	@sortdir varchar(10) = ''
AS
BEGIN

 SET NOCOUNT ON;
   declare @ReturnCount int;
    select @ReturnCount = count(ID) from Fideicomiso;
    
            if @sort = 'Fideicomiso_ID' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY ID 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_ID' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY ID desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
                if @sort = ''
                Begin
                   SELECT *,@ReturnCount as TotalRecords
                    FROM Fideicomiso
                    ORDER BY ID 
                    OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                    FETCH NEXT @pageSize  ROWS ONLY;

              End
            if @sort = 'Fideicomiso_GeneralesNumero' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY GeneralesNumero 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_GeneralesNumero' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY GeneralesNumero desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_GeneralesNombre' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY GeneralesNombre 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_GeneralesNombre' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY GeneralesNombre desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_GeneralesAdministrador' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY GeneralesAdministrador 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_GeneralesAdministrador' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY GeneralesAdministrador desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_GeneralesPromotor' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY GeneralesPromotor 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_GeneralesPromotor' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY GeneralesPromotor desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasFormaManejo' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasFormaManejo 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasFormaManejo' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasFormaManejo desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasTipoNegocio' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasTipoNegocio 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasTipoNegocio' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasTipoNegocio desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasClasificacionProducto' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasClasificacionProducto 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasClasificacionProducto' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasClasificacionProducto desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasProductoEstandar' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasProductoEstandar 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasProductoEstandar' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasProductoEstandar desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasProducto' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasProducto 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasProducto' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasProducto desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasValFatca' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasValFatca 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasValFatca' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasValFatca desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasMontoApertura' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasMontoApertura 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasMontoApertura' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasMontoApertura desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasManejoSubFisos' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasManejoSubFisos 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasManejoSubFisos' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasManejoSubFisos desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasSujetoArt151' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasSujetoArt151 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasSujetoArt151' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasSujetoArt151 desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasCerrado' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasCerrado 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasCerrado' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasCerrado desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasRevocable' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasRevocable 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasRevocable' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasRevocable desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasEsContratoEje' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasEsContratoEje 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasEsContratoEje' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasEsContratoEje desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasComiteTecnico' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasComiteTecnico 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasComiteTecnico' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasComiteTecnico desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasOfiBanxico' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasOfiBanxico 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasOfiBanxico' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasOfiBanxico desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasManejaMonExt' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasManejaMonExt 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasManejaMonExt' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasManejaMonExt desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasIvaFronterizo' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasIvaFronterizo 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasIvaFronterizo' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasIvaFronterizo desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasFechaAlta' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasFechaAlta 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasFechaAlta' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasFechaAlta desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasFechaConstitucion' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasFechaConstitucion 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasFechaConstitucion' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasFechaConstitucion desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasFechaAprobacion' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasFechaAprobacion 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasFechaAprobacion' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasFechaAprobacion desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_CaracteristicasEstado' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasEstado 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_CaracteristicasEstado' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY CaracteristicasEstado desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesTipo' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesTipo 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesTipo' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesTipo desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesTipoPersona' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesTipoPersona 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesTipoPersona' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesTipoPersona desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesConActividadEmpresarial' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesConActividadEmpresarial 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesConActividadEmpresarial' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesConActividadEmpresarial desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesPermisoSre' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesPermisoSre 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesPermisoSre' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesPermisoSre desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesFechaPermisoSre' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesFechaPermisoSre 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesFechaPermisoSre' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesFechaPermisoSre desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesProvSustFiduciaria' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesProvSustFiduciaria 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesProvSustFiduciaria' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesProvSustFiduciaria desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesFondosInterfaseAfore' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesFondosInterfaseAfore 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesFondosInterfaseAfore' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesFondosInterfaseAfore desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesRegNalInvExt' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesRegNalInvExt 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesRegNalInvExt' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesRegNalInvExt desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesFechaInscripcion' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesFechaInscripcion 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesFechaInscripcion' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesFechaInscripcion desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesFormalizacionContrato' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesFormalizacionContrato 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesFormalizacionContrato' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesFormalizacionContrato desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesNoEscritura' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesNoEscritura 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesNoEscritura' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesNoEscritura desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesFechaEscritura' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesFechaEscritura 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesFechaEscritura' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesFechaEscritura desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesNombreNotario' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesNombreNotario 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesNombreNotario' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesNombreNotario desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesNoNotario' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesNoNotario 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesNoNotario' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesNoNotario desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesCiudadNotario' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesCiudadNotario 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesCiudadNotario' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesCiudadNotario desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesEstadoNotario' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesEstadoNotario 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesEstadoNotario' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesEstadoNotario desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesPaisNotario' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesPaisNotario 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesPaisNotario' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesPaisNotario desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesFolioRegistroPublico' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesFolioRegistroPublico 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesFolioRegistroPublico' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesFolioRegistroPublico desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesFechaInscripcionRegPublico' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesFechaInscripcionRegPublico 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesFechaInscripcionRegPublico' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesFechaInscripcionRegPublico desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesAdministracion' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesAdministracion 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesAdministracion' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesAdministracion desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_AdicionalesContabilidadDelegada' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesContabilidadDelegada 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_AdicionalesContabilidadDelegada' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY AdicionalesContabilidadDelegada desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoActividadEconomica' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoActividadEconomica 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoActividadEconomica' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoActividadEconomica desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoFiducuario' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoFiducuario 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoFiducuario' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoFiducuario desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoSectorBancario' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoSectorBancario 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoSectorBancario' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoSectorBancario desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoLocalidad' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoLocalidad 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoLocalidad' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoLocalidad desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoCentroResp' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoCentroResp 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoCentroResp' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoCentroResp desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoNoCr' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoNoCr 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoNoCr' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoNoCr desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoRfcContrato' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoRfcContrato 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoRfcContrato' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoRfcContrato desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Fideicomiso_DatosBanxicoNumeroCliente' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoNumeroCliente 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Fideicomiso_DatosBanxicoNumeroCliente' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Fideicomiso
                ORDER BY DatosBanxicoNumeroCliente desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
 
      
        
END

GO


-------------------------------------------------///////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad BY ID SP//////////--------------------------------------------------------------------
-------------------------------------------------//////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:12 PM
-- CRUD Stored Procedures spGetListEntidadById
Create Procedure [dbo].[spGetFideicomisoByID] 
@ID int
AS
BEGIN
    SET NOCOUNT ON;
    select  
   Fideicomiso.ID ,
Fideicomiso.GeneralesNumero ,
Fideicomiso.GeneralesNombre ,
Fideicomiso.GeneralesAdministrador ,
Fideicomiso.GeneralesPromotor ,
Fideicomiso.CaracteristicasFormaManejo ,
Fideicomiso.CaracteristicasTipoNegocio ,
Fideicomiso.CaracteristicasClasificacionProducto ,
Fideicomiso.CaracteristicasProductoEstandar ,
Fideicomiso.CaracteristicasProducto ,
Fideicomiso.CaracteristicasValFatca ,
Fideicomiso.CaracteristicasMontoApertura ,
Fideicomiso.CaracteristicasManejoSubFisos ,
Fideicomiso.CaracteristicasSujetoArt151 ,
Fideicomiso.CaracteristicasCerrado ,
Fideicomiso.CaracteristicasRevocable ,
Fideicomiso.CaracteristicasEsContratoEje ,
Fideicomiso.CaracteristicasComiteTecnico ,
Fideicomiso.CaracteristicasOfiBanxico ,
Fideicomiso.CaracteristicasManejaMonExt ,
Fideicomiso.CaracteristicasIvaFronterizo ,
Fideicomiso.CaracteristicasFechaAlta ,
Fideicomiso.CaracteristicasFechaConstitucion ,
Fideicomiso.CaracteristicasFechaAprobacion ,
Fideicomiso.CaracteristicasEstado ,
Fideicomiso.AdicionalesTipo ,
Fideicomiso.AdicionalesTipoPersona ,
Fideicomiso.AdicionalesConActividadEmpresarial ,
Fideicomiso.AdicionalesPermisoSre ,
Fideicomiso.AdicionalesFechaPermisoSre ,
Fideicomiso.AdicionalesProvSustFiduciaria ,
Fideicomiso.AdicionalesFondosInterfaseAfore ,
Fideicomiso.AdicionalesRegNalInvExt ,
Fideicomiso.AdicionalesFechaInscripcion ,
Fideicomiso.AdicionalesFormalizacionContrato ,
Fideicomiso.AdicionalesNoEscritura ,
Fideicomiso.AdicionalesFechaEscritura ,
Fideicomiso.AdicionalesNombreNotario ,
Fideicomiso.AdicionalesNoNotario ,
Fideicomiso.AdicionalesCiudadNotario ,
Fideicomiso.AdicionalesEstadoNotario ,
Fideicomiso.AdicionalesPaisNotario ,
Fideicomiso.AdicionalesFolioRegistroPublico ,
Fideicomiso.AdicionalesFechaInscripcionRegPublico ,
Fideicomiso.AdicionalesAdministracion ,
Fideicomiso.AdicionalesContabilidadDelegada ,
Fideicomiso.DatosBanxicoActividadEconomica ,
Fideicomiso.DatosBanxicoFiducuario ,
Fideicomiso.DatosBanxicoSectorBancario ,
Fideicomiso.DatosBanxicoLocalidad ,
Fideicomiso.DatosBanxicoCentroResp ,
Fideicomiso.DatosBanxicoNoCr ,
Fideicomiso.DatosBanxicoRfcContrato ,
Fideicomiso.DatosBanxicoNumeroCliente 
             from Fideicomiso 
    where Fideicomiso.ID = @ID;

		
END

GO







