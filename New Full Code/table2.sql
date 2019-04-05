
create table SCM_CFP
(
  CFP_ID      VARCHAR2(100),
  ORDER_ID    VARCHAR2(100),
  SUPPLIER_ID VARCHAR2(100),
  PRODUCT     VARCHAR2(100),
  QUANTITY    NUMBER,
  STATUS      VARCHAR2(50)
);

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('2', '1', 'supp1', 'Computer', 1, 'Accept');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('3', '2', 'supp1', 'Computer', 1, 'Send');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('4', '3', 'supp1', 'Select Product', null, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('7', '6', 'supp1', 'Computer', 1, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('8', '7', 'supp5', 'Printer', 1, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('9', '8', 'supp1', 'Computer', 1, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('12', '11', 'supp1', 'Computer', 12, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('19', '18', 'supp1', 'Computer', 111, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('20', '19', 'supp2', 'Computer', 111, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('21', '20', 'supp3', 'Computer', 111, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('22', '21', 'supp4', 'Computer', 1, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('23', '22', 'supp1', 'Computer', 1, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('24', '23', 'supp5', 'Computer', 121, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('27', '26', 'supp1', 'Computer', 1, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('28', '27', 'supp1', 'Computer', 1, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('29', '28', 'supp6', 'Compute', 1, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('31', '30', 'supp1', 'Computer', 12, 'waiting');

insert into scm_cfp (CFP_ID, ORDER_ID, SUPPLIER_ID, PRODUCT, QUANTITY, STATUS)
values ('32', '31', 'supp1', 'Computer', 12, 'waiting');


commit;
