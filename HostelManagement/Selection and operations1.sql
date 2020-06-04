use dmdd_finals;
# Selecting all the records from the tables
select * from hostel;
select * from hostel_manager;
select * from message;
select * from room;
select * from student;
select * from application;

# Selecting a particular field from a table
select application_id from application;

#selecting the records using where condition
select * from hostel where hostel_id>=10;

#selecting records using group by
select fname,lname from student where student_id<10 group by student_id;

#selecting records using order by
select hostel_man_id,username,fname,lname from hostel_manager where hostel_man_id>5 
order by hostel_man_id;

#selecting records using having
 select * from room  group by room_id having room_id>15 order by room_id;
 
 #restrictingh the number of records using limit in descending order
 select * from hostel where hostel_id>=8 order by hostel_id asc limit 10;
 
#using alias 
select concat(fname,"",lname) as fullname from student;