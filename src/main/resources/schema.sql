CREATE TABLE MEMBER (
    ID NUMBER PRIMARY KEY,
    EMAIL VARCHAR2(100) NOT NULL UNIQUE,
    NICKNAME VARCHAR2(30) NOT NULL,
    HASHTAG NUMBER(4) NOT NULL,
    STATUS VARCHAR2(100) NULL
);

CREATE TABLE CHANNEL (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL,
    THUMBNAIL CLOB NULL,
    INVITE_CODE VARCHAR2(100) NOT NULL
);

CREATE TABLE CHANNEL_MEMBER (
    ID NUMBER PRIMARY KEY,
    CHANNEL_ID NUMBER NOT NULL,
    MEMBER_ID NUMBER NOT NULL,
    ROLE VARCHAR2(20) DEFAULT 'guest' CHECK (ROLE IN ('owner', 'manager', 'guest')),
    CONSTRAINT CHANNEL_MEMBER_CHANNEL_ID_FK FOREIGN KEY (CHANNEL_ID) REFERENCES CHANNEL (ID),
    CONSTRAINT CHANNEL_MEMBER_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (ID)
);

CREATE TABLE TOPIC (
    ID NUMBER PRIMARY KEY,
    TITLE VARCHAR2(100) NOT NULL,
 --     topic_group varchar2(100),
    CHANNEL_ID NUMBER NOT NULL, -- id of the channel that references topic
    CONSTRAINT TOPIC_CHANNEL_ID_FK FOREIGN KEY (CHANNEL_ID) REFERENCES CHANNEL (ID)
);

CREATE TABLE REFRESH_TOKEN (
    ID NUMBER PRIMARY KEY,
    EMAIL VARCHAR2(100) NOT NULL UNIQUE,
    TOKEN VARCHAR2(255) NOT NULL,
    EXPIRE_DATE DATE NOT NULL
);

CREATE TABLE MESSAGE (
    ID NUMBER PRIMARY KEY,
    AUTHOR_ID NUMBER NOT NULL,
    CONTENT VARCHAR2(1000) NOT NULL,
    CHANNEL_ID NUMBER NOT NULL, -- id of the channel that references message
    TOPIC_ID NUMBER NOT NULL, -- id of the topic that references message
    CREATED_AT DATE NOT NULL,
    UPDATED_AT DATE NOT NULL,
    CONSTRAINT MESSAGE_AUTHOR_ID_FK FOREIGN KEY (AUTHOR_ID) REFERENCES MEMBER (ID),
    CONSTRAINT MESSAGE_CHANNEL_ID_FK FOREIGN KEY (CHANNEL_ID) REFERENCES CHANNEL (ID),
    CONSTRAINT MESSAGE_TOPIC_ID_FK FOREIGN KEY (TOPIC_ID) REFERENCES TOPIC (ID)
);

CREATE TABLE ATTACHMENT (
    ID NUMBER PRIMARY KEY,
    CONTENT BLOB
);

CREATE TABLE DIRECT_MESSAGE (
    ID NUMBER PRIMARY KEY,
    MEMBER_ID NUMBER NOT NULL,
    ANOTHER_ID NUMBER NOT NULL,
    ACTIVE NUMBER(1) NOT NULL,
    CONSTRAINT TOPIC_MEMBER1_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (ID),
    CONSTRAINT TOPIC_MEMBER2_ID_FK FOREIGN KEY (ANOTHER_ID) REFERENCES MEMBER (ID)
);

CREATE TABLE REQUEST_FRIEND (
    ID NUMBER PRIMARY KEY,
    FROM_ID NUMBER,
    TO_ID NUMBER
);

CREATE TABLE FRIEND (
    ID NUMBER PRIMARY KEY,
    MY_ID NUMBER,
    FRIEND_ID NUMBER
);

CREATE SEQUENCE MEMBER_SEQ START WITH 10000;

CREATE SEQUENCE CHANNEL_SEQ START WITH 10000;

CREATE SEQUENCE CHANNEL_MEMBER_SEQ START WITH 10000;

CREATE SEQUENCE TOPIC_SEQ START WITH 10000;

CREATE SEQUENCE MESSAGE_SEQ START WITH 10000;

CREATE SEQUENCE ATTACHMENT_SEQ START WITH 10000;

CREATE SEQUENCE TOKEN_SEQ START WITH 10000;

CREATE SEQUENCE PERSONAL_TOPIC_SEQ START WITH 10000;

CREATE SEQUENCE REQUEST_FRIEND_SEQ START WITH 10000;

CREATE SEQUENCE FRIEND_SEQ START WITH 10000;