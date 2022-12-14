create table products
(
    product_id  bigserial
        primary key,
    assessment  integer          not null,
    description varchar(255),
    discount    double precision not null,
    price       double precision not null,
    title       varchar(255)
);

alter table products
    owner to postgres;

create table ratings
(
    id         bigserial
        primary key,
    user_id    bigint,
    value      integer not null,
    product_id bigint  not null
        constraint fk228us4dg38ewge41gos8y761r
            references products
);

alter table ratings
    owner to postgres;

create table sales
(
    id           bigserial
        primary key,
    check_number bigint,
    date_of_sale date,
    register     boolean not null,
    user_id      bigint
);

alter table sales
    owner to postgres;

create table user_statistic
(
    id          bigint not null
        primary key,
    check_count bigint,
    total_cost  double precision,
    total_sale  double precision,
    user_id     bigint
);

alter table user_statistic
    owner to postgres;

create table users
(
    user_id         bigserial
        primary key,
    first_discount  double precision not null,
    name            varchar(255),
    second_discount double precision not null
);

alter table users
    owner to postgres;

create table positions
(
    id             bigserial
        primary key,
    amount         bigint,
    final_discount double precision not null,
    final_price    double precision not null,
    original_price double precision not null,
    product_id     bigint,
    sale_id        bigint           not null
        constraint fkf3lvpsclottjm5u6nk5pj4dgv
            references sales
);

alter table positions
    owner to postgres;

create table product_statistic
(
    id                  bigint not null
        primary key,
    check_count         bigint,
    product_id          bigint,
    total_cost_position double precision,
    total_cost_sale     double precision
);

alter table product_statistic
    owner to postgres;

