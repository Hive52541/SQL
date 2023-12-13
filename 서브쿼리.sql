/*

서브쿼리의 구분

-단일행 서브쿼리
    서브쿼리 실행결과로 한 행이 획득된다.(1행 1열 데이터를 반환하는 서브쿼리)
    연산자
    =,!=,>,>=,<,<=,IN , NOT IN


-다중행 서브쿼리
    서브쿼리 실행결과로 여러 행이 획득된다.(N행 1열 데이터를 반환하는 서브쿼리)
    연산자
    IN, NOT IN, > ANY, >ALL, >=ANY, >=ALL
                < ANY, <ALL, <=ANY, <=ALL

-다중열 서브쿼리
    서브쿼리 실행결과로 여러 개의 컬럼값이 획득된다(N행N열 데이터를 반환하는 서브쿼리)
    연산자
        IN  , NOT IN

*/


--단일행 서브쿼리
--101 번 사원에게 보고받는 상사와 같은 상사에게 보고하는 직원의 아이디, 이름을 조회하기
SELECT
    EMPLOYEE_ID,
    FIRST_NAME
FROM
    EMPLOYEES
WHERE
    MANAGER_ID =(
        SELECT
            MANAGER_ID
        FROM
            EMPLOYEES
        WHERE
            EMPLOYEE_ID=101
    );

--101번 사원보다 급여를 많이 받는 직원의 아읻, 이름, 급여를 조회하기
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    SALARY
FROM
    EMPLOYEES
WHERE
    SALARY>(
        SELECT
            SALARY
        FROM
            EMPLOYEES
        WHERE
            EMPLOYEE_ID=101
    );

--'Steven'과 같은 해에 입사한 직원의 아이디, 이름, 입사일을 조회하기
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    HIRE_DATE
FROM
    EMPLOYEES
WHERE
    TO_CHAR(HIRE_DATE, 'YYYY') IN (
        SELECT
            TO_CHAR(HIRE_DATE, 'YYYY')
        FROM
            EMPLOYEES
        WHERE
            FIRST_NAME= 'Steven'
    );

--60번 부서에 소속된 직원들의 급여보다 급여를 많이 닫는 직원들의 아이디, 이름, 급여를 조회하기
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    SALARY
FROM
    EMPLOYEES
WHERE
    SALARY > (
        SELECT
            MAX(SALARY)
        FROM
            EMPLOYEES
        WHERE
            DEPARTMENT_ID = 60
    );

--다중열 서브
--각 부서별 최저 급여를 받는 직원의 아이디,이름 급여를 조회하기
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    SALARY,
    DEPARTMENT_ID
FROM
    EMPLOYEES
WHERE
    (DEPARTMENT_ID, SALARY) IN (
        SELECT
            DEPARTMENT_ID,
            MIN(SALARY)
        FROM
            EMPLOYEES
        WHERE
            DEPARTMENT_ID IS NOT NULL
        GROUP BY
            DEPARTMENT_ID
    );

/*
상호연관 서브쿼리
    서브쿼리에서 메인쿼리의 컬럼을 참조하면 상호연관 서브쿼리가 된다.
    형식
        SELECT OUTER.COLUMN, OUTER.COLUMN
        FROM  TABLE OUTER
        WHERE OUTER,COLUMN 연산자(SELECT INNER.COLUMN
        FROM TABLE INNER
        WHERE INNER.COLUMN = OUTER.COLUMN)

일반서브쿼리와 상호연관서브쿼리의 다른 점
    서브쿼리는 메인쿼리보다 먼저 실행된다.
    서브쿼리는 딱 한번 실행된다.

    상호연관 서브쿼리는 메인쿼리문에서 처리되는 각 행에 대해서 한번씩 실행된다.
    */

--직원들 중에서 자신이 소속된 부서의 평균급여보다 급여를 많이 받는 사원의 아이디, 이름, 급여를 조회하기
SELECT
    X.EMPLOYEE_ID,
    X.FIRST_NAME,
    X.SALARY
FROM
    EMPLOYEES X
WHERE
    X.SALARY >(
        SELECT
            AVG(Y.SALARY)
        FROM
            EMPLOYEES Y
        WHERE
            Y.DEPARTMENT_ID = X.DEPARTMENT_ID
    );

----------------------------------------------------------------------------------------
--EMPLOYEE_ID   FIRST_NAME  DEPARTMENT_ID       SALARY
--100           홍길동      10                  1000            서브쿼리의 X.DEPARTMENT_ID가 10으로 지정된다.
--101           김유신      10                  2000            서브쿼리의 X.DEPARTMENT_ID가 10으로 지정된다.
--102           강감찬      20                  2000            서브쿼리의 X.DEPARTMENT_ID가 20으로 지정된다.
--103           이순신      20                  4000            서브쿼리의 X.DEPARTMENT_ID가 20으로 지정된다.
--104           류관순      20                  1000            서브쿼리의 X.DEPARTMENT_ID가 20으로 지정된다.
---------------------------------------------------------------------------------------

-- 부서아이디, 부서이름, 해당 부서에 소속된 직원수를 조회하기
SELECT
    X.DEPARTMENT_ID,
    X.DEPARTMENT_NAME,
    (
        SELECT
            COUNT(*)
        FROM
            EMPLOYEES Y
        WHERE
            Y.DEPARTMENT_ID=X.DEPARTMENT_ID
    )CNT
FROM
    DEPARTMENTS X;

------------------------------------------------------------------------------------------------------

--DEPARTMENT_ID     DEPARTMENT_NAME         CNT
-- 10               Administration,1        SELECT COUNT(*) FROM EMPS Y WHERE Y.DEPT_ID= 10
-- 20               Marketing,2             SELECT COUNT(*) FROM EMPS Y WHERE Y.DEPT_ID= 20
-- 30               Purchasing,6            SELECT COUNT(*) FROM EMPS Y WHERE Y.DEPT_ID= 30
-- 40               Human Resources,1       SELECT COUNT(*) FROM EMPS Y WHERE Y.DEPT_ID= 40
-- 50               Shipping,45             SELECT COUNT(*) FROM EMPS Y WHERE Y.DEPT_ID= 50

------------------------------------------------------------------------------------------------------

--직원 아이디, 직원이름, 상사의 아이디, 상사의 이름을 조회하기
SELECT
    X.EMPLOYEE_ID EMP_ID,
    X.FIRST_NAME  EMP_NAME,
    X.MANAGER_ID  MGR_ID,
    (
        SELECT
            Y.FIRST_NAME
        FROM
            EMPLOYEES Y
        WHERE
            Y.EMPLOYEE_ID = X.MANAGER_ID
    )MGR_NAME
FROM
    EMPLOYEES X;