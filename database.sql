DROP DATABASE RealTime_Messenger;
CREATE DATABASE RealTime_Messenger;
USE RealTime_Messenger;

CREATE TABLE Users(
    Id int AUTO_INCREMENT,
    First_Name varchar(100),
    Last_Name varchar(100),
    Gender varchar(50),
    Birth_Date date,
    Email varchar(100),
    Password varchar(100),
    Created_At timestamp DEFAULT CURRENT_TIMESTAMP,
    Updated_At timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Id)
);

CREATE TABLE Room(
    Id int AUTO_INCREMENT,
    Name varchar(100),
    Created_At timestamp DEFAULT CURRENT_TIMESTAMP,
    Updated_At timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Id)
);

CREATE TABLE Users_Room(
    Id int AUTO_INCREMENT,
    Room_Id int,
    User_Id int,
    Created_At timestamp DEFAULT CURRENT_TIMESTAMP,
    Updated_At timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Id),
    FOREIGN KEY (Room_Id) REFERENCES Room(Id),
    FOREIGN KEY (User_Id) REFERENCES Users(Id)
);

CREATE TABLE Message(
    Id int AUTO_INCREMENT,
    Room_Id int,
    User_Id int,
    Body varchar(255),
    Created_At timestamp DEFAULT CURRENT_TIMESTAMP,
    Updated_At timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Id),
    FOREIGN KEY (Room_Id) REFERENCES Room(Id),
    FOREIGN KEY (User_Id) REFERENCES Users(Id)
);