select forenum, clrrrole, clntnum,used_to_be, datime
from tdevdta.clrrpf
where forenum like '22046551%'
order by datime desc
;