select * from pdevwrk.P097EQCHDR
where cnttype = 'IAR'
;

select * from pdevwrk.P097250401
where cnttype = 'IAR'
;

with ctex as ( 
select chdrno, cnttyp, dteeff, 
       fsplc01 || ':' || fsplc02 || ':' || fsplc03 || ':' || fsplc04 || ':' || fsplc05 || ':' || fsplc06 || ':' || fsplc07 || ':' || fsplc08 || ':' || fsplc09 || ':' || fsplc10 || ':' ||
       fsplc11 || ':' || fsplc12 || ':' || fsplc13 || ':' || fsplc14 || ':' || fsplc15 || ':' || fsplc16 || ':' || fsplc17 || ':' || fsplc18 || ':' || fsplc19
       as fsplc_all 
 from pdevdta.rjffpf
)
SELECT distinct CHDRNUM, CNTTYPE, EQ, x.dteeff, x.fsplc_all                     
FROM pdevwrk.P097250405 
left outer join ctex x 
on x.chdrno = chdrnum
where cnttype = 'IAR'
;
