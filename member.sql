CREATE TABLE viewLog(
	v_no integer primary key not null,
	v_ip varchar2(50) not null,
	v_viewNo integer not null
);
select * from ads
CREATE SEQUENCE V_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

SELECT A_TAG FROM ADS WHERE A_NO>170;
UPDATE ADS SET A_TAG='#자동차#BMW#엔진#스포츠카#모터쇼' WHERE A_NO > 170;
select * from ads_member;
DROP TABLE ADS_MEMBER;
--테이블 생성
CREATE TABLE ADS_MEMBER(
	M_ID  	VARCHAR2(20) 		PRIMARY KEY NOT NULL,--아이디
	M_PASSWORD  	VARCHAR2(20)		NOT NULL,--비밀번호
	M_NAME  VARCHAR2(20)		NOT NULL,--이름
	M_ADDRESS  VARCHAR2(50)		NOT NULL,--주소
	M_EMAIL  VARCHAR2(30)		NOT NULL,--이메일
	M_DATE  	DATE				NOT NULL,--가입날짜
	M_DEL	VARCHAR2(2)			NOT NULL,--탈퇴여부
	M_GRADE	INTEGER				NOT NULL,--등급
	M_IP	VARCHAR2(20)		NOT NULL,--IP주소
	M_PICTURE VARCHAR2(500), --회원 프로필 사진
	M_PHONE VARCHAR2(20)
);

CREATE TABLE CUSTOMER(
	C_NO INTEGER PRIMARY KEY NOT NULL,--고객센터번호 
	C_SUBJECT VARCHAR2(20) NOT NULL,--제목
	C_CONTENT VARCHAR2(20) NOT NULL,--내용
	C_DATE DATE NOT NULL,--날짜
	C_NAME VARCHAR2(20) NOT NULL,--이름
	C_COUNT INTEGER NOT NULL,--조회수
	C_MID VARCHAR2(20) ,--댓글작성자
	C_REF INTEGER ,--댓글
	C_RE_STEP INTEGER ,--댓글STEP
	C_RE_LEVEL INTEGER,--댓글LEVEL
	C_IP VARCHAR2(20),--아이피주소
	C_DEL VARCHAR2(2) not null--삭제여부
);
CREATE TABLE ADS(
	A_NO INTEGER PRIMARY KEY NOT NULL,--광고번호
	A_SUBJECT VARCHAR2(20) NOT NULL,--제목
	A_CONTENT VARCHAR2(500) NOT NULL,--내용
	A_URL VARCHAR2(50) NOT NULL,--URL주소
	A_FILENAME VARCHAR2(50) NOT NULL,--UPLOAD
	A_DATE DATE NOT NULL,--생성일
	A_NAME VARCHAR2(20) NOT NULL,--제작자명
	A_GOODCOUNT INTEGER NOT NULL,--좋아요
	A_VIEWCOUNT INTEGER NOT NULL,--조회수
	A_DEL VARCHAR2(2) NOT NULL,--삭제여부
	A_GRADE INTEGER,--시청등급
	A_CATEGORY VARCHAR2(20),--카테고리
	A_COUNTRY VARCHAR2(20),--나라
	A_KIND VARCHAR2(20),--기업인지 개인인지,
	A_LOC VARCHAR2(500)
);
create table REPLY(
	R_NO INTEGER PRIMARY KEY NOT NULL, --댓글 번호
	A_NO INTEGER NOT NULL,  -- ADS 게시글 번호
	R_MID VARCHAR2(20) NOT NULL, --MEMBER 아이디
	R_CONTENT VARCHAR2(100) NOT NULL, -- 댓글 내용
	R_DEL VARCHAR2(2)  DEFAULT 'N' NOT NULL --삭제 여부
);

select * from ads;
CREATE TABLE NOTICE (
	N_NO INTEGER NOT NULL, --게시글번호
	N_NAME VARCHAR2(20) NOT NULL,--작성자
	N_SUBJECT VARCHAR2(20) NOT NULL,--제목
	N_CONTENT VARCHAR2(500) NOT NULL,--내용
	N_DATE DATE NOT NULL,--게시글 날짜
	N_COUNT INTEGER NOT NULL,--조회수
	N_GRADE INTEGER
);
CREATE TABLE ADS_LIKE(
	L_NO INTEGER PRIMARY KEY NOT NULL, --좋아요번호
	L_MID VARCHAR2(20) NOT NULL,--회원 아이디
	L_LNO INTEGER NOT NULL-- 게시글번호
);
SELECT * FROM dba_tables WHERE OWNER='ADPOOL';

--SEQUENCE 생성
CREATE SEQUENCE A_SEQ -- ADS 시퀀스
START WITH 1 
INCREMENT BY 1
NOMAXVALUE;
CREATE SEQUENCE C_SEQ --CUSTOMER 시퀀스
START WITH 1
INCREMENT BY 1
NOMAXVALUE;
CREATE SEQUENCE N_SEQ -- NOTICE 시퀀스
START WITH 1
INCREMENT BY 1
NOMAXVALUE;
CREATE SEQUENCE L_SEQ --ADS_LIKE 시퀀스
START WITH 1
INCREMENT BY 1
NOMAXVALUE;
CREATE SEQUENCE R_SEQ --댓글 시퀸스
START WITH 1
INCREMENT BY 1
NOMAXVALUE;
select * from user_sequences;

--외래키 제약조건
--ADS 게시판 - MEMBER 게시판 (M_ID=A_RE_ID) 제약
ALTER TABLE ADS
ADD CONSTRAINT FK_ADS
FOREIGN KEY(A_RE_ID) REFERENCES ADS_MEMBER(M_ID)
ON DELETE SET NULL; --삭제 시 관련 된 외래키 속성 NULL로 변경
--ON UPDATE CASCADE : 수정시 관련 된 외래키 속성 수정
--NOTICE 게시판 - MEMBER 게시판 (M_ID=N_NAME) 제약
ALTER TABLE NOTICE
ADD CONSTRAINT FK_NOTICE
FOREIGN KEY (N_NAME) REFERENCES ADS_MEMBER(M_ID)
ON DELETE SET NULL; 
--CUSTOMER 게시판 - MEMBER 게시판 (M_ID=C_NAME && M_ID=C_MID)제약
ALTER TABLE CUSTOMER
ADD CONSTRAINT FK_CMID
FOREIGN KEY (C_MID) REFERENCES ADS_MEMBER(M_ID)
ON DELETE SET NULL; 
--ADS_LIKE 게시판 -ADS 게시판 / MEMBER 게시판 (M_ID=L_MID && A_NO =L_LNO) 제약
ALTER TABLE ADS_LIKE
ADD CONSTRAINT FK_LMID
FOREIGN KEY (L_MID) REFERENCES ADS_MEMBER(M_ID)
ON DELETE SET NULL; 
ALTER TABLE ADS_LIKE
ADD CONSTRAINT FK_LLNO
FOREIGN KEY (L_LNO) REFERENCES ADS(A_NO)
ON DELETE SET NULL; 
--REPLY 게시판 - ADS 게시판 / MEMBER 게시판 (A_NO = A_NO && M_ID =R_MID)
ALTER TABLE REPLY
ADD CONSTRAINT FK_RANO
FOREIGN KEY (A_NO) REFERENCES ADS(A_NO)
ON DELETE SET NULL;
ALTER TABLE REPLY
ADD CONSTRAINT FK_RMID
FOREIGN KEY (R_MID) REFERENCES ADS_MEMBER(M_ID)
ON DELETE SET NULL;

SELECT * FROM ALL_CONSTRAINTS WHERE CONSTRAINT_NAME LIKE 'FK%' AND OWNER='ADPOOL';

select a.*, from ads a , al ADS_LIKE where   
SELECT * FROM AD_MEMBER;
INSERT INTO AD_MEMBER VALUES('TEST_ID','TEST_PASSWORD','TEST_NAME','TEST_ADDRESS','TEST_EMAIL',SYSDATE,'N',0,'TEST_IP');

ALTER TABLE customer DROP CONSTRAINT FK_CNAME CASCADE;//제약조건 삭제

select * from (select rowNum rn, a.* from (select * from ads order by a_viewcount desc) a)
		where rn between 1 and 10;