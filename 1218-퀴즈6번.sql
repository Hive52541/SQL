-- employees 테이블에서 사원들의 모든 직종아이디를 조회하기
SELECT
    JOB_ID
FROM
    EMPLOYEES
 -- 급여를 12,000달러 이상 받는 사원의 이름과 급여를 조회하기
    SELECT
        FIRST_NAME,
        SALARY
    FROM
        EMPLOYEES
    WHERE
        SALARY >= 12000;

-- 사원번호가 176번 사원의 아이디와 이름 직종을 조회하기
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    JOB_TITLE
FROM
    EMPLOYEES E,
    JOBS      J
WHERE
    E.EMPLOYEE_ID = 176;

-- 급여를 12,000달러 이상 15,000달러 이하 받는 사원들의 사원 아이디와 이름과 급여를 조회하기
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    SALARY
FROM
    EMPLOYEES
WHERE
    SALARY >= 12000
    AND SALARY<=15000;

-- 2005년 1월 1일부터 2000년 6월 30일 사이에 입사한 사원의 아이디, 이름, 직종아이디, 입사일을 조회하기
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    JOB_ID,
    HIRE_DATE
FROM
    EMPLOYEES
WHERE
    HIRE_DATE (2005/01/01)
    AND (2000/06/30);

-- 급여가 5,000달러와 12,000달러 사이이고, 부서번호가 20 또는 50인 사원의 이름과 급여를 조회하기
SELECT
    FIRST_NAME,
    SALARY
FROM
    EMPLOYEES
WHERE
    DEPARTMENT_ID= 20
    OR DEPARTMENT_ID= 50 SALARY>5000
    AND SALARY<12000;

-- 관리자가 없는 사원의 이름과 직종아이디를 조회하기
SELECT
    FIRST_NAME,
    JOB_ID
FROM
    EMPLOYEES
WHERE
    MANAGER_ID IS NULL;

-- 커미션을 받는 모든 사원의 이름과 급여, 커미션을 급여 및 커미션의 내림차순으로 정렬해서 조회하기

SELECT
    FIRST_NAME,
    SALARY,
    COMMISSION_PCT
FROM
    EMPLOYEES
WHERE
    COMMISSION_PCT IS NOT NULL
ORDER BY
    SALARY DESC;

-- 이름의 2번째 글자가 e인 모든 사원의 이름을 조회하기
SELECT
    FIRST_NAME COUTN(*)
FROM
    EMPLOYEES
WHERE
    FIRST_NAME = 'E';

-- 직종아이디가 ST_CLERK 또는 SA_REP이고 급여를 2,500달러, 3,500달러, 7,000달러 받는 모든 사원의 이름과 직종아이디, 급여를 조회하기
SELECT
    E. FIRST_NAME,
    J.JOB_ID,
    E.SALARY
FROM
    EMPLOYEES E,
    JOBS      J
WHERE
    J.JOB_ID = 'ST_CLEAK'
    AND J.JOB_ID ='AS_REP';

-- 모든 사원의 이름과 입사일, 근무 개월 수를 계산하여 조회하기, 근무개월 수는 정수로 반올림하고, 근무개월수를 기준으로 오름차순으로 정렬하기
-- 사원의 이름과 커미션을 조회하기, 커미션을 받지 않는 사원은 '없음'으로 표시하기
-- 모든 사원의 이름, 부서번호, 부서이름을 조회하기
-- 80번부서에 소속된 사원의 이름과 직종아이디, 업무제목, 부서이름을 조회하기
SELECT
    E. FIRST_NAME,
    J.JOB_ID,
    J.JOB_TITLE,
    D.DEPARTMENT_NAME
FROM
    EMPLOYEES   E,
    JOBS        J,
    DEPARTMENTS D
WHERE
    D.DEPARTMENT_ID = 80;

-- 커미션을 받는 모든 사원의 이름과 직종아이디, 업무제목, 부서이름, 부서소재지 도시명을 조회하기
SELECT
    E.FIRST_NAME,
    J.JOB_ID,
    J.JOB_TITLE,
    D.DEPARTMENT_NAME,
    D.LOCATION_ID,
    L.COUNTRY_ID
FROM
    EMPLOYEES   E,
    JOBS        J,
    DEPARTMENTS D,
    LOCATIONS   L
WHERE
    E.COMMISSION_PCT IS NOT NULL;

-- 유럽에 소재지를 두고 있는 모든 부서아이디와 부서이름을 조회하기

SELECT
    DEPARTMENT_ID,
    DEPARTMENT_NAME
FROM
    DEPARTMENTS
WHERE
    LOCATION_ID
 -- 사원의 이름과 소속부서명, 급여, 급여 등급을 조회하기
    SELECT
        FIRST_NAME,
        DEPARTMENT_NAME,
        SALARY,
        SALARY_GRADES
    FROM
        EMPLOYEES,
        DEPARTMENTS;

(
    SELECT
    FROM
    WHERE
)
 -- 사원의 이름과 소속부서명, 소속부서의 관리자명을 조회하기, 소속부서가 없는 사원은 소속부서명 '없음, 관리자명 '없음'으로 표시하기
 -- 모든 사원의 급여 최고액, 급여 최저액, 급여 총액, 급여 평균액을 조회하기
 -- 업무별 급여 최고액, 급여 최저액, 급여 총액, 급여 평균액을 조회하기
 -- 각 업무별 사원수를 조회해서 가장 사원수가 많은 업무 3개를 조회하기, 직종아이디와 사원수 표시하기
 -- 관리자별 사원수를 조회하기, 관리자 이름과 그 관리자가 관리하는 사원수 표시하기
 -- 각 부서에 대해 부서이름, 관리자 이름, 소속사원 수, 소속사원들의 평균 급여를 조회하기
SELECT
    D.DEPARTMENT_NAME,
    (
        SELECT
            E.FIRST_NAME
        FROM
            EMPLOYEES E
        WHERE
            E.EMPLOYEE_ID=D.MANAGER_ID
    )MANAGER_NAME,
    (
        SELECT
            COUNT(*)
        FROM
            EMPLOYEES E
        WHERE
            E. DEPARTMENT_ID=D.DEPARTMENT_ID
    )CNT,
    (
        SELECT
            AVG(E.SALARY)
        FROM
            EMPLOYEES E
        WHERE
            E.DEPARTMENT_ID=D.DEPARTMENT_ID
    )AVG_SALARY
FROM
    DEPARTMENTS D;
 -- Steven King과 같은 부서에 속한 사원의 이름과 입사일을 조회하기
    SELECT
        FIRST_NAME,
        HIRE_DATE
    FROM
        EMPLOYEES
    WHERE
        DEPARTMENT_ID = (
            SELECT
                DEPARTMENT_ID
            FROM
                EMPLOYEES
            WHERE
                FIRST_NAME ='Steven'
                AND LAST_NAME = 'King'
        );

-- 소속 부서의 평균급여보다 많은 급여를 받는 사원의 아이디와 사원이름, 급여, 그 부서의 평균 급여를 조회하기

SELECT
    E.EMPLOYEE_ID,
    E.SALARY,
    A.AVG_SALARY
FROM
    (
        SELECT
            DEPARTMENT_ID,
            AVG(SALARY)   AVG_SALARY
        FROM
            EMPLOYEES
        WHERE
            DEPARTMENT_ID IS NOT NULL
        GROUP BY
            DEPARTMENT_ID
    )         A,
    EMPLOYEES E
WHERE
    A.DEPARTMENT_ID=E.DEPARTMENT_ID
    AND A.AVG_SALARY > E. SALARY;

-- Kochhar과 동일한 급여 모든 사원의 이름과 입사일 급여를 조회하기, 결과에 Kochhar은 포함시키지 않기
--'Neena'
SELECT
    FIRST_NAME,
    HIRE_DATE,
    SALARY
FROM
    EMPLOYEES
WHERE
    SALARY = (
        SELECT
            SALARY
        FROM
            EMPLOYEES
        WHERE
            FIRST_NAME='Neena'
    )
    AND FIRST_NAME != 'Neena';

-- 소속 부서에 입사일이 늦지만, 더 많은 급여를 받는 사원의 이름과 소속부서명, 급여를 조회하기
-- 관리자 아이디, 관리자명, 그 관리자가 관리하는 사원수, 그 관리자가 소속된 부서를 조회하기
SELECT
    MANAGER_ID,
    MANAGER_NAME,
    DEPARTMENT_NAME
FROM
    DEPARTMENTS
WHERE