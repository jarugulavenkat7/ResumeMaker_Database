-- RESUME_DATABASE SCRIPT
-- Venkat Sai Jarugula

DROP DATABASE RESUME_DATABASE;
CREATE DATABASE RESUME_DATABASE;
USE RESUME_DATABASE;



CREATE TABLE IMAGE_DETAILS (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  pic_byte blob,
  type varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ;


CREATE TABLE ADDRESS_DETAILS (
  id int(11) NOT NULL AUTO_INCREMENT,
  address_line1 varchar(255) DEFAULT NULL,
  address_line2 varchar(255) DEFAULT NULL,
  city varchar(255) DEFAULT NULL,
  country varchar(255) DEFAULT NULL,
  pincode varchar(255) DEFAULT NULL,
  state varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
); 

CREATE TABLE CONTACT_DETAILS (
  id int(11) NOT NULL AUTO_INCREMENT,
  email varchar(255) DEFAULT NULL,
  phone_number varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ;

CREATE TABLE PERSONAL_DETAILS (
  id int(11) NOT NULL AUTO_INCREMENT,
  first_name varchar(255) DEFAULT NULL,
  last_name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ;

CREATE TABLE RESUME(
  id int(11) NOT NULL AUTO_INCREMENT,
  address_details_id int(11) DEFAULT NULL unique,
  contact_details_id int(11) DEFAULT NULL unique,
  personal_details_id int(11) DEFAULT NULL unique,
  image_details_id int(11) DEFAULT NULL unique,
  PRIMARY KEY (id),
  FOREIGN KEY (personal_details_id) REFERENCES personal_details (id),
  FOREIGN KEY (address_details_id) REFERENCES address_details (id),
  FOREIGN KEY (contact_details_id) REFERENCES contact_details (id),
  FOREIGN KEY (image_details_id) REFERENCES image_details (id)
);

CREATE TABLE ACADEMIC_DETAILS (
  id int(11) NOT NULL AUTO_INCREMENT,
  course_name varchar(255) DEFAULT NULL,
  gpa_or_percentage double NOT NULL,
  institution_name varchar(255) DEFAULT NULL,
  university_or_board varchar(255) DEFAULT NULL,
  year_of_passing varchar(255) DEFAULT NULL,
  resume_fk int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (resume_fk) REFERENCES resume(id)
); 

CREATE TABLE WORK_EXPERIENCE_DETAILS (
	id int(11) NOT NULL AUTO_INCREMENT,
  employeer varchar(255) DEFAULT NULL,
  end_date varchar(255) DEFAULT NULL,
  start_date varchar(255) DEFAULT NULL,
  resume_fk int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (resume_fk) REFERENCES resume (id)
);




