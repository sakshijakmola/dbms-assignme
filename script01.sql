create database Sysmex2017;
use Sysmex2017;

create table PatientDetail(
patientID integer auto_increment primary key,
patientFirstName varchar(50),
patientLastName varchar(50),
Gender char(6),
healthTargetEligible char(3)
) engine=InnoDB;

-- drop table PatientConfidential;

create table PatientConfidential(
patientID int,
nHI char(10),
foreign key (patientID) references PatientDetail (patientID)
)engine=InnoDB;

create table PatientAgeData(
patientID int,
foreign key (patientID) references PatientDetail (patientID),
referralDate Date,
dateOfBirth Date,
ageAtReferral integer(3)
)engine=InnoDB;

create table Refree(
patientID int,
refreeID integer auto_increment primary key,
refreeFirstName varchar(50),
refreeLastName varchar(50),
foreign key (patientID) references PatientDetail (patientID)
)engine=InnoDB;

create table refreeType(
refreeID int,
foreign key (refreeID) references Refree (refreeID),
refreeType varchar(30)
) engine=InnoDB;

create table Department(
deptID integer auto_increment primary key,
departmentName varchar(50)
)engine=InnoDB;

create table Surgeon(
patientID int,
deptID int,
surgeonID integer auto_increment primary key,
surgeonFirstName varchar(50),
surgeonLastName varchar (50),
 foreign key (patientID) references PatientDetail (PatientID),
foreign key (deptID) references Department (deptID)
) engine= InnoDB;

-- drop table ReferralData;

create table ReferralData (
refreeID int,
patientID int,
surgeonID int,
foreign key (refreeID) references Refree (refreeID),
foreign key (patientID) references PatientDetail (PatientID),
foreign key (surgeonID) references Surgeon(surgeonID),
waitlistDate Date,
firstAppointDate Date,
daysFromReferral integer
) engine=InnoDB;