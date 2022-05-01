# CREATE database `cheers_dineIn_experience`;
use cheers_dineIn_experience;

drop table if exists payments;
drop table if exists reviews;
drop table if exists ordered_items;
drop table if exists orders;
drop table if exists dishes;
drop table if exists menu;
drop table if exists seat_table;
drop table if exists manager;
drop table if exists restaurant;
drop table if exists accounts;

create table accounts
(
    acc_id         int primary key auto_increment not null,
    acc_first_name varchar(20)                    not null,
    acc_last_name  varchar(20)                    not null,
    acc_username   varchar(20)                    not null,
    acc_password   varchar(100)                   not null
);


create table manager
(
    mgr_username  varchar(20)  not null,
    mgr_password  varchar(100) not null
);


create table menu
(
    menu_id       int primary key auto_increment not null,
    menu_name     varchar(20)                    not null,
    menu_comments varchar(128)
);

create table dishes
(
    dishes_id      int primary key auto_increment not null,
    dishes_name    varchar(128)                   not null,
    dishes_cost    decimal(15, 2)                 not null,
    dish_prep_time decimal(8, 2),
    dish_comments  varchar(128),
    menu_id        int(8)                         not null,
    foreign key (menu_id) references menu (menu_id)
);


create table seat_table
(
    table_id      int primary key auto_increment not null
);

create table orders
(
    order_id         int primary key auto_increment not null,
    order_number     int                            not null,
    order_cost       decimal(15, 2)                 not null,
    order_status     varchar(20)                    not null,
    order_start_time datetime                       not null,
    order_notes      varchar(20),
    acc_id          int                            not null,
    table_id         int                            not null,
    foreign key (acc_id) references accounts (acc_id),
    foreign key (table_id) references seat_table (table_id)
);

create table ordered_items
(
    dishes_id     int            not null,
    order_id      int            not null,
    orditm_status varchar(20)    not null,
    orditm_notes  varchar(128),
    orditm_cost   decimal(15, 2) not null,
    orditm_qty    int            not null,
    PRIMARY KEY (dishes_id, order_id),
    foreign key (dishes_id) references dishes (dishes_id),
    foreign key (order_id) references orders (order_id)
);

create table payments
(
    payment_id     int primary key auto_increment not null,
    payment_cc_num int                            not null,
    payment_cc_exp datetime                       not null,
    payment_cc_cvv int                            not null,
    payment_cc_zip int                            not null,
    acc_id        int                            not null,
    foreign key (acc_id) references accounts (acc_id)
);


create table reviews
(
    review_id     int primary key auto_increment not null,
    review_rating int                            not null,
    review_notes  varchar(128)                   not null,
    order_id      int                            not null,
    foreign key (order_id) references orders (order_id)
);