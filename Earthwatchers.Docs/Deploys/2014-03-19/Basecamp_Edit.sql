GO
CREATE PROCEDURE [dbo].[Basecamp_Edit] 
@basecampid INT,
@longitude FLOAT(50),
@latitude FLOAT(50),
@probability INT,
@name VARCHAR(50),
@id INT
AS
BEGIN

UPDATE BasecampDetails set BasecampId = @basecampId, Location = geography::STPointFromText('POINT(' + CAST(@longitude AS VARCHAR(20)) + ' ' + CAST(@latitude AS VARCHAR(20)) + ')', 4326), Probability = @probability, Name = @name where Id = @id

END
