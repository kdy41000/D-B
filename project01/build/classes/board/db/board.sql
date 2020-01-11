DROP TABLE TB_BOARD;
DROP SEQUENCE TB_BOARDSEQ;

CREATE SEQUENCE TB_BOARDSEQ;
CREATE TABLE TB_BOARD(
	BOA_SEQ NUMBER PRIMARY KEY,
	MEM_ID VARCHAR2(500),
	BOA_TITLE VARCHAR2(100) NOT NULL,
	BOA_CONTENT VARCHAR2(300) NOT NULL,
	BOA_CNT NUMBER DEFAULT 0,	
	REGDATE DATE DEFAULT SYSDATE NOT NULL,
	BOA_CATEGORY NUMBER(3),
	BOA_IMAGE VARCHAR2(100),
	CONSTRAINT FK_MEM_ID FOREIGN KEY(MEM_ID)
         REFERENCES TB_MEMBER(MEM_ID) ON DELETE CASCADE
);

INSERT INTO TB_BOARD
VALUES(TB_BOARDSEQ.NEXTVAL,'ADMIN','제목테스트','내용테스트',1,SYSDATE,2,'100');

SELECT BOA_SEQ,MEM_ID,BOA_TITLE,BOA_CONTENT,BOA_CNT,REGDATE,BOA_CATEGORY,BOA_IMAGE
FROM TB_BOARD;

INSERT INTO TB_BOARD
VALUES(TB_BOARDSEQ.NEXTVAL,'ADMIN','제목테스트','내용테스트',1,SYSDATE,2,'100');
