Use MRR_For_Slowly_Changing_Dimension_Type2

--DROP TABLE MRR_COUNTRIES
--TRUNCATE TABLE MRR_COUNTRIES
CREATE TABLE MRR_COUNTRIES (
	Country		VARCHAR(20)	NOT NULL,
	Continent	VARCHAR(20),
	Population	INTEGER,
	CONSTRAINT PK_COUNTRIES PRIMARY KEY (Country)
	)

--DROP TABLE MRR_SITES
--TRUNCATE TABLE MRR_SITES
CREATE TABLE MRR_SITES (
	ID					INTEGER		NOT NULL,
	Name				VARCHAR(20),
	[Contract Date]		DATE,
	Fee					MONEY,
	Country				VARCHAR(20),
	CONSTRAINT PK_SITES PRIMARY KEY (ID)
	)

--DROP TABLE MRR_IMPORTERS
--TRUNCATE TABLE MRR_IMPORTERS
CREATE TABLE MRR_IMPORTERS (
	ID			INTEGER		NOT NULL,
	Country		VARCHAR(20),
	Region		VARCHAR(20),
	City		VARCHAR(20),
	Birthdate	DATE,
	CONSTRAINT PK_IMPORTERS PRIMARY KEY (ID)
	)

--DROP TABLE MRR_AIRWAY_BILLS
--TRUNCATE TABLE MRR_AIRWAY_BILLS
CREATE TABLE MRR_AIRWAY_BILLS (
	ID					INTEGER		NOT NULL,
	[From]				VARCHAR(20), 
	[To]				VARCHAR(20),
	[Sum Order Cost]	MONEY,
	ETA					DATE,
	ATA					DATE,
	CONSTRAINT PK_AIRWAY_BILLS PRIMARY KEY (ID)
	)

--DROP TABLE MRR_ORDERS
--TRUNCATE TABLE MRR_ORDERS
CREATE TABLE MRR_ORDERS (
	[DW ORDER]			INTEGER		NOT NULL,
	OrderID				INTEGER		NOT NULL,
	[Site ID]			INTEGER		NOT NULL,
	[Importer ID]		INTEGER		NOT NULL,
	[Order Date]		DATE		NOT NULL,
	[Airway Bill ID]	INTEGER		NOT NULL,	
	[Delivery Method]	VARCHAR(20),
	[Order Cost]		MONEY,
	[Delivery Cost]		MONEY,
	[Sum Order Cost]	MONEY,
	ETA					DATE,
	ATA					DATE,
	Satisfaction		INTEGER,	
	CONSTRAINT PK_ORDERS PRIMARY KEY (OrderID, [Site ID])
	)

--DROP TABLE MRR_DISTRIBUTORS
--TRUNCATE TABLE MRR_DISTRIBUTORS
CREATE TABLE MRR_DISTRIBUTORS (
	ID						INTEGER		NOT NULL,
	Name					VARCHAR(20),
	[Max Parcels Per Day]	INTEGER,
	Handling				MONEY,
	[Start Date]			DATE,
	Score					INTEGER,
	CONSTRAINT PK_DISTRIBUTORS PRIMARY KEY (ID)
	)

--DROP TABLE MRR_PARCELS
--TRUNCATE TABLE MRR_PARCELS
CREATE TABLE MRR_PARCELS (
	ID					INTEGER		NOT NULL,
	OrderID				INTEGER		NOT NULL,
	[Site ID]			INTEGER		NOT NULL,
	Distributor			INTEGER		NOT NULL,
	[Customs Clearance]	BIT,
	Weight				FLOAT,
	[Delivery Date]		Date,
	CONSTRAINT PK_PARCELS PRIMARY KEY (ID)
	)
