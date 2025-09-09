select forepfx, forenum, mbchseqno, clntnum, effdate, job_name from xdevdta.mbchpf
where job_name = 'NCDUNMAT'
;
--where forenum  in ('21175420', '21175438')
select forepfx, forenum, mbchseqno, clntnum, effdate, job_name from xdevdta.mbchpf
where forenum  in ('21175420')

;

select forepfx, forenum, mbchseqno, clntnum, effdate, job_name from zurdta.mbchpf
where effdate >= 20230912
