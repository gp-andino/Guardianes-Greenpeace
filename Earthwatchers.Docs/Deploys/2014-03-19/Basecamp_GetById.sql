USE [Earthwatchers]
GO
/****** Object:  StoredProcedure [dbo].[Basecamp_GetById]    Script Date: 03/17/2014 12:48:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[Basecamp_GetById] 
@id int
AS
BEGIN
Select BasecampId, Name, Location.Lat as Latitude, Location.Long as Longitude, Probability  From BasecampDetails where Id = @id;
END
