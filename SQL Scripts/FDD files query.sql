select a.chdrnum, a.tranno, a.* from xdv2dta.chdrpf a
where chdrnum in ('21153582', '21153591')
order by chdrnum, tranno;

select a.chdrno, a.tranno, a.* from xdv2dta.rjffpf a
where chdrno in ('21153582', '21153591')
order by chdrno, tranno;

select a.chdrno, a.tranno, a.noitem, a.* from xdv2dta.sjffpf a
where chdrno in ('21153582', '21153591')
order by chdrno, tranno, noitem;


select a.chdrno, a.tranno, a.* from xdv2dta.prempf a
where chdrno in ('21153582', '21153591')
order by chdrno, tranno, premcl;
;

select a.chdrno, a.tranno, a.premcl, a.* from xdv2dta.prmxpf a
where chdrno in ('21153582', '21153591')
order by chdrno, tranno, premcl;
;

select a.chdrno, a.tranno, a.* from xdv2dta.rmappf a
where chdrno in ('21153582', '21153591')
order by chdrno, tranno;
;

select a.rldgacct, a.tranno, a.* from xdv2dta.ztrnpf a
where rldgacct in ('21153582', '21153591')
order by rldgacct, tranno;
;
