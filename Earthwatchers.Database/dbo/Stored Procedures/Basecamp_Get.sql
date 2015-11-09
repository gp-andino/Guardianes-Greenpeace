﻿CREATE PROCEDURE [dbo].[Basecamp_Get] 
AS
BEGIN
Select d.Id, d.Name, d.Location.Lat as Latitude, d.Location.Long as Longitude, d.HotPoint.Lat as HotPointLat, d.HotPoint.Long as HotPointLong, d.Probability, d.Name DetailName, d.ShortText, d.RegionId, d.Show 
From BasecampDetails d 
order by d.Name
END
