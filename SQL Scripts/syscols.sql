select * from jpttaq.zpack;

select  table_schema, table_name, ordinal_position, column_name, column_heading, data_type, length, numeric_scale, CCSID
--select *
from QSYS2.SYSCOLUMNS
where table_name = 'ZPACKTKEXT'
and table_schema = 'YDEVWRK';

select  table_schema, table_name, ordinal_position, column_name, column_heading, data_type, length, numeric_scale, CCSID
from QSYS2.SYSCOLUMNS
where 
--table_name = 'ZPACK'
table_name = 'ZPACK2'
and table_schema = 'JPTTAQ';

select * from jpttaq.zpack5035; 

select * from jpttaq.zpack2; 

select a.*, cast(zpack2x as varchar(1024) ccsid 5035) from jpttaq.zpack2x a; 

select a.*, cast(zpack21 as varchar(1024) ccsid 5035) from jpttaq.zpack21 a; 
