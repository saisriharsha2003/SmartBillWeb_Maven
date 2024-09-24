drop table consumer;
drop table bill;
drop table complaint;
drop table login;
drop table payment;

select * from consumer;
select * from bill;
select * from complaint;
select * from login;
select * from payment;

drop table consumer_details;
select * from consumer_details;

create table consumer_details(meter_number varchar(10));
INSERT INTO consumer_details (meter_number)
VALUES 
    ( 'MTRX9012'),
    ('MTRY3456'),
    ( 'MTRZ7890'),
    ( 'MTRW4567'),
    ( 'MTRV1234'),
    ('MTRU5678'),
    ('MTRT8901'),
    ( 'MTRS2345'),
    ('MTRR6789'),
    ('MTRQ0123');

-- registration or consumer table
CREATE TABLE CONSUMER (
		CONSUMER_ID BIGINT NOT NULL primary key,
		METER_NUMBER VARCHAR(20),
		TITLE VARCHAR(20),
		CONSUMER_NAME VARCHAR(100),
		EMAIL VARCHAR(50),
		MOBILE BIGINT,
		GENDER VARCHAR(20),
		USER_NAME VARCHAR(50),
		PASSWORD VARCHAR(50));

-- login table
create table login (
		username varchar(50) primary key,
		password varchar(50),
		consumer_id bigint,
		status varchar(20)
);

-- admin table
create table admin_login (
		username varchar(50) primary key,
		password varchar(50));
		
insert into admin_login values('admin', 'Harsha@2005');

-- bill table
CREATE TABLE BILL (
		BILL_NUMBER INTEGER NOT NULL primary key,
		DUE_AMOUNT DOUBLE,
		BILL_AMOUNT DOUBLE,
		DUE_DATE VARCHAR(20),
		PENALTY DOUBLE,
		STATUS VARCHAR(20),
		METER_NUMBER VARCHAR(20));


-- payment table
CREATE TABLE PAYMENT (
		TRANSACTION_NUMBER INTEGER NOT NULL primary key,
		BILL_NUMBER INTEGER,
		PAID_AMOUNT DOUBLE,
		TRANSACTION_MODE VARCHAR(50),
		TRANSACTION_DATE VARCHAR(50),
		CONSUMER_ID BIGINT,
		METER_NUMBER VARCHAR(20));
		
-- complaint table
CREATE TABLE COMPLAINT (
		COMPLAINT_ID INTEGER NOT NULL primary key,
		LANDMARK VARCHAR(50),
		SERVICE VARCHAR(50),
		CATEGORY VARCHAR(50),
		MOBILE BIGINT,
		CONTACT VARCHAR(50),
		PROBLEM VARCHAR(200),
		ADDRESS VARCHAR(200),
		COMPLAINT_STATUS VARCHAR(200),
		CONSUMER_ID BIGINT);


alter table bill
add constraint fk_bill
foreign key (meter_number)
references consumer (meter_number);

alter table complaint
add constraint fk_complaint
foreign key (consumer_id)
references consumer (consumer_id);

alter table payment
add constraint fk_payment
foreign key (bill_number)
references bill (bill_number);

alter table login
add constraint fk_login
foreign key (consumer_id)
references consumer (consumer_id);

