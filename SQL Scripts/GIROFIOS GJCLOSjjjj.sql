with ctex as ( 
select chdrno, cnttyp, dteeff, dteter,tranno,
       fsplc01 || ':' || fsplc02 || ':' || fsplc03 || ':' || fsplc04 || ':' || fsplc05 || ':' || fsplc06 || ':' || fsplc07 || ':' || fsplc08 || ':' || fsplc09 || ':' || fsplc10 || ':' ||
       fsplc11 || ':' || fsplc12 || ':' || fsplc13 || ':' || fsplc14 || ':' || fsplc15 || ':' || fsplc16 || ':' || fsplc17 || ':' || fsplc18 || ':' || fsplc19
       as fsplc_all 
 from pdevdta.rjffpf
)
SELECT distinct BATCACTYR, BATCACTMN, CHDRNUM, CNTTYPE, CLAIM, DATOCC, CLAMSTAT, BATCTRCDE, CURRFROM,
CCDATE, CRDATE, x.dteeff, x.tranno, x.fsplc_all                     
FROM pdevwrk.GJCLOS0093
--FROM pdevwrk.GJCLOS0091
inner join ctex x 
on x.chdrno = chdrnum
and x.dteeff between currfrom and currto 
where cnttype in ('IAR','FEP')
--and batcactyr >= 2024
--and batcactmn = 03
;

select * FROM pdevwrk.GJCLOS0090 
where batcactyr=2024
