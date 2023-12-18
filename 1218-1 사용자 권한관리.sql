/*
����ڿ� ���� ����

����
    Ư�� SQL���� ������ �� �ִ� �Ǹ�
������ ����
    �ý��۱���
        �����ͺ��̽��� ������ �� �� �ִ� ����
        �����ͺ��̽� �����ڸ� �ý��۱����� �ο�/ȸ���� �� �ִ�.
    ��ü����    
        �����ͺ��̽� ��ü�� ������ ��ȸ/������ �� �ִ� ����
        �����ͺ��̽� ��ü�� �����ϰ� �ִ� ����ڰ� �ٸ� ����ڿ��� ��ü������ �ο�/ȸ���� �� �ִ�.

��(Role)
    ����ڿ��� �ο��� �� �ִ� ���� ������ �ϳ��� ��� �׷�ȭ�ϰ� �̸��� �ο��� ���̴�.
    ���� ����ϸ� ������ �ο�, ȸ��, ���������� ��������.
    ��ǥ���� ��
    CONNECT ��
        ����Ŭ �����ͺ��̽��� ������ �� �ִ� ����(CREATE SESSION �ý��۱���)�� �����ϰ� �ִ� ���̴�.
    RESOURCE ��
        �����ͺ��̽� ��ü�� ����/����/������ �� �ִ� ������ �����ϰ� �ִ� ���̴�.
        �Ϲ������� ���� ���� ���Ǵ� �ý��۱����� �����ϰ� �ִ� ���̴�.
        *�Ϲݻ���ڴ� CONNECT��, RESOURCE���� �����Ѵ�.
    DBA ��   
        �����ͺ��̽��� �����ϴ� �ý��� ������ ��κ� �����ϰ� �ִ� ���̴�.
        

������ �ο��� ȸ��
    �ý��� ������ �ο�
        GRANT �ý��۱���, �ý��۱���, ...
        TO ����ڸ�;

        GRNT ��, ��,...
        TO ����ڸ�;
    �ý��� ������ ȸ��
        REMOVE �ý��۱���, ��,...
        FROM ����ڸ�;

    ��ü ������ �ο�
        GRANT ��ü���� (�÷���, �÷���, ...)
        ON ��ü��
        TO ����ڸ�;               

    ��ü ������ ȸ��
        REMOVE ��ü����, ��ü����, ...
        ON ��ü��
        FROM ����ڸ�;    


����� ����
    -����� ����
        CREATE USER ����ڸ� INDENTIFIED BY ��й�ȣ;
        * ����ڸ��� ��ҹ��ڸ� �������� �ʴ´�.
        * ��й�ȣ�� ��ҹ��ڸ� �����Ѵ�.
    -����� ����
        DROP USER ����ڸ�;
    -����� ��й�ȣ ����
        ALTER USER ����ڸ� INDENTIFIED BY ����й�ȣ;
    -���Ѻο�
    -����ȸ��

*/

--����� �����ϱ�
/*
    ORACLE 12c�������� ����ڸ� c##�� ������ ������ ������ �߻��� �� �ִ�.
    _ORACLE_SCRIPT�� TRUE�� �����ϸ� c##�� ������ �ʰ� ����ڸ� ���� �� �� �ִ�.
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER HTA IDENTIFIED BY zxcv1234;

--HTA ����ڿ���

/*
��Ű��(SCHEMA)
    * Ư�� ����ڿ� ����� �����ͺ��̽� ��ü (���̺�, ��, ������, �ε��� ���� �����ͺ��̽� ��ü�� ����)
    * �����ͺ��̽� ��ü�� ��κ� ����ڰ� �����ϰ� �ֱ� ������ ������� �̸��� ������ �̸��� ���´�.
    * �ٸ� ����ڰ� �����ϰ� �ִ� �����ͺ��̽� ��ü�� ������ �� ���� �ݵ�� ��Ű���� ����ؾ� �Ѵ�.

*/


--HTA���� ��ü������ �ο��� HR�� EMPLOYEES ���̺� ��ȸ�ϱ�

SELECT
    *
FROM
    HR.EMPLOYEES;

--HTA ����ڿ��� ��ü ���� �ο��ϱ�
GRANT SELECT
ON EMPLOYEES
TO HTA;

--HTA ����ڿ��� �ο��� ��ü ���� ȸ���ϱ�
REMOVE SELECT
ON EMPLOYEES
FROM HTA;

-- GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SEQUENCE
-- TO HTA;

-- GRANT CONNECT, RESOURCE
-- TO HTA;


--Ư�� ����ڿ��� EMPLOYEES��ü�� ���� ���� ���� ��ü ������ �ο��ϱ�
GRANT SELECT, INSERT, UPDATE, DELETE
ON EMPLOYEES
TO HTA;

--Ư�� ����ڿ��� EMPLOYEES��ü�� ���� ��� ��ü ������ �ο��ϱ�
GRANT ALL PRIVILEGES
ON EMPLOYEES
TO HTA;

--��� ����ڿ��� EMPLOYEES��ü�� ���� ��ü������ �ο��ϱ�
GRANT SELECT
ON EMPLOYEES
TO PUBLIC;

--WITH GRANT OPTION�� ����ϸ� SELECT ������ �ο����� HTA�� �ٸ� ����ڿ��� SELECT������ �ο��� �� �ִ�.
GRANT SELECT
ON EMPLOYEES
TO HTA
WITH GRANT OPTION;

/*
�ó��(SYNONYM:���Ǿ�)
    �ó���� �����ͺ��̽� ��ü(���̺�, ��, ������ ��)�� ���� ��ü�̸�(ALias)�� ���Ѵ�.

�ó���� ����ϴ� ����
    �ó���� �ٸ� ������ ��ü�� ������ �� ���� ����Ѵ�.
    ��ü�� �� �̸��� ����ϱ� ���� ª�� �̸����� �ó���� �����ϸ� SQL �ڵ��� �ܼ�ȭ�� �� �ִ�.
    �ó���� ����ϸ� ����ڰ� �����ϰ� �ִ� ��ü�� ���� ������, �̸��� ���� �� �ִ�.

�ó�� �����ϱ�
    CREATE [PUBLIC] SYSNONYM �ó���̸�
    FOR �����ͺ��̽� ��ü; 

* PUBLIC : ��� ����ڰ� ���� ������ �ó���� �����Ѵ�.

*/
--HR ������ EMPLOYEES ���̺��� HTA ����ϴ� ���
/*
    HR �������� �����ؼ� EMPLOYEES ���̺� ���� ��ü������ HTA�� �ο��ϱ�
    GRANT SELECT, INSERT, UPDATE, DELETE
    ON EMPLOYEES
    TO HTA;

HTA �������� �����ؼ� �ó���� �����ϱ�
    CREATE SYNONYM EMP FOR HR.EMPLOYEES;


HTA �������� �ó���� �̿��ؼ� �����ϱ�
    SELECT*
    FROM EMP;        
*/


-- --HTA�������� �����ؼ� EMPLOYEES ��ȸ�ϱ�
-- SELECT *
-- FROM HR.EMPLOYEES;
-- --HTA �������� �����ؼ� �ó�� �����ϱ�
-- CREATE SYSNONYM EMP
-- FOR HR.EMPLOYEES;


--HR.EMPLOYEES ���̺��� �����ϴ� �ó�� �����ϱ�
CREATE SYSNONYM EMP
FOR HR.EMPLOYEES;

SELECT *
FROM HR.EMPLOYEES;

--�ó���� �̿��� SQL����
SELECT *
FROM EMP;