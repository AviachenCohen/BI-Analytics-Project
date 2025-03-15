
USE DW_For_Slowly_Changing_Dimension_Type2

CREATE PROCEDURE UPDATE_UNKNOWN_DISTRIBUTORS
AS BEGIN
UPDATE DW_DIM_DISTRIBUTORS
SET [Distributor Name] = 'Unknown_' + CONVERT(varchar(20), [DW Distributor]),
	[Valid From] = GETDATE()
WHERE [Distributor ID] IS NULL
END