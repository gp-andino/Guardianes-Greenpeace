USE [Earthwatchers]
GO
/****** Object:  StoredProcedure [dbo].[Score_GetScoresByUserId]    Script Date: 03/19/2014 16:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Score_GetScoresByUserId] 
@Id INT
AS
BEGIN
select Id, EarthwatcherId, action, published, points, LandId, Param1, Param2 from Scores where earthwatcherid=@Id Order By published desc
END
