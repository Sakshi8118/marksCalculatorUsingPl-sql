SET SERVEROUTPUT ON;

DECLARE
    student_name VARCHAR2(50) := '&Enter_Student_Name';

    python_marks NUMBER := &Enter_Python_Marks;
    maths_marks  NUMBER := &Enter_Maths_Marks;
    dbms_marks   NUMBER := &Enter_DBMS_Marks;
    java_marks   NUMBER := &Enter_Java_Marks;
    daa_marks    NUMBER := &Enter_DAA_Marks;

    total_marks NUMBER;
    percentage NUMBER;
    grade VARCHAR2(2);
    result_status VARCHAR2(10);

BEGIN
    -- Validate marks
    IF python_marks NOT BETWEEN 0 AND 100
       OR maths_marks NOT BETWEEN 0 AND 100
       OR dbms_marks NOT BETWEEN 0 AND 100
       OR java_marks NOT BETWEEN 0 AND 100
       OR daa_marks NOT BETWEEN 0 AND 100 THEN

        DBMS_OUTPUT.PUT_LINE(
            'Error: Marks must be between 0 and 100.'
        );

    ELSE
        -- Calculate total and percentage
        total_marks := python_marks + maths_marks
                     + dbms_marks + java_marks + daa_marks;

        percentage := total_marks / 5;

        -- Calculate grade
        IF percentage >= 90 THEN
            grade := 'A+';
        ELSIF percentage >= 80 THEN
            grade := 'A';
        ELSIF percentage >= 70 THEN
            grade := 'B';
        ELSIF percentage >= 60 THEN
            grade := 'C';
        ELSIF percentage >= 40 THEN
            grade := 'D';
        ELSE
            grade := 'F';
        END IF;

        -- Check pass or fail
        IF python_marks >= 40
           AND maths_marks >= 40
           AND dbms_marks >= 40
           AND java_marks >= 40
           AND daa_marks >= 40 THEN
            result_status := 'PASS';
        ELSE
            result_status := 'FAIL';
        END IF;

        -- Display result
        DBMS_OUTPUT.PUT_LINE('===== STUDENT MARKS REPORT =====');
        DBMS_OUTPUT.PUT_LINE('Student Name: ' || student_name);
        DBMS_OUTPUT.PUT_LINE('Python Marks: ' || python_marks);
        DBMS_OUTPUT.PUT_LINE('Maths Marks: ' || maths_marks);
        DBMS_OUTPUT.PUT_LINE('DBMS Marks: ' || dbms_marks);
        DBMS_OUTPUT.PUT_LINE('Java Marks: ' || java_marks);
        DBMS_OUTPUT.PUT_LINE('DAA Marks: ' || daa_marks);
        DBMS_OUTPUT.PUT_LINE('Total Marks: ' || total_marks || '/500');
        DBMS_OUTPUT.PUT_LINE('Percentage: ' || percentage || '%');
        DBMS_OUTPUT.PUT_LINE('Grade: ' || grade);
        DBMS_OUTPUT.PUT_LINE('Result: ' || result_status);
    END IF;
END;
/
