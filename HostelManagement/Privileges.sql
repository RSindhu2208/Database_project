use dmdd_finals;

select * from mysql.user;

# creating new users
create user my_admin2 ;
create user tester2; 
create user developer2;
create user my_user2;


show grants;

show grants for tester2;
show grants for my_admin2;
show grants for developer2;
show grants for my_user2;

# Granting privileges
grant	select, 			 
			update, 
            delete
on dmdd_finals.*
to my_user2;


grant select
,update 
on dmdd_finals.student to tester2;

grant insert,
select, 
update
 on dmdd_finals.hostel to developer2;
 
grant all on dmdd_finals.* to my_admin2;

# Revoke privileges

revoke	select, 			 
			update, 
            delete
on dmdd_finals.*
from my_user2;


revoke select
,update 
on dmdd_finals.student from tester2;

revoke insert,
select, 
update
 on dmdd_finals.hostel from developer2;
 
revoke all privileges,grant option  from my_admin2;