--CREATE TABLE JPTTAQ.DISHLSDFC1 AS (
SELECT S02.CHDRNUM, S02.COWNNUM, S02.CNTTYPE, S02.PAYPLAN, S02.CCDATE,
--: Before change
--S02.SURNAME, S02.GIVNAME, S02.INST0101, S01.DISHREASN, S03.DISHREASN, 
--: After change
TRIM(S02.SURNAME) AS SURNAME, TRIM(S02.GIVNAME) AS GIVNAME, S02.INST0101, S01.DISHREASN AS DISHREASN1, 
S03.DISHREASN AS DISHREASN3, 
S02.ISTDEBIT, S02.DISHCNT, S02.CHDRNUM05, S02.BNFRATECL, S02.BAUTDAGEC
 FROM
  (SELECT  SUBSTR(TAPDATA,112,001) AS DISHREASN,                      
   SUBSTR(TAPDATA,113,008) AS CHDRNUM                                 
--   FROM      XDEVBIL.DFTAPB2305 T01                                   
   FROM      ZURBIL.DFTAPB2305 T01                                   
   WHERE     SUBSTR(TAPDATA,112,001) <> '0'                           
   AND       SUBSTR(TAPDATA,092,005) IN                               
--: Before Change
--                          ('08530', '06530', '07608', '08520')      
--: After Change
                          ('08530')          
   GROUP BY  SUBSTR(TAPDATA,112,001), SUBSTR(TAPDATA,113,008)         
  ) AS S01                                                            
LEFT OUTER JOIN                                                       
  (                                                                   
   SELECT                                                          
   T01.CHDRNUM, T02.COWNPFX, T02.COWNCOY, T02.COWNNUM, T02.CNTTYPE,
   T02.PAYPLAN, T02.CCDATE,  T01.DISHCNT, T01.CHDRNUM05,           
   T01.ISTDEBIT, T01.INST0101, T03.SURNAME, T03.GIVNAME,           
   T04.BNFRATECL, T04.BAUTDAGEC                                    
   FROM                                                            
   ( SELECT CHDRNUM,COUNT(CHDRNUM) AS CHDRNUM05,                   
     MAX(CURRFROM) AS CURRFROM04, DISHNRCNT+1 AS DISHCNT,          
     ISTDEBIT, SUM(INST01) AS INST0101                             
     FROM ZURDTA.IBXI                                                     
     WHERE  CHDRPFX   = 'CH'                                       
     AND    CHDRCOY   = '1'                                        
     AND    BATCACTYR = 2023                                      
     AND    BATCACTMN = 05                                        
     AND    BILSTS    = 'B'                                        
     AND    CHDRNUM IN                                    
     (                                                    
     SELECT SUBSTR(TAPDATA,113,008)                       
--     FROM   XDEVBIL.DFTAPB2305                                
    FROM   ZURBIL.DFTAPB2305                                
     WHERE  SUBSTR(TAPDATA,112,001) <> '0'                
     AND    SUBSTR(TAPDATA,092,005) IN                    
--: Before Change
--            ('08530', '06530', '07608', '08520')        
--: After Change
                ('08530')            
      )                                                   
      GROUP BY CHDRNUM, DISHNRCNT, ISTDEBIT               
   ) AS T01                                               
   LEFT OUTER JOIN  ZURDTA.CHDR T02                              
     ON    T02.CHDRPFX    = 'CH'                          
     AND   T02.CHDRCOY    = '1'                           
     AND   T01.CHDRNUM    = T02.CHDRNUM                   
     AND   T01.CURRFROM04 = T02.CURRFROM                  
 LEFT OUTER JOIN  ZURDTA.CLNT T03                        
 ON        T02.COWNPFX    = T03.CLNTPFX           
   AND     T02.COWNCOY    = T03.CLNTCOY           
   AND     T02.COWNNUM    = T03.CLNTNUM           
 LEFT OUTER JOIN ZURDTA.RMOT T04                         
 ON        T04.RSKPFX     = 'RK'                  
   AND     T04.RSKCOY     = '1'                   
   AND     T01.CHDRNUM    = T04.CHDRNO            
   AND     T02.CCDATE     = T04.DTEEFF            
) AS S02                                          
ON        S01.CHDRNUM     = S02.CHDRNUM           
LEFT OUTER JOIN                                   
ZURQRY.KH_DSHRESN AS S03                          
ON    S01.DISHREASN       = S03.DSHREASON         
--: Output file 1 (DISREASN <> 2)
WHERE     DISHCNT         <> 2                
--: Output file 2 (DISREASN = 2)
--WHERE     DISHCNT         = 2
--) WITH DATA                