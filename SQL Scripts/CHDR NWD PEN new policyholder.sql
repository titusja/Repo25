select chdrnum,statcode,cownnum,occdate,ccdate,currfrom,currto,crdate, tranno,endr01,datime
from tdevdta.chdrpf
where chdrnum='22046518'
;
select chdrno,rskno, dteeff, tranno, annpre, bmotanlpre, totpre, valid_flag, datime, a.* from tdevdta.rmotpf a
where chdrno='22046518'
