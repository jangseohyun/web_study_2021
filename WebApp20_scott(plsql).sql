SELECT USER
FROM DUAL;
--==>> SCOTT

DESC TBL_BOARD;

DECLARE
    V_CNT       NUMBER(9)       :=1;
    V_NAME      VARCHAR2(30);
    V_PWD       VARCHAR2(20);
    V_EMAIL     VARCHAR2(50);
    V_SUBJECT   VARCHAR2(100);
    V_CONTENT   VARCHAR2(4000);
    V_IPADDR    VARCHAR2(20);
    V_HITCOUNT  NUMBER;
    V_CREATED   DATE;
BEGIN
    LOOP
        EXIT WHEN V_CNT > 811;
        
        V_CNT := V_CNT + 1;
        
        IF (MOD(V_CNT, 5)=0) THEN
            V_PWD := 'JAVA006$';
            V_SUBJECT := '음식 관련 내용물';
            V_CONTENT := '음식 관련 내용물로 작성되었습니다.';
            V_IPADDR := '211.238.142.155';
        ELSIF (MOD(V_CNT, 5)=0) THEN
            V_PWD := 'JAVA004$';
            V_SUBJECT := '날씨 관련 내용물';
            V_CONTENT := '날씨 관련 내용물로 작성되었습니다.';
            V_IPADDR := '211.238.142.164';
        ELSIF (MOD(V_CNT, 7)=0) THEN
            V_PWD := 'JAVA007$';
            V_SUBJECT := '메이크업 관련 내용물';
            V_CONTENT := '메이크업 관련 내용물로 작성되었습니다.';
            V_IPADDR := '211.238.142.172';
        ELSE
            V_PWD := 'JAVA008$';
            V_SUBJECT := '프로젝트 관련 내용물';
            V_CONTENT := '프로젝트 관련 내용물로 작성되었습니다.';
            V_IPADDR := '211.238.142.169';
        END IF;
    
    V_NAME := '박정준' || LTRIM(TO_CHAR(V_CNT));
    V_SUBJECT := V_SUBJECT || LTRIM(TO_CHAR(V_CNT));
    
    IF (MOD(V_CNT, 2)=0) THEN
        V_CREATED := TO_DATE('2020-05-24','YYYY-MM-DD');
        V_EMAIL := 'apple@test.com';
        V_HITCOUNT := 27;
    ELSIF (MOD(V_CNT, 3)=0) THEN
        V_CREATED := TO_DATE('2020-05-21','YYYY-MM-DD');
        V_EMAIL := 'apple@test.com';
        V_HITCOUNT := 32;
    ELSIF (MOD(V_CNT, 4)=0) THEN
        V_CREATED := TO_DATE('2020-05-19','YYYY-MM-DD');
        V_EMAIL := 'study@test.com';
        V_HITCOUNT := 46;
    ELSE
        V_CREATED := TO_DATE('2020-05-22','YYYY-MM-DD');
        V_EMAIL := 'morning@test.com';
        V_HITCOUNT := 72;
    END IF;
    
        INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
        VALUES(V_CNT, V_NAME, V_PWD, V_EMAIL, V_SUBJECT, V_CONTENT, V_IPADDR, V_HITCOUNT, V_CREATED);
    
    END LOOP;
END;

DECLARE
    V_CNT       NUMBER(9)       :=1;
    V_NAME      VARCHAR2(30);
    V_PWD       VARCHAR2(20);
    V_EMAIL     VARCHAR2(50);
    V_SUBJECT   VARCHAR2(100);
    V_CONTENT   VARCHAR2(4000);
    V_IPADDR    VARCHAR2(20);
    V_HITCOUNT  NUMBER;
    V_CREATED   DATE            := TO_DATE('2018-05-10', 'YYYY-MM-DD');
BEGIN
    LOOP
    
        EXIT WHEN V_CNT > 825;
        
        V_IPADDR := '211.238.142.';
        V_CREATED := V_CREATED + 1;
        
        IF (MOD(V_CNT, 5)=0) THEN
            V_NAME := '김가영';
            V_PWD := 'java006$';
            V_EMAIL := 'zero@test.com';
            V_SUBJECT := '음식 관련 게시물';
            V_CONTENT := '음식 관련 내용물로 작성되었습니다.';
            V_IPADDR := V_IPADDR || '151';
            V_HITCOUNT := V_CNT + 10;
        ELSIF (MOD(V_CNT, 3)=0) THEN
            V_NAME := '김나영';
            V_PWD := 'net006$';
            V_EMAIL := 'one@test.com';
            V_SUBJECT := '날씨 관련 게시물';
            V_CONTENT := '날씨 관련 내용물로 작성되었습니다.';
            V_IPADDR := V_IPADDR || '164';
            V_HITCOUNT := V_CNT + 8;
        ELSIF (MOD(V_CNT, 7)=0) THEN
            V_NAME := '김다영';
            V_PWD := 'com006$';
            V_EMAIL := 'two@test.com';
            V_SUBJECT := '메이크업 관련 게시물';
            V_CONTENT := '메이크업 관련 내용물로 작성되었습니다.';
            V_IPADDR := V_IPADDR || '172';
            V_HITCOUNT := V_CNT + 13;
        ELSE
            V_NAME := '이새롬';
            V_PWD := 'java007$';
            V_EMAIL := 'study@test.com';
            V_SUBJECT := '프로젝트 관련 게시물';
            V_CONTENT := '프로젝트 관련 내용물로 작성되었습니다.';
            V_IPADDR := V_IPADDR || '169';
            V_HITCOUNT := V_CNT + 30;
        END IF;
        
        V_NAME := V_NAME || LTRIM(TO_CHAR(V_CNT));
        V_SUBJECT := V_SUBJECT || LTRIM(TO_CHAR(V_CNT));
        
        INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
        VALUES(V_CNT, V_NAME, V_PWD, V_EMAIL, V_SUBJECT, V_CONTENT, V_IPADDR, V_HITCOUNT, V_CREATED);
    
        V_CNT := V_CNT + 1;
        
    END LOOP;
END;