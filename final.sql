DROP DATABASE if exists Tripi;

CREATE DATABASE Tripi;

use Tripi;

create table Users(
	User_ID int(11) primary key not null auto_increment,
    User_password varchar(50) not null,
    User_name varchar(50) not null,
    User_displayname varchar(50),
    User_email varchar(50) not null,
    User_profile varchar(50)
);

create table Trip(
	Trip_ID int(11) primary key not null auto_increment,
    User_ID int(11) not null,
    Trip_cover_photo_link varchar(150),
    Trip_description varchar(150),
    Trip_title varchar(150) not null,
    Trip_main_place varchar(150) not null,
    Trip_public bool not null,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

create table Item(
	Item_ID int(11) primary key not null auto_increment,
    Trip_ID int(11) not null,
    Item_title varchar(50) not null,
    Item_description varchar(150) not null,
    latitude varchar(45) not null,
    longtitude varchar(45) not null,
    fromdate datetime not null,
    todate datetime not null,
    Item_type varchar(45) not null,
    Item_link varchar(150) not null,
    FOREIGN KEY (Trip_ID) REFERENCES Trip(Trip_ID)
);

