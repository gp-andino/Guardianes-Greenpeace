USE [Earthwatchers]
GO
/****** Object:  StoredProcedure [dbo].[Land_AddVerification]    Script Date: 03/19/2014 15:39:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Land_AddVerification] 
@LandId INT,
@isAlert BIT,
@Id INT
AS
BEGIN
IF NOT EXISTS (select Earthwatcher from Verifications where land = @LandId and earthwatcher = @Id and IsAlert = @isAlert and IsDeleted = 0)
	                                    BEGIN
		                                    Delete From Verifications where land = @LandId and earthwatcher = @Id
		                                    INSERT INTO Verifications (Land, Earthwatcher, IsAlert)
		                                    VALUES (@LandId, @Id, @isAlert)
		                                    Select count(Land) From Verifications Where land = @LandId
	                                    END
                                    ELSE
	                                    SELECT 0
END
