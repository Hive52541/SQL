/*
PL/SQL
    Procedural LANGUAGE extension to  SQL�� ���ڴ�.
    * Procedural LANGUAGE�� ������ ���α׷��� ���
     ������ ���α׷��� ���� ��������, ����ó��(IF), �ݺ�ó��(LOOP, WHILE, FOR)���� �����Ѵ�.
    * SQL�� ������ ���α׷� ���� Ȯ���Ų ���̴�.

    Ư¡
        * DBMS���ο��� ����Ǵ� ������ ���α׷��̴�.
        * BEGIN/END�� ��ϱ����� ���α׷��� ���ȭ�Ѵ�.
        * ���ǹ�, �ݺ����� ����ؼ� �������� SQL �۾��� ������ �� �ִ�.
    ����
        ���ν���(PROCEDURAL)
            * Ư�� �۾��� �����ϴ� �̸��� �ִ� PL/SQL ����̴�.
            * �Ű������� ���� �� �ְ�, ������ �� �ִ� PL/SQL ����̴�.
            * ���Ӽ��� ������ �۾� Ȥ�� ����ܰ谡 ������ Ʈ�����(SQL�۾�)�� �����ϱ� ���ؼ� ����Ѵ�.
        �Լ�(FUNCTION)
            * ���ν����� �����ϰ� PL/SQL�� �̿��ؼ� �Ϸ��� SQL �۾��� ó���ϰ�, �� ó������� 
              ���ϰ����� �����ϴ� PL/SQL ���α׷��̴�. 

        Ʈ����(TRIGGER)
            *Ư�� ���̺� �������� �߰�/����/���� ���� �����ͺ��� �̺�Ʈ�� �߻��ϸ�
                DBMS���� �ڵ����� ����ǵ��� PL/SQL�� ������ ���α׷��̴�.


*/

/*
���ν���

����
    CREATE OR REPLACE PROCEDURAL ���ν�����
    (
        ������ IN ������Ÿ��,
        ������ IN ������Ÿ��,
        ������ OUT ������Ÿ��,...
    ) IS
    --��������
    ������ ������Ÿ��;
    ������ ������Ÿ�� : =��;

    BEGIN
        SQL ���� Ȥ�� PL/SQL �����
        ...

    END;        
*/

CREATE OR REPLACE PROCEDURAL TEST
(NO IN NUMBER,
AMOUNT IN NUMBER,
MESSAGE OUT VARCHAR2 )
IS
BEGIN
MESSAGE :='����Ϸ�'
END;

DECLARE
    STR    VARCHAR2(100);
    TEST   (10, 1000, STR);
 --STR�� ���ν����� ������ ���� ���޹��� �� �ִ�.
 --DBMS_OUTPUT.PUT_LINE(STR);
END;
 /*

���� ���̵� ���޹޾Ƽ� ������ �޿��� �λ��Ű�� ���ν��� �ۼ��ϱ�
�λ����� �޿��� ���� �ٸ���.
    20000�̻� 10%�λ�
    10000�̻� 15%�λ�
    �� �ܴ�   20%�λ�

    PUBLIC VOID UPDATESALARY(INT EMPID)(
        EMPLOYEES EMP = EMPREPOSITORY.GETEMPLOTEEBYID(EMPID);
        DOUBLE INCREASERATE = 0.0;

        IF(SALARY > = 20000)(
            INCREASERATE = 0.1;

        )ELSE IF(SALARY >= 10000)(
            INCREASERATE = 0.15;
        )ELSE(
            INCREASERATE = 0.20;
        )
        DOUBLE INCREASESALARY = SALARY*INCREASERATE;

        emp.setSalary(SALARY + INCREASESALARY);
        EMPREPOSITORY.UPDATEEMPLOYEE(EMP);
    ) 

*/
 CREATE OR REPLACE PROCEDURAL UPDATE_SALARY
 --�Ű����� �����ϱ�
(I_EMP_ID IN NUMBER) IS
 --���� �����ϱ�
    V_EMP_SALARY EMPLOYEES.SALARY%TYPE: --EMPLOYEES���̺��� SALARY �÷��� Ÿ�԰� ������ Ÿ��
    V_INCREASE_RATE NUMBER(3, 2);
BEGIN
 --�Ű������� ���޹��� �������̵�� ������ �޿��� ��ȸ�ϰ�, ������ �����ϱ�
    SELECT
        SALARY INTO V_EMP_SALARY
    FROM
        EMPLOYEES
    WHERE
        EMPLOYEE_ID=I_EMP_ID;
 --������ �޿��� ���� �λ�� �����ϰ� ������ �����ϱ�
    IF V_EMP_SALARY >= 2000 THEN
        V_INCREASE_RATE: =0.1;
    ELSE
        IF V_EMP_SALARY > 10000 THEN
            V_INCREASE_RATE:=15%
        ELSE
            V_INCREASE_RATE:=0.2;
        END IF;
 --�޿��� �λ��Ű��
        UPDATE EMPLOYEES
        SET
            SALARY=SALARY + TRUNC(
                SALARY*V_INCREASE_RATE
            )
        WHERE
            EMPLOYEE_ID= I_EMP_ID;
 --�����ͺ��̽��� ���������� �ݿ���Ű��
        COMMIT;
    END;

    EXCUTE UPDATE_SALARY(100);
 ---------------------------------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------------------------
    CREATE OR REPLACE NONEDITIONABLE PROCEDURE UPDATE_SALARY
 -- �Ű����� �����ϱ�
    (I_EMP_ID IN NUMBER) IS
 -- ���� �����ϱ�
    V_EMP_SALARY EMPLOYEES.SALARY%TYPE; -- EMPLOYEES���̺��� SALARY�÷��� Ÿ�԰� ������ Ÿ��
    V_INCREASE_RATE NUMBER(3, 2);
    BEGIN
 -- �Ű������� ���޹��� �������̵�� ������ �޿��� ��ȸ�ϰ�, ������ �����ϱ�
        SELECT
            SALARY INTO V_EMP_SALARY
        FROM
            EMPLOYEES
        WHERE
            EMPLOYEE_ID = I_EMP_ID;
 -- ������ �޿��� ���� �λ�� �����ϰ� ������ �����ϱ�
        IF V_EMP_SALARY >= 20000 THEN
            V_INCREASE_RATE := 0.1;
        ELSIF V_EMP_SALARY >= 10000 THEN
            V_INCREASE_RATE := 0.15;
        ELSE
            V_INCREASE_RATE := 0.2;
        END IF;

        DBMS_OUTPUT.PUT_LINE('�λ��'
                             || V_INCREASE_RATE);
 -- �޿��� �λ��Ű��
        UPDATE EMPLOYEES
        SET
            SALARY = SALARY + TRUNC(
                SALARY*V_INCREASE_RATE
            )
        WHERE
            EMPLOYEE_ID = I_EMP_ID;
 -- �����ͺ��̽��� ���������� �ݿ���Ű��
        COMMIT;
    END;

    EXCUTE UPDATE_SALARY(101);