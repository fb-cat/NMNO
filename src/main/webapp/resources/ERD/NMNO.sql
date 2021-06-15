/* sqlplus에서 System으로 접속후 nmno 계정 생성  */
--CREATE USER nmno IDENTIFIED BY nmno;
--GRANT CONNECT, RESOURCE TO nmno;
--ALTER USER nmno ACCOUNT UNLOCK;

/* Drop Tables & SEQUENCE */

--DROP TABLE Likes CASCADE CONSTRAINTS;
--DROP TABLE BBS CASCADE CONSTRAINTS;
--DROP TABLE BodySize CASCADE CONSTRAINTS;
--DROP TABLE ReplyComment CASCADE CONSTRAINTS;
--DROP TABLE Comments CASCADE CONSTRAINTS;
--DROP TABLE Personal CASCADE CONSTRAINTS;
--DROP TABLE Transac CASCADE CONSTRAINTS;
--DROP TABLE Members CASCADE CONSTRAINTS;
--DROP SEQUENCE SEQ_MNO;
--DROP SEQUENCE SEQ_BNO;
--DROP SEQUENCE SEQ_CNO;
--DROP SEQUENCE SEQ_RNO;
--DROP SEQUENCE SEQ_LNO;

/* Create Tables */

CREATE TABLE BBS
(
	-- 글 번호
	bno number NOT NULL,
	-- 회원번호
	mno number NOT NULL,
	-- 제목
	title varchar2(128) NOT NULL,
	-- 내용
	content nvarchar2(2000) NOT NULL,
	-- 첨부파일
	attachFile varchar2(256),
	PRIMARY KEY (bno)
);


CREATE TABLE BodySize
(
	-- 회원번호
	mno number NOT NULL,
	-- 체형
	bodyType varchar2(20) DEFAULT 'NORMAL',
	-- 신장(키)
	height varchar2(20),
	-- 몸무게
	weight varchar2(20),
	-- 어깨너비
	shoulder varchar2(20),
	-- 가슴둘레
	chest varchar2(20),
	-- 허리둘레
	waist varchar2(20),
	-- 허벅지 둘레
	thigh varchar2(20)
);


CREATE TABLE Comments
(
	-- 댓글 번호
	cno number NOT NULL,
	-- 댓글 내용
	cbody varchar2(256) NOT NULL,
	-- 회원번호
	mno number NOT NULL,
	PRIMARY KEY (cno)
);


CREATE TABLE Likes
(
	-- 좋아요 번호
	lno number NOT NULL,
	-- 회원번호
	mno number NOT NULL,
	-- 글 번호
	bno number NOT NULL,
	-- 댓글 번호
	cno number NOT NULL,
	-- 대댓글 번호
	rno number NOT NULL,
	PRIMARY KEY (lno)
);


CREATE TABLE Members
(
	-- 회원번호
	mno number NOT NULL,
	-- 이메일
	email varchar2(64) NOT NULL,
	-- 아이디
	username varchar2(64) NOT NULL UNIQUE,
	-- 비밀번호
	password varchar2(64) NOT NULL,
	-- 닉네임
	nickname nvarchar2(20) NOT NULL UNIQUE,
	-- 이메일 수신여부
	action varchar2(10) DEFAULT 'N',
	-- 가입일
	regidate date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (mno)
);


CREATE TABLE Personal
(
	-- 회원번호
	mno number NOT NULL,
	-- 성별
	gender nvarchar2(10),
	-- 자기소개
	self nvarchar2(2000),
	-- 전화번호
	tel varchar2(20),
	-- 주소
	addr nvarchar2(100),
	-- 선호태그
	inter nvarchar2(1000),
	-- 프로필 사진
	photo varchar2(256)
);


CREATE TABLE ReplyComment
(
	-- 대댓글 번호
	rno number NOT NULL,
	-- 대댓글 내용
	rbody varchar2(256) NOT NULL,
	-- 회원번호
	mno number NOT NULL,
	-- 댓글 번호
	cno number NOT NULL,
	PRIMARY KEY (rno)
);


CREATE TABLE Transac
(
	-- 찜 목록
	favorite varchar2(2000),
	-- 검색 기록
	SearchHistory varchar2(512),
	-- 회원번호
	mno number NOT NULL
);


/* Create Sequence */
CREATE SEQUENCE SEQ_MNO NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_BNO NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_CNO NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_RNO NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_LNO NOCYCLE NOCACHE;

/* Create Foreign Keys */

ALTER TABLE Likes
	ADD FOREIGN KEY (bno)
	REFERENCES BBS (bno)
;


ALTER TABLE Likes
	ADD FOREIGN KEY (cno)
	REFERENCES Comments (cno)
;


ALTER TABLE ReplyComment
	ADD FOREIGN KEY (cno)
	REFERENCES Comments (cno)
;


ALTER TABLE BBS
	ADD FOREIGN KEY (mno)
	REFERENCES Members (mno)
;


ALTER TABLE BodySize
	ADD FOREIGN KEY (mno)
	REFERENCES Members (mno)
;


ALTER TABLE Comments
	ADD FOREIGN KEY (mno)
	REFERENCES Members (mno)
;


ALTER TABLE Likes
	ADD FOREIGN KEY (mno)
	REFERENCES Members (mno)
;


ALTER TABLE Personal
	ADD FOREIGN KEY (mno)
	REFERENCES Members (mno)
;


ALTER TABLE ReplyComment
	ADD FOREIGN KEY (mno)
	REFERENCES Members (mno)
;


ALTER TABLE Transac
	ADD FOREIGN KEY (mno)
	REFERENCES Members (mno)
;


ALTER TABLE Likes
	ADD FOREIGN KEY (rno)
	REFERENCES ReplyComment (rno)
;

/* INSERT Test Members */
INSERT INTO Members VALUES(SEQ_MNO.NEXTVAL,'kim@naver.com','KIM','1234','김길동',default,default);
INSERT INTO Members VALUES(SEQ_MNO.NEXTVAL,'lee@naver.com','LEE','1234','이길동',default,default);
INSERT INTO Members VALUES(SEQ_MNO.NEXTVAL,'park@naver.com','PARK','1234','박길동',default,default);

/* Comments */

COMMENT ON COLUMN BBS.bno IS '글 번호';
COMMENT ON COLUMN BBS.mno IS '회원번호';
COMMENT ON COLUMN BBS.title IS '제목';
COMMENT ON COLUMN BBS.content IS '내용';
COMMENT ON COLUMN BBS.attachFile IS '첨부파일';
COMMENT ON COLUMN BodySize.mno IS '회원번호';
COMMENT ON COLUMN BodySize.bodyType IS '체형';
COMMENT ON COLUMN BodySize.height IS '신장(키)';
COMMENT ON COLUMN BodySize.weight IS '몸무게';
COMMENT ON COLUMN BodySize.shoulder IS '어깨너비';
COMMENT ON COLUMN BodySize.chest IS '가슴둘레';
COMMENT ON COLUMN BodySize.waist IS '허리둘레';
COMMENT ON COLUMN BodySize.thigh IS '허벅지 둘레';
COMMENT ON COLUMN Comments.cno IS '댓글 번호';
COMMENT ON COLUMN Comments.cbody IS '댓글 내용';
COMMENT ON COLUMN Comments.mno IS '회원번호';
COMMENT ON COLUMN Likes.lno IS '좋아요 번호';
COMMENT ON COLUMN Likes.mno IS '회원번호';
COMMENT ON COLUMN Likes.bno IS '글 번호';
COMMENT ON COLUMN Likes.cno IS '댓글 번호';
COMMENT ON COLUMN Likes.rno IS '대댓글 번호';
COMMENT ON COLUMN Members.mno IS '회원번호';
COMMENT ON COLUMN Members.email IS '이메일';
COMMENT ON COLUMN Members.username IS '아이디';
COMMENT ON COLUMN Members.password IS '비밀번호';
COMMENT ON COLUMN Members.nickname IS '닉네임';
COMMENT ON COLUMN Members.action IS '이메일 수신여부';
COMMENT ON COLUMN Members.regidate IS '가입일';
COMMENT ON COLUMN Personal.mno IS '회원번호';
COMMENT ON COLUMN Personal.gender IS '성별';
COMMENT ON COLUMN Personal.self IS '자기소개';
COMMENT ON COLUMN Personal.tel IS '전화번호';
COMMENT ON COLUMN Personal.addr IS '주소';
COMMENT ON COLUMN Personal.inter IS '선호태그';
COMMENT ON COLUMN Personal.photo IS '프로필 사진';
COMMENT ON COLUMN ReplyComment.rno IS '대댓글 번호';
COMMENT ON COLUMN ReplyComment.rbody IS '대댓글 내용';
COMMENT ON COLUMN ReplyComment.mno IS '회원번호';
COMMENT ON COLUMN ReplyComment.cno IS '댓글 번호';
COMMENT ON COLUMN Transac.favorite IS '찜 목록';
COMMENT ON COLUMN Transac.SearchHistory IS '검색 기록';
COMMENT ON COLUMN Transac.mno IS '회원번호';



