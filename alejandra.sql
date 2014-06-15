--Import data for 2001 Tax Assessor into Memphis database
--Table names are "tax2001NAME" where NAME is the name of the file
--Variables are set up using the names in the 2001 readme file

--No additions table for 2001
--drop table if exists tax2001_addn;
--create table tax2001_addn (parid varchar, card integer, lline)

--Agricultural application table
drop table if exists tax2001_agappl;
create table tax2001_agappl (agappl varchar, name1 varchar, name2 varchar, addr1 varchar,
	addr2 varchar, zip1 varchar, zip2 varchar, acres numeric, legacres numeric, note varchar);
\copy tax2001_agappl from '/mnt/data/memphis/Assessor/2001/AGAPPL.txt' delimiter ',' csv header;

--Agricultural Land - note that there are multiple records per parcel recording the acreages of different soil types
drop table if exists tax2001_agland;
create table tax2001_agland (parid varchar, soil varchar, acres numeric);
\copy tax2001_agland from '/mnt/data/memphis/Assessor/2001/AGLAND.txt' delimiter ',' csv header;

--Assessed Values ASMT
drop table if exists tax2001_asmt;
create table tax2001_asmt (parid varchar, aprland numeric, aprbldg numeric, farmland numeric, hmsdland numeric,
	hmsdbldg numeric, class varchar, luc varchar, flag2 varchar, note1 varchar, note2 varchar, asmtland numeric,
	asmtbldg numeric, rtotapr numeric, rtotasmt numeric, rtotgrnasmt numeric, rtotgrnapr numeric);
\copy tax2001_asmt from '/mnt/data/memphis/Assessor/2001/ASMT.txt' delimiter ',' csv header;

--Commercial appartment data - multiple records per parcel, one for each type of apartment (eg 2 bed 2 bath vs studio)
--How accurate is rent and income? What is diff
--Income is total income from that all units of that type. So 12 * rent * num units.
drop table if exists tax2001_comapt;
create table tax2001_comapt (parid varchar, card numeric, usetype varchar, incuse varchar, incmod varchar,
	cnt numeric, bed numeric, bath numeric, half numeric, fireplace numeric, units numeric, rent numeric, income numeric);
\copy tax2001_comapt from '/mnt/data/memphis/Assessor/2001/COMAPT.txt' delimiter ',' csv header;

--Commercial Building data. It appears that Parid + card might be a unique id? 
drop table if exists tax2001_comdat;
create table tax2001_comdat (parid varchar, card numeric, bldnum numeric, yrblt numeric,effyr numeric, units numeric, structure varchar,
	grade varchar, numindent numeric, imprname varchar, note1 varchar, note2 varchar, yrremod numeric);
\copy tax2001_comdat from '/mnt/data/memphis/Assessor/2001/COMDAT.txt' delimiter ',' csv header;

--Not importing comfeat, on commercial features like decks, elevators, carports, coolers, for the moment.

--Not importing comintext, on details of the interior and exterior of commercial buildings, for the moment.

--Not importing comnt, on comments, for the moment.

--Dwelling data - multiple records by improvement.
drop table if exists tax2001_dweldat;
create table tax2001_dweldat (parid varchar, card numeric, stories numeric, extwall varchar, style varchar, yrblt numeric, 
	effyr numeric, rmtot numeric, rmbed numeric, rmfam numeric, fixbath numeric, fixhalf numeric, fixaddl numeric,
	fixtot numeric, bsmt varchar, heat varchar, fuel varchar, heatsys varchar, attic varchar, intext varchar,
	wbfp_o numeric, wbfp_s numeric, wbfp_pf numeric, bsmtcar numeric, condolvl numeric, condotyp varchar, mgfa numeric,
	sfla numeric, grade varchar, cond varchar, cdu varchar, note1 varchar, note2 varchar, user1 varchar, rooftype varchar, roofcover varchar);
\copy tax2001_dweldat from '/mnt/data/memphis/Assessor/2001/DWELDAT.txt' delimiter ',' csv header;

--Not importing enter on entrance information right now

--Land information - multiple records one for each lline = land segment number
drop table if exists tax2001_land;
create table tax2001_land (parid varchar, lline numeric, ltype varchar, code varchar, frontact numeric, 
	froneff numeric, depth numeric, sf numeric, acres numeric, note1 varchar);
\copy tax2001_land from '/mnt/data/memphis/Assessor/2001/LAND.txt' delimiter ',' csv header;

--Legal Data - I'm intrigued mainly by the subdivision names.
drop table if exists tax2001_legdat;
create table tax2001_legdat (parid varchar, rts varchar, acres numeric, legal1 varchar, legal2 varchar,
	legal3 varchar, note1 varchar, note2 varchar, lotdimens varchar, sublot varchar, subdivname varchar, user4 varchar);
\copy tax2001_legdat from '/mnt/data/memphis/Assessor/2001/LEGDAT.txt' delimiter ',' csv header;

--Other building and yard data - multiple records by parid and lline, maybe also card?
drop table if exists tax2001_oby;
create table tax2001_oby (parid varchar, lline numeric, card numeric, code varchar, yrblt numeric, effyr numeric,
	yrrem numeric, length numeric, width numeric, area numeric, grade varchar, cond varchar, funct varchar);
\copy tax2001_oby from '/mnt/data/memphis/Assessor/2001/OBY.txt' delimiter ',' csv header;

--Owner data 
drop table if exists tax2001_owndat;
create table tax2001_owndat (parid varchar, own1 varchar, own2 varchar, addr1 varchar, addr2 varchar, addr3 varchar,
	zip1 varchar, zip2 varchar, partial varchar, agappl varchar, note1 varchar, note2 varchar);
\copy tax2001_owndat from '/mnt/data/memphis/Assessor/2001/OWNDAT.txt' delimiter ',' csv header;

--Parcel level data
drop table if exists tax2001_pardat;
create table tax2001_pardat (parid varchar, taxyr numeric, altid varchar, adrno numeric, adradd varchar, adrdir varchar, adrstr varchar,
	adrsuf varchar, nbhd_p varchar, nbhd_s varchar, juris varchar, class varchar, luc varchar, livunit numeric, zoning varchar,
	note1 varchar, note2 varchar, ofcard numeric, region varchar);
\copy tax2001_pardat from '/mnt/data/memphis/Assessor/2001/PARDAT.txt' delimiter ',' csv header;

--Permit amounts 
drop table if exists tax2001_permit;
create table tax2001_permit (parid varchar, num varchar, permdt timestamp, why varchar, amount numeric, flag varchar, description varchar);
\copy tax2001_permit from '/mnt/data/memphis/Assessor/2001/PERMIT.txt' delimiter ',' csv header;

--Sales
drop table if exists tax2001_sales;
create table tax2001_sales (parid varchar, transno varchar, saledt timestamp, price numeric, saletype varchar, 
saleval varchar, note1 varchar, note2 varchar, steb varchar, numpars numeric);
\copy tax2001_sales from '/mnt/data/memphis/Assessor/2001/SALES.txt' delimiter ',' csv header;


--Sales

create table tax2002_sales (parid varchar, transno varchar, saledt timestamp, price numeric, saletype varchar, 
saleval varchar, note1 varchar, note2 varchar, steb varchar, numpars numeric);
\copy tax2001_sales from '/mnt/data/memphis/Assessor/2001/SALES.txt' delimiter ',' csv header;
