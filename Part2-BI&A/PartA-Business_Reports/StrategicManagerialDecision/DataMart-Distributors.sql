

--DROP TABLE SUMMARY_SMD_REPORT (Strategic management decision)
--TRUNCATE TABLE SUMMARY_SMD_REPORT
CREATE TABLE SUMMARY_SMD_REPORT (
	[DW Distributor]			INTEGER,
	[Distributor ID]			INTEGER,
	[Distributor Name]			VARCHAR(20),
	[Site ID]					INTEGER,
	[Importer Region]			VARCHAR(20),
	[Distributor Handling]		MONEY,
	[Max Parcels Per Month]		INTEGER,
	[Site Fee]					MONEY,
	[Delivery Cost]				MONEY,
	[Order]						INTEGER,
	[Parcel]					INTEGER,
	[Customs Clearance]			BIT,
	[Delivery Date]				DATE,
	[On Time]					BIT,
	)

	select * from SUMMARY_SMD_REPORT where [Distributor ID]=1 and YEAR([Delivery Date])=2017 and month([delivery date])=2
	select * from SUMMARY_SMD_REPORT where [Distributor ID]=1 and YEAR([Delivery Date])=2017 and month([delivery date])=2 and [On Time] = 0
	select * from SUMMARY_SMD_REPORT where [Distributor ID]=1 and YEAR([Delivery Date])=2017 and [Customs Clearance] = 0
	SELECT * FROM SUMMARY_SMD_REPORT where [customs clearance] = 0 AND [On Time] = 0 