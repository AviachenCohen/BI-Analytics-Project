


--DROP TABLE SUMMARY_DASHBOARD_DM
--TRUNCATE TABLE SUMMARY_DASHBOARD_DM
CREATE TABLE SUMMARY_DASHBOARD_DM (
	[Site ID]							INTEGER,
	[Site Name]							VARCHAR(20),
	[Site Fee]							MONEY,
	[Site Years Of Seniority]			INTEGER,
	[DW ORDER]							INTEGER,
	[Order Date]						DATE,
	[Distributor ID]					INTEGER,
	[Distributor Name]					VARCHAR(20),
	[Distributor Years Of Seniority]	INTEGER,
	[Distributor Score]					INTEGER,
	[Importer Region]					VARCHAR(20),
	[Importer City]						VARCHAR(20),
	[Satisfaction]						INTEGER,
	[Delivery Date]						DATE,
	[On Time]							BIT,
	[Delivery Cost]						MONEY,
	[Distributor Handling]				MONEY,
	[Country Origin]					VARCHAR(20),
	[The Year]							INTEGER,
	[The Quarter]						INTEGER,
	[The Month]							INTEGER,
	[The Month Name]					VARCHAR(20),
	[Total Orders By Us]				INTEGER,
	[Total Orders By Site]				INTEGER
	)

	select * from SUMMARY_DASHBOARD_DM