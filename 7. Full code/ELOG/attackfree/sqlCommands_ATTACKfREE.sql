


/*
login as SPG user

compile the below packages in SPG schema.
packages:
1. elog_userdetails.sql
2. elog_webpage.sql
3. ATTACKFREE_PACKAGE.sql
*/

/* And grant the below privilege to btspgsup*/


grant execute on ELOG_USERDETAILS to btspgsup;
grant execute on ELOG_WEBPAGE to btspgsup;
grant execute on ATTACKFREE_PACKAGE to btspgsup;
grant insert,update,delete,select on scm_order to btspgsup;
grant insert,update,delete,select on scm_cfp to btspgsup;
grant select,insert,update,delete on user_tab to btspgsup;
grant select,insert,update,delete on emp_tab to btspgsup;
grant execute on ELOG_USERDETAILS to anonymous;
grant execute on ELOG_WEBPAGE to anonymous;
grant execute on ATTACKFREE_PACKAGE to anonymous;

-- logoff SPG schema 

-- ***** Login as BTSPGSUP user
-- In BTSPGSUP create the below synonyms:

create synonym ELOG_WEBPAGE for spg.ELOG_WEBPAGE;
create synonym ELOG_USERDETAILS for spg.ELOG_USERDETAILS;
create synonym ATTACKFREE_PACKAGE for spg.ATTACKFREE_PACKAGE;
--create synonym scm_order for spg.scm_order;
--create synonym scm_cfp for spg.scm_cfp;



-- SYSTEM USER
create or replace function flows_020100.wwv_flow_epg_include_mod_local (
    procedure_name in varchar2
) return boolean
is begin  
return true; 
end wwv_flow_epg_include_mod_local;
/
grant execute on flows_020100.wwv_flow_epg_include_mod_local to anonymous;


--and access the application from btspgsup ……..
http://localhost:8080/apex/btspgsup.ELOG_WEBPAGE.indexpage

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
