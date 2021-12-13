# MARKET 예제
## 2021/12/13

### 이전 게시판 예제를 이용하여 MARKET 예제 작성
이전 게시판 예제를 활용하여 MARKET 예제를 만들어보려 구상을 했습니다.  
일단 테이블 구조를 먼저 짜보려고 생각했으나, 생각보다 생각할 것들이 많아 자료를 수집하다가  
하루가 지나갔습니다. 내일은 게시판의 형식을 크게 벗어나지 않는 방식으로 작성을 하고 이후에는  
네이버 스마트 에디터 api를 활용하여 상품의 상세정보를 표시할 수 있는 방법을 사용할 예정입니다.


###사용 DB테이블

#### 상품 테이블
CREATE TABLE item (  
item_Code	number	NOT NULL, (PK)   
member_ID	varchar2(20) not null, (FK)    
category_code	number	NOT NULL,  
item_Name	varchar2(50) not null,  
item_Price	number not null,  
item_Image	varchar2(100) not null,  
item_Info	varchar2(1000) null,  
Item_Stock	number default 0  
);

#### 회원 테이블
CREATE TABLE member_info (  
member_ID varchar2(20) NOT NULL, (PK)  
member_PWD varchar2(20) not null,  
member_Level number(1) default 1,  
member_Name	varchar2(20) not null,  
member_Adress varchar2(100) not null,  
member_Tel	varchar2(14) null,  
member_Birth date  
);

#### 상위 옵션 테이블
CREATE TABLE item_Options (  
option_Code	number not null, (PK)  
item_Code number not null, (FK)  
option_name	varchar2(20) not null,  
Option_PriceUD number default 0,  
option_Stock number default 0  
);

#### 하위 옵션 테이블
CREATE TABLE item_ChildOptions (  
childOption_Code	number, (PK)  
option_Code	number not null, (FK)
childOption_Name	varchar2(20) not null,  
childOption_PriceUD	number default 0,  
childOption_Stock	number default 0  
);

#### 카테고리 테이블
CREATE TABLE category (  
category_code	number	NOT NULL, (PK)  
category_Name	varchar2(20)	NULL  
);

현재는 위와 같이 테이블을 구성했으며, 점차 테이블과 컬럼을 수정할 계획입니다. 

## 2021/12/14

#### DB수정
전날 작성한 쿼리에 문제점을 발견하여 수정을 하였습니다.  
ITEM_CODE를 시퀀스로 만들었을때, 여러명이 동시에 작업을 요청할 경우, 꼬여버리는 문제가   
있을 수 있다고 생각이 들었습니다. 그래서 ITEM_CODE를 따로 입력받도록 하였고 하위 옵션테이블은  
ITEM 테이블과 ITEM_OPTIONS를 이용하면 구분이 가능하여 그대로 두었습니다.

####JSP수정
기존에 사용하던 형식을 최대한 활용하며 수정해보고자 했으나, 생각보다 다른 부분이 많았고  
옵션의 경우, 버튼을 통해 input을 생성해서 필요한 만큼 추가할 수 있도록 구현하고 싶었기 때문에  
js를 이용하여 버튼 클릭시 input을 추가하고 이 값이 null이 아닌 값을 option테이블에 추가할 수 있도록 구현하였습니다.
