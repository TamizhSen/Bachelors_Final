

create table USER_TAB
(
  USER_ID   NUMBER,
  USER_NAME VARCHAR2(100),
  USER_PWD  VARCHAR2(100),
  USER_ROLE VARCHAR2(100)
);

insert into user_tab (USER_ID, USER_NAME, USER_PWD, USER_ROLE)
values (318071, 'aarthy', 'aarthy', 'manager');

insert into user_tab (USER_ID, USER_NAME, USER_PWD, USER_ROLE)
values (318072, 'vikram', 'vikram', 'customer');

insert into user_tab (USER_ID, USER_NAME, USER_PWD, USER_ROLE)
values (318074, 'meenakshi', 'meenakshi', 'logistics');

insert into user_tab (USER_ID, USER_NAME, USER_PWD, USER_ROLE)
values (318073, 'meena', 'meena', 'supplier');


commit;
