/*

���������� ����

-������ ��������
    �������� �������� �� ���� ȹ��ȴ�.(1�� 1�� �����͸� ��ȯ�ϴ� ��������)
    ������
    =,!=,>,>=,<,<=,IN , NOT IN


-������ ��������
    �������� �������� ���� ���� ȹ��ȴ�.(N�� 1�� �����͸� ��ȯ�ϴ� ��������)
    ������
    IN, NOT IN, > ANY, >ALL, >=ANY, >=ALL
                < ANY, <ALL, <=ANY, <=ALL

-���߿� ��������
    �������� �������� ���� ���� �÷����� ȹ��ȴ�(N��N�� �����͸� ��ȯ�ϴ� ��������)
    ������
        IN  , NOT IN

*/


--������ ��������
--101 �� ������� ����޴� ���� ���� ��翡�� �����ϴ� ������ ���̵�, �̸��� ��ȸ�ϱ�
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

--101�� ������� �޿��� ���� �޴� ������ �Ɵ�, �̸�, �޿��� ��ȸ�ϱ�
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

--'Steven'�� ���� �ؿ� �Ի��� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
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

--60�� �μ��� �Ҽӵ� �������� �޿����� �޿��� ���� �ݴ� �������� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
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

--���߿� ����
--�� �μ��� ���� �޿��� �޴� ������ ���̵�,�̸� �޿��� ��ȸ�ϱ�
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
��ȣ���� ��������
    ������������ ���������� �÷��� �����ϸ� ��ȣ���� ���������� �ȴ�.
    ����
        SELECT OUTER.COLUMN, OUTER.COLUMN
        FROM  TABLE OUTER
        WHERE OUTER,COLUMN ������(SELECT INNER.COLUMN
        FROM TABLE INNER
        WHERE INNER.COLUMN = OUTER.COLUMN)

�Ϲݼ��������� ��ȣ�������������� �ٸ� ��
    ���������� ������������ ���� ����ȴ�.
    ���������� �� �ѹ� ����ȴ�.

    ��ȣ���� ���������� �������������� ó���Ǵ� �� �࿡ ���ؼ� �ѹ��� ����ȴ�.
    */

--������ �߿��� �ڽ��� �Ҽӵ� �μ��� ��ձ޿����� �޿��� ���� �޴� ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
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
--100           ȫ�浿      10                  1000            ���������� X.DEPARTMENT_ID�� 10���� �����ȴ�.
--101           ������      10                  2000            ���������� X.DEPARTMENT_ID�� 10���� �����ȴ�.
--102           ������      20                  2000            ���������� X.DEPARTMENT_ID�� 20���� �����ȴ�.
--103           �̼���      20                  4000            ���������� X.DEPARTMENT_ID�� 20���� �����ȴ�.
--104           ������      20                  1000            ���������� X.DEPARTMENT_ID�� 20���� �����ȴ�.
---------------------------------------------------------------------------------------

-- �μ����̵�, �μ��̸�, �ش� �μ��� �Ҽӵ� �������� ��ȸ�ϱ�
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

--���� ���̵�, �����̸�, ����� ���̵�, ����� �̸��� ��ȸ�ϱ�
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