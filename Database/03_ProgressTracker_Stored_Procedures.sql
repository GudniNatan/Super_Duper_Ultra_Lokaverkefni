delimiter $$
drop procedure if exists NewStudent $$

create procedure NewStudent
(
    user_name varchar(10),
    user_pass varchar(255),
    student_track int
)
begin
	declare student_id int;
    
	insert into Students(userName,userPassword,studentTrack,registerDate)
	values(user_name,user_pass,student_track,date(now()));
end $$
delimiter ;


delimiter $$
drop procedure if exists SingleStudent $$

create procedure SingleStudent(user_name char(10))
begin
	select S.studentID,S.userName,S.registerDate,T.trackID,T.trackName 
    from Students S
    inner join Tracks T on S.studentTrack = T.trackID
    and S.userName = user_name;
end $$
delimiter ;


delimiter $$
drop procedure if exists StudentList $$

create procedure StudentList()
begin
	select studentID, userName from Students;
end $$
delimiter ;


delimiter $$
drop procedure if exists UpdateStudent $$

create procedure UpdateStudent
(
    user_name char(10),
    student_track int
)
begin
	update Students
	set studentTrack = student_track
	where userName = user_name;
end $$
delimiter ;

delimiter $$
drop function if exists getPass $$

create function getPass
(
    user_name char(10)
) returns varchar(255)
begin
	return (SELECT userPassword from Students where userName = user_name);
end $$
delimiter ;

delimiter $$
drop procedure if exists updatePass $$

create procedure updatePass
(
    user_name char(10),
    user_pass varchar(255)
)
begin
	update Students
	set userPassword = user_pass
	where userName = user_name;
end $$
delimiter ;
delimiter $$
drop procedure if exists RemoveStudent $$

create procedure RemoveStudent
(
    user_name char(10)
)
begin
	DECLARE id int;
    
    SELECT studentID into id FROM Students WHERE userName = user_name;
    
	delete from StudentCourses WHERE studentID = id;
    delete from Students WHERE studentID = id;
end $$
delimiter ;

-- call RemoveStudent('1803982879');
select * from Students;