/* Project Part 2 Eric Wright */

/* Step 1 */
options validvarname=v7;
libname BAS150 '/home/u60652366/myfolders';

FILENAME CASES '/home/u60652366/BAS150/us_counties_cases_covid_confirmed_usafacts.xlsx';

PROC IMPORT DATAFILE=CASES
	DBMS=XLSX
	OUT=BAS150.COVID replace;
	GETNAMES=YES;
RUN;

/* Steps 2 and 3*/
DATA BAS150.COVID;
SET BAS150.COVID; 
IF county_name= "Statewide Unallocated" THEN delete;
aug_cases_2021= (as_of_8_31_2021)-(as_of_7_31_2021);
sep_cases_2021= (as_of_9_30_2021)-(as_of_8_31_2021);
oct_cases_2021= (as_of_10_31_2021)-(as_of_9_30_2021);
nov_cases_2021= (as_of_11_30_2021)-(as_of_10_31_2021);
dec_cases_2021= (as_of_12_31_2021)-(as_of_11_30_2021);
RUN;

/* Step 4 */
PROC MEANS DATA=Bas150.COVID;
VAR aug_cases_2021 sep_cases_2021 oct_cases_2021 nov_cases_2021 dec_cases_2021;
RUN;

/* Step 5 (PROC PRINTS are extra; easier for me to analyze) */
PROC SORT DATA=BAS150.COVID OUT=BAS150.aug_cases_2021;
BY DESCENDING aug_cases_2021;
RUN;

PROC PRINT DATA=BAS150.aug_cases_2021(obs=5);
var county_name state aug_cases_2021;
RUN;

PROC SORT DATA=BAS150.COVID OUT=BAS150.sep_cases_2021;
BY DESCENDING sep_cases_2021;
RUN;

PROC PRINT DATA=BAS150.sep_cases_2021(obs=5);
var county_name state sep_cases_2021;
RUN;

PROC SORT DATA=BAS150.COVID OUT=BAS150.oct_cases_2021;
BY DESCENDING oct_cases_2021;
RUN;

PROC PRINT DATA=BAS150.oct_cases_2021(obs=5);
var county_name state oct_cases_2021;
RUN;

PROC SORT DATA=BAS150.COVID OUT=BAS150.nov_cases_2021;
BY DESCENDING nov_cases_2021;
RUN;

PROC PRINT DATA=BAS150.nov_cases_2021(obs=5);
var county_name state nov_cases_2021;
RUN;

PROC SORT DATA=BAS150.COVID OUT=BAS150.dec_cases_2021;
BY DESCENDING dec_cases_2021;
RUN;

PROC PRINT DATA=BAS150.dec_cases_2021(obs=5);
var county_name state dec_cases_2021;
RUN;


/* Extra code to figure out which counties had the biggest
	drop in covid cases from month to month (Aug-December) */
	
DATA BAS150.COVID;
SET BAS150.COVID;
IF county_name= "Statewide Unallocated" THEN delete;
jul_cases_2021= (as_of_7_31_2021)-(as_of_6_30_2021);
aug_cases_2021= (as_of_8_31_2021)-(as_of_7_31_2021);
sep_cases_2021= (as_of_9_30_2021)-(as_of_8_31_2021);
oct_cases_2021= (as_of_10_31_2021)-(as_of_9_30_2021);
nov_cases_2021= (as_of_11_30_2021)-(as_of_10_31_2021);
dec_cases_2021= (as_of_12_31_2021)-(as_of_11_30_2021); 
aug_cases_change_2021= (aug_cases_2021)-(jul_cases_2021);
sep_cases_change_2021= (sep_cases_2021)-(aug_cases_2021);
oct_cases_change_2021= (oct_cases_2021)-(sep_cases_2021);
nov_cases_change_2021= (nov_cases_2021)-(oct_cases_2021);
dec_cases_change_2021= (dec_cases_2021)-(nov_cases_2021);
RUN;

PROC MEANS DATA=BAS150.COVID;
VAR aug_cases_change_2021 sep_cases_change_2021 oct_cases_change_2021 nov_cases_change_2021 dec_cases_change_2021;
RUN;

PROC SORT DATA=BAS150.COVID OUT=BAS150.aug_cases_drop_2021;
BY aug_cases_change_2021;
RUN;

PROC PRINT DATA=BAS150.aug_cases_drop_2021(obs=5);
var county_name state aug_cases_change_2021;
RUN;

PROC SORT DATA=BAS150.COVID OUT=BAS150.sep_cases_drop_2021;
BY sep_cases_change_2021;
RUN;

PROC PRINT DATA=BAS150.sep_cases_drop_2021(obs=5);
var county_name state sep_cases_change_2021;
RUN;

PROC SORT DATA=BAS150.COVID OUT=BAS150.oct_cases_drop_2021;
BY oct_cases_change_2021;
RUN;

PROC PRINT DATA=BAS150.oct_cases_drop_2021(obs=5);
var county_name state oct_cases_change_2021;
RUN;

PROC SORT DATA=BAS150.COVID OUT=BAS150.nov_cases_drop_2021;
BY nov_cases_change_2021;
RUN;

PROC PRINT DATA=BAS150.nov_cases_drop_2021(obs=5);
var county_name state nov_cases_change_2021;
RUN;

PROC SORT DATA=BAS150.COVID OUT=BAS150.dec_cases_drop_2021;
BY dec_cases_change_2021;
RUN;

PROC PRINT DATA=BAS150.dec_cases_drop_2021(obs=5);
var county_name state dec_cases_change_2021;
RUN;	
	

/* Extra code to figure out which counties had the biggest
	increase in covid cases from month to month (Aug-December) */
	
DATA BAS150.COVID;
SET BAS150.COVID;
IF county_name= "Statewide Unallocated" THEN delete;
aug_cases_2021= (as_of_8_31_2021)-(as_of_7_31_2021);
sep_cases_2021= (as_of_9_30_2021)-(as_of_8_31_2021);
oct_cases_2021= (as_of_10_31_2021)-(as_of_9_30_2021);
nov_cases_2021= (as_of_11_30_2021)-(as_of_10_31_2021);
dec_cases_2021= (as_of_12_31_2021)-(as_of_11_30_2021); 
jul_cases_2021= (as_of_7_31_2021)-(as_of_6_30_2021);
aug_cases_change_2021= (aug_cases_2021)-(jul_cases_2021);
sep_cases_change_2021= (sep_cases_2021)-(aug_cases_2021);
oct_cases_change_2021= (oct_cases_2021)-(sep_cases_2021);
nov_cases_change_2021= (nov_cases_2021)-(oct_cases_2021);
dec_cases_change_2021= (dec_cases_2021)-(nov_cases_2021);
RUN;

PROC MEANS DATA=BAS150.COVID;
VAR aug_cases_change_2021 sep_cases_change_2021 oct_cases_change_2021 nov_cases_change_2021 dec_cases_change_2021;
RUN;

PROC SORT DATA=BAS150.COVID OUT=BAS150.aug_cases_increase_2021;
BY DESCENDING aug_cases_change_2021;
RUN;

PROC PRINT DATA=BAS150.aug_cases_increase_2021(obs=5);
var county_name state aug_cases_change_2021;
RUN;

PROC SORT DATA=BAS150.COVID OUT=BAS150.sep_cases_increase_2021;
BY DESCENDING sep_cases_change_2021;
RUN;

PROC PRINT DATA=BAS150.sep_cases_increase_2021(obs=5);
var county_name state sep_cases_change_2021;
RUN;

PROC SORT DATA=BAS150.COVID OUT=BAS150.oct_cases_increase_2021;
BY DESCENDING oct_cases_change_2021;
RUN;

PROC PRINT DATA=BAS150.oct_cases_increase_2021(obs=5);
var county_name state oct_cases_change_2021;
RUN;

PROC SORT DATA=BAS150.COVID OUT=BAS150.nov_cases_increase_2021;
BY DESCENDING nov_cases_change_2021;
RUN;

PROC PRINT DATA=BAS150.nov_cases_increase_2021(obs=5);
var county_name state nov_cases_change_2021;
RUN;

PROC SORT DATA=BAS150.COVID OUT=BAS150.dec_cases_increase_2021;
BY DESCENDING dec_cases_change_2021;
RUN;

PROC PRINT DATA=BAS150.dec_cases_increase_2021(obs=5);
var county_name state dec_cases_change_2021;
RUN;		
	
	
	
	
	