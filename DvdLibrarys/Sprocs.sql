IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES
   WHERE ROUTINE_NAME = 'DvdSelectAll')
      DROP PROCEDURE DvdSelectAll
GO

CREATE PROCEDURE DvdSelectAll AS
BEGIN
	SELECT DvdId, Title, ReleaseYear, Rating, DirectorName
	FROM Dvds
END
GO

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES
   WHERE ROUTINE_NAME = 'DvdSelect')
      DROP PROCEDURE DvdSelect
GO

CREATE PROCEDURE DvdSelect (
	@DvdId int
) AS
BEGIN
	SELECT DvdId, Title, ReleaseYear, Rating, DirectorName		
	FROM Dvds
	WHERE DvdId = @DvdId
END
GO

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES
   WHERE ROUTINE_NAME = 'DvdInsert')
      DROP PROCEDURE DvdInsert
GO
CREATE PROCEDURE DvdInsert (
	@DvdId int output,
	@Title nvarchar(50),
	@ReleaseYear int,
	@Rating nvarchar (max),
	@DirectorName nvarchar (max)
	
) AS
BEGIN
	INSERT INTO Dvds(Title, ReleaseYear, Rating, DirectorName)
	VALUES (@Title, @ReleaseYear, @Rating, @DirectorName);

	SET @DvdId = SCOPE_IDENTITY();
END

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES
   WHERE ROUTINE_NAME ='DvdUpdate')
      DROP PROCEDURE DvdUpdate
GO

CREATE PROCEDURE DvdUpdate (
	@DvdId int,
	@Title nvarchar(50),
	@ReleaseYear int,
	@Rating nvarchar (max),
	@DirectorName nvarchar (max)
	
) AS
BEGIN

    UPDATE	Dvds SET	
	Title = @Title, 
	ReleaseYear = @ReleaseYear, 
	Rating = @Rating, 
	DirectorName = @DirectorName
    WHERE DvdId = @DvdId
	END

	
GO

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES
   WHERE ROUTINE_NAME ='DvdDelete')
      DROP PROCEDURE DvdDelete
GO
CREATE PROCEDURE DvdDelete (
	@DvdId int
) AS
BEGIN
	BEGIN TRANSACTION

	DELETE FROM Dvds WHERE DvdId = @DvdId;
	
	COMMIT TRANSACTION
END
GO

select * from Dvds

