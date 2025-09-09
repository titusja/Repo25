select chdrnum, cownnum, cnttype, tranno, ccdate, currfrom, min(currto, crdate) as crdate, statcode, endr01, statreasn, 
statdate, datime, left(tranid,4) as tranid
from tdevdta.chdrpf 
where cnttype = 'FDD'
and chdrnum in ('22044281', '22044299')
--and statcode = 'IF'
and tranid like '3R%'