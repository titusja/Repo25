select * from tactdta.rjffpf
where datime >= '2024-10-01'
--and chdrno = '22183795'
;

select a.* from xdevdta.pjffpf a
inner join xdevdta.chdrpf b
on a.chdrno = b.chdrnum
and b.cnttype = 'FDD'
--where dteeff >= 20240101
--and chdrno = '21955824'
;

select * from tsitdta.chdrpf
--where chdrnum = '21955824'
where chdrnum = '22187456'
and chdrpfx = 'CH'
and chdrcoy = '1'
;

select clntnum,cltstat,a.* from xdv2dta.clntpf a
where datime >= '2022-01-01'
and clntpfx = 'CN'
and clntnum = '99014112';

select * from xdv2wrk.blog219962
--where BOMSGTYPE= '<RAW>'
;

create table jpttaq.blogpftxt as (
select LOGDATA from xdv2wrk.blog219962
where BOMSGTYPE= '<RAW>'
) with data
;

select * from jpttaq.blogpftxt
;

select clntnum, adrcode from xdv2dta.clntpf
where clntnum = '99014112'
;

select * from xdv2dta.ADRMPF
where ADRCODE = '2501171009'
;

select clntnum, adrcode from xsitdta.clntpf
where clntnum = '94014438'
;

select * from xdv2dta.pjffpf
where chdrno = '21153191'
;



