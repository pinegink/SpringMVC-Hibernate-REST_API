drop table if exists playlist;
CREATE table playlist
(
    id   serial primary key,
    name varchar(50) not null
)