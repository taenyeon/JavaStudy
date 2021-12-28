create table jobdj_ty(
                         hire_post_num number primary key ,
                         hire_post_name varchar2(100),
                         apply_condition varchar2(100),
                         work_condition varchar2(200),
                         com_name varchar2(50),
                         category varchar2(100),
                         post_date date,
                         end_date date
);
insert into jobdj_ty values (1,
                             '2021년 CS Specialist /AS/RA Specialist 채용',
                             '경력:신입경력(3년이상),학력:대졸이상,우대:영어가능자',
                             '고용형태:정규직(수습 3개월),급여:회사내규에 따름-면접 후 결정,' ||
                             '지역:서울시 서초구&서울전지역,시간:주5일(월~금)|09시30분~18시30분,직책:팀원',
                             '스토케코리아 유한회사',
                             '기획,전략,경영',
                             sysdate,
                             to_date('20221223','YYYYMMDD')
                            );
insert into jobdj_ty values (2,
                             '2021년 떡잎방범대 요원 모집',
                             '경력:신입,학력:유치원졸업 이상,우대:컴퓨터사용가능자',
                             '고용형태:정규직(수습 3개월),급여:방범대 내규에 따름-면접 후 결정,' ||
                             '지역:떡잎마을,시간:주5일(월~금)|09시30분~18시30분,직책:방범대원',
                             '떡잎방범대',
                             '순찰,월급루팡,경호',
                             sysdate,
                             to_date('20220101','YYYYMMDD')
                            );
select * from jobdj_ty;
commit;