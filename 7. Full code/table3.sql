
create table Product_master_tab(Product_name varchar2(200),subtype1 varchar2(200),prod_model varchar2(200),
constraint product_pkey primary key (Product_name,subtype1,prod_model));

insert into product_master_tab (PRODUCT_NAME, SUBTYPE1, PROD_MODEL)
values ('Computer', 'Desktop', 'm2');

insert into product_master_tab (PRODUCT_NAME, SUBTYPE1, PROD_MODEL)
values ('Computer', 'Laptop', 'm1');

insert into product_master_tab (PRODUCT_NAME, SUBTYPE1, PROD_MODEL)
values ('Mobile', 'Smart phone', 'm3');

insert into product_master_tab (PRODUCT_NAME, SUBTYPE1, PROD_MODEL)
values ('Mouse', 'dual key', 'm4');

insert into product_master_tab (PRODUCT_NAME, SUBTYPE1, PROD_MODEL)
values ('Monitor', 'Lcd', 'm5');

insert into product_master_tab (PRODUCT_NAME, SUBTYPE1, PROD_MODEL)
values ('Moniter', 'Led', 'm2');

insert into product_master_tab (PRODUCT_NAME, SUBTYPE1, PROD_MODEL)
values ('Tv', 'Smart TV', 'm6');



commit;
