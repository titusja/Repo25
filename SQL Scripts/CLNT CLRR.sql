select chdrnum,ccdate,currfrom,statcode,a.* 
from zurdta.chdrpf a
where cnttype='NWD'
and ccdate>='20240101'
and tranid like '3R%'
;

select * from zurdta.clrrpf
where forenum like '21646877%'
;

select clntnum, cltdob, cltsex, a.* 
from tdevdta.clntpf a
where clntnum in ('90056444')
;
select clntnum, cltdob, cltsex, a.* 
from tdevdta.clntpf a
--from zurdta.clntpf a
where cltdob = 19700101
and cltsex = 'M'
;

select forenum, clrrrole, clntnum, USED_TO_BE, datime from tdevdta.clrrpf
where forenum like '22046551%'
and CLRRROLE = 'OW'
;

