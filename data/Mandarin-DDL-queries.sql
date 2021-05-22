CREATE TABLE users (
  userId INT NOT NULL AUTO_INCREMENT,
  userName VARCHAR(45) NOT NULL,
  userSurname VARCHAR(45) NOT NULL,
  userEmail VARCHAR(45) NOT NULL,
  password VARCHAR(45) NOT NULL,
  phone VARCHAR(45) NOT NULL,
  PRIMARY KEY (userId, userEmail));
  
  --------------------------------------------------------
 
  CREATE TABLE bronCoach (
  bronId INT NOT NULL AUTO_INCREMENT,
  userId INT NOT NULL,
  bronDate DATE NOT NULL,
  sectionId INT NOT NULL,
  PRIMARY KEY (bronId));
  
  CREATE TABLE sportSection (
  sectionId INT NOT NULL AUTO_INCREMENT,
  coachId INT NOT NULL,
  sectionName VARCHAR(500) NOT NULL,
  price INT NOT NULL,
  sectionAddress VARCHAR(500) NOT NULL,
  worktime VARCHAR(45) NOT NULL,
  description VARCHAR(255),
  sportId INT NOT NULL,
  phone VARCHAR(45),
  PRIMARY KEY (sectionId));
  
  --------------------------------------------------------
  
  CREATE TABLE sport (
  sportId INT NOT NULL AUTO_INCREMENT,
  sportName VARCHAR(45) NOT NULL,
  PRIMARY KEY (sportId));
  
  --------------------------------------------------------
  
  CREATE TABLE coach (
  coachId INT NOT NULL AUTO_INCREMENT,
  coachName VARCHAR(45) NOT NULL,
  coachSurname VARCHAR(45) NOT NULL,
  PRIMARY KEY (coachId));
  
  --------------------------------------------------------
  
  CREATE TABLE comments (
  commentsId INT NOT NULL AUTO_INCREMENT,
  playgroundId INT NOT NULL,
  userId INT NOT NULL,
  commText VARCHAR(255) NOT NULL,
  zvezda DOUBLE NOT NULL,
  commDate DATE NOT NULL,
  PRIMARY KEY (commentsId));
  
  --------------------------------------------------------
  
  CREATE TABLE bron (
  bronId INT NOT NULL AUTO_INCREMENT,
  userId INT NOT NULL,
  bronDate DATE NOT NULL,
  playgroundId INT NOT NULL,
  PRIMARY KEY (bronId));
  
  CREATE TABLE playground (
  playgroundId INT NOT NULL AUTO_INCREMENT,
  playgroundName VARCHAR(45) NOT NULL,
  playgroundAddress VARCHAR(85) NOT NULL,
  price INT NOT NULL,
  sportId INT NOT NULL,
  workTime VARCHAR(45) NOT NULL,
  description VARCHAR(155),
  phone VARCHAR(45),
  PRIMARY KEY (playgroundId));
  
 ---------------------------------------------------------
 
 CREATE TABLE specification (
  playgroundId INT NOT NULL,
  width INT NOT NULL,
  height INT NOT NULL,
  cover BOOLEAN NOT NULL,
  roofType VARCHAR(45) NULL,
  duw BOOLEAN ,
  razdevalka BOOLEAN,
  parkovka BOOLEAN ,
  tribuny BOOLEAN);
