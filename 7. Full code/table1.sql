

create table SCM_ORDER
(
  ORDER_ID    VARCHAR2(100),
  CUSTOMER_ID VARCHAR2(100),
  PRODUCT     VARCHAR2(100),
  PROD_TYPE   VARCHAR2(100),
  PNAME       VARCHAR2(100),
  QUNATITY    NUMBER,
  DESTINATION VARCHAR2(100),
  STATUS      VARCHAR2(100),
  MOD_DATE    DATE default sysdate
);

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('1', 'cust1', 'Computer', 'Desktop', 'pc2', 1, 'asas', 'Accept', to_date('28-12-2011 10:04:44', 'dd-mm-yyyy hh24:mi:ss'));

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('2', 'cust2', 'Moniter', 'LED', 'm2', 1, 'asas', 'Send', to_date('28-12-2011 10:04:44', 'dd-mm-yyyy hh24:mi:ss'));

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('3', 'cust2', 'Select Product', 'Select Type', 'Select Product Name', null, '', 'waiting', to_date('28-12-2011 10:04:44', 'dd-mm-yyyy hh24:mi:ss'));

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('6', 'cust3', 'Computer', 'Desktop', 'pc5', 1, 'asdsd', 'waiting', to_date('28-12-2011 10:04:44', 'dd-mm-yyyy hh24:mi:ss'));

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('7', 'cust2', 'Printer', 'Inject', 'ip3', 1, 'asdsd', 'waiting', to_date('28-12-2011 10:04:44', 'dd-mm-yyyy hh24:mi:ss'));

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('8', 'cust4', 'Computer', 'Desktop', 'pc2', 1, 'add', 'waiting', to_date('28-12-2011 10:04:44', 'dd-mm-yyyy hh24:mi:ss'));

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('1', 'cust5', 'Computer', 'Desktop', 'pc2', 1, 'asas', 'Accept', to_date('28-12-2011 10:46:34', 'dd-mm-yyyy hh24:mi:ss'));

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('1', 'cust12', 'Computer', 'Desktop', 'pc2', 1, 'asas', 'Accept', to_date('28-12-2011 11:06:34', 'dd-mm-yyyy hh24:mi:ss'));

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('11', 'cust1', 'Computer', 'Desktop', 'pc5', 12, 'add', 'waiting', to_date('28-12-2011 13:22:16', 'dd-mm-yyyy hh24:mi:ss'));

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('18', 'cust1', 'Computer', 'Desktop', 'pc2', 111, 'add', 'waiting', to_date('01-02-2012', 'dd-mm-yyyy'));

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('19', 'cust1', 'Computer', 'Desktop', 'pc2', 111, 'add', 'waiting', to_date('11-02-2012', 'dd-mm-yyyy'));

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('20', 'cust1', 'Computer', 'Desktop', 'pc2', 111, 'add', 'waiting', to_date('11-02-2012', 'dd-mm-yyyy'));

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('21', 'cust1', 'Computer', 'Desktop', 'pc2', 1, 'add', 'waiting', to_date('29-12-2011 09:40:09', 'dd-mm-yyyy hh24:mi:ss'));

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('22', 'cust1', 'Computer', 'Laptop', 'nb1', 1, 'add', 'waiting', to_date('29-12-2011 09:40:55', 'dd-mm-yyyy hh24:mi:ss'));

insert into scm_order (ORDER_ID, CUSTOMER_ID, PRODUCT, PROD_TYPE, PNAME, QUNATITY, DESTINATION, STATUS, MOD_DATE)
values ('23', 'cust1', 'Computer', 'Desktop', 'pc1', 121, 'asas', 'waiting', to_date('11-02-2012', 'dd-mm-yyyy'));


commit;
