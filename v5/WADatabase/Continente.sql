      

--Fecha Creación:7/17/2019 4:56:19 PM Template TableAndStoreds, Author: Alfredo Reyes C., V1

IF OBJECT_ID('[dbo].[TContinente]', 'U') IS NOT NULL 
Drop Table [dbo].[TContinente]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteTContinente]') AND type in (N'P', N'PC'))
    Drop Procedure spDeleteTContinente
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateTContinente]') AND type in (N'P', N'PC'))
    Drop Procedure spUpdateTContinente
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdatePartialTContinente]') AND type in (N'P', N'PC'))
    Drop Procedure spUpdatePartialTContinente
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertTContinente]') AND type in (N'P', N'PC'))
    Drop Procedure spInsertTContinente
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetListTContinentePaged]') AND type in (N'P', N'PC'))
    Drop Procedure spGetListTContinentePaged
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetListTContinenteAndRelationsPaged]') AND type in (N'P', N'PC'))
    Drop Procedure spGetListTContinenteAndRelationsPaged
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetTContinenteByID]') AND type in (N'P', N'PC'))
    Drop Procedure spGetTContinenteByID
GO


-------------------------------------------------//////////////////--------------------------------------------------------------------
----Datos para la seguridad de los servicios
-----------------------------------------------------

-------------------------------------------------//////////////////--------------------------------------------------------------------
--Fecha Creación:7/17/2019 4:56:19 PM
--Add Columns to Table must be null 



-------------------------------------------------/////////CREAR TABLA/////////--------------------------------------------------------------------
-------------------------------------------------//////////////////--------------------------------------------------------------------
--CRUD Tabla SQL
Create Table [dbo].[TContinente](
                        [CIdContinente] int--%>
                        IDENTITY (1,1)  ,
            
                   
 [CNombreContinente] varchar(250)
                NOT NULL ,
       
 [CActivo] bit
                NOT NULL 
       
    CONSTRAINT [PK_TContinente] PRIMARY KEY CLUSTERED
    (
    [CIdContinente] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]

GO


---Añadimos lo constraints de ForeignKeys 


-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////////DELETE SP//////--------------------------------------------------------------------
--Fecha Creación:7/17/2019 4:56:19 PM
--CRUD Stored Procedures

Create Procedure [dbo].[spDeleteTContinente]
    @CIdContinente int,
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
			 delete from TContinente where CIdContinente = @CIdContinente;
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
--Fecha Creación:7/17/2019 4:56:19 PM
-- CRUD Stored Procedures
Create Procedure [dbo].[spInsertTContinente]
      @CNombreContinente varchar(250)  ,
@CActivo bit  ,
    @ReturnValue int output
AS
BEGIN
   
    SET NOCOUNT ON;
    Insert into TContinente (
     CNombreContinente,CActivo
    )     
    values (  
    @CNombreContinente,@CActivo
    );

		--select @ReturnValue = Max(CIdContinente) from TContinente;
        select @ReturnValue = 1;
END

GO

-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////////Update SP//////--------------------------------------------------------------------
--Fecha Creación:7/17/2019 4:56:19 PM
-- CRUD Stored Procedures
Create Procedure [dbo].[spUpdateTContinente]
      @CIdContinente int ,
@CNombreContinente varchar(250) ,
@CActivo bit ,
    @ReturnValue int output
AS
BEGIN
    SET NOCOUNT ON;
    Update TContinente set 
        CNombreContinente = @CNombreContinente,CActivo = @CActivo
    where CIdContinente = @CIdContinente;

		select @ReturnValue = 1;
END

GO
-------------------------------------------------/////////////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------/////////////Update SP Partial///////////--------------------------------------------------------------------
-------------------------------------------------////////////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:7/17/2019 4:56:19 PM
-- CRUD Stored Procedures
Create Procedure [dbo].[spUpdatePartialTContinente]
      @CIdContinente int ,
@CNombreContinente varchar(250) ,
@CActivo bit ,
    @ReturnValue int output
AS
BEGIN
    SET NOCOUNT ON;
    Update TContinente set 
        CNombreContinente = @CNombreContinente,CActivo = @CActivo
    where CIdContinente = @CIdContinente;

		select @ReturnValue = 1;
END

GO
-------------------------------------------------////////////////////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad Rwlations SP//////////--------------------------------------------------------------------
-------------------------------------------------////////////////////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:7/17/2019 4:56:19 PM
-- CRUD Stored Procedures spGetListEntidadSQLAndRelationsPaged
Create Procedure [dbo].[spGetListTContinenteAndRelationsPaged]
     @pagNo int, 
    @pageSize int,
    @sort varchar(50) = '',
	@sortdir varchar(10) = ''
AS
BEGIN

  SET NOCOUNT ON;
   declare @ReturnCount int;
    select @ReturnCount = count(CIdContinente) from TContinente;
    
            if @sort = 'IdContinente' and @sortdir = 'ASC'
            Begin
               SELECT TContinente.CIdContinente,TContinente.CNombreContinente,TContinente.CActivo,@ReturnCount as TotalRecords
                FROM TContinente 
                ORDER BY TContinente.CIdContinente
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'IdContinente' and @sortdir <> 'ASC'
            Begin
                SELECT TContinente.CIdContinente,TContinente.CNombreContinente,TContinente.CActivo,@ReturnCount as TotalRecords
                FROM TContinente 
                ORDER BY TContinente.CIdContinente desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
                
            if @sort = '' 
            Begin
               SELECT TContinente.CIdContinente,TContinente.CNombreContinente,TContinente.CActivo,@ReturnCount as TotalRecords
                FROM TContinente 
                ORDER BY TContinente.CIdContinente
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
                 
            if @sort = 'NombreContinente' and @sortdir = 'ASC'
            Begin
               SELECT TContinente.CIdContinente,TContinente.CNombreContinente,TContinente.CActivo,@ReturnCount as TotalRecords
                FROM TContinente 
                ORDER BY TContinente.CNombreContinente
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'NombreContinente' and @sortdir <> 'ASC'
            Begin
                SELECT TContinente.CIdContinente,TContinente.CNombreContinente,TContinente.CActivo,@ReturnCount as TotalRecords
                FROM TContinente 
                ORDER BY TContinente.CNombreContinente desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Activo' and @sortdir = 'ASC'
            Begin
               SELECT TContinente.CIdContinente,TContinente.CNombreContinente,TContinente.CActivo,@ReturnCount as TotalRecords
                FROM TContinente 
                ORDER BY TContinente.CActivo
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Activo' and @sortdir <> 'ASC'
            Begin
                SELECT TContinente.CIdContinente,TContinente.CNombreContinente,TContinente.CActivo,@ReturnCount as TotalRecords
                FROM TContinente 
                ORDER BY TContinente.CActivo desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
 
      
        
END

GO
-------------------------------------------------///////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad//////////--------------------------------------------------------------------
-------------------------------------------------//////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:7/17/2019 4:56:19 PM
-- CRUD Stored Procedures spGetListEntidadSQLPaged
Create Procedure [dbo].[spGetListTContinentePaged]
     @pagNo int, 
    @pageSize int,
    @sort varchar(50) = '',
	@sortdir varchar(10) = ''
AS
BEGIN

 SET NOCOUNT ON;
 
if @pagNo = 0   
  set @pagNo = 1;  
  
  if @pageSize = 0  
  set @pageSize = 100;  
 
   declare @ReturnCount int;
    select @ReturnCount = count(CIdContinente) from TContinente;
    
            if @sort = 'IdContinente' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM TContinente
                ORDER BY CIdContinente 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'IdContinente' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM TContinente
                ORDER BY CIdContinente desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
                if @sort = ''
                Begin
                   SELECT *,@ReturnCount as TotalRecords
                    FROM TContinente
                    ORDER BY CIdContinente 
                    OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                    FETCH NEXT @pageSize  ROWS ONLY;

              End
            if @sort = 'NombreContinente' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM TContinente
                ORDER BY CNombreContinente 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'NombreContinente' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM TContinente
                ORDER BY CNombreContinente desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Activo' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM TContinente
                ORDER BY CActivo 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Activo' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM TContinente
                ORDER BY CActivo desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
 
      
        
END

GO


-------------------------------------------------///////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad BY ID SP//////////--------------------------------------------------------------------
-------------------------------------------------//////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:7/17/2019 4:56:19 PM
-- CRUD Stored Procedures spGetListEntidadById
Create Procedure [dbo].[spGetTContinenteByID] 
@CIdContinente int
AS
BEGIN
    SET NOCOUNT ON;
    select  
   TContinente.CIdContinente ,
TContinente.CNombreContinente ,
TContinente.CActivo 
             from TContinente 
    where TContinente.CIdContinente = @CIdContinente;

		
END

GO







