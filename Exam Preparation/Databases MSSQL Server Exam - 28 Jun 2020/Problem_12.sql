CREATE PROCEDURE usp_ChangeJourneyPurpose(@JourneyId INT, @NewPurpose VARCHAR(MAX))
AS
BEGIN
	DECLARE @IsJourney INT = (SELECT COUNT(*) FROM [Journeys] WHERE [Id] = @JourneyId)
	DECLARE @JourneyPurpose VARCHAR(MAX) = (SELECT [Purpose] FROM [Journeys] WHERE [Id] = @JourneyId)

	IF (@IsJourney = 0)
		THROW 50001, 'The journey does not exist!',1

	IF (@NewPurpose = @JourneyPurpose)
		THROW 50002, 'You cannot change the purpose!',1

	UPDATE [Journeys]
	SET [Purpose] = @NewPurpose
	WHERE [Id] = @JourneyId
END

EXEC usp_ChangeJourneyPurpose 4, 'Technical'

EXEC usp_ChangeJourneyPurpose 2, 'Educational'

EXEC usp_ChangeJourneyPurpose 196, 'Technical'