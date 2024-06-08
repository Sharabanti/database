create database school_Database_management;

create table parents(
Id int PRIMARY key auto_increment,
Name varchar(20),
Phone_number varchar(14)
)
INSERT INTO `parents` (`Id`, `Name`, `Phone_number`)
VALUES (NULL, 'kamena', '346745692'), (NULL, 'kaberi', '47238769');

create table classes(
Id int PRIMARY key auto_increment,
class_level varchar(10)
)
INSERT INTO `classes` (`Id`, `class_level`) VALUES (NULL, '5'), (NULL, '6');

create table students(
Id int PRIMARY key auto_increment,
Name varchar(20),
date_of_birth time,
class_id int,
FOREIGN key (class_id) REFERENCES classes(Id),
parent_id int,
FOREIGN key (parent_id) REFERENCES parents(Id),
address varchar(100),
Phone_number varchar(14)
)
INSERT INTO `students` (`Id`, `Name`, `date_of_birth`, `class_id`, `parent_id`, `address`, `Phone_number`) 
VALUES (NULL, 'korobi', '2000/02/02', '1', '2', 'dhaka', '4576854'), (NULL, 'abir', '2007/08/08', '2', '1', 'khulna', '46678746');
 ---------------------- 
create table subject(
Id int PRIMARY key auto_increment,
subject_name varchar(10)
)

INSERT INTO `subject` (`Id`, `subject_name`) VALUES (NULL, 'math 5'), (NULL, 'math 6');


create table teacher(
Id int PRIMARY key auto_increment,
name varchar(20),
Designation varchar(20),
address varchar(20),
contact_number varchar(20)
)
INSERT INTO teacher (`Id`, `name`, `Designation`, `address`, `contact_number`)
VALUES (NULL, 'shacin', 'lecturer', 'dhaka', '4582802'), (NULL, 'md. salam', 'assistant teacher', 'cumilla', '38723467');

create table courses(
Id int PRIMARY key auto_increment,
course_name varchar(20),
class_id int,
FOREIGN key (class_id) REFERENCES classes(Id),
teacher_id int,
FOREIGN key (teacher_id) REFERENCES teacher(Id)
)
INSERT INTO `courses` (`Id`, `course_name`, `class_id`, `teacher_id`) 
VALUES (NULL, 'math 6', '2', '2'), (NULL, 'math5', '1', '1');

create table Attendence(
Id int PRIMARY key auto_increment,
student_id int,
FOREIGN key (student_id) REFERENCES students(Id),
course_id int,
FOREIGN key (course_id) REFERENCES courses(Id),
present enum ('yes','no')
)
INSERT INTO `attendence` (`Id`, `student_id`, `course_id`, `present`) 
VALUES (NULL, '1', '2', 'yes'), (NULL, '2', '1', 'yes');

create table notice(
Id int PRIMARY key auto_increment,
tittle varchar(20),
description varchar(100),
publishing_date datetime DEFAULT CURRENT_TIMESTAMP,
attachment varchar(200)
)
INSERT INTO `notice` (`Id`, `tittle`, `description`, `publishing_date`, `attachment`) 
VALUES (NULL, 'admission circular', 'to admite students', '2024-06-04 22:27:20', 'hddhsdahdh http//');

create table room(
Id int PRIMARY key auto_increment,
Name varchar(20),
location varchar(20)
)
INSERT INTO `room` (`Id`, `Name`, `location`) 
VALUES (NULL, '203 A', '1st floor'), (NULL, '304B', '2nd floor');

create table class_room(
Id int PRIMARY key auto_increment,
class_id int,
FOREIGN key (class_id) REFERENCES classes(Id),
room_id int,
FOREIGN key (room_id) REFERENCES room(Id)
)
INSERT INTO `class_room` (`Id`, `class_id`, `room_id`) 
VALUES (NULL, '1', '1'), (NULL, '2', '2');

create table routine(
Id int PRIMARY key auto_increment,
class_id int,
FOREIGN key (class_id) REFERENCES classes(Id),
day varchar(10),
class_time varchar (10)
)
INSERT INTO `routine` (`Id`, `class_id`, `day`, `class_time`) 
VALUES (NULL, '1', 'sunday', '9- 12AM'), (NULL, '2', 'monday', '3-6pm');

create table Exam(
Id int PRIMARY key auto_increment,
exam_name varchar(20),
total_marks varchar(20),
obtained_marks varchar(20),
student_id int,
FOREIGN key (student_id) REFERENCES students(Id)
)
INSERT INTO `exam` (`Id`, `exam_name`, `total_marks`, `obtained_marks`, `student_id`) 
VALUES (NULL, 'MID TERM', '60', '45', '2'), (NULL, 'mid term', '60', '40', '1');


create table student_courses(
Id int PRIMARY key auto_increment,
student_id int,
FOREIGN key (student_id) REFERENCES students(Id),
course_id int,
FOREIGN key (course_id) REFERENCES courses(Id)
)

INSERT INTO student_courses (`Id`, `student_id`, `course_id`) 
VALUES (NULL, '2', '2'), (NULL, '1', '1');