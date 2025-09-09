select a.chdrnum, a.tranno,  
a.* from xdv2dta.chdrpf a
where chdrnum in ('21154015') --, '21153736')
--where chdrnum in ('21153710', '21153736')
--where chdrno in ('21153868', '21153876')
order by a.chdrnum, a.tranno
;

--RJFF
select a.chdrno, a.tranno, 
       cast(a.accassu as char(16) ccsid 5026) ACCASSU_KJ, 
       cast(a.insd as char(25) ccsid 5026) INSD_KJ,  
       cast(a.occptn as char(20) ccsid 5026) OCCPTN_KJ,  
       cast(a.ownerkan as char(25) ccsid 5026) OWNERKAN_KJ,  
a.* from xdv2dta.rjffpf a
where chdrno in ('21154015', '21153736')
--where chdrno in ('21153973', '21153736')
--where chdrno in ('21153973', '21153736')
--where chdrno in ('21153965', '21153736')
--where chdrno in ('21153710', '21153736')
--where chdrno in ('21153868', '21153876')
--where substr(a.tranid,1,2) = '3R'
and tranno <= 2 
--and datime >= '2025-01-01' 
order by a.chdrno desc, a.tranno
;

--SJFF
select  a.chdrno, a.tranno, a.valid_flag, --a.old_fap01, a.old_fap02, a.new_fap01, a.new_fap02, 
       cast(a.PROPINS01 as char(30) ccsid 5026) PROPINS01_KJ,  
a.* from xdv2dta.sjffpf a
where chdrno in ('21154015', '21153736') and a.tranno <= 2 -- and valid_flag='1'
--where chdrno in ('21153981', '21153736') 
--where chdrno in ('21153973') and valid_flag='1'
--where chdrno in ('21153973', '21153736') and valid_flag='1'
--where chdrno in ('21153965', '21153736') and a.tranno=2 and valid_flag='1'
--where chdrno in ('21153710', '21153736')
--where chdrno in ('21153868', '21153876')
order by a.chdrno desc, a.tranno
;

-- PREM
select a.chdrno, a.tranno,
a.* from xdv2dta.prempf a
where chdrno in ('21154015', '21153736') and a.tranno <= 2 
--where chdrno in ('21153710', '21153736')
order by chdrno desc, tranno

 
;

select a.chdrno, a.tranno, a.premcl,
a.* from xdv2dta.prmxpf a
where chdrno in ('21153736')
--where chdrno in ('21153710', '21153736')
--where chdrno in ('21153868', '21153876')
order by a.chdrno, a.premcl,a.tranno
;

select a.rldgacct, a.batctrcde, a.tranno, 
a.* from xdv2dta.ztrnpf a
--where rldgacct in ('21153710', '21153736')
where rldgacct in ('21153868', '21153876')
order by a.rldgacct, a.batctrcde, a.tranno
;
