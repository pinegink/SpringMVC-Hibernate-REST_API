drop table if exists songs;
CREATE table songs (
 id serial primary key,
 name varchar(50) not null,
 band varchar (30) not null,
 year integer not null
)