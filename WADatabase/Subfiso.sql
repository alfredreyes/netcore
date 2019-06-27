      

--Fecha Creación:5/24/2019 6:13:36 PM Template TableAndStoreds, Author: Alfredo Reyes C., V1

IF OBJECT_ID('[dbo].[Subfiso]', 'U') IS NOT NULL 
Drop Table [dbo].[Subfiso]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteSubfiso]') AND type in (N'P', N'PC'))
    Drop Procedure spDeleteSubfiso
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateSubfiso]') AND type in (N'P', N'PC'))
    Drop Procedure spUpdateSubfiso
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdatePartialSubfiso]') AND type in (N'P', N'PC'))
    Drop Procedure spUpdatePartialSubfiso
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertSubfiso]') AND type in (N'P', N'PC'))
    Drop Procedure spInsertSubfiso
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetListSubfisoPaged]') AND type in (N'P', N'PC'))
    Drop Procedure spGetListSubfisoPaged
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetListSubfisoAndRelationsPaged]') AND type in (N'P', N'PC'))
    Drop Procedure spGetListSubfisoAndRelationsPaged
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetSubfisoByID]') AND type in (N'P', N'PC'))
    Drop Procedure spGetSubfisoByID
GO


-------------------------------------------------//////////////////--------------------------------------------------------------------
----Datos para la seguridad de los servicios
-----------------------------------------------------

-------------------------------------------------//////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:36 PM
--Add Columns to Table must be null 



-------------------------------------------------/////////CREAR TABLA/////////--------------------------------------------------------------------
-------------------------------------------------//////////////////--------------------------------------------------------------------
--CRUD Tabla SQL
Create Table [dbo].[Subfiso](
                        [ID] int--%>
                        IDENTITY (1,1)  ,
            
                   
 [Fideicomiso] int
                NOT NULL ,
       
 [Numero] int
                NOT NULL ,
       
 [Nombre] varchar(250)
                NOT NULL ,
       
 [Estatus] varchar(250)
                NOT NULL ,
       
 [FechaRegistro] date
                NOT NULL ,
       
 [Identificador] varchar(250)
                NULL 
       
    CONSTRAINT [PK_Subfiso] PRIMARY KEY CLUSTERED
    (
    [ID] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]

GO


---Añadimos lo constraints de ForeignKeys 
        ALTER TABLE [dbo].[Subfiso]  WITH CHECK ADD FOREIGN KEY([Fideicomiso])
        REFERENCES [dbo].[Fideicomiso] ([ID])
        GO


-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////////DELETE SP//////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:36 PM
--CRUD Stored Procedures

Create Procedure [dbo].[spDeleteSubfiso]
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
			 delete from Subfiso where ID = @ID;
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
--Fecha Creación:5/24/2019 6:13:36 PM
-- CRUD Stored Procedures
Create Procedure [dbo].[spInsertSubfiso]
      @Fideicomiso int  ,
@Numero int  ,
@Nombre varchar(250)  ,
@Estatus varchar(250)  ,
@FechaRegistro date  ,
@Identificador varchar(250) NULL ,
    @ReturnValue int output
AS
BEGIN
   
    SET NOCOUNT ON;
    Insert into Subfiso (
     Fideicomiso,Numero,Nombre,Estatus,FechaRegistro,Identificador
    )     
    values (  
    @Fideicomiso,@Numero,@Nombre,@Estatus,@FechaRegistro,@Identificador
    );

		--select @ReturnValue = Max(ID) from Subfiso;
        select @ReturnValue = 1;
END

GO

-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////////Update SP//////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:36 PM
-- CRUD Stored Procedures
Create Procedure [dbo].[spUpdateSubfiso]
      @ID int ,
@Fideicomiso int ,
@Numero int ,
@Nombre varchar(250) ,
@Estatus varchar(250) ,
@FechaRegistro date ,
@Identificador varchar(250) NULL,
    @ReturnValue int output
AS
BEGIN
    SET NOCOUNT ON;
    Update Subfiso set 
        Fideicomiso = @Fideicomiso,Numero = @Numero,Nombre = @Nombre,Estatus = @Estatus,FechaRegistro = @FechaRegistro,Identificador = @Identificador
    where ID = @ID;

		select @ReturnValue = 1;
END

GO
-------------------------------------------------/////////////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------/////////////Update SP Partial///////////--------------------------------------------------------------------
-------------------------------------------------////////////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:36 PM
-- CRUD Stored Procedures
Create Procedure [dbo].[spUpdatePartialSubfiso]
      @ID int ,
@Fideicomiso int ,
@Numero int ,
@Nombre varchar(250) ,
@Estatus varchar(250) ,
@FechaRegistro date ,
@Identificador varchar(250) NULL,
    @ReturnValue int output
AS
BEGIN
    SET NOCOUNT ON;
    Update Subfiso set 
        Fideicomiso = @Fideicomiso,Numero = @Numero,Nombre = @Nombre,Estatus = @Estatus,FechaRegistro = @FechaRegistro,Identificador = @Identificador
    where ID = @ID;

		select @ReturnValue = 1;
END

GO
-------------------------------------------------////////////////////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad Rwlations SP//////////--------------------------------------------------------------------
-------------------------------------------------////////////////////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:36 PM
-- CRUD Stored Procedures spGetListEntidadSQLAndRelationsPaged
Create Procedure [dbo].[spGetListSubfisoAndRelationsPaged]
     @pagNo int, 
    @pageSize int,
    @sort varchar(50) = '',
	@sortdir varchar(10) = ''
AS
BEGIN

  SET NOCOUNT ON;
   declare @ReturnCount int;
    select @ReturnCount = count(ID) from Subfiso;
    
            if @sort = 'Subfiso_ID' and @sortdir = 'ASC'
            Begin
               SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Subfiso.ID
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Subfiso_ID' and @sortdir <> 'ASC'
            Begin
                SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Subfiso.ID desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
                
            if @sort = '' 
            Begin
               SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Subfiso.ID
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
                 
            if @sort = 'MyFideicomiso1.Fideicomiso_GeneralesNumero' and @sortdir = 'ASC'
            Begin
               SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Fideicomiso1.GeneralesNumero
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'MyFideicomiso1.Fideicomiso_GeneralesNumero' and @sortdir <> 'ASC'
            Begin
                SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Fideicomiso1.GeneralesNumero desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Subfiso_Numero' and @sortdir = 'ASC'
            Begin
               SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Subfiso.Numero
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Subfiso_Numero' and @sortdir <> 'ASC'
            Begin
                SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Subfiso.Numero desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Subfiso_Nombre' and @sortdir = 'ASC'
            Begin
               SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Subfiso.Nombre
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Subfiso_Nombre' and @sortdir <> 'ASC'
            Begin
                SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Subfiso.Nombre desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Subfiso_Estatus' and @sortdir = 'ASC'
            Begin
               SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Subfiso.Estatus
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Subfiso_Estatus' and @sortdir <> 'ASC'
            Begin
                SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Subfiso.Estatus desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Subfiso_FechaRegistro' and @sortdir = 'ASC'
            Begin
               SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Subfiso.FechaRegistro
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Subfiso_FechaRegistro' and @sortdir <> 'ASC'
            Begin
                SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Subfiso.FechaRegistro desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Subfiso_Identificador' and @sortdir = 'ASC'
            Begin
               SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Subfiso.Identificador
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Subfiso_Identificador' and @sortdir <> 'ASC'
            Begin
                SELECT Subfiso.ID,Subfiso.Fideicomiso,Subfiso.Numero,Subfiso.Nombre,Subfiso.Estatus,Subfiso.FechaRegistro,Subfiso.Identificador,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

                ORDER BY Subfiso.Identificador desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
 
      
        
END

GO
-------------------------------------------------///////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad//////////--------------------------------------------------------------------
-------------------------------------------------//////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:36 PM
-- CRUD Stored Procedures spGetListEntidadSQLPaged
Create Procedure [dbo].[spGetListSubfisoPaged]
     @pagNo int, 
    @pageSize int,
    @sort varchar(50) = '',
	@sortdir varchar(10) = ''
AS
BEGIN

 SET NOCOUNT ON;
   declare @ReturnCount int;
    select @ReturnCount = count(ID) from Subfiso;
    
            if @sort = 'Subfiso_ID' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Subfiso
                ORDER BY ID 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Subfiso_ID' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Subfiso
                ORDER BY ID desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
                if @sort = ''
                Begin
                   SELECT *,@ReturnCount as TotalRecords
                    FROM Subfiso
                    ORDER BY ID 
                    OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                    FETCH NEXT @pageSize  ROWS ONLY;

              End
            if @sort = 'Subfiso_Fideicomiso' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Subfiso
                ORDER BY Fideicomiso 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Subfiso_Fideicomiso' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Subfiso
                ORDER BY Fideicomiso desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Subfiso_Numero' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Subfiso
                ORDER BY Numero 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Subfiso_Numero' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Subfiso
                ORDER BY Numero desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Subfiso_Nombre' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Subfiso
                ORDER BY Nombre 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Subfiso_Nombre' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Subfiso
                ORDER BY Nombre desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Subfiso_Estatus' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Subfiso
                ORDER BY Estatus 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Subfiso_Estatus' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Subfiso
                ORDER BY Estatus desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Subfiso_FechaRegistro' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Subfiso
                ORDER BY FechaRegistro 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Subfiso_FechaRegistro' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Subfiso
                ORDER BY FechaRegistro desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Subfiso_Identificador' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Subfiso
                ORDER BY Identificador 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Subfiso_Identificador' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Subfiso
                ORDER BY Identificador desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
 
      
        
END

GO


-------------------------------------------------///////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad BY ID SP//////////--------------------------------------------------------------------
-------------------------------------------------//////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:36 PM
-- CRUD Stored Procedures spGetListEntidadById
Create Procedure [dbo].[spGetSubfisoByID] 
@ID int
AS
BEGIN
    SET NOCOUNT ON;
    select  
   Subfiso.ID ,
Subfiso.Fideicomiso ,
Subfiso.Numero ,
Subfiso.Nombre ,
Subfiso.Estatus ,
Subfiso.FechaRegistro ,
Subfiso.Identificador 
         , Fideicomiso1.GeneralesNumero as GeneralesNumero1
    from Subfiso  left join Fideicomiso as Fideicomiso1 on Subfiso.Fideicomiso = Fideicomiso1.ID

    where Subfiso.ID = @ID;

		
END

GO







