-- =================================================================
-- Project: Oracle PL/SQL Code Review Standards
-- Focus: Performance, Bulk Processing, and Error Handling
-- =================================================================

CREATE OR REPLACE PACKAGE emp_management_pkg AS
    -- Custom record and table types for bulk operations
    TYPE t_emp_id_list IS TABLE OF employees.employee_id%TYPE;
    
    -- Procedure to update employee department in bulk
    PROCEDURE update_dept_bulk(
        p_emp_ids      IN  t_emp_id_list,
        p_new_dept_id  IN  employees.department_id%TYPE,
        p_updated_cnt  OUT NUMBER
    );
END emp_management_pkg;
/

CREATE OR REPLACE PACKAGE BODY emp_management_pkg AS

    PROCEDURE update_dept_bulk(
        p_emp_ids      IN  t_emp_id_list,
        p_new_dept_id  IN  employees.department_id%TYPE,
        p_updated_cnt  OUT NUMBER
    ) IS
    BEGIN
        -- Best Practice: Use FORALL for bulk processing instead of standard loops
        FORALL i IN 1..p_emp_ids.COUNT
            UPDATE employees
               SET department_id = p_new_dept_id,
                   last_updated = SYSDATE
             WHERE employee_id = p_emp_ids(i);

        p_updated_cnt := SQL%ROWCOUNT;

    EXCEPTION
        WHEN OTHERS THEN
            -- Best Practice: Log error context appropriately
            DBMS_OUTPUT.PUT_LINE('Error in update_dept_bulk: ' || SQLERRM);
            RAISE;
    END update_dept_bulk;

END emp_management_pkg;
/
