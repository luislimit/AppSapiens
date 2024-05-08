ALTER session SET "_ORACLE_SCRIPT"=true;

CREATE USER hr
    IDENTIFIED BY hr
    TEMPORARY TABLESPACE temp
    quota 100M on SYSTEM;
    
ALTER USER hr ACCOUNT UNLOCK;

ALTER USER hr quota unlimited on users;

GRANT CREATE SESSION TO hr;

GRANT CREATE TABLE TO hr;

GRANT CREATE SEQUENCE TO hr;

GRANT CONNECT TO hr;

GRANT RESOURCE TO hr;

GRANT CREATE PROCEDURE TO hr;

GRANT CREATE TRIGGER TO hr;

GRANT CREATE VIEW TO hr;

CREATE OR REPLACE PROCEDURE createUser(
	pi_username IN NVARCHAR2,
	pi_password IN NVARCHAR2) IS
	
	user_name NVARCHAR2(20)  	:= pi_username;
	pwd NVARCHAR2(20) 		:= pi_password;
   	li_count       INTEGER	:= 0;
   	lv_stmt   VARCHAR2 (1000);
BEGIN
   	SELECT COUNT (1)
     	INTO li_count
     	FROM dba_users
   	WHERE username = UPPER ( user_name );

   	IF li_count != 0
   	THEN
		lv_stmt := 'DROP USER '|| user_name || ' CASCADE';      	
		EXECUTE IMMEDIATE ( lv_stmt );
   	END IF;
        lv_stmt := 'CREATE USER ' || user_name || ' IDENTIFIED BY ' || pwd || ' DEFAULT TABLESPACE SYSTEM';
	DBMS_OUTPUT.put_line(lv_stmt);

	EXECUTE IMMEDIATE ( lv_stmt ); 
                                                
        -- ****** Object: Roles for user ******
	lv_stmt := 'GRANT RESOURCE, CONNECT TO ' || user_name;

	EXECUTE IMMEDIATE ( lv_stmt );
                                                
        -- ****** Object: System privileges for user ******
	lv_stmt := 'GRANT ALTER SESSION,
	       	    	  CREATE ANY TABLE,
	       	    	  CREATE CLUSTER,
	            	  CREATE DATABASE LINK,
	            	  CREATE MATERIALIZED VIEW,
	       		  CREATE SYNONYM,
	       		  CREATE TABLE,
	       		  CREATE VIEW,
	       		  CREATE SESSION,
	       		  UNLIMITED TABLESPACE
	       	    TO ' || user_name;

        EXECUTE IMMEDIATE ( lv_stmt );
        
	COMMIT;
END createUser;
/
