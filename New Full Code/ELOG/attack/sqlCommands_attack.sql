
-- Create 2 users (SPG, BTSPGSUP)

/*
Tables
1. SCM_ORDER   (table1.sql)
2. SCM_CFP     (table2.sql)
3. Product_master_tab (table3.sql)
4. USER_TAB    (table4.sql)
5. emp_tab     (table5.sql)
compile these tables in SPG schema.
*/
/*
Sequence
1. ORDERID_SEQ   (sequence.sql) 
compile sequence.sql in spg schema
*/

/*packages:

1. SQLATTACK_USERDETAILS.sql
2. SQLATTACK_WEBPAGE.sql
3. SECURE_PACKAGE.sql
compile these packages in SPG schema.
*/

-- execute the below commands in SPG Schema

grant execute on SQLATTACK_USERDETAILS to btspgsup;
grant execute on SQLATTACK_WEBPAGE to btspgsup;
grant execute on SECURE_PACKAGE to btspgsup;
grant insert,update,delete,select on scm_order to btspgsup;
grant insert,update,delete,select on scm_cfp to btspgsup;
grant select,insert,update,delete on user_tab to btspgsup;
grant select,insert,update,delete on emp_tab to btspgsup;
grant execute on SQLATTACK_USERDETAILS to anonymous;
grant execute on SQLATTACK_WEBPAGE to anonymous;
grant execute on SECURE_PACKAGE to anonymous;
--------------------------------------------------------
-- ****** log off spg schema  *******

-- log in to BTSPGSUP Schema 
-- In BTSPGSUP create the below synonyms:

create synonym SQLATTACK_WEBPAGE for spg.SQLATTACK_WEBPAGE;
create synonym SQLATTACK_USERDETAILS for spg.SQLATTACK_USERDETAILS;
create synonym scm_order for spg.scm_order;
create synonym scm_cfp for spg.scm_cfp;
create synonym SECURE_PACKAGE for spg.SECURE_PACKAGE;

-- ****** log off BTSPGSUP schema  *******

-- log in to SYSTEM Schema 
-- SYSTEM USER
create or replace function flows_020100.wwv_flow_epg_include_mod_local (
    procedure_name in varchar2
) return boolean
is begin  
return true; 
end wwv_flow_epg_include_mod_local;
/
--------

grant execute on flows_020100.wwv_flow_epg_include_mod_local to anonymous;
-------------


--and access the application from btspgsup ……..
localhost:8080/apex/btspgsup.SQLATTACK_WEBPAGE.indexpage



------------------------------------------------

Manager will access the application from spg schema……….
             

/*

 select * from all_source where type='FUNCTION' and lower(name)='wwv_flow_epg_include_mod_local';
 
 desc all_source ;
 
 
 grant execute on flows_020100.wwv_flow_epg_include_mod_local to anonymous;
 
 
 
 grant execute on SQLATTACK_WEBPAGE to anonymous;
 
 grant execute on SQLATTACK_USERDETAILS to anonymous;
  
create synonym SQLATTACK_WEBPAGE for murali.SQLATTACK_WEBPAGE;

create synonym SQLATTACK_USERDETAILS for murali.SQLATTACK_USERDETAILS;
 
 */
