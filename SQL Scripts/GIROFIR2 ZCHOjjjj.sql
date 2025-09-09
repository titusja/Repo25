with ctex as ( 
select chdrno, cnttyp, dteeff, 
       fsplc01 || ':' || fsplc02 || ':' || fsplc03 || ':' || fsplc04 || ':' || fsplc05 || ':' || fsplc06 || ':' || fsplc07 || ':' || fsplc08 || ':' || fsplc09 || ':' || fsplc10 || ':' ||
       fsplc11 || ':' || fsplc12 || ':' || fsplc13 || ':' || fsplc14 || ':' || fsplc15 || ':' || fsplc16 || ':' || fsplc17 || ':' || fsplc18 || ':' || fsplc19
       as fsplc_all 
 from pactdta.rjffpf
)
select * from ctex 
where --cnttyp = 'IAR' and
       (fsplc_all like '%G0%' 
     or fsplc_all like '%G1%'
     or fsplc_all like '%G2%'
     or fsplc_all like '%G3%'
     or fsplc_all like '%G5%'
     or fsplc_all like '%G6%')
order by dteeff desc 
;

select * FROM 
zurwrk.ZCHO0018 
--pdevwrk.ZCHO0018 
;

SELECT BATCACTYR, BATCACTMN, CHDRNUM, CNTTYPE, BATCTRCDE, CURRFROM,
CCDATE, CURRTO, CRDATE                     
--FROM pdevwrk.rochfi0022 
FROM pdevwrk.ZCHO0019 
;


with ctex as ( 
select chdrno, cnttyp, dteeff, 
       fsplc01 || ':' || fsplc02 || ':' || fsplc03 || ':' || fsplc04 || ':' || fsplc05 || ':' || fsplc06 || ':' || fsplc07 || ':' || fsplc08 || ':' || fsplc09 || ':' || fsplc10 || ':' ||
       fsplc11 || ':' || fsplc12 || ':' || fsplc13 || ':' || fsplc14 || ':' || fsplc15 || ':' || fsplc16 || ':' || fsplc17 || ':' || fsplc18 || ':' || fsplc19
       as fsplc_all 
 from pdevdta.rjffpf
)
SELECT BATCACTYR, BATCACTMN, CHDRNUM, CNTTYPE, BATCTRCDE, CURRFROM,
CCDATE, CURRTO, CRDATE, x.dteeff, x.fsplc_all                     
FROM pdevwrk.ROCHFI0028  
--FROM pdevwrk.ROCHFI0023  
--FROM pdevwrk.rochfi0020
left outer join ctex x 
on x.chdrno = chdrnum
and x.dteeff = currfrom 
where chdrnum='21172196'
;
