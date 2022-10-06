drop table if exists owners2;
drop table if exists pets2;
	


------------ PRIMARY KEY ------------

--Create table with owner id having primary key constraint
create table "owners2" (
    ownerid integer primary key,
    name varchar(100),
    city varchar(100)
);
    
---select
select * from owners2;

--Insert record - sample
insert into owners2 values(6049, 'Debbbie','SF');

---select
select * from owners2;

--Insert duplicate record 
insert into owners2 values(6049, 'Mary','LA');

--Insert record with null value for owner id
insert into owners2 values(null, 'Mary','LA');

--add another column with primary key constraint
alter table owners2 
add id int primary key ;


------------ UNIQUE KEY ------------

drop table if exists owners2;

create table owners2 (
    ownerid integer primary key,
    name varchar(100),
    city varchar(100),
    emailid varchar(100) unique,
    mobile_number varchar(20) unique
);

insert into owners2 values 	(6049, 'Debbbie','Grand Rapids','debbie000@abc.com',''),
						(2863, 'John','Davison','john@fff.com','9876123'),
						(3518, 'Connie','Bloomfield Township',null,'865468'),
						(3663, 'Lena','Traverse City','lena@345.com','098767'),
						(1070, 'Jessica','Southfield','nkl@fmail.com','123123'),
						(7101, 'Bessie','Rochester',null,null),
						(2419, 'Mary','Kalamazoo',null,'32456'),
						(6194, 'Luisa','Southfield','lusia@coldmail.com',null),	
						(5833, 'Karen','GrandRapids',null,null),
						(9614, 'Carmen','Detroit','carmen@hooray.in',null);
						
select * from owners2;
--we can see null values in emailid and mobile number column which means that the owner decided not to give these details

--Let's try inserting a new row with null values
insert into owners2 values(1234, 'Cody','San Francisco','cody@yipee.com',null);

select * from owners2;

--let's try another row which has same email as Cody's
insert into owners2 values(1345, 'Cody2','San Francisco','cody@yipee.com',null);
--throws an error that cody's email id already exists
--trying the same with mobile number

insert into owners2 values(18976, 'Diane','San Francisco',null,'8906856');
select * from owners2;

--Suppose diane wants her email id to be updated and the DBA tries to create a new user for her
insert into owners2 values(18907, 'Diane','San Francisco','diane2@yipee.com','8906856');
--mobile number already exists

--use instead
update owners2 
set emailid = 'diane2@yipee.com'
where mobile_number = '8906856';
select * from owners2;



------------ FOREIGN KEY ------------

drop table if exists pets2;

-- Adding foreign key to the ownerid field
-- The foreign key references to the ownerid field of 'owners2' table
create table pets2 (
    petid integer primary key,
    name varchar(100),
    age integer,
    type varchar(50),
    ownerid integer,
    CONSTRAINT fk_owner
    		FOREIGN KEY (ownerid) 	
    			references owners2(ownerid)
);

-- drop existing foreign key constraints
ALTER TABLE pets2
DROP CONSTRAINT fk_owner;

-- add a new foreign key constraint
ALTER TABLE pets2
ADD CONSTRAINT fk_owner
FOREIGN KEY (ownerid)
REFERENCES owners2(ownerid);

-- bulk inserting values
insert into pets2 values 	(111, 'Little bow bow',2,'cat', 1234),
						(122, 'Hitler',12,'dog', 18976),
						(124, 'Sherlock',5,'dog', 18976),
						(131, 'Satan',3,'cat', 1070);

select * from pets2;

-- Insertion Error because owner with id 1111 does not exist
INSERT INTO pets2
VALUES (142, 'Leo',6,'dog', 1111);

-- passing null value
INSERT INTO pets2
VALUES (142, 'Leo',6,'dog', null);

select * from pets2;

-- Again the same insertion error
UPDATE pets2
set ownerid = 1234
where petid = 142;

select * from pets2;

-- The following statement deletes the owner id 1 from the owners2 table:
DELETE FROM owners2
WHERE ownerid = 1234;
-- PostgreSQL issues a constraint violation  ON DELETE NO ACTION
-- because the referencing rows of the owner id 1234 still exist in the pets2 table