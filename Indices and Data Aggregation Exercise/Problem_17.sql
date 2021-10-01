SELECT COUNT(*) - COUNT([ManagerID]) AS [Count]
FROM [Employees]

--Cleaner version for me

SELECT COUNT([Salary])
FROM [Employees]
WHERE [ManagerID] IS NULL