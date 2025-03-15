Use DW_For_Slowly_Changing_Dimension_Type2

--TRUNCATE TABLE DW_DIM_COUNTRIES
CREATE TABLE DW_DIM_COUNTRIES (
	Country		VARCHAR(20),
	Continent	VARCHAR(20),
	Population	INTEGER,
	)

-- TRUNCATE TABLE DW_DIM_SITES
CREATE TABLE DW_DIM_SITES(
	[Site ID]					INTEGER,
	[Site Name]					VARCHAR(20),
	[Contract Date]				DATE,
	[Site Years Of Seniority]	INTEGER,
	Fee							MONEY,
	[Site Country]				VARCHAR(20), 
)

-- DROP TABLE DW_DIM_IMPORTERS
-- TRUNCATE TABLE DW_DIM_IMPORTERS
CREATE TABLE DW_DIM_IMPORTERS(
	[Importer ID]		INTEGER,
	[Importer Country]	VARCHAR(20), 
	Region				VARCHAR(20),
	City				VARCHAR(20),
	Birthdate			DATE,
)

-- TRUNCATE TABLE DW_DIM_AIRWAY_BILLS
CREATE TABLE DW_DIM_AIRWAY_BILLS(
	[Airway Bill ID]		INTEGER,
	[From Country]			VARCHAR(20), 
	[To Country]			VARCHAR(20), 
	[Sum Order Cost]		MONEY,
	[ETA Date]				DATE,
	[ATA Date]				DATE,
	[Arrived On Time]		VARCHAR(3),
)

-- DROP TABLE DW_FACT_ORDERS
-- TRUNCATE TABLE DW_FACT_ORDERS
CREATE TABLE DW_FACT_ORDERS(
	[DW ORDER]			INTEGER,
	[Order ID]			INTEGER,
	[Site ID]			INTEGER,
	[Importer ID]		INTEGER,
	[Order Date]		DATE,
	[Airway Bill ID]	INTEGER,
	[Delivery Method]	VARCHAR(20),
	[Order Cost]		MONEY,
	[Delivery Cost]		MONEY,
	[Sum Order Cost]	MONEY,
	ETA					DATE,
	ATA					DATE,
	Satisfaction		INTEGER,
	[Order]				INTEGER,
)


--DROP TABLE DW_DIM_DISTRIBUTORS
-- TRUNCATE TABLE DW_DIM_DISTRIBUTORS
CREATE TABLE DW_DIM_DISTRIBUTORS(
	[DW Distributor]					INTEGER IDENTITY(1,1),
	[Distributor ID]					INTEGER,
	[Distributor Name]					VARCHAR(20), 
	[Max Parcels Per Day]				INTEGER,
	Handling							MONEY,
	[Start Date]						DATE,
	[Distributor Years Of Seniority]	INTEGER,
	Score								INTEGER,
	[Valid From]						DATE,
	[Valid Until]						DATE,
)


--DROP TABLE DW_FACT_PARCELS
-- TRUNCATE TABLE DW_FACT_PARCELS
CREATE TABLE DW_FACT_PARCELS(
	[Parcel ID]			INTEGER, 
	[Site ID]			INTEGER,
	[Importer ID]		INTEGER,
	[Airway Bill ID]	INTEGER,
	[DW Distributor]	INTEGER, --USED TO BE ONLY Distributor
	[Value]				MONEY,
	[Customs Clearance] BIT,
	VAT					MONEY,
	[Weight]			FLOAT,
	[On Time]			BIT,
	[Delivery Date]		DATE,
	[Country Origin]	VARCHAR(20),
	[Country Target]	VARCHAR(20),
)

-- TRUNCATE TABLE DW_DIM_SITE_RATES
CREATE TABLE DW_DIM_SITE_RATES(
	[DW Site Rate ID]		INTEGER IDENTITY(1,1),
	[Site Rate ID]			INTEGER,
	[Year]					INTEGER,
	[Site Rate Name]		VARCHAR(20),
	[Site Rate Country]		VARCHAR(20), 
	[Average Rate]			FLOAT,
	[Num Of Rates]			INTEGER,
	[Orders Count]			INTEGER,
)

--DROP TABLE DW_SUMMARY_YEARLY_ORDERS_BY_SITE_AND_COUNTRY
-- TRUNCATE TABLE DW_SUMMARY_YEARLY_ORDERS_BY_SITE_AND_COUNTRY
CREATE TABLE DW_SUMMARY_YEARLY_ORDERS_BY_SITE_AND_COUNTRY (
	[Site ID]				INTEGER,
	[DW Site Rate ID]		INTEGER,
	Country					VARCHAR(20),
	[Year]					INTEGER,
	[Total Orders By Us]	INTEGER,
	[Total Orders By Site]	INTEGER,
	[Total Orders Cost]		MONEY,
	[Total Delivery Cost]	MONEY,
	[Total Sum Order Cost]	MONEY,
	CONSTRAINT PK_DW_SUMMARY_YEARLY_ORDERS_BY_SITE_AND_COUNTRY PRIMARY KEY ([Site ID], [DW Site Rate ID], Country, [Year])
)

--DROP TABLE DW_SUMMARY_YEARLY_PARCELS_BY_DISTRIBUTOR
-- TRUNCATE TABLE DW_SUMMARY_YEARLY_PARCELS_BY_DISTRIBUTOR
CREATE TABLE DW_SUMMARY_YEARLY_PARCELS_BY_DISTRIBUTOR (
	[Distributor ID]	INTEGER,
	[Year]				INTEGER,
	[Total Parcels]		INTEGER,
	[Total Handling]	MONEY,
	CONSTRAINT PK_DW_SUMMARY_MONTHLY_PARCELS_BY_DISTRIBUTOR_AND_SITE PRIMARY KEY ([Distributor ID], [Year])
)


CREATE TABLE OLD_VERSION_DISTRIBUTORS(
	[DW Distributor]					INTEGER,
	[Distributor ID]					INTEGER,
	[Distributor Name]					VARCHAR(20), 
	[Max Parcels Per Day]				INTEGER,
	Handling							MONEY,
	[Start Date]						DATE,
	[Distributor Years Of Seniority]	INTEGER,
	Score								INTEGER,
	[Valid From]						DATE,
	[Valid Until]						DATE
)


--DROP TABLE OLD_VERSION_DISTRIBUTORS

CREATE PROCEDURE UPDATE_OLD_VERSION_DISTRIBUTORS
AS BEGIN
UPDATE DW_DIM_DISTRIBUTORS
SET [Valid Until] = GETDATE()
WHERE [DW Distributor] IN (SELECT [DW Distributor] FROM OLD_VERSION_DISTRIBUTORS)
TRUNCATE TABLE OLD_VERSION_DISTRIBUTORS
END