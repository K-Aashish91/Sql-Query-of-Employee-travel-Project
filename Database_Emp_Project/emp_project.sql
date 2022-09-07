drop table login_details;

CREATE TABLE login_details
(
        login_id  VARCHAR2(20) ,
        user_id  VARCHAR2(20) not null,
        password VARCHAR2(20) not null,
        designation VARCHAR2(50) not null,
       CONSTRAINT login_id_pk PRIMARY KEY(login_id)        
);

SELECT * FROM login_details;

create sequence login_details_sequence Start with 100 increment by 1;

Insert into login_details values(login_details_sequence.NEXTVAL, 'emp001', 'emp123', 'Employee');

Insert into login_details values( login_details_sequence.NEXTVAL, 'emp002' , 'emp123', 'Employee');

Insert into login_details values( login_details_sequence.NEXTVAL, 'emp003', 'emp123', 'Employee');

Insert into login_details values( login_details_sequence.NEXTVAL, 'pm001', 'pm123', 'Project_Manager');

Insert into login_details values( login_details_sequence.NEXTVAL, 'dir001', 'dir123', 'Director');

Insert into login_details values( login_details_sequence.NEXTVAL, 'ta001', 'ta123', 'Travel_Agent');


CREATE TABLE slab_details(
             slab_id VARCHAR2(20),
             designation VARCHAR2(20),
             slab NUMBER(20,5),
             CONSTRAINT slab_id_pk PRIMARY KEY(slab_id)
);

SELECT * FROM slab_details;

CREATE SEQUENCE slab_details_sequence START WITH 200 INCREMENT by 1;

INSERT INTO slab_details VALUES(slab_details_sequence.NEXTVAL,'Employee',5000);
INSERT INTO slab_details VALUES(slab_details_sequence.NEXTVAL,'Project_Manager',10000);


CREATE TABLE user_details(
           user_id VARCHAR2(20),
           name VARCHAR2(20) NOT NULL,
           date_of_birth DATE NOT NULL,
           gender VARCHAR2(20) NOT NULL,
           city VARCHAR2(20) NOT NULL,
           state VARCHAR2(20) NOT NULL,
           country VARCHAR2(20) NOT NULL,
           pincode VARCHAR2(20) NOT NULL,
           email VARCHAR2(20) NOT NULL,
           phone VARCHAR2(20) NOT NULL,
           reports_to VARCHAR2(20),
           login_id VARCHAR2(20) NOT NULL,
           slab_id VARCHAR2(20),
           CONSTRAINT  user_id_pk PRIMARY KEY(user_id),
           CONSTRAINT login_id_fk FOREIGN KEY(login_id) REFERENCES login_details(login_id),
            CONSTRAINT slab_id_fk FOREIGN KEY(slab_id) REFERENCES slab_details(slab_id)
);

insert into user_details
values('emp001','Dinesh Rajan','13-NOV-2000','Male','Mumbai','Maharashtra','India','400019','dinesh@gmail.com','9619375749','pm001','100','200');

insert into user_details
values('emp002','Kunal Aakre','06-MAR-1998','Male','Ambernath','Maharashtra','India','421505','kunal@gmail.com','8087023828','pm001','101','200');

insert into user_details
values('emp003','Ashish Kamble','13-JUN-1990','Male','Thane','Maharashtra','India','400028','ashish@gmail.com','98565996596','pm001','102','200');

insert into user_details
values('pm001','Siraj Shaikh','01-JAN-1998','Male','Mumbai','Maharashtra','India','400070','siraj@gmail.com','8498494954','dir001','103','201');

insert into user_details
values('dir001','Vivek Gohil','02-OCT-1965','Male','Gujarat','Maharashtra','India','542614','vivek@gmail.com','4874989789',null,'104',null);

insert into user_details
values('ta001','Amit Rana','02-SEP-1965','Male','Banaras','UP','India','542634','amit@gmail.com','4554989679',null,'105',null);



SELECT * FROM user_details;

drop table request_details;
drop sequence request_details_sequence;

CREATE TABLE request_details(
             request_id VARCHAR2(20) NOT NULL,
             user_id VARCHAR2(20) NOT NULL,
             mode_of_travel VARCHAR2(20) NOT NULL,
            mode_of_stay VARCHAR2(20) NOT NULL,
            departure_Date DATE NOT NULL,
            departure_destination VARCHAR2(50) NOT NULL,
            arrival_date DATE NOT NULL,
            arrival_destination VARCHAR2(30) NOT NULL,
            purpose_of_travelling VARCHAR2(100) NOT NULL,
            doc_id VARCHAR2(20) NOT NULL,
            status VARCHAR2(20),	
            CONSTRAINT request_id_pk PRIMARY KEY(request_id),
            CONSTRAINT user_id_fk FOREIGN KEY(user_id) REFERENCES user_details(user_id),
            CONSTRAINT doc_id_fk FOREIGN KEY(doc_id) REFERENCES document_details(doc_id)
);

SELECT * FROM request_details;

create sequence request_details_sequence start with 300 increment by 1;

insert into request_details
values('R'||request_details_sequence.NEXTVAL,'emp001','Train','3-Star-AC','08-AUG-2022','Mumbai','10-AUG-2022','Delhi','training','D500',null);

insert into request_details
values('R'||request_details_sequence.NEXTVAL,'pm001','Flight','5-Star-Non-AC','08-SEP-2022','Banglore','10-SEP-2022','Mumbai','project','D501',null);

insert into request_details
values('R'||request_details_sequence.NEXTVAL,'emp002','Train','5-Star-AC','01-AUG-2022','Pune','10-AUG-2022','Delhi','training','D500',null);

insert into request_details
values('R'||request_details_sequence.NEXTVAL,'emp003','Flight','3-Star-AC','22-AUG-2022','Mumbai','28-AUG-2022','Banglore','Business Meeting','D501',null);

insert into request_details
values('R'||request_details_sequence.NEXTVAL,'pm001','Train','5-Star-AC','18-AUG-2022','Mumbai','25-AUG-2022','Delhi','project','D501',null);

update request_details set status='pending' where departure_destination='Pune';

CREATE TABLE document_details(
doc_id VARCHAR2(20) NOT NULL,
doc_name VARCHAR2(40) NOT NULL,
doc_type VARCHAR2(40) NOT NULL,
uploaded_file BLOB,
CONSTRAINT doc_id_pk PRIMARY KEY(doc_id)
);

CREATE SEQUENCE document_details_sequence START WITH 500 INCREMENT by 1;

SELECT * FROM document_details;

INSERT INTO document_details VALUES('D'||document_details_sequence.NEXTVAL,'Aadhaar Card','.pdf',null);
INSERT INTO document_details VALUES('D'||document_details_sequence.NEXTVAL,'Pan Card','.docx',null);
INSERT INTO document_details VALUES('D'||document_details_sequence.NEXTVAL,'Passport Card','.pdf',null);

update document_details set doc_name='Passport' where doc_id='D502';

drop table document_details;
drop sequence document_details_sequence;


CREATE TABLE booking_details(
             booking_id VARCHAR2(20) NOT NULL,
             request_id VARCHAR2(20) NOT NULL,
             pnr_no VARCHAR2(20) NOT NULL,
             flight_name VARCHAR2(20) NOT NULL,
             hotel_name VARCHAR2(50) NOT NULL,
             travel_cost NUMBER(30) NOT NULL,
             accomodation_cost NUMBER(30) NOT NULL,
             departure_time VARCHAR2(20) NOT NULL,
             arrival_time  VARCHAR2(20) NOT NULL,
             room_type VARCHAR2(20) NOT NULL,
             check_in VARCHAR2(20) NOT NULL,
             check_out VARCHAR2(20) NOT NULL,
             CONSTRAINT booking_id_pk PRIMARY KEY(booking_id),
             CONSTRAINT request_id_fk FOREIGN KEY(request_id) REFERENCES request_details(request_id)         
                
);


alter table booking_details drop column travel_cost;

SELECT * FROM booking_details;

CREATE SEQUENCE booking_details_sequence 
START WITH 400 INCREMENT by 1;

INSERT INTO booking_details
VALUES ('B'||booking_details_sequence.NEXTVAL,'R300','PNR1234','Spice Travels','Taj',1200,1000,'17:30','18:40','3-Star-AC','09-AUG-2022:19:30','10-AUG-2022:10:30');

INSERT INTO booking_details
VALUES ('B'||booking_details_sequence.NEXTVAL,'R301','PNR134','IndigoTravels','Oberoi',1000,800,'17:30','18:40','3-Star-AC','09-AUG-2022:19:30','10-AUG-2022:10:30');

INSERT INTO booking_details
VALUES ('B'||booking_details_sequence.NEXTVAL,'R302','PNR1444','Rajdhani','Solaitre','14:30','19:40','5-Star-AC','09-AUG-2022:19:30','10-AUG-2022:10:30');

INSERT INTO booking_details
VALUES ('B'||booking_details_sequence.NEXTVAL,'R304','PNR1213','Rajdhani','Lotus','14:30','19:40','3-Star-AC','21-AUG-2022:13:30','25-AUG-2022:15:30');

INSERT INTO booking_details
VALUES ('B'||booking_details_sequence.NEXTVAL,'R302','PNR2134','Duranto','West-In','10:30','18:20','5-Star-AC','11-AUG-2022:20:30','15-AUG-2022:11:30');

COMMIT;

SELECT * FROM login_details;
SELECT * FROM slab_details;
SELECT * FROM booking_details;
SELECT * FROM user_details;
SELECT * FROM document_details;
SELECT * FROM request_details;

alter table request_details drop column mode_of_stay;

gre

DROP table login_details;
DROP table slab_details;
DROP table booking_details;
DROP table user_details;
DROP table document_details;
DROP table request_details;