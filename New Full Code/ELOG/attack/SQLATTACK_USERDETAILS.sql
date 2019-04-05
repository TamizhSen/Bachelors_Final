create or replace package SQLATTACK_USERDETAILS is


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
   procedure VerifyUser(username USER_TAB.USER_NAME%type ,password1 USER_TAB.USER_PWD%type,click varchar2 default 'login');
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
end SQLATTACK_USERDETAILS;
/
create or replace package body SQLATTACK_USERDETAILS is

   procedure signUp (username user_tab.USER_NAME%type
                    ,password1 user_tab.USER_PWD%type
                    ,role1 user_tab.USER_ROLE%type)
  is
  begin
  if username is not null and password1 is not null  and role1 is not null then
  insert into user_tab(USER_NAME,USER_PWD,USER_ROLE ) values(username,password1,role1);
  commit;
  htp.p('<center><font size="5" color="Maroon">Signup Successfully completed</font></center>');
  SQLATTACK_WEBPAGE.indexpage;
  else
  htp.p('<center><font size="5" color="Maroon">Fill All the Field</font></center>');
  SQLATTACK_WEBPAGE.signUp;
  end if;
  end signUp;


  function isValidUser(username varchar2,password1 varchar2) return boolean
   is
   u_pwd USER_TAB.USER_PWD%type;
   user_name USER_TAB.USER_name%type;
   sql1 varchar2(5000);
   begin
     SQL1:='select user_name from USER_TAB where USER_NAME='''||username||''''||' and user_pwd='''||password1||'''';
   execute immediate SQL1 into user_name;
   return true;
   exception when others then
   return false;
   --dbms_output.put_line('Error occured'||sqlerrm );
   end isValidUser;

   function getUserRole(username varchar2,pasword varchar2) return varchar2
    is
     u_role USER_TAB.USER_ROLE%type;

    begin
     select USER_ROLE,user_name into u_role,gv_u_name from USER_TAB where USER_NAME=username;
     --debug_aarthy_tab(gv_u_name ||'user');
     return u_role;
    exception when others then
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
  procedure VerifyUser(username USER_TAB.USER_NAME%type ,password1 USER_TAB.USER_PWD%type,click varchar2 default 'login') is
     u_role USER_TAB.USER_ROLE%type;
     sql1 varchar2(5000);
     begin
   /*  SQL1:='select user_name from USER_TAB where USER_ID='''||username||''''||' and user_pwd='''||password1||'''';
   htp.p(sql1);*/
     if(isValidUser(username,password1)) then
     u_role:=getUserRole(username,password1);
     --debug_aarthy_tab(gv_u_name ||'role');
     case when u_role = 'manager' then
     SQLATTACK_WEBPAGE.manager;
     when  u_role = 'customer' then
     SQLATTACK_WEBPAGE.customer(gv_u_name);
     when u_role = 'supplier' then
     SQLATTACK_WEBPAGE.supplier;
     when u_role = 'logistics' then
     SQLATTACK_WEBPAGE.logistics;
     else
     SQLATTACK_WEBPAGE.indexpage;
     htp.p('
     <SCRIPT language="JavaScript" type="text/javascript">');
     htp.p('alert("Invaid password");</script>');
     end case;
     else
     SQLATTACK_WEBPAGE.indexpage;
     htp.p('
     <SCRIPT language="JavaScript" type="text/javascript">');
     htp.p('alert("Invalid password");</script>');
     end if;
     exception when others then

      SQLATTACK_WEBPAGE.indexpage;
        htp.p('
<SCRIPT language="JavaScript" type="text/javascript">');
     htp.p('alert("Invalid password");</script>');
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
     begin
     --customer_id :='cust1';
     Supplier_id := 'supp1';
     status := 'waiting';
     --debug_aarthy_tab(gv_u_name);
     select customer_name||ORDERID_SEQ.NEXTVAL,customer_name||CFPID_SEQ.NEXTVAL into  order_id,cfp_id from dual;

     execute immediate 'begin SQLATTACK_USERDETAILS.insertorder('''||order_id||''','''||customer_name||'''
                                                               ,'''||Supplier_id||''','''||cfp_id||'''
                                                               ,'''||product||''','''||type1||'''
                                                               ,'''||pname||''','''||quantity||'''
                                                               ,'''||status||''','''||destination||'''); end;' ;

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
     htp.p('<font size="5" color="660000" face="Monotype Corsiva">order placed</font>');
     SQLATTACK_WEBPAGE.customer(customer_name);
     end insertorder;

     procedure acceptOrder (inde varchar2 default null
                           ,selec varchar2 default null
                           ,index1 varchar2 default null
                           ) is
     v_order orderlist;
     begin
     htp.p('<font size="5" color="660000" face="Monotype Corsiva">hi</font>');
     htp.p(inde);
     if inde is not null then
     gv_order := getorder(inde);
     SQLATTACK_WEBPAGE.supplier;
     end if;
     if selec is not null then
     v_order :=getorder(index1);
     changestatus(v_order,selec);
     htp.p('<font size="5" color="660000" face="Monotype Corsiva">status changed</font>');

     SQLATTACK_USERDETAILS.getOrderDetails;
     SQLATTACK_WEBPAGE.supplier;
     end if;
    -- htp.p('end');
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
     SQLATTACK_WEBPAGE.logistics;
       end if;
     if selec is not null then
     v_order :=getorder(index1);
     changestatus(v_order,selec);
     htp.p('<font size="5" color="660000" face="Monotype Corsiva">status changed</font>');
     getOrderDetails;
     SQLATTACK_WEBPAGE.logistics;
     end if;
     end moveorder;

     procedure searchorder (search_field varchar2,fieldvalue varchar2) is
     SQL1 varchar2(5000);
     c number :=1;

     TYPE EmpCurTyp IS REF CURSOR;
     emp_cv   EmpCurTyp;
      fieldvalue1   varchar2(5000) :=upper(fieldvalue);
     begin
     g_orderlist := orderlist();
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
   --g_orderlist := orderlist(ord_det);
   sqlattack_webpage.searchorder;

     end searchorder;
      procedure insertproduct(productname varchar2, subtype1 varchar2, prodmodel varchar2) is
      begin
      if (insertprodtable(productname,subtype1,prodmodel) = 'Success') then
      htp.p('<font size="5" color="660000" face="Monotype Corsiva">Product has been added in Database</font>' );
      sqlattack_webpage.insertporductpage;
      else
      htp.p('<font size="5" color="660000" face="Monotype Corsiva">error occured . Please enter product details correctly</font>' );
      sqlattack_webpage.insertporductpage;
      end if;
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
end SQLATTACK_USERDETAILS;
/
