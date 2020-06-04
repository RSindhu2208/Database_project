use dmdd_finals;

# 1
create view simple_view as
select student_id, fname, lname from student;

select * from simple_view;

# 2
create view average as
select a.application_id, s.student_id, s.fname from 
application a, student s
where s.student_id=a.student_id;

select * from average;

# 3
create view my_view2 as
select s.student_id,a.application_id,h.hostel_id,s.fname from 
student s, application a ,hostel h
where s.student_id=a.student_id
and a.hostel_id=h.hostel_id
and s.student_id= 5;

select * from my_view2;
select * from student;
