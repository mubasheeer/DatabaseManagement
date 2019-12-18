CREATE SCHEMA `bond`;

CREATE TABLE `bond`.`profile` (
  `idprofileid` INT NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `contactno` INT NULL,
  `DOB` DATE NULL,
  `emailid` VARCHAR(255) NULL,
  PRIMARY KEY (`idprofileid`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `contactno_UNIQUE` (`contactno` ASC) VISIBLE,
  UNIQUE INDEX `emailid_UNIQUE` (`emailid` ASC) VISIBLE);


CREATE TABLE `bond`.`post` (
  `postid` INT NOT NULL,
  `pg` INT NULL,
  `USER` INT NULL,
  `postdata` VARCHAR(45) NULL,
  `postlink` VARCHAR(255) NULL,
  `likescount` INT NULL,
  `commentscount` INT NULL,
  PRIMARY KEY (`postid`),
  UNIQUE INDEX `postid_UNIQUE` (`postid` ASC) VISIBLE);

CREATE TABLE `bond`.`eventpg` (
  `pgid` INT NOT NULL,
  `adminid` INT NOT NULL,
  `eventname` VARCHAR(45) NULL,
  `location` VARCHAR(255) NULL,
  `description` VARCHAR(45) NULL,
  `createdon` DATE NULL,
  PRIMARY KEY (`pgid`));
  
CREATE TABLE `bond`.`likes` (
  `userid` INT NULL,
  `post` INT NULL);
  
DELIMITER $$
USE `bond`$$
CREATE TRIGGER `likes_BEFORE_INSERT_1` BEFORE INSERT ON `likes` FOR EACH ROW BEGIN
UPDATE `bond`.`post` SET likescount=likescount + 1 WHERE postid=NEW.post;
END$$
DELIMITER ;

  
  


CREATE TABLE `bond`.`comments` (
  `commentedby` INT NOT NULL,
  `onpost` INT NULL,
  `content` VARCHAR(255) NULL);
  
DELIMITER $$
USE `bond`$$
CREATE TRIGGER `comments_BEFORE_INSERT_1` BEFORE INSERT ON `comments` FOR EACH ROW BEGIN
UPDATE `bond`.`post` SET commentscount=commentscount + 1 WHERE postid=NEW.onpost;
END$$
DELIMITER ;



CREATE TABLE `bond`.`image` (
  `frompost` INT NULL,
  `imagesize` VARCHAR(25) NULL);

CREATE TABLE `bond`.`friendlist` (
  `friend1` INT NULL,
  `friend 2` INT NULL);

CREATE TABLE `bond`.`registereduser` (
  `userprofile` INT NULL,
  `eventid` INT NULL);

CREATE TABLE `bond`.`audio` (
  `idpost` INT NULL,
  `audiosize` varchar(20) NULL);

CREATE TABLE `bond`.`text` (
  `postid` INT NULL,
  `textsize` INT NULL,
  INDEX `FK10_idx` (`postid` ASC) VISIBLE,
  CONSTRAINT `FK10`
    FOREIGN KEY (`postid`)
    REFERENCES `bond`.`post` (`postid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

/* USE OF ALTER TO ADD FOREIGN KEYS INTO TABLES */

ALTER TABLE `bond`.`post` 
ADD INDEX `FK1_idx` (`user` ASC) VISIBLE,
ADD INDEX `FK2_idx` (`pg` ASC) VISIBLE;

ALTER TABLE `bond`.`post` 
ADD CONSTRAINT `FK1`
  FOREIGN KEY (`user`)
  REFERENCES `bond`.`profile` (`idprofileid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `FK2`
  FOREIGN KEY (`pg`)
  REFERENCES `bond`.`eventpg` (`pgid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `bond`.`likes` 
ADD INDEX `FK3_idx` (`userid` ASC) VISIBLE,
ADD INDEX `FK4_idx` (`post` ASC) VISIBLE;

ALTER TABLE `bond`.`likes` 
ADD CONSTRAINT `FK3`
  FOREIGN KEY (`userid`)
  REFERENCES `bond`.`profile` (`idprofileid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `FK4`
  FOREIGN KEY (`post`)
  REFERENCES `bond`.`post` (`postid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `bond`.`comments` 
ADD CONSTRAINT `FK5`
  FOREIGN KEY (`commentedby`)
  REFERENCES `bond`.`profile` (`idprofileid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `bond`.`registereduser` 
ADD INDEX `FK6_idx` (`userprofile` ASC) VISIBLE,
ADD INDEX `FK7_idx` (`eventid` ASC) VISIBLE;

ALTER TABLE `bond`.`registereduser` 
ADD CONSTRAINT `FK6`
  FOREIGN KEY (`userprofile`)
  REFERENCES `bond`.`profile` (`idprofileid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `FK7`
  FOREIGN KEY (`eventid`)
  REFERENCES `bond`.`eventpg` (`pgid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `bond`.`image` 
ADD INDEX `FK8_idx` (`frompost` ASC) VISIBLE;

ALTER TABLE `bond`.`image` 
ADD CONSTRAINT `FK8`
  FOREIGN KEY (`frompost`)
  REFERENCES `bond`.`post` (`postid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `bond`.`audio` 
ADD INDEX `FK9_idx` (`idpost` ASC) VISIBLE;

ALTER TABLE `bond`.`audio` 
ADD CONSTRAINT `FK9`
  FOREIGN KEY (`idpost`)
  REFERENCES `bond`.`post` (`postid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
ALTER TABLE `bond`.`eventpg` 
ADD INDEX `FK11_idx` (`adminid` ASC) VISIBLE;


ALTER TABLE `bond`.`eventpg` 
ADD CONSTRAINT `FK11`
  FOREIGN KEY (`adminid`)
  REFERENCES `bond`.`profile` (`idprofileid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `bond`.`comments` 
ADD INDEX `FK59_idx` (`onpost` ASC) VISIBLE;

ALTER TABLE `bond`.`comments` 
ADD CONSTRAINT `FK59`
  FOREIGN KEY (`onpost`)
  REFERENCES `bond`.`post` (`postid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;










