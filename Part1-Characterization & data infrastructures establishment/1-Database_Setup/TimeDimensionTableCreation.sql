--DROP TABLE DW_DIM_DATE
create table DW_DIM_DATE
(
	TheDate date,
	TheDay int,
	TheDayName varchar(20),
	TheDayOfWeek int,
	IsWeekend int,
	TheWeek int,
	TheWeekOfMonth int,
	TheMonth int,
	TheMonthName varchar(20),
	TheQuarter int,
	TheFirstOfQuarter date,
	TheLastOfQuarter date,
	TheYear int,
	IsLeapYear int
	)


DECLARE @StartDate  date = '20170101';
DECLARE @CutoffDate date = DATEADD(DAY, -1, DATEADD(YEAR, 30, @StartDate));
;WITH seq(n) AS
(
  SELECT 0 UNION ALL SELECT n + 1 FROM seq
  WHERE n < DATEDIFF(DAY, @StartDate, @CutoffDate)
),
d(d) AS
(
  SELECT DATEADD(DAY, n, @StartDate) FROM seq
),
src AS
(
  SELECT
    TheDate         = CONVERT(date, d),
    TheDay          = DATEPART(DAY,       d),
    TheDayName      = DATENAME(WEEKDAY,   d),
    TheWeek         = DATEPART(WEEK,      d),
    TheISOWeek      = DATEPART(ISO_WEEK,  d),
    TheDayOfWeek    = DATEPART(WEEKDAY,   d),
    TheMonth        = DATEPART(MONTH,     d),
    TheMonthName    = DATENAME(MONTH,     d),
    TheQuarter      = DATEPART(Quarter,   d),
    TheYear         = DATEPART(YEAR,      d),
    TheFirstOfMonth = DATEFROMPARTS(YEAR(d), MONTH(d), 1),
    TheLastOfYear   = DATEFROMPARTS(YEAR(d), 12, 31),
    TheDayOfYear    = DATEPART(DAYOFYEAR, d)
  FROM d
),

dim AS
(
  SELECT
    TheDate,
    TheDay,
    TheDayName,
    TheDayOfWeek,
    IsWeekend           = CASE WHEN TheDayOfWeek IN (CASE @@DATEFIRST WHEN 1 THEN 6 WHEN 7 THEN 1 END,7)
                            THEN 1 ELSE 0 END,
    TheWeek,
    TheWeekOfMonth      = CONVERT(tinyint, DENSE_RANK() OVER
                            (PARTITION BY TheYear, TheMonth ORDER BY TheWeek)),
    TheMonth,
    TheMonthName,
    TheQuarter,
    TheFirstOfQuarter   = MIN(TheDate) OVER (PARTITION BY TheYear, TheQuarter),
    TheLastOfQuarter    = MAX(TheDate) OVER (PARTITION BY TheYear, TheQuarter),
    TheYear,
    IsLeapYear          = CONVERT(bit, CASE WHEN (TheYear % 400 = 0)
                            OR (TheYear % 4 = 0 AND TheYear % 100 <> 0)
                            THEN 1 ELSE 0 END)
  FROM src
)
insert into DW_DIM_DATE
SELECT * FROM dim
  ORDER BY TheDate

OPTION (MAXRECURSION 0);






  