select * from pdevdta.rjffpf
where cnttyp in ('IAR','FEP');

with ctex as ( 
select chdrno, cnttyp, dteeff, 
       fsplc01 || ':' || fsplc02 || ':' || fsplc03 || ':' || fsplc04 || ':' || fsplc05 || ':' || fsplc06 || ':' || fsplc07 || ':' || fsplc08 || ':' || fsplc09 || ':' || fsplc10 || ':' ||
       fsplc11 || ':' || fsplc12 || ':' || fsplc13 || ':' || fsplc14 || ':' || fsplc15 || ':' || fsplc16 || ':' || fsplc17 || ':' || fsplc18 || ':' || fsplc19
       as fsplc_all 
 from zurdta.rjffpf a
-- from pactdta.rjffpf a
 where valid_flag = '1'
)
select distinct a.* from ctex a 
where cnttyp in ('IAR','FEP') 
 and dteeff >= 20200101
   and
       (fsplc_all like '%G0%' 
     or fsplc_all like '%G1%'
     or fsplc_all like '%G2%'
     or fsplc_all like '%G3%'
     or fsplc_all like '%G5%'
     or fsplc_all like '%G6%'
     or fsplc_all like '%L1%'
     or fsplc_all like '%L2%'
     or fsplc_all like '%L3%'
     or fsplc_all like '%L4%') 
order by dteeff desc 
;


SELECT BATCACTYR, BATCACTMN, CHDRNUM, CNTTYPE, BATCTRCDE, CURRFROM,
CCDATE, CURRTO, CRDATE                     
FROM pdevwrk.rochfi0041 
--FROM pdevwrk.rochfi0022 
--FROM pdevwrk.rochfi0020 
;

with ctex as ( 
select chdrno, cnttyp, dteeff, 
       fsplc01 || ':' || fsplc02 || ':' || fsplc03 || ':' || fsplc04 || ':' || fsplc05 || ':' || fsplc06 || ':' || fsplc07 || ':' || fsplc08 || ':' || fsplc09 || ':' || fsplc10 || ':' ||
       fsplc11 || ':' || fsplc12 || ':' || fsplc13 || ':' || fsplc14 || ':' || fsplc15 || ':' || fsplc16 || ':' || fsplc17 || ':' || fsplc18 || ':' || fsplc19
       as fsplc_all 
 from zurdta.rjffpf
 --from pdevdta.rjffpf
 where valid_flag='1'
)
SELECT distinct BATCACTYR, BATCACTMN, CHDRNUM, CNTTYPE, BATCTRCDE, tranno, CCDATE, CURRFROM,
CURRTO, CRDATE, x.dteeff, x.fsplc_all        
FROM zurwrk.ROCHFI0028 a 
--FROM pdevwrk.ROCHFI0041 a 
--FROM pdevwrk.ROCHFI0032 a 
--FROM pdevwrk.ROCHFI0022 a 
--FROM pdevwrk.ROCHFI0028  
--FROM pdevwrk.ROCHFI0023  
--FROM pdevwrk.rochfi0020
inner join ctex x 
on x.chdrno = chdrnum
and x.dteeff = currfrom 
order by chdrnum,tranno
--where chdrnum='21172196'
;

select * FROM pdevwrk.ROCHFI0022 
;
