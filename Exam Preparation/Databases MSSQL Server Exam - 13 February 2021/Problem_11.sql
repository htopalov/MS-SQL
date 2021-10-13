CREATE FUNCTION udf_AllUserCommits (@username VARCHAR(MAX))
RETURNS INT
AS
BEGIN
	DECLARE @UserId INT
	SET @UserId = (SELECT [Id] FROM [Users] WHERE [Username] = @username)
	RETURN (SELECT COUNT(*) FROM [Commits] WHERE [ContributorId] = @UserId)
END

SELECT dbo.udf_AllUserCommits('UnderSinduxrein')