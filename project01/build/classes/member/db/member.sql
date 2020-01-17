DROP TABLE TB_MEMBER;

CREATE TABLE TB_MEMBER(
-- 아이디, 패스워드, 이름, 주소, 전화번호, 이메일, 가입여부(Y-가입/N-탈퇴), 등급(관리자(1), 고객(2), 판매자(3))

	MEM_ID VARCHAR2(500) NOT NULL,
	MEM_PW VARCHAR2(500) NOT NULL,
	MEM_NAME VARCHAR2(500) NOT NULL,
	MEM_GENDER VARCHAR2(1) NOT NULL,
	MEM_ADDR VARCHAR2(4000) NOT NULL,
	MEM_PHONE VARCHAR2(20) NOT NULL,
	MEM_EMAIL VARCHAR2(100) NOT NULL,
	MEM_ADDDATE DATE DEFAULT SYSDATE NOT NULL,
	MEM_ENABLED VARCHAR2(2) NOT NULL,
	MEM_ROLE NUMBER NOT NULL,
	CONSTRAINT TB_MEMBER_PK_MEM_ID PRIMARY KEY(MEM_ID),
	CONSTRAINT TB_MEMBER_CHK_MEM_GENDER CHECK(MEM_GENDER IN('M','F')),
	CONSTRAINT TB_MEMBER_UQ_MEM_PHONE UNIQUE(MEM_PHONE),
	CONSTRAINT TB_MEMBER_UQ_MEM_EMAIL UNIQUE(MEM_EMAIL),
	CONSTRAINT TB_MEMBER_CHK_MEM_ENABLED CHECK(MEM_ENABLED IN('Y','N'))
);

INSERT INTO TB_MEMBER
VALUES('DY','1234','동영게스트','M','경기도 용인시','010-012321-0000','ADMI1N0@naver.com',SYSDATE,'Y',2);

SELECT MEM_ID,MEM_PW,MEM_NAME,MEM_GENDER,MEM_ADDR,MEM_PHONE,MEM_EMAIL,MEM_ADDDATE,MEM_ENABLED,MEM_ROLE
FROM TB_MEMBER;