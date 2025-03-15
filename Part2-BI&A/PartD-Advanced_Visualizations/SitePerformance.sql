
	--DROP TABLE DW_SITE_PERFORMANCE
	--TRUNCATE TABLE DW_SITE_PERFORMANCE
CREATE TABLE DW_SITE_PERFORMANCE (
	[Site ID]					INTEGER,
	[Site Name]					VARCHAR(20),
	[Year]						INTEGER,
	[Month]						INTEGER,
	[Month Name]				VARCHAR(20),
	[Satisfaction]				FLOAT,
	[Site Average Rate]			FLOAT,
	[Site Experience]			INTEGER, -- add a condition for over 5 years
	[Site Fee]					MONEY, 
	[Expected Income]			MONEY,
	[Actual Income]				MONEY,
	[Overall Performance]		FLOAT,
	[Fulfillment Speed]			FLOAT,
	[Total On Time]				INTEGER,
	[Total Late]				INTEGER,
	)

	select * from DW_SITE_PERFORMANCE
