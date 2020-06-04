use dmdd_finals;

#Stored procedures

Delimiter $$
create procedure getStudent(in first int(20), in second int(20), out total int(20))
Begin
declare first1 int;
declare second2 int;
set first1=first;
set second2=second;

select count(*) into total from student where student_id between first1 and second2;
End $$
Delimiter ;

call getStudent(10,10,@total); 
select @total;


Delimiter $$
create procedure getHostelName(in room int(12), in id int(20), out output varchar(30))
Begin
declare first int;
declare second int;
set first=room;
set second=id;

Select hostel_name from hostel where hostel_id between first and second;
End $$
delimiter ;

call getHostelName(20,27,@output);




 