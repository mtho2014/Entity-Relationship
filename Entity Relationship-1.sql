CREATE TABLE `High_School` (
  `School_Name` varchar(255) PRIMARY KEY,
  `address` varchar(255),
  `phone` int,
  `year_built` int,
  `sq_footage` int
);

CREATE TABLE `Subjects` (
  `Subject_Number` int PRIMARY KEY,
  `Subject_Name` varchar(255),
  `Grade_Level` int,
  `Year_Introduced` int
);

CREATE TABLE `Teachers` (
  `Employee_Number` int PRIMARY KEY,
  `Teacher_Name` varchar(255),
  `Year_Hired` int,
  `Age` int,
  `Subject` varchar(255),
  `Previous_School` varchar(255),
  `Education_Background` varchar(255),
  `Supervisor` varchar(255),
  `University_Attended` varchar(255)
);

CREATE TABLE `Students` (
  `Student_Number` int PRIMARY KEY,
  `Student_Name` varchar(255),
  `Home_Address` varchar(255),
  `Home_Phone` int,
  `Age` int,
  `Current_Grade` varchar(255),
  `Teacher` varchar(255),
  `Year_Taught` int
);

CREATE TABLE `Administrators` (
  `Employee_Number` int PRIMARY KEY,
  `Admin_Name` varchar(255),
  `Rank` varchar(255),
  `Office_Phone` int,
  `Cell_Phone` int
);

CREATE TABLE `Previous_School` (
  `Prev_School_Name` varchar(255) PRIMARY KEY,
  `Year_Hired` int,
  `Highest_Pay_Rate` int
);

CREATE TABLE `University_Attended` (
  `University_Name` varchar(255) PRIMARY KEY,
  `Year_Founded` int,
  `Website` varchar(255),
  `Address` varchar(255),
  `Degrees_Earned` varchar(255),
  `Year_Degree_Earned` int
);

ALTER TABLE `Teachers` ADD FOREIGN KEY (`Employee_Number`) REFERENCES `High_School` (`School_Name`);

ALTER TABLE `University_Attended` ADD FOREIGN KEY (`Degrees_Earned`) REFERENCES `Teachers` (`Employee_Number`);

ALTER TABLE `University_Attended` ADD FOREIGN KEY (`University_Name`) REFERENCES `Teachers` (`Employee_Number`);

ALTER TABLE `Subjects` ADD FOREIGN KEY (`Subject_Number`) REFERENCES `Teachers` (`Employee_Number`);

ALTER TABLE `Students` ADD FOREIGN KEY (`Student_Number`) REFERENCES `Teachers` (`Employee_Number`);

ALTER TABLE `Subjects` ADD FOREIGN KEY (`Subject_Number`) REFERENCES `Students` (`Student_Number`);

ALTER TABLE `Students` ADD FOREIGN KEY (`Student_Number`) REFERENCES `High_School` (`School_Name`);

ALTER TABLE `Administrators` ADD FOREIGN KEY (`Employee_Number`) REFERENCES `High_School` (`School_Name`);

ALTER TABLE `Subjects` ADD FOREIGN KEY (`Subject_Number`) REFERENCES `High_School` (`School_Name`);

ALTER TABLE `Previous_School` ADD FOREIGN KEY (`Prev_School_Name`) REFERENCES `Teachers` (`Employee_Number`);

ALTER TABLE `Teachers` ADD FOREIGN KEY (`Supervisor`) REFERENCES `Administrators` (`Employee_Number`);
