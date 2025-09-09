select * from xdv2dta.rjffpf    
where chdrno='21153272'
;

select chdrno,tranno, dteeff, dteatt,dteter, ffiresi,ffireprm,
fprmclsi as fprmclsi_eq, fprmclprm as fprmclprm_eq, 
fbtotprem, 
--fspptotpr as fspptotpr_sp, fspptotsi as fspptotsi_sp,
new_fap01, new_fap08, new_fap09, 
old_fap01, old_fap08, old_fap09,
frideprm01, frideprm02, a.* from xdv2dta.rjffpf a   
where chdrno in ('21153256','21153281')
order by chdrno, tranno
;

select chdrno,cnttyp,tranno, dteeff, dteter, ffiresi,ffireprm,
fprmclsi as fprmclsi_eq, fprmclprm as fprmclprm_eq, 
fgrannl,totpre,fbtotprem, 
--fspptotpr as fspptotpr_sp, fspptotsi as fspptotsi_sp,
new_fap08, new_fap09, 
old_fap08, old_fap09,
frideprm01, frideprm02, a.* from xdv2dta.rjffpf a   
--where chdrno in ('21153281', '21153400', '21153418')
--where chdrno in ('21153281', '21153418','21153191','21153396','21153370')
where chdrno in ('21153361', '21153302')
--and tranno=1
order by chdrno, tranno
;

select * from xdv2dta.pjffpf a   
--where chdrno in ('21153281', '21153400', '21153418')
--where chdrno in ('21153281', '21153418','21153191','21153396','21153370')
where chdrno in ('21153302')
--and tranno=1
order by chdrno, tranno
;


select chdrnum, cnttype, statcode, ccdate, condate from xdv2dta.chdrpf a   
--where chdrno in ('21153281', '21153400', '21153418')
--where chdrno in ('21153281', '21153418','21153191','21153396','21153370')
where chdrnum in ('21153361', '21153264')
--and tranno=1
order by chdrnum, tranno
;

select * from xdv2dta.itempf
where itempfx ='IT' and itemtabl='TT175'
;
