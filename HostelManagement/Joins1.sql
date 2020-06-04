use dmdd_finals;

# Inner Join
select student.student_id,student.fname,hostel.hostel_id
from hostel inner join student on
hostel.hostel_id=student.hostel_id;

# Left join
select application.application_id, student.student_id
from student left join  application
on application.student_id=student.student_id;

# Right join
select application.application_id, student.student_id,student.fname
from student right join  application
on application.student_id=student.student_id;

# Full join
select *
from student left join  application
on application.student_id=student.student_id

union

select *
from student right join  application
on application.student_id=student.student_id;

# Cross join
select * from student cross join application on student.student_id=application.student_id;

