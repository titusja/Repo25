select chdrnum, cownnum,A.tranno,cnttype, cntbranch,statcode, ccdate,crdate,currfrom 
--,B.FSPLC, B.BSPLC, B.SPLPRATE 
from tactdta.chdrpf A
-- INNER JOIN TACTDTA.PJFFPF B
--   ON B.CHDRNO = A.CHDRNUM
--   AND B.TRANNO = A.TRANNO
--   AND B.RSKCOY = '1'
--   AND B.RSKPFX = 'RK'
where cnttype='FDD'
and statcode='IF'
and ccdate >= 20230101
and A.tranid like '3R%'
;

SELECT DISTINCT B.CNTTYPE FROM ZURDTA.PJFFPF A
INNER JOIN ZURDTA.CHDRPF B 
ON A.CHDRNO = B.CHDRNUM
