/*

    ���̺��� ������ ��ȸ

    1. ������ ���̺��� ��� ��, ��� ���� ��ȸ�Ѵ�.
    SELECT *
    FROM ���̺��;
    
    2. ������ ���̺��� ��� ��, ������ ���� ��ȸ�ϱ�
    SELECT �÷���, �ķ���, �÷���, ...
    FROM ���̺��;

    3. SELECT������ ��Ģ������ ������ �� �ִ�.
    SELECT �÷���, ����.�÷���*�÷���... 
    FROM ���̺��;
    *��Ģ���꿡 ���Ǵ� �÷��� �ش� �÷��� ���� ���ڿ����Ѵ�.
    
    4. �÷���(Alias)��û �ο��ϱ�
    SELECT �÷��� AS ��Ī, �ķ��� AS ��Ī,... 
    
    SELECT �÷��� ��Ī, �÷��� ��Ī, �÷��� ��Ī,...
    FROM ���̺��;
    
    SELECT JOB_ID, MAX_SALARY, MIN_SALARY
*/

--���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�



SELECT
    *
FROM
    regions;


--���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�

SELECT
    *
FROM
    countries;

--���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT
    *
FROM
    jobs;

--�μ� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT
    *
FROM
    departments;

--���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT
    *
FROM
    employees;

--���� ���̺��� ���� ���̵�, �ּұ޿�, �ִ�޿� ��ȸ�ϱ� 
SELECT
    job_id,
    min_salary,
    max_salary
FROM
    jobs;

--���� ���̺��� �������̵�, ���� �̸�(FIRST_NAME), �޿��� ��ȸ�ϱ�
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees;

--������ ���̺��� ������ ���̵�, �ּ�, ���ø��� ��ȸ�ϱ�
SELECT
    location_id,
    street_address,
    city
FROM
    locations;

--���� ���̺��� ���� ���̵�, �����̸�, �޿�. ������ ��ȸ�ϱ�
--������ �޿�*12�� ����Ѵ�.
SELECT EXPLOYEE_ID, FIRST_NAME, SALART, SALARY*12
FROM EXPLOYEES

--���� ���̺��� �������̵�, �����̸�, �޿�, ������ ��ȸ�ϱ�
--������ �޿� *12�� �����Ѵ�
--������ ��Ī�� ANNUAL_SALARY��
SELECT  EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY *12 AS ANNUAL_SALAY
FROM ELPLOYEES;

--���� ���̺��� ��ǰ���̵�, �ְ�޿�, �����޿�, �ְ�޿��� �����޿��� ���̸� ��ȸ�ϱ� 
�ְ�޿��� �����޿��� ���̴� ALARY_GAP��Ī�� �ο��Ѵ�

SELECT JOB_ID, MAXSALAY, MIN_SALARY - MIN_SALARY As ANNUAL_SALARY
FROM
    explyees
    �������̺���
    ���߾��̵�.�ְ�޿�, �����޿�, �ְ�޿�

/*

������ ���͸��ϱ�
1. WHERE ���� ���ǽ��� �ۼ��ؼ� �ش� ���ǽ��� ������Ű�� �ุ ��ȸ�ϱ�
SELECT �÷���, �÷���, �÷��� ,...
FROM ���̺��
WHERE ���ǽ�;

2. WHERE ������ 2�� �̻��� ���ǽ����� �����͸� ���͸��� �� �ִ�.
2�� �̻��� ���ǽ��� �ۼ��� ���� AND, OR, NOT �� �����ڸ� ����Ѵ�.

SELECT �÷���, �÷���, �÷���, ...
FROM ���̺��
WHERE ���ǽ�1 AND ���ǽ� 2;
*���ǽ� 1�� ���ǽ� 2�� ��� TRUE �� �����Ǵ� �ุ ��ȸ�ȴ�

SELECT �÷���, �÷���, �÷���, ...
FROM ���̺��
WHERE ���ǽ�1 OR ���ǽ� 2;
*���ǽ� 1�� ���ǽ� 2�߿� �ϳ��� TRUE�� �����Ǵ� �ุ ��ȸ�ȴ�

SELECT �÷���, �÷���, �÷���, ...
FROM ���̺��
WHERE ���ǽ�1 AND (���ǽ� 2 OR ���ǽ�3);
AND �����ڿ� OR �����ڸ� ���� ����� ���� OR ������� ��ȣ�� ���´�.

*/

--���� ���̺��� �ҼӺμ� ���̵� 60���� ������ ���̵�, �̸�, �������̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM  EMEPLOYEES
WHERE DEPARTMENET_ID =60;

--���� ���̺��� �޿��� 10000�޷� �̻� �޴� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000;

--���� ���̺��� �������̵� 'SA_MAN'�� ������ ���̵�, �̸�, �޿�, �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME,SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'SA_MAN'

--���� ���̺��� �޿��� 5000 ~10000 ������ ���ϴ� ���� ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
--�޿��� 5000�̻�, 10000���Ϸ� �޴� ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME,JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000 AND SALARY <= 10000;

--���� ���̺��� 10�� �μ�, 20�� �μ�, 30�� �μ����� �ٹ��ϴ� ���� ���̵�, �̸� ,�μ� ���̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID =20 OR DEPARTMENT_ID = 30;