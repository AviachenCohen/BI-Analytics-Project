Use STG_For_Slowly_Changing_Dimension_Type_2

--DROP TABLE COUNTRIES
--TRUNCATE TABLE STG_COUNTRIES
CREATE TABLE STG_COUNTRIES (
	Country		VARCHAR(20),
	Continent	VARCHAR(20),
	Population	INTEGER,
	)

--DROP TABLE STG_SITES
--TRUNCATE TABLE STG_SITES
CREATE TABLE STG_SITES (
	[Site ID]					INTEGER,
	[Site Name]					VARCHAR(20),
	[Contract Date]				DATE,
	Fee							MONEY,
	[Site Years Of Seniority]	INTEGER,
	[Site Country]				VARCHAR(20),
	)

--DROP TABLE STG_IMPORTERS
--TRUNCATE TABLE STG_IMPORTERS
CREATE TABLE STG_IMPORTERS (
	[Importer ID]			INTEGER,
	[Importer Country]		VARCHAR(20),
	Region					VARCHAR(20),
	City					VARCHAR(20),
	Birthdate				DATE,
	)

--DROP TABLE STG_AIRWAY_BILLS
--TRUNCATE TABLE STG_AIRWAY_BILLS
CREATE TABLE STG_AIRWAY_BILLS (
	[Airway Bill ID]	INTEGER,
	[From Country]		VARCHAR(20), 
	[To Country]		VARCHAR(20),
	[Sum Order Cost]	MONEY,
	[ETA Date]			DATE,
	[ATA Date]			DATE,
	[Arrived On Time]	VARCHAR(3),
	)

--DROP TABLE STG_ORDERS
--TRUNCATE TABLE STG_ORDERS
CREATE TABLE STG_ORDERS (
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

--DROP TABLE STG_DISTRIBUTORS
--TRUNCATE TABLE STG_DISTRIBUTORS
CREATE TABLE STG_DISTRIBUTORS (
	[Distributor ID]					INTEGER,
	[Distributor Name]					VARCHAR(20),
	[Max Parcels Per Day]				INTEGER,
	Handling							MONEY,
	[Start Date]						DATE,
	[Distributor Years Of Seniority]	INTEGER,
	Score								INTEGER,
	)

--ALTER TABLE STG_DISTRIBUTORS
--ADD [DW Distributor]	INTEGER	IDENTITY(1,1),
--[Valid From]			DATE,
--[Valid Until]			DATE


--DROP TABLE STG_PARCELS
--TRUNCATE TABLE STG_PARCELS
CREATE TABLE STG_PARCELS (
	[Parcel ID]			INTEGER,
	[Site ID]			INTEGER,
	[Importer ID]		INTEGER,
	[Airway Bill ID]	INTEGER,
	[DW Distributor]	INTEGER,	
	[Value]				MONEY,
	[Customs Clearance]	BIT,
	VAT					MONEY,
	[Weight]			FLOAT,
	[On Time]			BIT,
	[Delivery Date]		Date,
	[Country Origin]	VARCHAR(20),
	[Country Target]	VARCHAR(20),
	)
