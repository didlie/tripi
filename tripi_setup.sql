DROP DATABASE if exists Tripi;

CREATE DATABASE Tripi;

use Tripi;

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

INSERT INTO `User` (`user_id`,`password`,`username`,`displayname`,`email`,`profile_pic`) VALUES (1,'password','WWillie','Willie','wwillie@usc.edu','https://pbs.twimg.com/profile_images/985671011965153280/CBqYLkWC_400x400.jpg');
INSERT INTO `User` (`user_id`,`password`,`username`,`displayname`,`email`,`profile_pic`) VALUES (2,'fighton','JMiller','Jeffrey Miller PhD','jeffrey.miller@usc.edu','https://viterbi.usc.edu/directory/images/2dafc9bc59c736884ae57b7235d5bc67.jpg');

INSERT INTO `Trip` (`trip_id`,`user_id`,`cover_photo_link`,`description`,`title`,`main_place`,`share`) VALUES (1,1,'http://cdn-image.travelandleisure.com/sites/default/files/styles/1600x1000/public/1444253482/DG2015-new-york.jpg?itok=neFmsUY1','Leisurely tour of New York City','Big Apple Tour','New York',1);
INSERT INTO `Trip` (`trip_id`,`user_id`,`cover_photo_link`,`description`,`title`,`main_place`,`share`) VALUES (2,1,'https://res.cloudinary.com/simpleview/image/upload/c_limit,f_auto,h_1200,q_75,w_1200/v1/clients/lasvegas/strip_b86ddbea-3add-4995-b449-ac85d700b027.jpg','What happens in Vegas stays in Vegas','Sin City','Las Vegas',1);
INSERT INTO `Trip` (`trip_id`,`user_id`,`cover_photo_link`,`description`,`title`,`main_place`,`share`) VALUES (3,2,'https://images.businessoffashion.com/site/uploads/2018/02/shutterstock_111362132.jpg?auto=format%2Ccompress&crop=top&fit=crop&h=573&w=1024','A tour of Paris, France','Tour de France','Paris',1);
INSERT INTO `Trip` (`trip_id`,`user_id`,`cover_photo_link`,`description`,`title`,`main_place`,`share`) VALUES (4,2,'https://www.roadaffair.com/wp-content/uploads/2018/01/aerial-view-berlin-germany-shutterstock_337203833-780x520.jpg','Nice tour of Berlin, Germany','Field Trip to Berlin','Berlin',1);

