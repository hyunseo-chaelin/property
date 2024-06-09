USE propertyDB;

create table member ( 
    id varchar(10) not null,
    password varchar(10) not null,
    name varchar(10) not null,
    gender varchar(4),
    birth  varchar(10),
    mail  varchar(30),
    phone1 varchar(10),
    phone2 varchar(10),
    phone3 varchar(10),
    address varchar(90),
    addr_detail varchar(90),
    card_type varchar(30),
    cc_name varchar(30),
    cc_num_1 varchar(10),
    cc_num_2 varchar(10),
    cc_num_3 varchar(10),
    cc_num_4 varchar(10),
    cc_expiration_yy varchar(10),
    cc_expiration_mm varchar(10),
    CVC varchar(10),
    regist_day varchar(50),
    primary key(id) 
) default CHARSET=utf8;


select * from member; 


drop table member;