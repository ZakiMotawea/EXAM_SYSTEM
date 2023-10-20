
create table Student(
	Student_ID int primary key,
	S_Fname varchar(20),
	S_Lname varchar(20),
	Address varchar(100),
	Phone int,
	Gender varchar(20),
	Email varchar(150),
	Birth date,
	Education varchar(200),
	Graduation_year varchar(5),
	Grade_Faculty varchar(20),
	Start_Date date,
	End_Date date,
	Dept_id int,
	Branch_id int
)


alter table student drop column Phone

alter table student add Phone varchar(12)

alter table Student add constraint c11212 foreign key(Dept_id) references Department(Dept_id)

alter table Student add constraint c2124 foreign key(Branch_id) references Branch(Branch_ID)



create table Course(
	Crs_id int primary key,
	Name varchar(50),
	Duration int,
	Fees int,
	Credit_Hour int,
	Topic_id int
)

alter table Course add constraint c193 foreign key(Topic_id) references Topic(Topic_id)




create table Instructor(
	Ins_id int primary key,
	Name varchar(50),
	Address varchar(100),
	Phone int,
	Gender varchar(20),
	Email varchar(150),
	BirthDate date,
	Education varchar(200),
	Position varchar(100),
	Company varchar(100),
	Salary int,
	Dept_id int
)

alter table Instructor add constraint c1122 foreign key(Dept_id) references Department(Dept_id)


Department Dept_id, name, Ins_id

create table Department(
	Dept_id int primary key,
	Name varchar(200),
	Ins_id int
)

alter table Department add constraint c1121 foreign key(Ins_id) references Instructor(Ins_id)


create table Branch(
	Branch_ID int primary key,
	Name varchar(50),
	Location varchar(50),
	Longitude decimal(12,9),
	Latitude decimal(12,9),
	Ins_Id int
	constraint c11111 foreign key(Ins_Id) references Instructor(Ins_Id)
)


create table Exam(
	Exam_ID int primary key,
	Name varchar(100),
	Number_Of_Questions int,
	Duration int,
	Status varchar(20),
	Fees int
)

create table Questions(
	Question_ID int primary key ,
	Question varchar(1000),
	Answer varchar(100),
	Type varchar(50),
	Choice_A varchar(100),
	Choice_B varchar(100) ,
	Choice_C varchar(100),
	Difficulty varchar(50),
	Crs_ID int
)

alter table questions add constraint c1111 foreign key(Crs_ID) references Course(Crs_ID)


create table Exam_Question(
	Exam_ID int,
	Question_ID int,
	constraint c11221 primary key(Exam_ID ,Question_ID),
	constraint c2442 foreign key(Exam_ID) references Exam(Exam_ID),
	constraint c364 foreign key(Question_ID) references Questions(Question_ID)
)


create table Student_Question(
	Student_ID int,
	Question_ID int ,
	constraint c1123 primary key(Student_ID ,Question_ID),
	constraint c2123 foreign key(Question_ID) references Questions(Question_ID),
	constraint c3211 foreign key(Student_ID) references Student(Student_ID)
)



create table Exam_Student(
	Student_ID int ,
	Exam_ID int,
	Date date,
	Grade float,
	constraint c21211 primary key(Student_ID ,Exam_ID),
	constraint c2121 foreign key(Student_ID) references Student(Student_ID),
	constraint c33312 foreign key(Exam_ID) references Exam(Exam_ID)
)


create table Student_Course(
	Student_ID int,
	Course_ID int ,
	constraint c1222 primary key(Student_ID ,Course_ID),
	constraint c2232 foreign key(Student_ID) references Student(Student_ID),
	constraint c3343 foreign key(Course_ID) references Course(Crs_id)
)



create table Topic_Department(
	Topic_ID int,
	Dept_ID int ,
	constraint c111 primary key(Topic_ID ,Dept_ID),
	constraint c222 foreign key(Topic_ID) references Topic(Topic_ID),
	constraint c333 foreign key(Dept_ID) references Department(Dept_ID)
)


create table Instructor_Course(
	Ins_id int,
	Crs_id int ,
	constraint c100 primary key(Ins_id ,Crs_id),
	constraint c200 foreign key(Ins_id) references Instructor(Ins_id),
	constraint c300 foreign key(Crs_id) references Course(Crs_id)
)



create table Evaluate(
	Ins_ID int,
	Student_ID int,
	Crs_ID int,
	Evaluation varchar(50),
	constraint c10 primary key(Ins_id ,Crs_id,Student_ID),
	constraint c20 foreign key(Ins_id) references Instructor(Ins_id),
	constraint c30 foreign key(Crs_id) references Course(Crs_id),
	constraint c40 foreign key(Student_ID) references Student(Student_ID)
)


create table Topic(
	Topic_ID int primary key,
	name varchar(100)
)


create table Offer(
	Offer_ID int primary key,
	Location varchar(10),
	Salary int, 
    HireDate date,
	Position varchar(100),
	Status varchar(20),
	Company_Type varchar(100),
	Company_Name varchar(100),
	Student_ID int,
	constraint c1 foreign key(Student_ID) references Student(Student_ID)
)









