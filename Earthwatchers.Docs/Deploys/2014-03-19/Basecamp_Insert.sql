USE [Earthwatchers]
GO
/****** Object:  StoredProcedure [dbo].[Basecamp_Insert]    Script Date: 03/19/2014 14:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Basecamp_Insert] 
@ID INT output,
@basecampid INT,
@longitude FLOAT(50),
@latitude FLOAT(50),
@probability INT,
@name VARCHAR(50)
AS
BEGIN
INSERT INTO BasecampDetails (BasecampId, Location, Probability, Name) values(@basecampid, geography::STPointFromText('POINT(' + CAST(@longitude AS VARCHAR(20)) + ' ' + CAST(@latitude AS VARCHAR(20)) + ')', 4326), @probability, @name)SET @ID = SCOPE_IDENTITY()

--Luego de agregarlo , calcula las distancias de las lands
insert into BasecampLandDistance
select bc.Id, l.Id, l.Centroid.STDistance(bc.Location)
from Land l, BasecampDetails bc
where l.LandStatus > 0
and l.Landthreat > 0 
and l.IsLocked = 0
and l.DemandAuthorities = 0
and l.Id <> 64207
and bc.Id = (select top 1 Id from BasecampDetails order by Id DESC)
END
