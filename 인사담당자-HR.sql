/*

    테이블의 데이터 조회

    1. 지정된 테이블의 모든 행, 모든 열을 조회한다.
    SELECT *
    FROM 테이블명;
    
    2. 지정된 테이블의 모든 행, 지정된 열을 조회하기
    SELECT 컬럼명, 컴럼명, 컬럼명, ...
    FROM 테이블명;

    3. SELECT절에서 사칙연산을 수행할 수 있다.
    SELECT 컬러명, 숫자.컬러명*컬러명... 
    FROM 테이블명;
    *사칙연산에 사용되는 컬럼은 해당 컬럼의 값이 숫자여야한다.
    
    4. 컬럼에(Alias)별청 부여하기
    SELECT 컬럼명 AS 별칭, 컴럼명 AS 별칭,... 
    
    SELECT 컬럼명 별칭, 컬럼명 별칭, 컬럼명 별칭,...
    FROM 테이블명;
    
    SELECT JOB_ID, MAX_SALARY, MIN_SALARY
*/

--지역 테이블의 모든 행, 모든 열 조회하기



SELECT
    *
FROM
    regions;


--국가 테이블의 모든 행, 모든 열 조회하기

SELECT
    *
FROM
    countries;

--직종 테이블의 모든 행, 모든 열 조회하기
SELECT
    *
FROM
    jobs;

--부서 테이블의 모든 행, 모든 열 조회하기
SELECT
    *
FROM
    departments;

--직원 테이블의 모든 행, 모든 열 조회하기
SELECT
    *
FROM
    employees;

--직종 테이블에서 직종 아이디, 최소급여, 최대급여 조회하기 
SELECT
    job_id,
    min_salary,
    max_salary
FROM
    jobs;

--직원 테이블에서 직원아이디, 직원 이름(FIRST_NAME), 급여를 조회하기
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees;

--소재지 테이블에서 소재지 아이디, 주소, 도시명을 조회하기
SELECT
    location_id,
    street_address,
    city
FROM
    locations;

--직원 테이블에서 직원 아이디, 직원이름, 급여. 연봉을 조회하기
--연봉은 급여*12로 계산한다.
SELECT EXPLOYEE_ID, FIRST_NAME, SALART, SALARY*12
FROM EXPLOYEES

--직원 테이블에서 직원아이디, 직원이름, 급여, 연봉을 조회하기
--연뵹은 급여 *12로 시작한다
--연봉의 별칭은 ANNUAL_SALARY다
SELECT  EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY *12 AS ANNUAL_SALAY
FROM ELPLOYEES;

--직종 테이블에서 작품아이디, 최고급여, 최저급여, 최고급여와 최저급여의 차이를 조회하기 
최고급여와 최저급여의 차이는 ALARY_GAP별칭을 부여한다

SELECT JOB_ID, MAXSALAY, MIN_SALARY - MIN_SALARY As ANNUAL_SALARY
FROM
    explyees
    직종테이블에서
    작중아이디.최고급여, 최저급여, 최고급여

/*

데이터 필터링하기
1. WHERE 절에 조건식을 작성해서 해당 조건식을 만족시키는 행만 조회하기
SELECT 컬럼명, 컬럼명, 컬럼명 ,...
FROM 테이블명
WHERE 조건식;

2. WHERE 절에서 2개 이상의 조건식으로 데이터를 필터링할 수 있다.
2개 이상의 조건식을 작성할 때는 AND, OR, NOT 논리 연산자를 사용한다.

SELECT 컬럼명, 컬럼명, 컬럼명, ...
FROM 테이블명
WHERE 조건식1 AND 조건식 2;
*조건식 1과 조건식 2가 모두 TRUE 로 판정되는 행만 조회된다

SELECT 컬럼명, 컬럼명, 컬럼명, ...
FROM 테이블명
WHERE 조건식1 OR 조건식 2;
*조건식 1과 조건식 2중에 하나라도 TRUE로 판정되는 행만 조회된다

SELECT 컬럼명, 컬럼명, 컬럼명, ...
FROM 테이블명
WHERE 조건식1 AND (조건식 2 OR 조건식3);
AND 연산자와 OR 연산자를 같이 사용할 때는 OR 연산식을 괄호로 묶는다.

*/

--직원 테이블에서 소속부서 아이디가 60번이 직원의 아이디, 이름, 직종아이디를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM  EMEPLOYEES
WHERE DEPARTMENET_ID =60;

--직원 테이블에서 급여를 10000달러 이상 받는 직원의 아이디, 이름, 직종아이디, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000;

--직원 테이블에서 직종아이디가 'SA_MAN'인 직원의 아이디, 이름, 급여, 소속부서 아이디를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME,SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'SA_MAN'

--직원 테이블에서 급여가 5000 ~10000 범위에 속하는 직원 아이디, 이름, 직종아이디, 급여를 조회하기
--급여가 5000이상, 10000이하로 받는 직원을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME,JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000 AND SALARY <= 10000;

--직원 테이블에서 10번 부서, 20번 부서, 30번 부서에서 근무하는 직원 아이디, 이름 ,부서 아이디를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID =20 OR DEPARTMENT_ID = 30;