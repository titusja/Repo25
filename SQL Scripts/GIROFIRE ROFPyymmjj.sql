SELECT *
FROM pdevwrk.rofp250141
;

SELECT substr(ROFIRE,040,6)  as ROFP_CNTL_NO
      ,substr(ROFIRE,101,20) as ROFP_POL_NO
      ,substr(ROFIRE,292,2)  as ROFP_POL_CD1
      ,substr(ROFIRE,310,1)  as ROFP_DEST_SIGN
      ,substr(ROFIRE,325,1)  as ROFP_LAYERED 
      ,substr(ROFIRE,898,2)  as ROFP_EQ_CND 
      ,substr(ROFIRE,900,10)  as ROFP_EQ_AMT 
      ,substr(ROFIRE,910,10)  as ROFP_EQ_PRM 
      ,substr(ROFIRE,920,10)  as ROFP_EQ_DEDCT 
  FROM zurwrk.ROFP250929 a    
--FROM zurwrk.ROFP250126 a
--FROM pdevwrk.ROFP250343 a
--FROM pactwrk.ROFP250505 a
--FROM pdevwrk.ROFP250237 a
--where 
-- substr(ROFIRE,310,1) in ('2', ' ')  /*ROFP_DEST_SIGN*/
-- substr(ROFIRE,101,20) like '%FEP%'
-- substr(ROFIRE,325,1) <> ' ' /*ROFP-LAYERED*/
-- substr(ROFIRE,1,1) = 'D'
--and (substr(ROFIRE,101,20) like '%FEP%' or substr(ROFIRE,101,20) like '%IAR%')
--FROM pdevwrk.ROFP250232 a
--FROM pdevwrk.ROFP250322 a
--FROM pdevwrk.ROFP250331 a
--FROM pdevwrk.ROFP250230 a
--FROM pdevwrk.ROFP250229 a
--FROM pdevwrk.ROFP250428 a
--FROM pdevwrk.ROFP250123 a
--FROM pdevwrk.rofp250322 a
--and substr(ROFIRE,101,20) like '%FEP%'

--and substr(ROFIRE,101,20) like '21172196%'
;
