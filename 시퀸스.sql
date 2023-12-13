/*
������ 
    �Ϸù�ȣ�� �����ϴ� ����Ŭ��ü��.


    �����ϱ�
        CREATE SEQUENCE ��������;
    �����ϱ�
        DROP SEQUENCE ��������;
    �����ϱ�
        ALTER SEQUENCE ��������;

    ������ ���� ����
        CREATE SEQUENCE ��������
        *���۰�:1, ����ġ:1, �ּڰ�:1 �ִ밪:999999999999999999999999
        *ĳ�û�����: 20             

        CREATE SEQUENCE ��������
            START WITH 1000
            INCREMENT BY 100
            NOCACHE;
            *���۰�:1000, ����ġ:100 �ּҰ�:1 �ִ밪:99999999999999999999999999999999999
            *ĳ�� ������� ����
*/

--���ο� ������ �����ϱ�
CREATE SEQUENCE BOOKS_SEQ;

--�� �Ϸù�ȣ ��ȸ�ϱ�

SELECT
    BOOKS_SEQ.NEXTVAL
FROM
    DUAL;

SELECT
    BOOKS_SEQ.CURRVAL
FROM
    DUAL;

--INSERT �������� ������ Ȱ���ϱ�
INSERT INTO SAMPLE_BOOKS (
    BOOK_NO,
    BOOK_TITLE,
    BOOK_WRITER,
    BOOK_PRICE
) VALUES(
    BOOKS_SEQ.NEXTVAL,
    '������ Ȱ���ϱ�',
    'ȫ�浿',
    10000
);

-- INSERT INTO SAMPLE_BOOKS (
--     BOOK_NO,
--     BOOK_TITLE,
--     BOOK_WRITER,
--     BOOK_PRICE,
--     BOOK_IMAGE_NAME
-- ) VALUES (
--     BOOKS_SEQ.NEXTVAL,
--     '�̰��� �ڹٴ�',
--     '�ſ��',
--     10000,
--     BOOKS_SEQ.CURRVAL
--     || '.png'
-- );

/*

NOT NULL ��������
        -�÷������� ���������� �����Ѵ�.
        -�ش� �÷��� NULL���� ���� �� ����.
        -�Է����� �ʼ��Է°��� �ش�Ǵ� �׸��� NOT NULL ���������� ����� �׸��̴�.


CREATE TABLE USERS(
USER_NO
USER_ID         VARHCAR2(255) NOT NULL, --�ʼ��Է°�
USER_PASSWORD   VARHCAR2(255) NOT NULL, --�ʼ��Է°�
USER_NAME       VARHCAR2(255) NOT NULL, --�ʼ��Է°�
USER_EMAIL      VARHCAR2(255)           --�ʼ��Է°� �ƴ�

)

*ȸ�����̵�, ȸ����й�ȣ, ȸ���̸��� NULL���� ������� �ʴ´�.


UNIQUE ��������
        -�÷����� Ȥ�� 1�� �̻��� �÷��� ���ļ� ���������� ������ �� �ִ�.
        -�ش� �÷��� ���̺� ��ü�� ���ؼ� ������ ���� ������ �Ѵ�.
        -NOT NULL ���������� �������� �ʾҴٸ� NULL���� ������ ���� �������.
        -�Է������� �ߺ��˻縦 �ϴ� �׸��� UNIQUE ���������� ����� �׸��̴�.

CREATE TABLE USERS(
USER_NO
USER_ID         VARHCAR2(255) UNIQUE, 
USER_PASSWORD   VARHCAR2(255) , 
USER_NAME       VARHCAR2(255) , 
USER_EMAIL      VARHCAR2(255) UNIQUE,
...

)

CREATE TABLE ������û��Ȳ(
    ��û��ȣ        NUMBER(8),
    ��û�⵵        NUMBER(4),
    �бⱸ��        CHAR(1),     --1:1�б�, 2:2�б�, S:���������б�, W:�ܿ�����б�
    ������ȣ        CHAR(4),
    �л���ȣ        NUMBER(6),

    UNIQUE(��û�⵵, �бⱸ��, ������ȣ, �л���ȣ)

)
*��û�⵵,�бⱸ��,������ȣ,�л���ȣ�� ��� ������ ���� ������ �ٸ� ���� ������ �� ����.

PRIMARY KEY ��������
        -�÷����� Ȥ�� 1�� �̻��� �÷��� ���ļ� ���������� ������ �� �ִ�
        -���̺�� �ϳ��� ������ �� �ִ�.
        -PRIMARY KEY ���������� ����� �÷��� NULL���� ������� ������, ������ ���� ������ �Ѵ�.
        -���̺��� ���� ��ǥ�ϴ� �÷��� �����ϴ� ���������̴�.
        -PRIMARY KEY ���������� ����� �÷��� ���� ���������� ȹ���� �Ϸù�ȣ�� ����ϴ� ���� �����̴�.
CREATE TABLE USERS(
    USER_NO          NUMBER(10) PRIMARY KEY,
    USER_ID          VARVHAR(255),
    USER_PASSWORD    VARVHAR(255),
    USER_NAME        VARVHAR(255),
    USER_EMAIL       VARVHAR(255),
    ...
)        

FOREIGN KEY ��������
        -�÷������� ���������� �����Ѵ�.
        -FOREIGN KEY ���������� ����� �÷��� ���� �ٸ� ���̺� Ȥ�� ���� ���̺��� Ư���÷��� �� �߿� �ϳ����� �Ѵ�.

CREATE TABLE EMPLOYEES(
    EMP_NO
    EMP_NAME
    DEPT_NO         NUMBER(4)     REFERENCES DEPARTMENTS(DEPT_NO)  --������ �ҼӺμ� ��ȣ
)        
* EMPLOYEES �� DEPT_NO �÷��� DEPARTMENTS�� DEPT_NO �÷��� ���� �����ϴ� �÷��̴�.
* EMPLOYEES �� DEPT_NO �÷����� �����ϰ� �ִ� �÷��� ������ �ִ� ���� ���ȴ�.
* EMPLOYEES �� DEPT_NO �÷����� NOT NULL ���������� ����Ǿ� �������� ��� NULL���� �����ϴ� ���� �������.
* FOREIGN KEY ������������ �����Ǵ� �÷��� �ݵ�� PRIMARY KEY �������� Ȥ�� UNIQUE ���������� ����Ǿ� �־�� �Ѵ�.





CREATE TABLE EMPLOYEES (

    EMPLOYEE_ID DELETE      NUMBER(4)       PRIMARY KEY,
    FIRST_NAME              VARCHAR2(100)
    LAST_NAME               VARCHAR2(100)
    EMAIL                   VARCHAR2(100)   UNIQUE,
    PHONE_NUMBER            VARCHAR2(100)
    HIRE_DATE               DATE
    JOB_ID                  VARCHAR2(100)   REFERENCES JOBS(JOB_ID),
    SALARY                  NUMBER(8, 2)
    COMMISSION_PCT          NUMBER(3, 2)
    MANAGER_ID              NUMBER(4)       REFERENCES  EMPLOYEES(EMPLOYEE_ID),
    DEPARTMENT_ID           NUMBER(4)       REFERENCES  DEPARTMENTS(DEPARTMENT_ID)
)

CREATE TABLE DEPARTMENTS (

    DEPARTMENT_ID        NUMBER(4) PRIMARY KEY,
    DEPARTMENT_NAME      VARCHAR2(100)
    MANAGER_ID           NUMBER(4) REFERENCES  EMPLOYEES(EMPLOYEE_ID),
    LOCATION_ID          NUMBER(4) REFERENCES  LOCATIONS(LOCATION_ID)

)

CHECK ��������

        -�÷������� ���������� �����Ѵ�.
        -���õ� ���ǽ��� �����ϴ� ���� �÷��� ���尡���ϰ� �Ѵ�.

CREATE TABLE USERS (
    USER_ID
    USER_NAME
    USER_GENDER         CHAR(1)     CHECK(USER_GENDER IN('F','M')), --������ 'F'�� 'M'�� �����ϴ�.
    USER_AGE            NUMBER(3)   CHECK(USER_AGE >= 1 AND USER_AGE < 150),
)        





*/