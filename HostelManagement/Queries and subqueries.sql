use dmdd_finals;

# Queries
select student_id,concat(fname,"",lname) as fullName from student
where student_id>10
group by fname
order by student_id;

select s.student_id,s.fname,a.application_id
from student s, application a where
s.student_id= a.student_id;

select s.student_id,h.hostel_id,h.hostel_name
from student s, hostel h
where h.hostel_id=s.hostel_id
order by hostel_id;

# Subqueries
Select student_id from student
where student_id in
(select student_id from
 application where application_id in (1,5,9));
 
Select * from room where room_id 
in(select room_id from student where student_id=8);

select * from student inner join application 
where student.student_id in(select application.student_id from application where application_status=1);
