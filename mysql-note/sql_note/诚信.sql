## ce
 select   if(count(*),'1','0') as ce  from cxrz_archive_certificate where company_id='6524'and record_status='2' and certificate_type='5'

## 信用类
select  certificate_type, if(locate('1',v1.xx)>0,'AAA',if(locate('2',v1.xx)>0 ,'AA',if(locate('3',v1.xx)>0 ,'A',if(locate('4',v1.xx)>0,'BBB','其他')))) as evaluationClass
FROM
(
select  certificate_type,  group_concat(  distinct ( json_extract (certificate_grade,'$[0].certificateGrade'))) as xx   from cxrz_archive_certificate v where company_id='6524'and record_status='2' and certificate_type='6'
) v1

