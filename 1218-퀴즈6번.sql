-- employees ���̺��� ������� ��� �������̵� ��ȸ�ϱ�
SELECT
    JOB_ID
FROM
    EMPLOYEES
 -- �޿��� 12,000�޷� �̻� �޴� ����� �̸��� �޿��� ��ȸ�ϱ�
    SELECT
        FIRST_NAME,
        SALARY
    FROM
        EMPLOYEES
    WHERE
        SALARY >= 12000;

-- �����ȣ�� 176�� ����� ���̵�� �̸� ������ ��ȸ�ϱ�
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    JOB_TITLE
FROM
    EMPLOYEES E,
    JOBS      J
WHERE
    E.EMPLOYEE_ID = 176;

-- �޿��� 12,000�޷� �̻� 15,000�޷� ���� �޴� ������� ��� ���̵�� �̸��� �޿��� ��ȸ�ϱ�
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    SALARY
FROM
    EMPLOYEES
WHERE
    SALARY >= 12000
    AND SALARY<=15000;

-- 2005�� 1�� 1�Ϻ��� 2000�� 6�� 30�� ���̿� �Ի��� ����� ���̵�, �̸�, �������̵�, �Ի����� ��ȸ�ϱ�
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

-- �޿��� 5,000�޷��� 12,000�޷� �����̰�, �μ���ȣ�� 20 �Ǵ� 50�� ����� �̸��� �޿��� ��ȸ�ϱ�
SELECT
    FIRST_NAME,
    SALARY
FROM
    EMPLOYEES
WHERE
    DEPARTMENT_ID= 20
    OR DEPARTMENT_ID= 50 SALARY>5000
    AND SALARY<12000;

-- �����ڰ� ���� ����� �̸��� �������̵� ��ȸ�ϱ�
SELECT
    FIRST_NAME,
    JOB_ID
FROM
    EMPLOYEES
WHERE
    MANAGER_ID IS NULL;

-- Ŀ�̼��� �޴� ��� ����� �̸��� �޿�, Ŀ�̼��� �޿� �� Ŀ�̼��� ������������ �����ؼ� ��ȸ�ϱ�

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

-- �̸��� 2��° ���ڰ� e�� ��� ����� �̸��� ��ȸ�ϱ�
SELECT
    FIRST_NAME COUTN(*)
FROM
    EMPLOYEES
WHERE
    FIRST_NAME = 'E';

-- �������̵� ST_CLERK �Ǵ� SA_REP�̰� �޿��� 2,500�޷�, 3,500�޷�, 7,000�޷� �޴� ��� ����� �̸��� �������̵�, �޿��� ��ȸ�ϱ�
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

-- ��� ����� �̸��� �Ի���, �ٹ� ���� ���� ����Ͽ� ��ȸ�ϱ�, �ٹ����� ���� ������ �ݿø��ϰ�, �ٹ��������� �������� ������������ �����ϱ�
-- ����� �̸��� Ŀ�̼��� ��ȸ�ϱ�, Ŀ�̼��� ���� �ʴ� ����� '����'���� ǥ���ϱ�
-- ��� ����� �̸�, �μ���ȣ, �μ��̸��� ��ȸ�ϱ�
-- 80���μ��� �Ҽӵ� ����� �̸��� �������̵�, ��������, �μ��̸��� ��ȸ�ϱ�
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

-- Ŀ�̼��� �޴� ��� ����� �̸��� �������̵�, ��������, �μ��̸�, �μ������� ���ø��� ��ȸ�ϱ�
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

-- ������ �������� �ΰ� �ִ� ��� �μ����̵�� �μ��̸��� ��ȸ�ϱ�

SELECT
    DEPARTMENT_ID,
    DEPARTMENT_NAME
FROM
    DEPARTMENTS
WHERE
    LOCATION_ID
 -- ����� �̸��� �ҼӺμ���, �޿�, �޿� ����� ��ȸ�ϱ�
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
 -- ����� �̸��� �ҼӺμ���, �ҼӺμ��� �����ڸ��� ��ȸ�ϱ�, �ҼӺμ��� ���� ����� �ҼӺμ��� '����, �����ڸ� '����'���� ǥ���ϱ�
 -- ��� ����� �޿� �ְ��, �޿� ������, �޿� �Ѿ�, �޿� ��վ��� ��ȸ�ϱ�
 -- ������ �޿� �ְ��, �޿� ������, �޿� �Ѿ�, �޿� ��վ��� ��ȸ�ϱ�
 -- �� ������ ������� ��ȸ�ؼ� ���� ������� ���� ���� 3���� ��ȸ�ϱ�, �������̵�� ����� ǥ���ϱ�
 -- �����ں� ������� ��ȸ�ϱ�, ������ �̸��� �� �����ڰ� �����ϴ� ����� ǥ���ϱ�
 -- �� �μ��� ���� �μ��̸�, ������ �̸�, �Ҽӻ�� ��, �Ҽӻ������ ��� �޿��� ��ȸ�ϱ�
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
 -- Steven King�� ���� �μ��� ���� ����� �̸��� �Ի����� ��ȸ�ϱ�
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

-- �Ҽ� �μ��� ��ձ޿����� ���� �޿��� �޴� ����� ���̵�� ����̸�, �޿�, �� �μ��� ��� �޿��� ��ȸ�ϱ�

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

-- Kochhar�� ������ �޿� ��� ����� �̸��� �Ի��� �޿��� ��ȸ�ϱ�, ����� Kochhar�� ���Խ�Ű�� �ʱ�
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

-- �Ҽ� �μ��� �Ի����� ������, �� ���� �޿��� �޴� ����� �̸��� �ҼӺμ���, �޿��� ��ȸ�ϱ�
-- ������ ���̵�, �����ڸ�, �� �����ڰ� �����ϴ� �����, �� �����ڰ� �Ҽӵ� �μ��� ��ȸ�ϱ�
SELECT
    MANAGER_ID,
    MANAGER_NAME,
    DEPARTMENT_NAME
FROM
    DEPARTMENTS
WHERE