select chdrnum, cnttype, ccdate,currfrom,tranno  from tactdta.chdrpf
where cnttype = 'FDD'
and statcode = 'CA'
and ccdate >= 20230101
;

select * from tactdta.prempf
where chdrno = '21962201'
;

select * from tactdta.prmxpf
where chdrno = '21962201'
;

select * from tactdta.rjffpf
where chdrno = '21962201'
;