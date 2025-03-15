


-- DROP TABLE DW_MART_TACTI
CREATE TABLE DW_MART_TACTI(
	[DW ORDER]					INTEGER,
	[Importer ID]				INTEGER,
	[Order Date]				DATE,
	[Order ETA]					DATE,
	[Order ATA]					DATE,
	[Delivery Method]			VARCHAR(20),
   	[Age]						INTEGER,
   	[Region]					VARCHAR(20),
   	[Satisfaction]				INTEGER,
   	[On Time]					INTEGER,
   	[Delivery Cost]				MONEY,
)
 
 select * from DW_MART_TACTI