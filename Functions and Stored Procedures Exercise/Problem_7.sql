CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
RETURNS BIT
AS
BEGIN
	DECLARE @wordLength INT = LEN(@word)
	DECLARE @counter INT = 1
	DECLARE @character CHAR(1)
	WHILE (@counter <= @wordLength)
	BEGIN
		  SET @character = SUBSTRING(@word, @counter, 1)
          IF (CHARINDEX(@character, @setOfLetters) > 0)
				SET @counter +=1
		          ELSE
					RETURN 0
     END
     RETURN 1
END


SELECT [dbo].[ufn_IsWordComprised] ('oistmiahf','halves')