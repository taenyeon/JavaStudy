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
