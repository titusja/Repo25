select * from xdv2dta.lkghpf
where boblkg = 'RSKSFDIT'
;

select * from xdv2dta.vmolpf
where boblkg = 'RSKSFD'
;

select * from xdv2dta.vmmgpf
where DATime >= '2000-10-01'
;

select * from xdv2dta.vmLKpf
where DATime >= '2000-10-01'
;

--- BO pgm and BO parent (ex: BO4375 -> P4375)
select * from tsitdta.bobhpf    
;

select * from tsitdta.bomepf
where bobobj = 'POL'
and bmethod='CAN'
;

select * from xdv2dta.bomfpf
where bobobj = 'POL'
and bmethod='CAN'
AND PREFIX = 'BF'
and Boblkg LIKE 'RSKSFD%'
;

select * from xdv2dta.bomh
;

select * from xdv2dta.lkghpf
--where bobobj = 'POL'
;

select boblkg, lkgdesc, lkglen, embedlkg, "BEGIN" from xdv2dta.lkgHpf
;

select BOBLKG, FIELDSEQ, FLDNAME, FIELD_TYPE, FIELD_LENGTH, "DECIMALS", STRTPOS, FIELD_OCCURRENCE from xdv2dta.lkgfpf
WHERE BOBLKG='RSKMOT'
;

select * from xdv2dta.utrcpf
--where bobobj = 'POL'
;

SELECT * FROM xdv2dta.BOBMPF WHERE BOBOBJ='POL' AND BMETHOD='NEW' AND BOBLKG 
IN ('POLHEAD', 'RSKSFD', 'RSKSFDFC', 'RSKSFDIT')                   
;

SELECT * FROM xdv2dta.BOBMPF WHERE BOBOBJ='POL' AND BMETHOD='CAN' AND BOBLKG 
IN ('POLHEAD', 'RSKSFD', 'RSKSFDFC', 'RSKSFDIT', 'RSKMOT')                   
;

SELECT * FROM xdv2dta.BOBMPF WHERE BOBOBJ='POL' AND BMETHOD='END' AND BOBLKG 
IN ('POLHEAD', 'RSKSFD', 'RSKSFDFC', 'RSKSFDIT', 'RSKMOT')                   
;

select * from xdv2dta.LKGHPF
where boblkg = 'RSKSFD'
;

SELECT * FROM XACTDTA.BOBHPF
where BOBNAME='BOP500';

SELECT * FROM XACTDTA.BOBFPF
where BOBNAME='BOP500';

SELECT * FROM tsitdta.BOBMPF
where BOBOBJ='POL';

SELECT * FROM tsitdta.BOMEPF
--where BOBSUBMENU IN ('BOP538','BOZ692', 'BOP500')
where bobobj = 'POL'
and bmethod = 'IEN'
;

select * from zurcom.wrkhpf
;

select * from zurcom.nsprpf 
where worku='A24045'

;

select * from zurcom.wrkepf 
where worku='A24045'
;

select * from zurcom.nsprpf 
where object_type='BOB'
and datime >= '2020-10-20'
;

SELECT * FROM tsitdta.BOBHPF
where BOBNAME in ('BOP538','BOZ692');

SELECT * FROM tsitdta.BOBFPF
where BOBNAME in ('BOP538','BOZ692');

SELECT * FROM tsitdta.BOMEPF
where bobobj='POL'
and bmethod='RIS'
--where BOBSUBMENU in ('BOP538','BOZ692')
;

SELECT * FROM tsitdta.LKGHPF
where BOBLKG = 'POLHEAD'
;

SELECT * FROM tsitdta.LKGFPF
where BOBLKG = 'POLHEAD'
;

SELECT A.BOBLKG, A.BOBOBJ, A.BMETHOD, B.PREFIX, B.BOBSUBMENU, B.SBMACTION FROM tsitdta.BOMFPF A
LEFT OUTER JOIN TSITDTA.BOMEPF B
ON A.BOBOBJ = B.BOBOBJ
AND A.BMETHOD = B.BMETHOD
AND B.PREFIX = 'BH' --useless filter (all BOME records have BH prefix!
where A.BOBLKG = 'POLHEAD'
group by A.BOBLKG, A.BOBOBJ, A.BMETHOD, B.PREFIX, B.BOBSUBMENU, B.SBMACTION
;

SELECT * FROM tsitdta.BOBHPF
where BOBNAME = 'BOZ509'
;

SELECT * FROM tsitdta.BOBFPF
where BOBNAME = 'BOZ509'
;

SELECT * FROM tsitdta.BOBMPF
where BOBNAME = 'BOZ509'
;

SELECT * FROM tsitdta.BOBFPF
where BOBNAME in ('BOP538','BOZ692');


SELECT * FROM xactdta.BOBHPF
where BOBNAME in ('BOP499','BOP500');

SELECT * FROM xactdta.BOBFPF
where BOBNAME in ('BOP499','BOP500');

SELECT DISTINCT PREFIX FROM zurdta.BOMEPF

--where BOBSUBMENU in ('BOP499','BOP500');
;

SELECT * FROM tsitdta.BOMFPF
where prefix = 'BH'
--where BOBSUBMENU IN ('BOP538','BOZ692', 'BOP500')
;   
