Use DW_For_Slowly_Changing_Dimension_Type2
-- DROP TABLE DW_MART_OLAP
CREATE TABLE DW_MART_OLAP(
   	[Parcel ID]					INTEGER,
	[Site ID]					INTEGER,
   	[Airway Bill ID]			INTEGER,
   	[Distributor ID]			INTEGER,
   	[On Time]					BIT,
   	[Delivery Date]				DATE,
	[Country Origin]			VARCHAR(20),
	[Site Name]					VARCHAR(20),
	[Contract Date]				DATE,
	[Site Years Of Seniority]	INTEGER,
	[Fee]						MONEY,
	[Continent]					VARCHAR(20),
	[Importer ID]				INTEGER,
	[Region]					VARCHAR(20),
	[City]						VARCHAR(20)
)
 
 SELECT * FROM DW_MART_OLAP where [Delivery Date] IS NULL