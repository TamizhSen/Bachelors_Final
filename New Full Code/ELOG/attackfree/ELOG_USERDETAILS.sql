create or replace package ELOG_USERDETAILS --authid current_user  is  @@@@@
is
 

 type orderlist is table of scm_order%rowtype;
  g_orderlist orderlist := orderlist();
  type cfplist is table of scm_cfp%rowtype;
  g_cfplist cfplist :=cfplist();
  gv_order orderlist:= orderlist();
  ord_det   scm_order%rowtype;
  gv_u_name user_tab.user_name%type;
  function isValidUser(username varchar2,password1 varchar2) return boolean;
  function getUserRole(username varchar2,pasword varchar2) return varchar2;
  procedure signUp (username user_tab.USER_NAME%type
                    ,password1 user_tab.USER_PWD%type
                    ,role1 user_tab.USER_ROLE%type) ;
   procedure VerifyUser(username USER_TAB.USER_name%type ,password1 USER_TAB.USER_PWD%type,click varchar2 default 'login');
   procedure getOrderDetails(customer_name scm_order.CUSTOMER_ID%type default null );
   procedure getCfpDetails;
   procedure PlaceOrder(product scm_order.product%TYPE,
     type1 scm_order.prod_type%TYPE
     ,pname scm_order.pname%TYPE
     ,quantity scm_order.qunatity%TYPE
     ,destination scm_order.destination%TYPE
      ,customer_name varchar2 );
      procedure acceptOrder (inde varchar2 default null
                           ,selec varchar2 default null
                           ,index1 varchar2 default null
                           );
     function getorder(inde varchar2) return orderlist;
     procedure changestatus(v_order orderlist,selec varchar2);
     procedure moveorder (inde varchar2 default null
                           ,selec varchar2 default null
                           ,index1 varchar2 default null
                           );
     procedure insertorder(order_id scm_order.order_id%TYPE
     ,customer_name scm_order.customer_id%TYPE
     ,Supplier_id scm_cfp.Supplier_id%TYPE
     ,cfp_id scm_cfp.cfp_id%TYPE
     ,product scm_order.product%TYPE
     ,type1 scm_order.prod_type%TYPE
     ,pname scm_order.pname%TYPE
     ,quantity scm_order.qunatity%TYPE
     ,status scm_order.status%TYPE
     ,destination scm_order.destination%TYPE);

     procedure searchorder (search_field varchar2,fieldvalue varchar2);
     procedure insertproduct(productname varchar2, subtype1 varchar2, prodmodel varchar2);
    function insertprodtable(productname varchar2, subtype1 varchar2, prodmodel varchar2) return varchar2 ;

end ELOG_USERDETAILS;
/
create or replace package body ELOG_USERDETAILS is
   procedure signUp (username user_tab.USER_NAME%type
                    ,password1 user_tab.USER_PWD%type
                    ,role1 user_tab.USER_ROLE%type)
  is
   lv_pass varchar2(100);
  begin
  if username is not null and password1 is not null  and role1 is not null then
  -- md5 conversion
  lv_pass := password1;
  lv_pass :=utl_raw.cast_to_raw(lv_pass);
  lv_pass :=dbms_obfuscation_toolkit.Md5(input =>lv_pass);
  -- end
  insert into user_tab(USER_NAME,USER_PWD,USER_ROLE ) values(username,lv_pass,role1);
  commit;
  htp.p('<center><font size="5" color="#336633" face="Times New Roman,Times,serif">Signup sucessfully completed</font></center>');
  ELOG_WEBPAGE.indexpage;
  else
  htp.p('Fill All the Field');
  ELOG_WEBPAGE.signUp;
  end if;
  end signUp;


  function isValidUser(username varchar2,password1 varchar2) return boolean
   is
   u_pwd USER_TAB.USER_PWD%type;
   user_name USER_TAB.USER_name%type;
   sql1 varchar2(5000);
   lv_pass varchar2(100);
   begin
   -- md5 for comparision
    lv_pass := password1;
  lv_pass :=utl_raw.cast_to_raw(lv_pass);
  lv_pass :=dbms_obfuscation_toolkit.Md5(input =>lv_pass);
   -- end
     SQL1:='select user_name from USER_TAB where USER_name=:a and user_pwd=:b';
   execute immediate SQL1 into user_name using username,lv_pass ;
   return true;
   exception when others then
     htp.p('Exception<br> ');
   htp.p(sqlerrm);
   return false;
  -- return true; -- @@@@@
   --dbms_output.put_line('Error occured'||sqlerrm );
   end isValidUser;

   function getUserRole(username varchar2,pasword varchar2) return varchar2
    is
     u_role USER_TAB.USER_ROLE%type;

    begin

     select USER_ROLE,user_name into u_role,gv_u_name from USER_TAB where USER_name=username;
     --debug_aarthy_tab(gv_u_name ||'user');

     return u_role;
    exception when others then
      htp.p(sqlerrm);
    return null;
    end getUserRole;

    procedure insertOrder(order_id SCM_ORDER.ORDER_ID%type default to_char(1),
    customer_id SCM_ORDER.CUSTOMER_ID%type,
    product SCM_ORDER.PRODUCT%type,
    prod_type SCM_ORDER.PROD_TYPE%type,
    pname SCM_ORDER.PNAME%type,
    quantity SCM_ORDER.QUNATITY%type,
    destination SCM_ORDER. DESTINATION%type,
    status SCM_ORDER. STATUS%type) is
    begin

     /*  if order_id is null then
            order_id := to_char(1);
        end if;     */

        insert into scm_order(order_id,customer_id,product,prod_type,pname,QUNATITY,destination,status)
        values(order_id,customer_id,product,prod_type,pname,quantity,destination,status);
        commit;
     end insertOrder;
  procedure VerifyUser(username USER_TAB.USER_name%type ,password1 USER_TAB.USER_PWD%type,click varchar2 default 'login') is
     u_role USER_TAB.USER_ROLE%type;
     sql1 varchar2(5000);
     begin
   /*  SQL1:='select user_name from USER_TAB where USER_name='''||username||''''||' and user_pwd='''||password1||'''';
   htp.p(sql1);*/
  -- htp.p('Hello');
     if(isValidUser(username,password1)) then

     u_role:=getUserRole(username,password1);
     case when u_role = 'manager' then
     ELOG_WEBPAGE.manager;
     when  u_role = 'customer' then
     ELOG_WEBPAGE.customer(gv_u_name);
     when u_role = 'supplier' then
     ELOG_WEBPAGE.supplier;
     when u_role = 'logistics' then
     ELOG_WEBPAGE.logistics;
     else
     ELOG_WEBPAGE.loginPage;
     htp.p('<SCRIPT language="JavaScript" type="text/javascript">');
     htp.p('alert("Invalid password");</script>');
     end case;
     else
     ELOG_WEBPAGE.loginPage;
     htp.p('<SCRIPT language="JavaScript" type="text/javascript">');
     htp.p('alert("Invalid password");</script>');
          end if;
     exception when others then
     ELOG_WEBPAGE.loginPage;
     htp.p('<SCRIPT language="JavaScript" type="text/javascript">');
     htp.p('alert("Exception");</script>');
     end VerifyUser;
     procedure getOrderDetails(customer_name scm_order.CUSTOMER_ID%type default null ) is
     begin
     if (customer_name is null) then
     select  ORDER_ID,
        CUSTOMER_ID ,
        PRODUCT,
        PROD_TYPE,
        PNAME,
        QUNATITY,
        DESTINATION,
        STATUS,mod_date
        bulk collect into g_orderlist
        from scm_order
        where trunc(mod_date) > trunc(sysdate) - 30;
     else
      select  ORDER_ID,
        CUSTOMER_ID ,
        PRODUCT,
        PROD_TYPE,
        PNAME,
        QUNATITY,
        DESTINATION,
        STATUS,mod_date
        bulk collect into g_orderlist
        from scm_order
        where CUSTOMER_ID=customer_name and trunc(mod_date) > trunc(sysdate) - 30;
     end if;
     end getOrderDetails;
     procedure getCfpDetails is
     begin
     select * bulk collect into g_cfplist from scm_cfp;
     end getCfpDetails;
     procedure PlaceOrder(product scm_order.product%TYPE,
     type1 scm_order.prod_type%TYPE
     ,pname scm_order.pname%TYPE
     ,quantity scm_order.qunatity%TYPE
     ,destination scm_order.destination%TYPE
      ,customer_name varchar2 )is
     order_id varchar2(200);
     cfp_id varchar2(200);
     --customer_id VARCHAR2(100);
     Supplier_id VARCHAR2(100);
     status varchar2(100);
     dest varchar2(300);
     begin
     --customer_id :='cust1';
     Supplier_id := 'supp1';
     status := 'waiting';
     select DBMS_ASSERT.SIMPLE_SQL_NAME(destination) into dest  from dual ;
     select customer_name||ORDERID_SEQ.NEXTVAL,customer_name||CFPID_SEQ.NEXTVAL into  order_id,cfp_id from dual;

     execute immediate 'begin ELOG_USERDETAILS.insertorder('''||order_id||''','''||customer_name||'''
                                                               ,'''||Supplier_id||''','''||cfp_id||'''
                                                               ,'''||product||''','''||type1||'''
                                                               ,'''||pname||''','''||quantity||'''
                                                               ,'''||status||''','''||destination||'''); end;' ;

    exception when others then
    elog_webpage.customer(customer_name);
     htp.p('<SCRIPT language="JavaScript" type="text/javascript">');
     htp.p('alert("Destiantion field contains SQL keywords is validated by dbms_assert package.");</script>');
    end PlaceOrder;

     procedure insertorder(order_id scm_order.order_id%TYPE
     ,customer_name scm_order.customer_id%TYPE
     ,Supplier_id scm_cfp.Supplier_id%TYPE
     ,cfp_id scm_cfp.cfp_id%TYPE
     ,product scm_order.product%TYPE
     ,type1 scm_order.prod_type%TYPE
     ,pname scm_order.pname%TYPE
     ,quantity scm_order.qunatity%TYPE
     ,status scm_order.status%TYPE
     ,destination scm_order.destination%TYPE) is
     begin
     insert into scm_order
     (order_id,customer_id,product,prod_type,pname,qunatity,destination,status)
     values(order_id,customer_name,product,type1,pname,quantity,destination,status);

     insert into scm_cfp(cfp_id,order_id,supplier_id,product,quantity,status)
     values(cfp_id,order_id,Supplier_id,product,quantity,status);
     commit;

     ELOG_WEBPAGE.customer(customer_name);
     htp.p('<SCRIPT language="JavaScript" type="text/javascript">');

     htp.p('alert("Order has been placed sucessfully");</script>');
     end insertorder;

     procedure acceptOrder (inde varchar2 default null
                           ,selec varchar2 default null
                           ,index1 varchar2 default null
                           ) is
     v_order orderlist;
     begin

     if inde is not null then
     gv_order := getorder(inde);
     ELOG_WEBPAGE.supplier;
     end if;
     if selec is not null then
     v_order :=getorder(index1);
     changestatus(v_order,selec);
    ELOG_WEBPAGE.supplier;
     htp.p('<SCRIPT language="JavaScript" type="text/javascript">');
     htp.p('alert("Order has been placed sucessfully");</script>');

     ELOG_USERDETAILS.getOrderDetails;

     end if;
     end acceptOrder;
     function getorder(inde varchar2) return orderlist is
     v_order orderlist;
     begin
     select * bulk collect into v_order from scm_order where order_id=inde;
     return v_order;
     end getorder;

     procedure changestatus(v_order orderlist,selec varchar2) is
     begin
     UPDATE scm_order SET status = selec where order_id=v_order(1).order_id;
     UPDATE scm_cfp SET status = selec where order_id=v_order(1).order_id;
     commit;
     end changestatus;

     procedure moveorder (inde varchar2 default null
                           ,selec varchar2 default null
                           ,index1 varchar2 default null
                           ) is
    v_order orderlist;
    begin
       if inde is not null then
     gv_order := getorder(inde);
     ELOG_WEBPAGE.logistics;
       end if;
     if selec is not null then
     v_order :=getorder(index1);
     changestatus(v_order,selec);
     ELOG_WEBPAGE.logistics;
     htp.p('<SCRIPT language="JavaScript" type="text/javascript">');
     htp.p('alert("status changed");</script>');

     getOrderDetails;

     end if;
     end moveorder;

    procedure searchorder (search_field varchar2,fieldvalue varchar2) is
     SQL1 varchar2(5000);
     c number :=1;

     TYPE EmpCurTyp IS REF CURSOR;
     emp_cv   EmpCurTyp;
      fieldvalue1   varchar2(5000) :=upper(fieldvalue);
      myfield varchar2(5000):=upper(fieldvalue1);
       filv varchar2(100);
       len number;
     begin
     g_orderlist := orderlist();
    len:=length(myfield);   
    if len>=10 then
   elog_webpage.searchorder;
     htp.p('<SCRIPT language="JavaScript" type="text/javascript">');
     htp.p('alert("error occured while accessing unauthorized program");</script>');
   -- htp.p('<font color="red">error occured while accessing unauthorized program</font>');
   --select DBMS_ASSERT.SIMPLE_SQL_NAME(fieldvalue1)into filv from dual;
   else
     --g_orderlist:=orderlist();
     sql1 := 'select *
     from scm_order
     where upper('||search_field||') like '''||'%'||fieldvalue1||'%''';
     open emp_cv for sql1;
     LOOP
     FETCH emp_cv INTO ord_det;
      exit when emp_cv%notfound;
      g_orderlist.extend;
       g_orderlist(c) := ord_det;
       c:=c+1;
   END LOOP;
   CLOSE emp_cv;
  end if;
 --exception when others then
   ---htp.p('<font color="red">error occured while accessing unauthorized program</font>');
   --g_orderlist := orderlist(ord_det);
   elog_webpage.searchorder;
   

     end searchorder;
      procedure insertproduct(productname varchar2, subtype1 varchar2, prodmodel varchar2) is
      begin
      if (insertprodtable(productname,subtype1,prodmodel) = 'Success') then

      ELOG_WEBPAGE.insertporductpage;
        htp.p('<SCRIPT language="JavaScript" type="text/javascript">');
     htp.p('alert("Product has been added in Database");</script>');
      else
      ELOG_WEBPAGE.insertporductpage;
      htp.p('<SCRIPT language="JavaScript" type="text/javascript">');
     htp.p('alert("Please enter the details correctly");</script>');
      end if;

      ELOG_WEBPAGE.insertporductpage;
      end insertproduct;
      function insertprodtable(productname varchar2, subtype1 varchar2, prodmodel varchar2) return varchar2 is
      pragma autonomous_transaction ;
      begin
      insert into Product_master_tab values (productname,subtype1,prodmodel);
      commit;
      return 'Success';
      exception when others then
      return 'error';
      end insertprodtable;
end ELOG_USERDETAILS;
/
