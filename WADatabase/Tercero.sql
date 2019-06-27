      

--Fecha Creación:5/24/2019 6:13:42 PM Template TableAndStoreds, Author: Alfredo Reyes C., V1

IF OBJECT_ID('[dbo].[Tercero]', 'U') IS NOT NULL 
Drop Table [dbo].[Tercero]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteTercero]') AND type in (N'P', N'PC'))
    Drop Procedure spDeleteTercero
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateTercero]') AND type in (N'P', N'PC'))
    Drop Procedure spUpdateTercero
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdatePartialTercero]') AND type in (N'P', N'PC'))
    Drop Procedure spUpdatePartialTercero
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertTercero]') AND type in (N'P', N'PC'))
    Drop Procedure spInsertTercero
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetListTerceroPaged]') AND type in (N'P', N'PC'))
    Drop Procedure spGetListTerceroPaged
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetListTerceroAndRelationsPaged]') AND type in (N'P', N'PC'))
    Drop Procedure spGetListTerceroAndRelationsPaged
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetTerceroByID]') AND type in (N'P', N'PC'))
    Drop Procedure spGetTerceroByID
GO


-------------------------------------------------//////////////////--------------------------------------------------------------------
----Datos para la seguridad de los servicios
-----------------------------------------------------

-------------------------------------------------//////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:42 PM
--Add Columns to Table must be null 



-------------------------------------------------/////////CREAR TABLA/////////--------------------------------------------------------------------
-------------------------------------------------//////////////////--------------------------------------------------------------------
--CRUD Tabla SQL
Create Table [dbo].[Tercero](
                        [ID] int--%>
                        IDENTITY (1,1)  ,
            
                   
 [Fideicomiso] int
                NOT NULL ,
       
 [NoTercero] int
                NOT NULL ,
       
 [RazonSocial] varchar(250)
                NOT NULL ,
       
 [Nacionalidad] varchar(250)
                NOT NULL ,
       
 [ActividadEconomica] varchar(250)
                NULL ,
       
 [LadaCasa] varchar(250)
                NULL ,
       
 [LadaOficina] varchar(250)
                NULL ,
       
 [LadaFax] varchar(250)
                NULL ,
       
 [TelefonoCasa] varchar(250)
                NULL ,
       
 [TelefonoOficina] varchar(250)
                NULL ,
       
 [TelefonoFax] varchar(250)
                NULL ,
       
 [ExtOficina] varchar(250)
                NULL ,
       
 [ExtFax] varchar(250)
                NULL ,
       
 [Estatus] varchar(250)
                NOT NULL ,
       
 [FechaVerFircosoft] date
                NULL ,
       
 [TipoPersona] varchar(250)
                NOT NULL ,
       
 [Rfc] varchar(250)
                NULL ,
       
 [Correo] varchar(250)
                NULL ,
       
 [CalidaMigratoria] varchar(250)
                NULL 
       
    CONSTRAINT [PK_Tercero] PRIMARY KEY CLUSTERED
    (
    [ID] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]

GO


---Añadimos lo constraints de ForeignKeys 
        ALTER TABLE [dbo].[Tercero]  WITH CHECK ADD FOREIGN KEY([Fideicomiso])
        REFERENCES [dbo].[Fideicomiso] ([ID])
        GO


-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////////DELETE SP//////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:42 PM
--CRUD Stored Procedures

Create Procedure [dbo].[spDeleteTercero]
    @ID int,
    @ReturnValue int output,
    @numhijos int output
AS
BEGIN
    SET NOCOUNT ON;
    set @numhijos = 0;
      
        
    if @numhijos > 0
	Begin
		select @ReturnValue = 0;	
	End
	else
		BEGIN TRY
			 delete from Tercero where ID = @ID;
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
--Fecha Creación:5/24/2019 6:13:42 PM
-- CRUD Stored Procedures
Create Procedure [dbo].[spInsertTercero]
      @Fideicomiso int  ,
@NoTercero int  ,
@RazonSocial varchar(250)  ,
@Nacionalidad varchar(250)  ,
@ActividadEconomica varchar(250) NULL ,
@LadaCasa varchar(250) NULL ,
@LadaOficina varchar(250) NULL ,
@LadaFax varchar(250) NULL ,
@TelefonoCasa varchar(250) NULL ,
@TelefonoOficina varchar(250) NULL ,
@TelefonoFax varchar(250) NULL ,
@ExtOficina varchar(250) NULL ,
@ExtFax varchar(250) NULL ,
@Estatus varchar(250)  ,
@FechaVerFircosoft date NULL ,
@TipoPersona varchar(250)  ,
@Rfc varchar(250) NULL ,
@Correo varchar(250) NULL ,
@CalidaMigratoria varchar(250) NULL ,
    @ReturnValue int output
AS
BEGIN
   
    SET NOCOUNT ON;
    Insert into Tercero (
     Fideicomiso,NoTercero,RazonSocial,Nacionalidad,ActividadEconomica,LadaCasa,LadaOficina,LadaFax,TelefonoCasa,TelefonoOficina,TelefonoFax,ExtOficina,ExtFax,Estatus,FechaVerFircosoft,TipoPersona,Rfc,Correo,CalidaMigratoria
    )     
    values (  
    @Fideicomiso,@NoTercero,@RazonSocial,@Nacionalidad,@ActividadEconomica,@LadaCasa,@LadaOficina,@LadaFax,@TelefonoCasa,@TelefonoOficina,@TelefonoFax,@ExtOficina,@ExtFax,@Estatus,@FechaVerFircosoft,@TipoPersona,@Rfc,@Correo,@CalidaMigratoria
    );

		--select @ReturnValue = Max(ID) from Tercero;
        select @ReturnValue = 1;
END

GO

-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////////Update SP//////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:42 PM
-- CRUD Stored Procedures
Create Procedure [dbo].[spUpdateTercero]
      @ID int ,
@Fideicomiso int ,
@NoTercero int ,
@RazonSocial varchar(250) ,
@Nacionalidad varchar(250) ,
@ActividadEconomica varchar(250) NULL,
@LadaCasa varchar(250) NULL,
@LadaOficina varchar(250) NULL,
@LadaFax varchar(250) NULL,
@TelefonoCasa varchar(250) NULL,
@TelefonoOficina varchar(250) NULL,
@TelefonoFax varchar(250) NULL,
@ExtOficina varchar(250) NULL,
@ExtFax varchar(250) NULL,
@Estatus varchar(250) ,
@FechaVerFircosoft date NULL,
@TipoPersona varchar(250) ,
@Rfc varchar(250) NULL,
@Correo varchar(250) NULL,
@CalidaMigratoria varchar(250) NULL,
    @ReturnValue int output
AS
BEGIN
    SET NOCOUNT ON;
    Update Tercero set 
        Fideicomiso = @Fideicomiso,NoTercero = @NoTercero,RazonSocial = @RazonSocial,Nacionalidad = @Nacionalidad,ActividadEconomica = @ActividadEconomica,LadaCasa = @LadaCasa,LadaOficina = @LadaOficina,LadaFax = @LadaFax,TelefonoCasa = @TelefonoCasa,TelefonoOficina = @TelefonoOficina,TelefonoFax = @TelefonoFax,ExtOficina = @ExtOficina,ExtFax = @ExtFax,Estatus = @Estatus,FechaVerFircosoft = @FechaVerFircosoft,TipoPersona = @TipoPersona,Rfc = @Rfc,Correo = @Correo,CalidaMigratoria = @CalidaMigratoria
    where ID = @ID;

		select @ReturnValue = 1;
END

GO
-------------------------------------------------/////////////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------/////////////Update SP Partial///////////--------------------------------------------------------------------
-------------------------------------------------////////////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:42 PM
-- CRUD Stored Procedures
Create Procedure [dbo].[spUpdatePartialTercero]
      @ID int ,
@Fideicomiso int ,
@NoTercero int ,
@RazonSocial varchar(250) ,
@Nacionalidad varchar(250) ,
@ActividadEconomica varchar(250) NULL,
@LadaCasa varchar(250) NULL,
@LadaOficina varchar(250) NULL,
@LadaFax varchar(250) NULL,
@TelefonoCasa varchar(250) NULL,
@TelefonoOficina varchar(250) NULL,
@TelefonoFax varchar(250) NULL,
@ExtOficina varchar(250) NULL,
@ExtFax varchar(250) NULL,
@Estatus varchar(250) ,
@FechaVerFircosoft date NULL,
@TipoPersona varchar(250) ,
@Rfc varchar(250) NULL,
@Correo varchar(250) NULL,
@CalidaMigratoria varchar(250) NULL,
    @ReturnValue int output
AS
BEGIN
    SET NOCOUNT ON;
    Update Tercero set 
        Fideicomiso = @Fideicomiso,NoTercero = @NoTercero,RazonSocial = @RazonSocial,Nacionalidad = @Nacionalidad,ActividadEconomica = @ActividadEconomica,LadaCasa = @LadaCasa,LadaOficina = @LadaOficina,LadaFax = @LadaFax,TelefonoCasa = @TelefonoCasa,TelefonoOficina = @TelefonoOficina,TelefonoFax = @TelefonoFax,ExtOficina = @ExtOficina,ExtFax = @ExtFax,Estatus = @Estatus,FechaVerFircosoft = @FechaVerFircosoft,TipoPersona = @TipoPersona,Rfc = @Rfc,Correo = @Correo,CalidaMigratoria = @CalidaMigratoria
    where ID = @ID;

		select @ReturnValue = 1;
END

GO
-------------------------------------------------////////////////////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad Rwlations SP//////////--------------------------------------------------------------------
-------------------------------------------------////////////////////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:42 PM
-- CRUD Stored Procedures spGetListEntidadSQLAndRelationsPaged
Create Procedure [dbo].[spGetListTerceroAndRelationsPaged]
     @pagNo int, 
    @pageSize int,
    @sort varchar(50) = '',
	@sortdir varchar(10) = ''
AS
BEGIN

  SET NOCOUNT ON;
   declare @ReturnCount int;
    select @ReturnCount = count(ID) from Tercero;
    
            if @sort = 'Tercero_ID' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.ID
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_ID' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.ID desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
                
            if @sort = '' 
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.ID
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
                 
            if @sort = 'MyFideicomiso1.Fideicomiso_GeneralesNumero' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Fideicomiso1.GeneralesNumero
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'MyFideicomiso1.Fideicomiso_GeneralesNumero' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Fideicomiso1.GeneralesNumero desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_NoTercero' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.NoTercero
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_NoTercero' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.NoTercero desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_RazonSocial' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.RazonSocial
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_RazonSocial' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.RazonSocial desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_Nacionalidad' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.Nacionalidad
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_Nacionalidad' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.Nacionalidad desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_ActividadEconomica' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.ActividadEconomica
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_ActividadEconomica' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.ActividadEconomica desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_LadaCasa' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.LadaCasa
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_LadaCasa' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.LadaCasa desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_LadaOficina' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.LadaOficina
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_LadaOficina' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.LadaOficina desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_LadaFax' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.LadaFax
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_LadaFax' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.LadaFax desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_TelefonoCasa' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.TelefonoCasa
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_TelefonoCasa' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.TelefonoCasa desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_TelefonoOficina' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.TelefonoOficina
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_TelefonoOficina' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.TelefonoOficina desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_TelefonoFax' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.TelefonoFax
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_TelefonoFax' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.TelefonoFax desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_ExtOficina' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.ExtOficina
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_ExtOficina' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.ExtOficina desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_ExtFax' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.ExtFax
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_ExtFax' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.ExtFax desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_Estatus' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.Estatus
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_Estatus' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.Estatus desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_FechaVerFircosoft' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.FechaVerFircosoft
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_FechaVerFircosoft' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.FechaVerFircosoft desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_TipoPersona' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.TipoPersona
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_TipoPersona' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.TipoPersona desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_Rfc' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.Rfc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_Rfc' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.Rfc desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_Correo' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.Correo
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_Correo' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.Correo desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_CalidaMigratoria' and @sortdir = 'ASC'
            Begin
               SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.CalidaMigratoria
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_CalidaMigratoria' and @sortdir <> 'ASC'
            Begin
                SELECT Tercero.ID,Tercero.Fideicomiso,Tercero.NoTercero,Tercero.RazonSocial,Tercero.Nacionalidad,Tercero.ActividadEconomica,Tercero.LadaCasa,Tercero.LadaOficina,Tercero.LadaFax,Tercero.TelefonoCasa,Tercero.TelefonoOficina,Tercero.TelefonoFax,Tercero.ExtOficina,Tercero.ExtFax,Tercero.Estatus,Tercero.FechaVerFircosoft,Tercero.TipoPersona,Tercero.Rfc,Tercero.Correo,Tercero.CalidaMigratoria,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

                ORDER BY Tercero.CalidaMigratoria desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
 
      
        
END

GO
-------------------------------------------------///////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad//////////--------------------------------------------------------------------
-------------------------------------------------//////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:42 PM
-- CRUD Stored Procedures spGetListEntidadSQLPaged
Create Procedure [dbo].[spGetListTerceroPaged]
     @pagNo int, 
    @pageSize int,
    @sort varchar(50) = '',
	@sortdir varchar(10) = ''
AS
BEGIN

 SET NOCOUNT ON;
   declare @ReturnCount int;
    select @ReturnCount = count(ID) from Tercero;
    
            if @sort = 'Tercero_ID' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY ID 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_ID' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY ID desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
                if @sort = ''
                Begin
                   SELECT *,@ReturnCount as TotalRecords
                    FROM Tercero
                    ORDER BY ID 
                    OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                    FETCH NEXT @pageSize  ROWS ONLY;

              End
            if @sort = 'Tercero_Fideicomiso' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY Fideicomiso 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_Fideicomiso' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY Fideicomiso desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_NoTercero' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY NoTercero 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_NoTercero' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY NoTercero desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_RazonSocial' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY RazonSocial 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_RazonSocial' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY RazonSocial desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_Nacionalidad' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY Nacionalidad 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_Nacionalidad' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY Nacionalidad desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_ActividadEconomica' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY ActividadEconomica 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_ActividadEconomica' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY ActividadEconomica desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_LadaCasa' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY LadaCasa 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_LadaCasa' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY LadaCasa desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_LadaOficina' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY LadaOficina 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_LadaOficina' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY LadaOficina desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_LadaFax' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY LadaFax 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_LadaFax' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY LadaFax desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_TelefonoCasa' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY TelefonoCasa 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_TelefonoCasa' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY TelefonoCasa desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_TelefonoOficina' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY TelefonoOficina 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_TelefonoOficina' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY TelefonoOficina desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_TelefonoFax' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY TelefonoFax 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_TelefonoFax' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY TelefonoFax desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_ExtOficina' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY ExtOficina 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_ExtOficina' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY ExtOficina desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_ExtFax' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY ExtFax 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_ExtFax' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY ExtFax desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_Estatus' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY Estatus 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_Estatus' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY Estatus desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_FechaVerFircosoft' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY FechaVerFircosoft 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_FechaVerFircosoft' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY FechaVerFircosoft desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_TipoPersona' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY TipoPersona 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_TipoPersona' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY TipoPersona desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_Rfc' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY Rfc 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_Rfc' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY Rfc desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_Correo' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY Correo 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_Correo' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY Correo desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Tercero_CalidaMigratoria' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY CalidaMigratoria 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Tercero_CalidaMigratoria' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Tercero
                ORDER BY CalidaMigratoria desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
 
      
        
END

GO


-------------------------------------------------///////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad BY ID SP//////////--------------------------------------------------------------------
-------------------------------------------------//////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:42 PM
-- CRUD Stored Procedures spGetListEntidadById
Create Procedure [dbo].[spGetTerceroByID] 
@ID int
AS
BEGIN
    SET NOCOUNT ON;
    select  
   Tercero.ID ,
Tercero.Fideicomiso ,
Tercero.NoTercero ,
Tercero.RazonSocial ,
Tercero.Nacionalidad ,
Tercero.ActividadEconomica ,
Tercero.LadaCasa ,
Tercero.LadaOficina ,
Tercero.LadaFax ,
Tercero.TelefonoCasa ,
Tercero.TelefonoOficina ,
Tercero.TelefonoFax ,
Tercero.ExtOficina ,
Tercero.ExtFax ,
Tercero.Estatus ,
Tercero.FechaVerFircosoft ,
Tercero.TipoPersona ,
Tercero.Rfc ,
Tercero.Correo ,
Tercero.CalidaMigratoria 
         , Fideicomiso1.GeneralesNumero as GeneralesNumero1
    from Tercero  left join Fideicomiso as Fideicomiso1 on Tercero.Fideicomiso = Fideicomiso1.ID

    where Tercero.ID = @ID;

		
END

GO







