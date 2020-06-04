use dmdd_finals;

# Rollback and commit

Start transaction;
savepoint save;
update hostel
set hostel_name='North' where hostel_id=12;
select * from hostel;
rollback to savepoint save;
update hostel
set hostel_name='Starks'
where hostel_id=12;
select * from hostel;
commit;

lock table hostel read;

unlock table;

Start transaction ;
savepoint s1;
insert into room values(55,10,401,8);
select * from room;
rollback to savepoint s1;
insert into room values(54,7,402,9);
select * from room;
commit;
