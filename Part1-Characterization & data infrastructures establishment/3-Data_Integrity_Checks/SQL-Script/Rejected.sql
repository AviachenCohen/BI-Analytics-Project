Use DW_For_Slowly_Changing_Dimension_Type2

--TRUNCATE TABLE DW_FACT_REJECTED_PARCELS
CREATE TABLE DW_FACT_REJECTED_PARCELS (
	[DW_Rejected_Parcel]	INTEGER IDENTITY(1,1),
	[Parcel ID]				INTEGER, -- NOT SURE IF WE NEED THIS FIELD, ILL CHECK LATER
	[Site ID]				INTEGER,
	[Importer ID]			INTEGER,
	[Airway Bill ID]		INTEGER,
	[DW Distributor]		INTEGER, 
	[Value]					MONEY,
	[Customs Clearance]		BIT,
	VAT						MONEY,
	[Weight]				FLOAT,
	[On Time]				BIT,
	[Delivery Date]			DATE,
	[Country Origin]		VARCHAR(20),
	[Country Target]		VARCHAR(20),
	)


