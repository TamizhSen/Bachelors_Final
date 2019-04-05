
DECLARE
  l_source  VARCHAR2(32767);
  l_wrap    VARCHAR2(32767);
BEGIN
  l_source := 'create or replace package ATTACKFREE_PACKAGE is' ||

              'procedure signUp;' ||
              'procedure signupsuccess;' ||
              'procedure indexpage;' ||
              'procedure css;' ||
              'procedure loginPage;' ||
              'Procedure manager;' ||
              'procedure customer(customer_name varchar2 default null);' ||
              'procedure supplier;' ||
              'procedure logistics;' ||
              'procedure searchorder;' ||
              'procedure insertporductpage;' ||
              'end ATTACKFREE_PACKAGE;';

  l_wrap := SYS.DBMS_DDL.WRAP(ddl => l_source);
  execute immediate l_wrap;
  DBMS_OUTPUT.put_line(l_wrap);
END;


