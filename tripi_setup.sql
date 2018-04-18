DROP DATABASE if exists Tripi_Exp;

CREATE DATABASE Tripi_Exp;

use Tripi_Exp;

create table User(
    user_id int(11) primary key not null auto_increment,
    password varchar(50) not null,
    username varchar(50) not null,
    displayname varchar(100) not null,
    email varchar(256) not null,
    profile_pic varchar(2083)
);

create table Trip(
    trip_id int(11) primary key not null auto_increment,
    user_id int(11) not null,
    cover_photo_link varchar(2083) not null,
    description varchar(140) not null,
    title varchar(140) not null,
    main_place varchar(150) not null,
    share bool not null,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

create table Item(
    item_id int(11) primary key not null auto_increment,
    trip_id int(11) not null,
    title varchar(50) not null,
    description varchar(150) not null,
    latitude double not null,
    longitude double not null,
    type varchar(10) not null,
    link varchar(2083) not null,
    time datetime not null,
    address varchar(256) not null,
    FOREIGN KEY (trip_id) REFERENCES Trip(trip_id)
);

