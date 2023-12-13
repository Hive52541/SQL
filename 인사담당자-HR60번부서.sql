-- 60�� �μ��� �Ҽӵ� �������� ���̵�, �̸�, �������� ���̵�, �������� �̸��� ��ȸ�ϱ�
-- E                    E               E    M                  M
SELECT
FROM
    EMPLOYEES E AS EMP_ID,
    E.FIRST_NAME AS EMP_NAME,
    M.EMPLOYEE_ID AS MGR_ID,
    M.FIRST_NAME AS MGR_NAME
WHERE
    E.DEPARTMENT_ID = 60
    AND E.MANAGER_ID=M.EMPLOYEE_ID;

-- 60�� �μ��� �Ҽӵ� �������� ���̵�, �̸�, �޿�, �޿������ ��ȸ�ϱ�
-- E

-- ������ �߿��� �ڽ��� ��纸�� ���� �Ի��� �������� ���̵�, �̸�, �Ի���, �������� �̸�, �������� �Ի����� ��ȸ�ϱ�
SELECT
    E.EMPLOYEE_ID AS EMP_ID,
    E.FIRST_NAME  AS EMP_NAME,
    E.HIRE_DATE   AS EMP_HIRE_DATE,
    M.EMPLOYEE_ID AS MGT_ID,
    M.FIRST_NAME  AS MGT_NAME,
    M.HIRE_DATE   AS MGT_HIRE_DATE
FROM
    EMPLOYEES E,
    EMPLOYEES M
WHERE
    E.MANAGER_ID = M.EMPLOYEE_ID
    AND E.HIRE_DATE < M.HIRE_DATE;

-- �������� �������̵� ��ձ޿��� ��ȸ�ؼ� �������̵�, ��ձ޿��� ��ȸ�ϱ�
-- ��ձ޿��� �Ҽ����κ��� ���� ������.
SELECT
    JOB_ID,
    AVG(SALARY)
FROM
    EMPLOYEES
GROUP BY
    JOB_ID;

-- �����ں�(���)�� ����ڴ� �������� ��ȸ�ؼ� ������ ���̵�, �������� ����ϱ�
SELECT
    MANAGER_ID,
    COUNT(*)
FROM
    EMPLOYEES
WHERE
    MANAGER_ID IS NOT NULL
GROUP BY
    MANAGER_ID;

-- �������� ��ü ��ձ޿����� �޿��� ���� �޴� �������� ���̵�, �̸�, �޿��� ����ϱ�
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    SALARY
FROM
    EMPLOYEES
WHERE
    SALARY < (
        SELECT
            AVG(SALARY)
        FROM
            EMPLOYEES
    );

-- ��ü ������ ��ձ޿����� 2�� �̻��� �޿��� �޴� �������� ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    JOB_ID,
    SALARY
FROM
    EMPLOYEES
WHERE
    SALARY> (
        SELECT
            AVG(SALARY)*2
        FROM
            EMPLOYEES
    );

-- 80�� �μ��� �ٹ��ϰ�, 80�� �μ��� �����޿��� ������ �޿��� �޴� ������ ���̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    JOB_ID,
    SALARY
FROM
    EMPLOYEES
WHERE
    DEPARTMENT_ID = 80
    AND SALARY = (
        SELECT
            MIN(SALARY)
        FROM
            EMPLOYEES
        WHERE
            DEPARTMENT_ID = 80
    );

-- �������� �޿������ ����ؼ� �޿���޺� �������� ��ȸ�ؼ� �޿����, �������� ����ϱ�
SELECT
    G.GRADE,
    COUNT(*)
FROM
    EMPLOYEES     E,
    SALARY_GRADES G
WHERE
    E.SALARY >= G.MIN_SALARY
    AND E.SALARY <= G.MAX_SALARY
GROUP BY
    G.GRADE;

-- 'Neena'�� ���� �ؿ� �Ի��� �������� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    HIRE_DATE
FROM
    EMPLOYEES
WHERE
    TO_CHAR(HIRE_DATE, 'YYYY') = (
        SELECT
            TO_CHAR(HIRE_DATE, 'YYYY')
        FROM
            EMPLOYEES
        WHERE
            FIRST_NAME = 'Neena'
    );