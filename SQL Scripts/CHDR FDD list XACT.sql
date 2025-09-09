select chdrnum, cownnum,tranno,cnttype, cntbranch,statcode, ccdate,crdate,currfrom 
from tactdta.chdrpf
where cnttype='FDD'
and statcode='IF'
and ccdate >= 20230101