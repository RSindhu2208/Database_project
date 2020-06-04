# FUNCTIONS
use dmdd_finals;

select sqrt(7);    # To find the square root

select round(2.7);   # Rounds off the number
select round(-9.2);

select ceil(3.8);   # Gives the least integer
select floor(3.8);

select truncate(4.99,0);   # Truncates the decimal value

select rand(8);      # Generates a random digit

select avg(student_id) from student;   # returns the average of a particular column


select pow(2,4);     # Returns the power specified to a given argument

select ucase(fname) from student;    # Return a string of upper case
select lcase(lname) from student;     # Converts string to lower case

select strcmp('ab','bc');            # compares to strings

select substr(fname,1,3) from student;  # returns the substring

select concat(fname,"",lname) as fullName from student;  # concatanates two strings

select 45/8;                      # returns the quotient

select cast(180 as char);          # converts values to the mentioned type
select cast(5-10 as signed);



