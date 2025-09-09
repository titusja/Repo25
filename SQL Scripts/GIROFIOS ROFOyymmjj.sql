SELECT *
FROM pdevwrk.ROFO250191
;

SELECT substr(ROFIREC,101,20) as ROFC_POL_NO
      ,substr(ROFIREC,040,20)  as ROFC_CNTL_NO_CLAIM
      ,substr(ROFIREC,292,2)  as ROFC_POL_CD1
      ,substr(ROFIREC,310,1)  as ROFC_DEST_SIGN
      ,substr(ROFIREC,325,1)  as ROFC_LAYERED 
FROM zurwrk.ROFO250107 a
--FROM pdevwrk.ROFO250193 a
--FROM pdevwrk.ROFO250191 a
where substr(ROFIREC,1,1) = 'D'
and substr(ROFIREC,101,20) <> ' '
and (   substr(ROFIREC,101,20) like '%IAR%' 
     or substr(ROFIREC,101,20) like '%FEP%') 

;