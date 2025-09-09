select 'XACT', max(datime) from xactdta.bsscpf
where bschednam = 'GIROFIRE'
union all
select 'TACT', max(datime) from tactdta.bsscpf
where bschednam = 'GIROFIRE'
union all
select 'PACT', max(datime) from pactdta.bsscpf
where bschednam = 'GIROFIRE'
;

select cnttype, count(chdrnum), max(ccdate), max(datime)
--from tactdta.chdrpf -- 143 IAR, 2 FEP
--from tsitdta.chdrpf -- 10 IAR, no FEP
--from pactdta.chdrpf --280 IAR, 14 FEP
from psitdta.chdrpf --280 IAR, 14 FEP
--from pdevdta.chdrpf 960 IAR, 230 FEP
where cnttype in ('IAR','FEP')
and statcode = 'IF'
group by cnttype
;

--select a.cnttype, a.chdrnum, a.statcode, a.tranno, b.batctrcde, b.batcactyr, b.batcactmn
select b.batcactyr, b.batcactmn, b.batctrcde, a.cnttype, count(a.chdrnum)
from pdevdta.chdrpf a
right outer join pdevdta.ptrnpf b
on a.chdrnum = b.chdrnum
and a.tranno = b.tranno
where a.cnttype in ('IAR', 'FEP') 
and b.batctrcde in ('T405', 'T409', 'T413', 'B414', 'T454')
and b.batcactyr >= 2025
group by  b.batcactyr, b.batcactmn, b.batctrcde,a.cnttype
;

select a.cnttype, a.chdrnum, a.ccdate, a.currfrom, a.statcode, a.tranno, b.batctrcde, b.batcactyr, b.batcactmn, a.usrprf
from pdevdta.chdrpf a
right outer join pdevdta.ptrnpf b
on a.chdrnum = b.chdrnum
and a.tranno = b.tranno
where a.cnttype in ('IAR', 'FEP') 
and b.batctrcde in ('T405', 'T409', 'T413', 'B414', 'T454')
and b.batcactyr >= 2025
;

select * from pdevwrk.ROCHFI0022
;
select * from pdevwrk.ROFP250322
;

select * from pdevwrk.ROFP220118
;
-- 3/12 test
select * from pdevwrk.ROCHFI0021
;

select * from pdevwrk.ROFP250321
;


with ctex as ( 
select chdrno, cnttyp, dteeff, 
       fsplc01 || ':' || fsplc02 || ':' || fsplc03 || ':' || fsplc04 || ':' || fsplc05 || ':' || fsplc06 || ':' || fsplc07 || ':' || fsplc08 || ':' || fsplc09 || ':' || fsplc10 || ':' ||
       fsplc11 || ':' || fsplc12 || ':' || fsplc13 || ':' || fsplc14 || ':' || fsplc15 || ':' || fsplc16 || ':' || fsplc17 || ':' || fsplc18 || ':' || fsplc19
       as fsplc_all 
 from pdevdta.rjffpf
)
select * from ctex 
where --cnttyp = 'IAR' and
       (fsplc_all like '%G0%' 
     or fsplc_all like '%G1%'
     or fsplc_all like '%G2%'
     or fsplc_all like '%G3%')
order by dteeff desc 
;

select a.chdrno, b.cnttyp, a.dteeff, a.rskno, fsplc, fsplcprm, a.new_fap, a.old_fap
 from pdevdta.pjffpf a
 inner join pdevdta.rjffpf b
 on a.chdrno = b.chdrno
 and a.rskno = b.rskno
 and a.dteeff = b.dteeff
-- and a.tranno = b.tranno
where a.fsplc in ('G0', 'G1', 'G2', 'G3','G5','G6') 
and a.vflag = '1'


