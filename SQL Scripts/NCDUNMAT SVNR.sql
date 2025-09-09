



select forepfx, forenum, mbchtrcde, mesgstat01, mesgstat02, reqdate, clntnum, mbchseqno, datime from xdevdta.svnrpf
where job_name = 'NCDUNMAT';
;

select forepfx, forenum, mbchtrcde, mesgstat01, mesgstat02, reqdate, clntnum, mbchseqno, datime from xdevdta.svnrpf
where forenum  in ('21175420')
;

select forepfx, forenum, mbchtrcde, mesgstat01, mesgstat02, reqdate, clntnum, mbchseqno, datime from xdevdta.svnrpf
where forenum  in ('21175420', '21175438')
;
--select *  from jpttaq.svnrpfsav1

