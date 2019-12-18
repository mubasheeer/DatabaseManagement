INSERT INTO `bond`.`profile` (`idprofileid`, `fname`, `lname`, `username`, `password`, `gender`,`contactno`,`DOB`,`emailid`) VALUES ('1' ,'ashna', 'syeda', 'ashnaansar', 'lock', 'F' ,'123456' , '1997-05-10' , 'ashna@gmail.com');
INSERT INTO `bond`.`profile` (`idprofileid`, `fname`, `lname`, `username`, `password`, `gender`,`contactno`,`DOB`,`emailid`) VALUES ('2' , 'mubasheer', 'khan', 'mubasheer', 'lockword', 'M', '234567' ,'1997-04-22' , 'mubasheer2@gmail.com');
INSERT INTO `bond`.`profile` (`idprofileid`, `fname`, `lname`, `username`, `password`, `gender`,`contactno`,`DOB`, `emailid`) VALUES ('3' , 'john', 'smith', 'john123', 'johncena', 'M', '123876' ,'1999-02-12' , 'joh@yahoo.com' );
INSERT INTO `bond`.`profile` (`idprofileid`, `fname`, `lname`, `username`, `password`, `gender`,`contactno`,`DOB`, `emailid`) VALUES ('4' , 'bob', 'builder', 'bob123', 'bobcena', 'M', '146729' ,'1999-03-12' , 'bob@yahoo.com' );
INSERT INTO `bond`.`profile` (`idprofileid`, `fname`, `lname`, `username`, `password`, `gender`,`contactno`,`DOB`, `emailid`) VALUES ('5' , 'rob', 'clarke', 'rob123', 'robcena', 'M', '199999' ,'1999-05-12' , 'rob@yahoo.com' );
INSERT INTO `bond`.`profile` (`idprofileid`, `fname`, `lname`, `username`, `password`, `gender`,`contactno`,`DOB`, `emailid`) VALUES ('6' , 'peter', 'parker', 'peter123', 'spiderman', 'M', '298989' ,'1999-07-12' , 'peter@yahoo.com' );
INSERT INTO `bond`.`profile` (`idprofileid`, `fname`, `lname`, `username`, `password`, `gender`,`contactno`,`DOB`, `emailid`) VALUES ('7' , 'robert', 'downeyjr', 'downey123', 'iloveyou3000', 'M', '3030303' ,'1999-08-12' , 'rdj@yahoo.com' );


INSERT INTO `bond`.`eventpg` (`pgid`, `adminid`, `eventname`, `location`, `description`) VALUES ('10', '1', 'halloween', 'arlington', '7pm');
INSERT INTO `bond`.`eventpg` (`pgid`, `adminid`, `eventname`, `location`, `description`) VALUES ('11', '1', 'christmas', 'dallas', '6pm');
INSERT INTO `bond`.`eventpg` (`pgid`, `adminid`, `eventname`, `location`, `description`) VALUES ('12', '2', 'concert', 'frisco', '8pm');
INSERT INTO `bond`.`eventpg` (`pgid`, `adminid`, `eventname`, `location`, `description`) VALUES ('13', '2', 'thanksgiving', 'plano', '6pm');
INSERT INTO `bond`.`eventpg` (`pgid`, `adminid`, `eventname`, `location`, `description`) VALUES ('14', '4', 'graduation party', 'chicago', 'at Crystall Hall');
INSERT INTO `bond`.`eventpg` (`pgid`, `adminid`, `eventname`, `location`, `description`) VALUES ('15', '2', 'farewell party', 'dallas', '8pm');
INSERT INTO `bond`.`eventpg` (`pgid`, `adminid`, `eventname`, `location`, `description`) VALUES ('16', '1', 'formal party', 'arlington', '10pm');

INSERT INTO `bond`.`post` (`postid`, `pg`, `postdata`,`likescount`,`commentscount`) VALUES ('40', '10', 'venue change','0','0');
INSERT INTO `bond`.`post` (`postid`, `pg`, `postdata`,`likescount`,`commentscount`) VALUES ('41', '10', 'costume competition','0','0');
INSERT INTO `bond`.`post` (`postid`, `pg`, `postdata`,`likescount`,`commentscount`) VALUES ('42', '11', 'venue change','0','0');
INSERT INTO `bond`.`post` (`postid`, `pg`, `postdata`,`likescount`,`commentscount`) VALUES ('43', '12', 'tickets','0','0');
INSERT INTO `bond`.`post` (`postid`, `user`, `postdata`,`likescount`,`commentscount`) VALUES ('44', '1', 'house for sale','0','0');
INSERT INTO `bond`.`post` (`postid`, `user`, `postdata`,`likescount`,`commentscount`) VALUES ('45', '1', 'furniture for sale','0','0');
INSERT INTO `bond`.`post` (`postid`, `user`, `postdata`,`likescount`,`commentscount`) VALUES ('46', '6', 'car for sale','0','0');


INSERT INTO `bond`.`likes` (`userid`, `post`) VALUES ('1', '41');
INSERT INTO `bond`.`likes` (`userid`, `post`) VALUES ('1', '40');
INSERT INTO `bond`.`likes` (`userid`, `post`) VALUES ('2', '40');

INSERT INTO `bond`.`comments` (`commentedby`, `onpost` , `content`) VALUES ('1', '41','HELLO WORLD');
INSERT INTO `bond`.`comments` (`commentedby`, `onpost` , `content`) VALUES ('2', '46','WHAT A BEAUTIFUL DAY');
INSERT INTO `bond`.`comments` (`commentedby`, `onpost` , `content`) VALUES ('3', '45','AWESOME PICTURE');
INSERT INTO `bond`.`comments` (`commentedby`, `onpost` , `content`) VALUES ('4', '44','MISSING YOU');
INSERT INTO `bond`.`comments` (`commentedby`, `onpost` , `content`) VALUES ('5', '43','COME BACK SOON');
INSERT INTO `bond`.`comments` (`commentedby`, `onpost` , `content`) VALUES ('6', '42','YOU LOOK BEAUTIFUL');

INSERT INTO `bond`.`image` (`frompost`, `imagesize`) VALUES ('42', '2MB');
INSERT INTO `bond`.`image` (`frompost`, `imagesize`) VALUES ('41', '2.5MB');
INSERT INTO `bond`.`image` (`frompost`, `imagesize`) VALUES ('40', '2MB');


INSERT INTO `bond`.`audio` (`idpost`, `audiosize`) VALUES ('40', '2MB');
INSERT INTO `bond`.`audio` (`idpost`, `audiosize`) VALUES ('41', '1.5MB');
INSERT INTO `bond`.`audio` (`idpost`, `audiosize`) VALUES ('42', '2MB');
INSERT INTO `bond`.`audio` (`idpost`, `audiosize`) VALUES ('43', '2MB');
INSERT INTO `bond`.`audio` (`idpost`, `audiosize`) VALUES ('44', '1MB');
INSERT INTO `bond`.`audio` (`idpost`, `audiosize`) VALUES ('45', '2MB');
INSERT INTO `bond`.`audio` (`idpost`, `audiosize`) VALUES ('46', '2.5MB');

INSERT INTO `bond`.`text` (`postid` , `textsize` ) VALUES ( '43' , '32' );
INSERT INTO `bond`.`text` (`postid` , `textsize` ) VALUES ( '44' , '45' );
INSERT INTO `bond`.`text` (`postid` , `textsize` ) VALUES ( '44' , '34' );
INSERT INTO `bond`.`text` (`postid` , `textsize` ) VALUES ( '46' , '67' );

INSERT INTO `bond`.`registereduser` (`userprofile` , `eventid` ) VALUES ( '2' , '16' );
INSERT INTO `bond`.`registereduser` (`userprofile` , `eventid` ) VALUES ( '6' , '15' );
INSERT INTO `bond`.`registereduser` (`userprofile` , `eventid` ) VALUES ( '3' , '14' );
INSERT INTO `bond`.`registereduser` (`userprofile` , `eventid` ) VALUES ( '4' , '13' );
INSERT INTO `bond`.`registereduser` (`userprofile` , `eventid` ) VALUES ( '5' , '12' );
INSERT INTO `bond`.`registereduser` (`userprofile` , `eventid` ) VALUES ( '2' , '11' );
INSERT INTO `bond`.`registereduser` (`userprofile` , `eventid` ) VALUES ( '1' , '16' );
INSERT INTO `bond`.`registereduser` (`userprofile` , `eventid` ) VALUES ( '1' , '15' );
INSERT INTO `bond`.`registereduser` (`userprofile` , `eventid` ) VALUES ( '1' , '13' );
INSERT INTO `bond`.`registereduser` (`userprofile` , `eventid` ) VALUES ( '2' , '13' );

INSERT INTO `bond`.`friendlist` (`friend1` , `friend 2` ) VALUES ( '1' , '2' );
INSERT INTO `bond`.`friendlist` (`friend1` , `friend 2` ) VALUES ( '2' , '3' );
INSERT INTO `bond`.`friendlist` (`friend1` , `friend 2` ) VALUES ( '4' , '2' );
INSERT INTO `bond`.`friendlist` (`friend1` , `friend 2` ) VALUES ( '1' , '4' );
INSERT INTO `bond`.`friendlist` (`friend1` , `friend 2` ) VALUES ( '1' , '5' );
INSERT INTO `bond`.`friendlist` (`friend1` , `friend 2` ) VALUES ( '6' , '4' );
INSERT INTO `bond`.`friendlist` (`friend1` , `friend 2` ) VALUES ( '5' , '6' );
INSERT INTO `bond`.`friendlist` (`friend1` , `friend 2` ) VALUES ( '7' , '2' );










