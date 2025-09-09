select forenum, clrrrole, clntnum,used_to_be, datime
from rsitdta.clrrpf
where forenum='22185500'
order by datime desc
;

select forenum, clrrrole, clntnum,used_to_be, datime
from rsitdta.clrrpf
where forenum like '22207627%'
order by datime desc
;



select chdrnum,ccdate,currfrom,statcode, datime from ractdta.chdrpf
where chdrnum='21985642'
;  
 

select forenum, clrrrole, clntnum,used_to_be, datime
from tdevdta.clrrpf
where forenum='22046534'
order by datime desc
;

select clntnum, bpostcode, cltdob, cltstat, a.* from tdevdta.clntpf a
 where cltdob = 19700101 and bpostcode = '1640003'
--where clntnum = '90056444'
;