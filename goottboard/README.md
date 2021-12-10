# PARAMETER 전달 이해2
## 2021/12/11
### 이전 내용 복습
이전에 여러 방식으로 값을 전달하여 다른 페이지에서 필요한 값만을 가지고  
작업을 수행할 수 있는 방법에 대해서 공부하였습니다.  
오늘은 완전히 이해하기 위해서 새로운 테이블을 이용해서 다시 설계를 하는 방법으로  
이전 내용을 복습하였습니다. 사용한 오라클 쿼리는 아래와 같습니다.

### 게시판 테이블 쿼리
create table edugoott(  
eno number primary key ,  
eid varchar2(20) not null ,  
etitle varchar2(50) not null,  
ememo varchar2(500) not null ,  
etel varchar2(13) null ,  
edate date not null  
);

### 유저 테이블 쿼리
create table goottuser(  
id varchar2(20) primary key not null ,  
pwd varchar2(65) not null ,  
name varchar2(30) not null ,  
tel varchar2(13) null  
);

### 게시판 번호 자동 증가 시퀀스
create sequence edugoott_enoUp start with 1 increment by 1 maxvalue 9999 nocache nocycle;

### 유저 이름 변경시, 게시판 작성자 이름 변경 트리거
create or replace trigger goott_name
after
update of name on goottuser
for each row
begin
update edugoott
set eid =:new.name
where eid =:OLD.name;
end;

여기서 어려웠던 부분은 게시판에서 중간 번호의 게시물을 삭제한다면 시퀀스가 제대로 된 번호를 불러오지 못하기도 하고  
게시물 번호에 빈 부분이 생기는 문제가 있었습니다.  
그래서 상황에 따라 다른 방법으로 이를 해결하였습니다.  
1. 삭제하는 게시물이 가장 최신이라면,  
게시물 삭제 -> 시퀀스 증감을 -1로 조정 -> 시퀀스 동작 -> 시퀀스 증감을 다시 +1로 조정  


2. 삭제하는 게시물이 중간에 있다면,  
게시물 삭제 -> 게시물보다 최근의(번호가 큰) 게시물들의 번호를 -1 ->  
시퀀스 증감을 -1로 조정 -> 시퀀스 동작 -> 시퀀스 증감을 다시 +1로 조정

이외에도 id와 name(nickname) 둘중에서 게시판 작성자에 들어가는 이름을 고민하는게 문제였고,  
id와 name(nickname) 둘다 원래 중복되면 안되기도 했습니다. 아직 테이블을 짜는게 부족함을 많이 느꼈고,  
내일은 이걸 해결할 수 있는 방법을 찾아 새로운 테이블에 연습할 계획입니다.