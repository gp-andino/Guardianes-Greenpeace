USE [Earthwatchers]
GO
/****** Object:  StoredProcedure [dbo].[Contest_GetWinner]    Script Date: 02/24/2014 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Contest_GetWinner] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP 1 c.Id, c.ShortTitle, c.Title, SUBSTRING(e.Name, 0, CHARINDEX('@', e.Name)) as Description, c.StartDate, c.EndDate, c.ImageUrl, c.WinnerId From Contest c
	Inner Join Earthwatcher e on c.WinnerId = e.Id
	Left Join scores s on c.WinnerId = s.EarthwatcherId and s.Action = 'ContestWon' + CAST(c.Id AS VARCHAR(10))
	Where 
		s.Id is null
		AND EndDate <= GETDATE()
	Order By c.EndDate DESC
		
END
