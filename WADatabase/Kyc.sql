      

--Fecha Creación:5/24/2019 6:13:24 PM Template TableAndStoreds, Author: Alfredo Reyes C., V1

IF OBJECT_ID('[dbo].[Kyc]', 'U') IS NOT NULL 
Drop Table [dbo].[Kyc]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteKyc]') AND type in (N'P', N'PC'))
    Drop Procedure spDeleteKyc
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateKyc]') AND type in (N'P', N'PC'))
    Drop Procedure spUpdateKyc
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdatePartialKyc]') AND type in (N'P', N'PC'))
    Drop Procedure spUpdatePartialKyc
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertKyc]') AND type in (N'P', N'PC'))
    Drop Procedure spInsertKyc
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetListKycPaged]') AND type in (N'P', N'PC'))
    Drop Procedure spGetListKycPaged
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetListKycAndRelationsPaged]') AND type in (N'P', N'PC'))
    Drop Procedure spGetListKycAndRelationsPaged
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetKycByID]') AND type in (N'P', N'PC'))
    Drop Procedure spGetKycByID
GO


-------------------------------------------------//////////////////--------------------------------------------------------------------
----Datos para la seguridad de los servicios
-----------------------------------------------------

-------------------------------------------------//////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:24 PM
--Add Columns to Table must be null 



-------------------------------------------------/////////CREAR TABLA/////////--------------------------------------------------------------------
-------------------------------------------------//////////////////--------------------------------------------------------------------
--CRUD Tabla SQL
Create Table [dbo].[Kyc](
                        [ID] int--%>
                        IDENTITY (1,1)  ,
            
                   
 [Fideicomiso] int
                NOT NULL ,
       
 [Nombre] varchar(250)
                NULL ,
       
 [NumRegistro] varchar(250)
                NULL ,
       
 [Oficina] varchar(250)
                NULL ,
       
 [ConceptoImpresion] varchar(250)
                NULL ,
       
 [CrBanca] varchar(250)
                NULL ,
       
 [Folio] varchar(250)
                NULL 
       
    CONSTRAINT [PK_Kyc] PRIMARY KEY CLUSTERED
    (
    [ID] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]

GO


---Añadimos lo constraints de ForeignKeys 
        ALTER TABLE [dbo].[Kyc]  WITH CHECK ADD FOREIGN KEY([Fideicomiso])
        REFERENCES [dbo].[Fideicomiso] ([ID])
        GO


-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------/////////Insert SP/////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:24 PM
-- CRUD Stored Procedures
Create Procedure [dbo].[spInsertKyc]
      @Fideicomiso int  ,
@Nombre varchar(250) NULL ,
@NumRegistro varchar(250) NULL ,
@Oficina varchar(250) NULL ,
@ConceptoImpresion varchar(250) NULL ,
@CrBanca varchar(250) NULL ,
@Folio varchar(250) NULL ,
    @ReturnValue int output
AS
BEGIN
   
    SET NOCOUNT ON;
    Insert into Kyc (
     Fideicomiso,Nombre,NumRegistro,Oficina,ConceptoImpresion,CrBanca,Folio
    )     
    values (  
    @Fideicomiso,@Nombre,@NumRegistro,@Oficina,@ConceptoImpresion,@CrBanca,@Folio
    );

		--select @ReturnValue = Max(ID) from Kyc;
        select @ReturnValue = 1;
END

GO

-------------------------------------------------////////////////////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad Rwlations SP//////////--------------------------------------------------------------------
-------------------------------------------------////////////////////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:24 PM
-- CRUD Stored Procedures spGetListEntidadSQLAndRelationsPaged
Create Procedure [dbo].[spGetListKycAndRelationsPaged]
     @pagNo int, 
    @pageSize int,
    @sort varchar(50) = '',
	@sortdir varchar(10) = ''
AS
BEGIN

  SET NOCOUNT ON;
   declare @ReturnCount int;
    select @ReturnCount = count(ID) from Kyc;
    
            if @sort = 'Kyc_ID' and @sortdir = 'ASC'
            Begin
               SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.ID
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_ID' and @sortdir <> 'ASC'
            Begin
                SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.ID desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
                
            if @sort = '' 
            Begin
               SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.ID
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
                 
            if @sort = 'MyFideicomiso1.Fideicomiso_GeneralesNumero' and @sortdir = 'ASC'
            Begin
               SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Fideicomiso1.GeneralesNumero
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'MyFideicomiso1.Fideicomiso_GeneralesNumero' and @sortdir <> 'ASC'
            Begin
                SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Fideicomiso1.GeneralesNumero desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Kyc_Nombre' and @sortdir = 'ASC'
            Begin
               SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.Nombre
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_Nombre' and @sortdir <> 'ASC'
            Begin
                SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.Nombre desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Kyc_NumRegistro' and @sortdir = 'ASC'
            Begin
               SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.NumRegistro
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_NumRegistro' and @sortdir <> 'ASC'
            Begin
                SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.NumRegistro desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Kyc_Oficina' and @sortdir = 'ASC'
            Begin
               SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.Oficina
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_Oficina' and @sortdir <> 'ASC'
            Begin
                SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.Oficina desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Kyc_ConceptoImpresion' and @sortdir = 'ASC'
            Begin
               SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.ConceptoImpresion
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_ConceptoImpresion' and @sortdir <> 'ASC'
            Begin
                SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.ConceptoImpresion desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Kyc_CrBanca' and @sortdir = 'ASC'
            Begin
               SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.CrBanca
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_CrBanca' and @sortdir <> 'ASC'
            Begin
                SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.CrBanca desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Kyc_Folio' and @sortdir = 'ASC'
            Begin
               SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.Folio
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_Folio' and @sortdir <> 'ASC'
            Begin
                SELECT Kyc.ID,Kyc.Fideicomiso,Kyc.Nombre,Kyc.NumRegistro,Kyc.Oficina,Kyc.ConceptoImpresion,Kyc.CrBanca,Kyc.Folio,Fideicomiso1.ID as ID1,Fideicomiso1.GeneralesNumero as GeneralesNumero1,Fideicomiso1.GeneralesNombre as GeneralesNombre1,Fideicomiso1.GeneralesAdministrador as GeneralesAdministrador1,Fideicomiso1.GeneralesPromotor as GeneralesPromotor1,Fideicomiso1.CaracteristicasFormaManejo as CaracteristicasFormaManejo1,Fideicomiso1.CaracteristicasTipoNegocio as CaracteristicasTipoNegocio1,Fideicomiso1.CaracteristicasClasificacionProducto as CaracteristicasClasificacionProducto1,Fideicomiso1.CaracteristicasProductoEstandar as CaracteristicasProductoEstandar1,Fideicomiso1.CaracteristicasProducto as CaracteristicasProducto1,Fideicomiso1.CaracteristicasValFatca as CaracteristicasValFatca1,Fideicomiso1.CaracteristicasMontoApertura as CaracteristicasMontoApertura1,Fideicomiso1.CaracteristicasManejoSubFisos as CaracteristicasManejoSubFisos1,Fideicomiso1.CaracteristicasSujetoArt151 as CaracteristicasSujetoArt1511,Fideicomiso1.CaracteristicasCerrado as CaracteristicasCerrado1,Fideicomiso1.CaracteristicasRevocable as CaracteristicasRevocable1,Fideicomiso1.CaracteristicasEsContratoEje as CaracteristicasEsContratoEje1,Fideicomiso1.CaracteristicasComiteTecnico as CaracteristicasComiteTecnico1,Fideicomiso1.CaracteristicasOfiBanxico as CaracteristicasOfiBanxico1,Fideicomiso1.CaracteristicasManejaMonExt as CaracteristicasManejaMonExt1,Fideicomiso1.CaracteristicasIvaFronterizo as CaracteristicasIvaFronterizo1,Fideicomiso1.CaracteristicasFechaAlta as CaracteristicasFechaAlta1,Fideicomiso1.CaracteristicasFechaConstitucion as CaracteristicasFechaConstitucion1,Fideicomiso1.CaracteristicasFechaAprobacion as CaracteristicasFechaAprobacion1,Fideicomiso1.CaracteristicasEstado as CaracteristicasEstado1,Fideicomiso1.AdicionalesTipo as AdicionalesTipo1,Fideicomiso1.AdicionalesTipoPersona as AdicionalesTipoPersona1,Fideicomiso1.AdicionalesConActividadEmpresarial as AdicionalesConActividadEmpresarial1,Fideicomiso1.AdicionalesPermisoSre as AdicionalesPermisoSre1,Fideicomiso1.AdicionalesFechaPermisoSre as AdicionalesFechaPermisoSre1,Fideicomiso1.AdicionalesProvSustFiduciaria as AdicionalesProvSustFiduciaria1,Fideicomiso1.AdicionalesFondosInterfaseAfore as AdicionalesFondosInterfaseAfore1,Fideicomiso1.AdicionalesRegNalInvExt as AdicionalesRegNalInvExt1,Fideicomiso1.AdicionalesFechaInscripcion as AdicionalesFechaInscripcion1,Fideicomiso1.AdicionalesFormalizacionContrato as AdicionalesFormalizacionContrato1,Fideicomiso1.AdicionalesNoEscritura as AdicionalesNoEscritura1,Fideicomiso1.AdicionalesFechaEscritura as AdicionalesFechaEscritura1,Fideicomiso1.AdicionalesNombreNotario as AdicionalesNombreNotario1,Fideicomiso1.AdicionalesNoNotario as AdicionalesNoNotario1,Fideicomiso1.AdicionalesCiudadNotario as AdicionalesCiudadNotario1,Fideicomiso1.AdicionalesEstadoNotario as AdicionalesEstadoNotario1,Fideicomiso1.AdicionalesPaisNotario as AdicionalesPaisNotario1,Fideicomiso1.AdicionalesFolioRegistroPublico as AdicionalesFolioRegistroPublico1,Fideicomiso1.AdicionalesFechaInscripcionRegPublico as AdicionalesFechaInscripcionRegPublico1,Fideicomiso1.AdicionalesAdministracion as AdicionalesAdministracion1,Fideicomiso1.AdicionalesContabilidadDelegada as AdicionalesContabilidadDelegada1,Fideicomiso1.DatosBanxicoActividadEconomica as DatosBanxicoActividadEconomica1,Fideicomiso1.DatosBanxicoFiducuario as DatosBanxicoFiducuario1,Fideicomiso1.DatosBanxicoSectorBancario as DatosBanxicoSectorBancario1,Fideicomiso1.DatosBanxicoLocalidad as DatosBanxicoLocalidad1,Fideicomiso1.DatosBanxicoCentroResp as DatosBanxicoCentroResp1,Fideicomiso1.DatosBanxicoNoCr as DatosBanxicoNoCr1,Fideicomiso1.DatosBanxicoRfcContrato as DatosBanxicoRfcContrato1,Fideicomiso1.DatosBanxicoNumeroCliente as DatosBanxicoNumeroCliente1,@ReturnCount as TotalRecords
                FROM Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

                ORDER BY Kyc.Folio desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
 
      
        
END

GO
-------------------------------------------------///////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad//////////--------------------------------------------------------------------
-------------------------------------------------//////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:24 PM
-- CRUD Stored Procedures spGetListEntidadSQLPaged
Create Procedure [dbo].[spGetListKycPaged]
     @pagNo int, 
    @pageSize int,
    @sort varchar(50) = '',
	@sortdir varchar(10) = ''
AS
BEGIN

 SET NOCOUNT ON;
   declare @ReturnCount int;
    select @ReturnCount = count(ID) from Kyc;
    
            if @sort = 'Kyc_ID' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY ID 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_ID' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY ID desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
                if @sort = ''
                Begin
                   SELECT *,@ReturnCount as TotalRecords
                    FROM Kyc
                    ORDER BY ID 
                    OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                    FETCH NEXT @pageSize  ROWS ONLY;

              End
            if @sort = 'Kyc_Fideicomiso' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY Fideicomiso 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_Fideicomiso' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY Fideicomiso desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Kyc_Nombre' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY Nombre 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_Nombre' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY Nombre desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Kyc_NumRegistro' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY NumRegistro 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_NumRegistro' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY NumRegistro desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Kyc_Oficina' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY Oficina 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_Oficina' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY Oficina desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Kyc_ConceptoImpresion' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY ConceptoImpresion 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_ConceptoImpresion' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY ConceptoImpresion desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Kyc_CrBanca' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY CrBanca 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_CrBanca' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY CrBanca desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Kyc_Folio' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY Folio 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Kyc_Folio' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM Kyc
                ORDER BY Folio desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
 
      
        
END

GO


-------------------------------------------------///////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad BY ID SP//////////--------------------------------------------------------------------
-------------------------------------------------//////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:5/24/2019 6:13:24 PM
-- CRUD Stored Procedures spGetListEntidadById
Create Procedure [dbo].[spGetKycByID] 
@ID int
AS
BEGIN
    SET NOCOUNT ON;
    select  
   Kyc.ID ,
Kyc.Fideicomiso ,
Kyc.Nombre ,
Kyc.NumRegistro ,
Kyc.Oficina ,
Kyc.ConceptoImpresion ,
Kyc.CrBanca ,
Kyc.Folio 
         , Fideicomiso1.GeneralesNumero as GeneralesNumero1
    from Kyc  left join Fideicomiso as Fideicomiso1 on Kyc.Fideicomiso = Fideicomiso1.ID

    where Kyc.ID = @ID;

		
END

GO







