SELECT *
FROM pdevwrk.rofp018wrk
;

SELECT substr(ROFIRE,101,20) as ROFP_POL_NO
      ,substr(ROFIRE,292,2)  as ROFP_POL_CD1
      ,substr(ROFIRE,310,1)  as ROFP_DEST_SIGN
      ,substr(ROFIRE,325,1)  as ROFP_LAYERED 
      ,substr(ROFIRE,898,2)   as ROFP_EQ_CND 
      ,substr(ROFIRE,900,10)  as ROFP_EQ_AMT 
      ,substr(ROFIRE,910,10)  as ROFP_EQ_PRM 
      ,substr(ROFIRE,920,10)  as ROFP_EQ_DEDCT 
FROM zurwrk.ROFP022WRK a
--FROM pdevwrk.ROFP032WRK a
--FROM pactwrk.ROFP005WRK a
--FROM pactwrk.ROFP003WRK a
--FROM pdevwrk.ROFP030WRK a
--FROM pdevwrk.ROFP029WRK a
--FROM pdevwrk.ROFP028WRK a
--FROM pdevwrk.ROFP027WRK a
--FROM pdevwrk.ROFP024WRK a
--FROM pdevwrk.ROFP021WRK a
--FROM pdevwrk.ROFP018WRK a
where substr(ROFIRE,1,1) = 'D'
--and (substr(ROFIRE,101,20) like '%IAR%' or substr(ROFIRE,101,20) like '%FEP%')
--and substr(ROFIRE,101,20) like '21172196%'
;

select chdrnum, cnttype, nofrisks
from pdevdta.chdrpf
where chdrnum = '21171211'
;

select a.chdrno, a.dteeff, a.cnttyp,a.FSPPTOTPR as RJFF_FSPPTOTPR  ,b.eqannprm as RLKP_EQANNPRM
from pdevdta.rjffpf a
inner join pdevdta.rlkppf b
on a.chdrno = b.chdrnum
and a.tranno = b.tranno
where a.dteeff >= 20240101
and cnttyp in ('IAR','FEP')
;

select EQANNPRM ,a.* from pdevdta.rlkppf a
where chdrnum = '21171211'
;