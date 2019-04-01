CREATE OR REPLACE PACKAGE crypto AS 

  TYPE t_array IS TABLE OF VARCHAR2(2000) INDEX BY BINARY_INTEGER; 
  my_spl_char CHAR(1) := '|'; 
  
  FUNCTION encrypt (p_in_str IN VARCHAR2) RETURN VARCHAR2;
  FUNCTION decrypt (p_in_str IN VARCHAR2) RETURN VARCHAR2;  
END crypto;
/


CREATE OR REPLACE PACKAGE BODY crypto AS
    
    PROCEDURE p_get_array (p_in_str IN VARCHAR2, p_array OUT t_array);
    
    FUNCTION encrypt (p_in_str IN VARCHAR2) RETURN VARCHAR2 IS 
        my_char         CHAR(1);
        my_out_string   VARCHAR2(300);
    BEGIN
        FOR I IN 1 .. LENGTH(p_in_str)
        LOOP
            my_char := SUBSTR(p_in_str, I, 1);
            my_out_string := my_out_string || ASCII(my_char);
            
            IF I < LENGTH (p_in_str) THEN
                my_out_string := my_out_string || my_spl_char;
            END IF;
        END LOOP;
        RETURN my_out_string;
    END;
    
    FUNCTION decrypt (p_in_str IN VARCHAR2) RETURN VARCHAR2 IS 
        my_arr          t_array;
        my_out_string   VARCHAR2(300);
    BEGIN
        p_get_array(p_in_str, my_arr);
                
        FOR I IN 0 .. (my_arr.COUNT-1) 
        LOOP
            my_out_string := my_out_string || CHR(TO_NUMBER(my_arr(I)));
        END LOOP;
        
        my_out_string := REPLACE(my_out_string, '\&', '&');
        
        RETURN my_out_string; 
    END;

    PROCEDURE p_get_array (p_in_str IN VARCHAR2, p_array OUT t_array) IS
        my_array t_array;
    BEGIN
        FOR current_row IN (
            WITH test AS (SELECT p_in_str FROM DUAL)
            SELECT REGEXP_SUBSTR(p_in_str, '[^'|| my_spl_char || ']+', 1, ROWNUM) SPLIT
        FROM test
        CONNECT BY LEVEL <= LENGTH (REGEXP_REPLACE(p_in_str, '[^' || my_spl_char || ']+'))  + 1)
        LOOP
        my_array(my_array.COUNT) := current_row.SPLIT;
        END LOOP;
        
        p_array := my_array;
    END;
    
END crypto; 
/