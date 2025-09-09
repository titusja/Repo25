SELECT *
FROM pdevwrk.rocl250307
;

SELECT substr(ROFIREC,101,20) as ROFC_POL_NO
      ,substr(ROFIREC,040,20)  as ROFC_CNTL_NO_CLAIM
      ,substr(ROFIREC,292,2)  as ROFC_POL_CD1
      ,substr(ROFIREC,310,1)  as ROFC_DEST_SIGN
      ,substr(ROFIREC,325,1)  as ROFC_LAYERED 
      ,substr(ROFIREC,805,1)  as ROFC_CLAUSE_EQ 
FROM zurwrk.ROCL250110 a
--FROM pdevwrk.ROCL250312 a
--FROM pactwrk.ROCL250507 a
--FROM pdevwrk.ROCL250310 a
--FROM pdevwrk.ROCL250208 a
--FROM pdevwrk.rocl250307 a
where substr(ROFIREC,1,1) = 'D'
;