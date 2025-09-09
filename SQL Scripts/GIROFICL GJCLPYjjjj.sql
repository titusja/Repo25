with ctex as ( 
select chdrno, cnttyp, dteeff, dteter,tranno,
       fsplc01 || ':' || fsplc02 || ':' || fsplc03 || ':' || fsplc04 || ':' || fsplc05 || ':' || fsplc06 || ':' || fsplc07 || ':' || fsplc08 || ':' || fsplc09 || ':' || fsplc10 || ':' ||
       fsplc11 || ':' || fsplc12 || ':' || fsplc13 || ':' || fsplc14 || ':' || fsplc15 || ':' || fsplc16 || ':' || fsplc17 || ':' || fsplc18 || ':' || fsplc19
       as fsplc_all 
 from pactdta.rjffpf
-- from pdevdta.rjffpf
)
SELECT distinct BATCACTYR, BATCACTMN, CHDRNUM, CNTTYPE, CLAIM, DATOCC, x.fsplc_all,  CLAMSTAT, BATCTRCDE, CURRFROM,
CCDATE, CRDATE, x.dteeff, x.tranno                     
FROM pactwrk.GJCLPY0007 
--FROM pdevwrk.GJCLPY0011 
--FROM pdevwrk.GJCLPY0010 
--FROM pdevwrk.GJCLPY0008 
--FROM pdevwrk.GJCLPY0007 
Left outer join ctex x 
on x.chdrno = chdrnum
and x.dteeff = currfrom 
--where chdrnum='21172196'