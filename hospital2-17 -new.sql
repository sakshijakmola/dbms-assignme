create database SmaxHospital2017;
use SmaxHospital2017;

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

-- drop table PatientAgeData;
create table PatientAgeData(
patientID int,
foreign key (patientID) references PatientDetail (patientID),
referralDate Date,
dateOfBirth Date
)engine=InnoDB;
-- drop table refreetype;
create table refreeType(
refreetypeID int auto_increment primary key,
refreeType varchar(30)
) engine=InnoDB;

create table Refree(
refreeID integer auto_increment primary key,
refreeFirstName varchar(50),
refreeLastName varchar(50),
refreetypeID int,
foreign key (refreetypeID) references refreetype (refreetypeID)
)engine=InnoDB;


create table Department(
deptID integer auto_increment primary key,
departmentName varchar(50)
)engine=InnoDB;

create table Surgeon(
surgeonID integer auto_increment primary key,
surgeonFirstName varchar(50),
surgeonLastName varchar (50),
patientID int,
foreign key (patientID) references PatientDetail (PatientID),
deptID int,
foreign key (deptID) references Department (deptID)
) engine= InnoDB;


create table ReferralData(
refreeID int,
foreign key (refreeID) references Refree (refreeID),
waitlistDate Date,
firstAppointDate Date,
refreetypeID int,
 foreign key (refreetypeID) references refreetype (refreetypeID),
patientID int,
foreign key (patientID) references PatientDetail (PatientID),
surgeonID int,
foreign key (surgeonID) references Surgeon(surgeonID)
) engine=InnoDB;