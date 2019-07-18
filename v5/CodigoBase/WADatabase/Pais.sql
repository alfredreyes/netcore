      

--Fecha Creación:7/18/2019 10:39:25 AM Template TableAndStoreds, Author: Alfredo Reyes C., V1

IF OBJECT_ID('[dbo].[TPais]', 'U') IS NOT NULL 
Drop Table [dbo].[TPais]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteTPais]') AND type in (N'P', N'PC'))
    Drop Procedure spDeleteTPais
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateTPais]') AND type in (N'P', N'PC'))
    Drop Procedure spUpdateTPais
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdatePartialTPais]') AND type in (N'P', N'PC'))
    Drop Procedure spUpdatePartialTPais
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertTPais]') AND type in (N'P', N'PC'))
    Drop Procedure spInsertTPais
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetListTPaisPaged]') AND type in (N'P', N'PC'))
    Drop Procedure spGetListTPaisPaged
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetListTPaisAndRelationsPaged]') AND type in (N'P', N'PC'))
    Drop Procedure spGetListTPaisAndRelationsPaged
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetTPaisByID]') AND type in (N'P', N'PC'))
    Drop Procedure spGetTPaisByID
GO


-------------------------------------------------//////////////////--------------------------------------------------------------------
----Datos para la seguridad de los servicios
-----------------------------------------------------

-------------------------------------------------//////////////////--------------------------------------------------------------------
--Fecha Creación:7/18/2019 10:39:25 AM
--Add Columns to Table must be null 



-------------------------------------------------/////////CREAR TABLA/////////--------------------------------------------------------------------
-------------------------------------------------//////////////////--------------------------------------------------------------------
--CRUD Tabla SQL
Create Table [dbo].[TPais](
                        [CIdPais] int--%>
                        IDENTITY (1,1)  ,
            
                   
 [CNombrePais] varchar(250)
                NOT NULL ,
       
 [CHabitantes] float
                NULL 
       
    CONSTRAINT [PK_TPais] PRIMARY KEY CLUSTERED
    (
    [CIdPais] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]

GO


---Añadimos lo constraints de ForeignKeys 


-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////////DELETE SP//////--------------------------------------------------------------------
--Fecha Creación:7/18/2019 10:39:25 AM
--CRUD Stored Procedures

Create Procedure [dbo].[spDeleteTPais]
    @CIdPais int,
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
			 delete from TPais where CIdPais = @CIdPais;
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
--Fecha Creación:7/18/2019 10:39:25 AM
-- CRUD Stored Procedures
Create Procedure [dbo].[spInsertTPais]
      @CNombrePais varchar(250)  ,
@CHabitantes float NULL ,
    @ReturnValue int output
AS
BEGIN
   
    SET NOCOUNT ON;
    Insert into TPais (
     CNombrePais,CHabitantes
    )     
    values (  
    @CNombrePais,@CHabitantes
    );

		--select @ReturnValue = Max(CIdPais) from TPais;
        select @ReturnValue = 1;
END

GO

-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------///////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////////Update SP//////--------------------------------------------------------------------
--Fecha Creación:7/18/2019 10:39:25 AM
-- CRUD Stored Procedures
Create Procedure [dbo].[spUpdateTPais]
      @CIdPais int ,
@CNombrePais varchar(250) ,
@CHabitantes float NULL,
    @ReturnValue int output
AS
BEGIN
    SET NOCOUNT ON;
    Update TPais set 
        CNombrePais = @CNombrePais,CHabitantes = @CHabitantes
    where CIdPais = @CIdPais;

		select @ReturnValue = 1;
END

GO
-------------------------------------------------/////////////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------/////////////Update SP Partial///////////--------------------------------------------------------------------
-------------------------------------------------////////////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:7/18/2019 10:39:25 AM
-- CRUD Stored Procedures
Create Procedure [dbo].[spUpdatePartialTPais]
      @CIdPais int ,
@CNombrePais varchar(250) ,
@CHabitantes float NULL,
    @ReturnValue int output
AS
BEGIN
    SET NOCOUNT ON;
    Update TPais set 
        CNombrePais = @CNombrePais,CHabitantes = @CHabitantes
    where CIdPais = @CIdPais;

		select @ReturnValue = 1;
END

GO
-------------------------------------------------////////////////////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad Rwlations SP//////////--------------------------------------------------------------------
-------------------------------------------------////////////////////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:7/18/2019 10:39:25 AM
-- CRUD Stored Procedures spGetListEntidadSQLAndRelationsPaged
Create Procedure [dbo].[spGetListTPaisAndRelationsPaged]
     @pagNo int, 
    @pageSize int,
    @sort varchar(50) = '',
	@sortdir varchar(10) = ''
AS
BEGIN

  SET NOCOUNT ON;
   declare @ReturnCount int;
    select @ReturnCount = count(CIdPais) from TPais;
    
            if @sort = 'IdPais' and @sortdir = 'ASC'
            Begin
               SELECT TPais.CIdPais,TPais.CNombrePais,TPais.CHabitantes,@ReturnCount as TotalRecords
                FROM TPais 
                ORDER BY TPais.CIdPais
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'IdPais' and @sortdir <> 'ASC'
            Begin
                SELECT TPais.CIdPais,TPais.CNombrePais,TPais.CHabitantes,@ReturnCount as TotalRecords
                FROM TPais 
                ORDER BY TPais.CIdPais desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
                
            if @sort = '' 
            Begin
               SELECT TPais.CIdPais,TPais.CNombrePais,TPais.CHabitantes,@ReturnCount as TotalRecords
                FROM TPais 
                ORDER BY TPais.CIdPais
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
                 
            if @sort = 'NombrePais' and @sortdir = 'ASC'
            Begin
               SELECT TPais.CIdPais,TPais.CNombrePais,TPais.CHabitantes,@ReturnCount as TotalRecords
                FROM TPais 
                ORDER BY TPais.CNombrePais
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'NombrePais' and @sortdir <> 'ASC'
            Begin
                SELECT TPais.CIdPais,TPais.CNombrePais,TPais.CHabitantes,@ReturnCount as TotalRecords
                FROM TPais 
                ORDER BY TPais.CNombrePais desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Habitantes' and @sortdir = 'ASC'
            Begin
               SELECT TPais.CIdPais,TPais.CNombrePais,TPais.CHabitantes,@ReturnCount as TotalRecords
                FROM TPais 
                ORDER BY TPais.CHabitantes
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Habitantes' and @sortdir <> 'ASC'
            Begin
                SELECT TPais.CIdPais,TPais.CNombrePais,TPais.CHabitantes,@ReturnCount as TotalRecords
                FROM TPais 
                ORDER BY TPais.CHabitantes desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
 
      
        
END

GO
-------------------------------------------------///////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad//////////--------------------------------------------------------------------
-------------------------------------------------//////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:7/18/2019 10:39:25 AM
-- CRUD Stored Procedures spGetListEntidadSQLPaged
Create Procedure [dbo].[spGetListTPaisPaged]
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
    select @ReturnCount = count(CIdPais) from TPais;
    
            if @sort = 'IdPais' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM TPais
                ORDER BY CIdPais 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'IdPais' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM TPais
                ORDER BY CIdPais desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
                if @sort = ''
                Begin
                   SELECT *,@ReturnCount as TotalRecords
                    FROM TPais
                    ORDER BY CIdPais 
                    OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                    FETCH NEXT @pageSize  ROWS ONLY;

              End
            if @sort = 'NombrePais' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM TPais
                ORDER BY CNombrePais 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'NombrePais' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM TPais
                ORDER BY CNombrePais desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
            if @sort = 'Habitantes' and @sortdir = 'ASC'
            Begin
               SELECT *,@ReturnCount as TotalRecords
                FROM TPais
                ORDER BY CHabitantes 
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END
            Else if @sort = 'Habitantes' and @sortdir <> 'ASC'
            Begin
                SELECT *,@ReturnCount as TotalRecords
                FROM TPais
                ORDER BY CHabitantes desc
                OFFSET ((@pagNo - 1)  * @pageSize) ROWS
                FETCH NEXT @pageSize  ROWS ONLY;

            END 
 
      
        
END

GO


-------------------------------------------------///////////////////////////////////--------------------------------------------------------------------
-------------------------------------------------////////Get List  Entidad BY ID SP//////////--------------------------------------------------------------------
-------------------------------------------------//////////////////////////////////--------------------------------------------------------------------
--Fecha Creación:7/18/2019 10:39:25 AM
-- CRUD Stored Procedures spGetListEntidadById
Create Procedure [dbo].[spGetTPaisByID] 
@CIdPais int
AS
BEGIN
    SET NOCOUNT ON;
    select  
   TPais.CIdPais ,
TPais.CNombrePais ,
TPais.CHabitantes 
             from TPais 
    where TPais.CIdPais = @CIdPais;

		
END

GO







