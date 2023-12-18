/*
사용자와 권한 관리

권한
    특정 SQL문을 실행할 수 있는 권리
권한의 종류
    시스템권한
        데이터베이스를 엑세스 할 수 있는 권한
        데이터베이스 관리자만 시스템권한을 부여/회수할 수 있다.
    객체권한    
        데이터베이스 객체의 내용을 조회/조작할 수 있는 권한
        데이터베이스 객체를 소유하고 있는 사용자가 다른 사용자에게 객체권한을 부여/회수할 수 있다.

롤(Role)
    사용자에게 부여할 수 있는 여러 권한을 하나로 묶어서 그룹화하고 이름을 부여한 것이다.
    롤을 사용하면 권한의 부여, 회수, 유지관리가 쉬워진다.
    대표적인 롤
    CONNECT 롤
        오라클 데이터베이스에 접속할 수 있는 권한(CREATE SESSION 시스템권한)을 포함하고 있는 롤이다.
    RESOURCE 롤
        데이터베이스 객체를 생성/수정/삭제할 수 있는 권한을 포함하고 있는 롤이다.
        일반적으로 가장 많이 사용되는 시스템권한을 포함하고 있는 롤이다.
        *일반사용자는 CONNECT롤, RESOURCE롤을 포함한다.
    DBA 롤   
        데이터베이스를 관리하는 시스템 권한을 대부분 포함하고 있는 롤이다.
        

권한의 부여와 회수
    시스템 권한의 부여
        GRANT 시스템권한, 시스템권한, ...
        TO 사용자명;

        GRNT 롤, 롤,...
        TO 사용자명;
    시스템 권한의 회수
        REMOVE 시스템권한, 롤,...
        FROM 사용자명;

    객체 권한의 부여
        GRANT 객체권한 (컬럼명, 컬럼명, ...)
        ON 객체명
        TO 사용자명;               

    객체 권한의 회수
        REMOVE 객체권한, 객체권한, ...
        ON 객체명
        FROM 사용자명;    


사용자 관리
    -사용자 생성
        CREATE USER 사용자명 INDENTIFIED BY 비밀번호;
        * 사용자명은 대소문자를 구분하지 않는다.
        * 비밀번호는 대소문자를 구분한다.
    -사용자 삭제
        DROP USER 사용자명;
    -사용자 비밀번호 변경
        ALTER USER 사용자명 INDENTIFIED BY 새비밀번호;
    -권한부여
    -권한회수

*/

--사용자 생성하기
/*
    ORACLE 12c버전부터 사용자명에 c##을 붙이지 않으면 오류가 발생할 수 있다.
    _ORACLE_SCRIPT를 TRUE로 설정하면 c##을 붙이지 않고 사용자를 생성 할 수 있다.
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER HTA IDENTIFIED BY zxcv1234;

--HTA 사용자에게

/*
스키마(SCHEMA)
    * 특정 사용자와 연결된 데이터베이스 객체 (테이블, 뷰, 시퀸스, 인덱스 등의 데이터베이스 객체의 집합)
    * 데이터베이스 객체는 대부분 사용자가 소유하고 있기 때문에 사용자의 이름과 동일한 이름을 갖는다.
    * 다른 사용자가 소유하고 있는 데이터베이스 객체를 엑세스 할 때는 반드시 스키마를 명시해야 한다.

*/


--HTA에게 객체권한이 부여된 HR의 EMPLOYEES 테이블 조회하기

SELECT
    *
FROM
    HR.EMPLOYEES;

--HTA 사용자에게 객체 권한 부여하기
GRANT SELECT
ON EMPLOYEES
TO HTA;

--HTA 사용자에게 부여된 객체 권한 회수하기
REMOVE SELECT
ON EMPLOYEES
FROM HTA;

-- GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SEQUENCE
-- TO HTA;

-- GRANT CONNECT, RESOURCE
-- TO HTA;


--특정 사용자에게 EMPLOYEES객체에 대한 여러 개의 객체 권한을 부여하기
GRANT SELECT, INSERT, UPDATE, DELETE
ON EMPLOYEES
TO HTA;

--특정 사용자에게 EMPLOYEES객체에 대한 모든 객체 권한을 부여하기
GRANT ALL PRIVILEGES
ON EMPLOYEES
TO HTA;

--모든 사용자에게 EMPLOYEES객체에 대한 객체권한을 부여하기
GRANT SELECT
ON EMPLOYEES
TO PUBLIC;

--WITH GRANT OPTION을 사용하면 SELECT 권한을 부여받은 HTA가 다른 사용자에게 SELECT권한을 부여할 수 있다.
GRANT SELECT
ON EMPLOYEES
TO HTA
WITH GRANT OPTION;

/*
시노님(SYNONYM:동의어)
    시노님의 데이터베이스 객체(테이블, 뷰, 시퀸스 등)에 대한 대체이름(ALias)를 말한다.

시노님을 사용하는 이유
    시노님의 다른 유저의 객체를 참조할 때 많이 사용한다.
    객체의 긴 이름을 사용하기 쉬운 짧은 이름으로 시노님을 생성하면 SQL 코딩을 단순화할 수 있다.
    시노님을 사용하면 사용자가 참조하고 있는 객체에 대한 소유자, 이름을 감출 수 있다.

시노님 생성하기
    CREATE [PUBLIC] SYSNONYM 시노님이름
    FOR 데이터베이스 객체; 

* PUBLIC : 모든 사용자가 접근 가능한 시노님을 생성한다.

*/
--HR 계정의 EMPLOYEES 테이블을 HTA 사용하는 경우
/*
    HR 계정으로 접속해서 EMPLOYEES 테이블에 대한 객체권한을 HTA에 부여하기
    GRANT SELECT, INSERT, UPDATE, DELETE
    ON EMPLOYEES
    TO HTA;

HTA 계정으로 접속해서 시노님을 생성하기
    CREATE SYNONYM EMP FOR HR.EMPLOYEES;


HTA 계정에서 시노님을 이용해서 쿼리하기
    SELECT*
    FROM EMP;        
*/


-- --HTA계정으로 접속해서 EMPLOYEES 조회하기
-- SELECT *
-- FROM HR.EMPLOYEES;
-- --HTA 계정으로 접속해서 시노님 생성하기
-- CREATE SYSNONYM EMP
-- FOR HR.EMPLOYEES;


--HR.EMPLOYEES 테이블을 참조하는 시노님 생성하기
CREATE SYSNONYM EMP
FOR HR.EMPLOYEES;

SELECT *
FROM HR.EMPLOYEES;

--시노님을 이용한 SQL쿼리
SELECT *
FROM EMP;