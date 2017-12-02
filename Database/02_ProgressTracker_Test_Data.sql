insert into Schools(schoolName) values('Tækniskólinn');


insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Haust2017','2017-08-01','2017-12-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Vor2018','2018-01-01','2018-05-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Haust2018','2018-08-01','2018-12-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Vor2019','2019-01-01','2019-05-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Haust2019','2019-08-01','2019-12-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Vor2020','2020-01-01','2020-05-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Haust2020','2020-08-01','2020-12-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Vor2021','2021-01-01','2021-05-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Haust2021','2021-08-01','2021-12-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Vor2022','2022-01-01','2022-05-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Haust2022','2022-08-01','2022-12-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Vor2023','2023-01-01','2023-05-31');


insert into Divisions(divisionName,schoolID)values('Byggingatækniskólinn',1);
insert into Divisions(divisionName,schoolID)values('Endurmenntunarskólinn',1);
insert into Divisions(divisionName,schoolID)values('Flugskóli Íslands',1);
insert into Divisions(divisionName,schoolID)values('Handverksskólinn',1);
insert into Divisions(divisionName,schoolID)values('Margmiðlunarskólinn',1);
insert into Divisions(divisionName,schoolID)values('Meistaraskólinn',1);
insert into Divisions(divisionName,schoolID)values('Raftækniskólinn',1);
insert into Divisions(divisionName,schoolID)values('Skipstjórnarskólinn',1);
insert into Divisions(divisionName,schoolID)values('Tækniakademían',1);
insert into Divisions(divisionName,schoolID)values('Tæknimenntaskólinn',1);
insert into Divisions(divisionName,schoolID)values('Upplýsingatækniskólinn',1);
insert into Divisions(divisionName,schoolID)values('Vefskólinn',1);
insert into Divisions(divisionName,schoolID)values('Véltækniskólinn',1);


insert into Tracks(trackName,divisionID)values('Almennt nám Upplýsingatækniskóla - AN UTN',10);
insert into Tracks(trackName,divisionID)values('Bókband',10);
insert into Tracks(trackName,divisionID)values('Grafísk miðlun',10);
insert into Tracks(trackName,divisionID)values('Grunnnám upplýsinga- og fjölmiðlagreina',10);
insert into Tracks(trackName,divisionID)values('K2 Tækni- og vísindaleiðin',10);
insert into Tracks(trackName,divisionID)values('Ljósmyndun',10);
insert into Tracks(trackName,divisionID)values('Prentun',10);
insert into Tracks(trackName,divisionID)values('Stúdentspróf',10);
insert into Tracks(trackName,validFrom,divisionID)values('Tölvubraut','2015-01-01',10);


insert into Courses(courseNumber,courseName, divisionID, courseCredits)
values
      ('ÍÞRÓ1LA01AT','Íþróttir',10, 1),
      ('ÍÞRÓ1GH02AT','Íþróttir',10, 1),
      ('ÍÞRÓ1LB01BT','Íþróttir',10, 1),
      ('ÍÞRÓ1LC01CT','Íþróttir',10, 1),
	  ('FORK2FE02AU','Forritunarkeppni I',11, 2),
      ('FORK2FT02BU','Forritunarkeppni II',11, 2),
      ('FORK2FÞ02CU','Forritunarkeppni III',11, 2);


insert into Courses(courseNumber,courseName, divisionID)
values('ENSK2AE05AT','Enska',10),
	  ('ENSK2OF05BT','Enska',10),
      ('ENSK3AM05CT','Enska',10),
      ('ÍSLE2AA05AT','Íslanska',10),
      ('ÍSLE2GO05BT','Íslenska',10),
      ('ÍSLE3BF05CT','Íslenska',10),
      ('ÍSLE3NB05CT','Íslenska',10),
      ('ÍSLE3LF05CT','Íslenska',10),
      ('DANS2BM05AT','Danska',10),
      ('STÆR2BR05AT','Stærðfræði',10),
      ('STÆR2AH05BT','Stærðfræði',10),
      ('STÆR3RV05CT','Stærðfræði',10),
      ('STÆR3FM05DT','Stærðfræði',10),
      ('STÆR3FV05ET','Stærðfræði',10),
      ('STÆR4HT05FT','Stærðfræði',10),
      ('STÆR2LT05BT','Stærðfræði',10),
      ('LÍFS1GR05AT','Lífsleikni',10),
      ('MENL1AL05AT','Menningarlæsi',10),
      ('EÐLI2GR05BT','Eðlisfræði',10),
      ('EÐLI2RB05CT','Eðlisfræði',10),
      ('EÐLI3AK05DT','Eðlisfræði',10),
      ('EFNA2AE05BT','Efnafræði',10),
      ('EFNA3JA05CT','Efnafræði',10),
      ('ÍÞRÓ1LD01DT','Íþróttir',10),
	  ('FORR1FG05AU','Forritun I',11),
	  ('FORR2FA05BU','Forritun II',11),
	  ('FORR2HF05CU','Hlutbundin forritun',11),
	  ('FORR3NÞ05DU','Netforritun og þráðavinnsla',11),
      ('FORR2GL05DU','Leikjaforritun I',11),
	  ('FORR3FL05EU','Leikjaforritun II',11),
	  ('FORR3RR05DU','Reiknirit',11),
      ('FORR3JS05DU','JavaScript',11),
	  ('FORR3FV05EU','Viðmótsforritun',11),
	  ('FORR3CG05DU','C# grunnur',11),
      ('ROBO2RG05AU','Vélmenni I',11), 
	  ('ROBO3RF05BU','Vélmenni II',11),
	  ('GAGN1NG05AU','Notkun gagnasafna',11),
	  ('GAGN2HS05BU','Gagnagrunnar - önnun og smíði',11),
      ('GAGN2VG05CU','Gagnagrunnar - vensluð gagnasöfn',11),
	  ('GAGN3GS05DU','Gagnagreining',11),
	  ('KEST1TR05AU','Tölvutækni - talnakerfi og rökrásir',11),
	  ('KEST2VJ05BU','Tölvutækni - vélbúnaður og jaðartæki',11),
      ('KEST2UN05CU','Tölvutækni - undirstöðuatriði netkerfa',11),
	  ('KEST2CG05DU','CCNA - netkerfisstaðlar',11),
	  ('KEST3CR05EU','CCNA - routing and switching',11),
      ('KEST3CS05FU','CCNA - scaling networks',11),
	  ('KEST3CN05GU','CCNA - Connection network',11),
	  ('KEST2LG05DU','Linux - kerfisstjórnun',11),
      ('KEST3LN05EU','Linux - netstjórnun',11),
      ('KEST3LS05FU','Linux – skriftur',11),
      ('KEST2WG05DU','Windows server - kerfisstjórnun',11),
      ('KEST3WN05EU','Windows server - netstjórnun og skriftur I',11),
      ('KEST3WS05FU','Windows server - netstjórnun og skriftur II',11), 
	  ('VEFÞ1VG05AU','Vefhönnun I',11),
      ('VEFÞ2VH05BU','Vefhönnun II',11),
      ('VEFÞ2VF05CU','Vefforritun I',11),
	  ('VEFÞ2VÞ05DU','Vefforritun II',11),
	  ('VEFÞ3VL05EU','Vefforritun III',11),
      ('FORR4CF05EU','Gagnaskipan (C++)',11);      
insert into TrackCourses(trackID, courseNumber, mandatory)
values
(9, 'ENSK2AE05AT', 1),
(9, 'ENSK2OF05BT', 1),
(9, 'ENSK3AM05CT', 1),
(9, 'ÍSLE2AA05AT', 1),
(9, 'ÍSLE2GO05BT', 1),
(9, 'ÍSLE3BF05CT', 1),
(9, 'ÍSLE3NB05CT', 1),
(9, 'ÍSLE3LF05CT', 1),
(9, 'DANS2BM05AT', 1),
(9, 'STÆR2BR05AT', 1),
(9, 'STÆR2AH05BT', 1),
(9, 'STÆR3RV05CT', 1),
(9, 'STÆR3FM05DT', 1),
(9, 'STÆR3FV05ET', 1),
(9, 'STÆR4HT05FT', 1),
(9, 'STÆR2LT05BT', 1),
(9, 'LÍFS1GR05AT', 1),
(9, 'MENL1AL05AT', 1),
(9, 'EÐLI2GR05BT', 1),
(9, 'EÐLI2RB05CT', 1),
(9, 'EÐLI3AK05DT', 0),
(9, 'EFNA2AE05BT', 1),
(9, 'EFNA3JA05CT', 0),
(9, 'ÍÞRÓ1LA01AT', 1),
(9, 'ÍÞRÓ1GH02AT', 1),
(9, 'ÍÞRÓ1LB01BT', 1),
(9, 'ÍÞRÓ1LC01CT', 0),
(9, 'ÍÞRÓ1LD01DT', 0),
(9, 'FORR1FG05AU', 1),
(9, 'FORR2FA05BU', 1),
(9, 'FORR2HF05CU', 1),
(9, 'FORR3NÞ05DU', 0),
(9, 'FORR2GL05DU', 0),
(9, 'FORR3FL05EU', 0),
(9, 'FORR3RR05DU', 0),
(9, 'FORR3JS05DU', 0),
(9, 'FORR3FV05EU', 0),
(9, 'FORR3CG05DU', 0),
(9, 'FORK2FE02AU', 0),
(9, 'FORK2FT02BU', 0),
(9, 'FORK2FÞ02CU', 0),
(9, 'ROBO2RG05AU', 0),
(9, 'ROBO3RF05BU', 0),
(9, 'GAGN1NG05AU', 1),
(9, 'GAGN2HS05BU', 1),
(9, 'GAGN2VG05CU', 1),
(9, 'GAGN3GS05DU', 0),
(9, 'KEST1TR05AU', 1),
(9, 'KEST2VJ05BU', 1),
(9, 'KEST2UN05CU', 1),
(9, 'KEST2CG05DU', 0),
(9, 'KEST3CR05EU', 0),
(9, 'KEST3CS05FU', 0),
(9, 'KEST3CN05GU', 0),
(9, 'KEST2LG05DU', 0),
(9, 'KEST3LN05EU', 0),
(9, 'KEST3LS05FU', 0),
(9, 'KEST2WG05DU', 0),
(9, 'KEST3WN05EU', 0),
(9, 'KEST3WS05FU', 0),
(9, 'VEFÞ1VG05AU', 1),
(9, 'VEFÞ2VH05BU', 1),
(9, 'VEFÞ2VF05CU', 1),
(9, 'VEFÞ2VÞ05DU', 0),
(9, 'VEFÞ3VL05EU', 0),
(9, 'FORR4CF05EU', 0);

/*(9, 1, 0),
(9, 2, 0),
(9, 3, 0),
(9, 4, 0),
(9, 5, 0),
(9, 6, 0),
(9, 7, 0),
(9, 8, 0),
(9, 9, 0),
(9, 10, 0),
(9, 11, 0),
(9, 12, 0),
(9, 13, 0),
(9, 14, 0),
(9, 15, 0),
(9, 16, 0),
(9, 17, 0),
(9, 18, 0),
(9, 19, 0),
(9, 20, 0),
(9, 21, 0),
(9, 22, 0),
(9, 23, 0),
(9, 24, 0),
(9, 25, 0),
(9, 26, 0),
(9, 27, 0),
(9, 28, 0),
(9, 29, 0),
(9, 30, 0),
(9, 31, 0),
(9, 32, 0),
(9, 33, 0),
(9, 34, 0),
(9, 35, 0),
(9, 36, 0),
(9, 37, 0),
(9, 38, 0),
(9, 39, 0),
(9, 40, 0),
(9, 41, 0),
(9, 42, 0),
(9, 43, 0),
(9, 44, 0),
(9, 44, 0),
(9, 45, 0),
(9, 46, 0),
(9, 47, 0),
(9, 48, 0),
(9, 49, 0),
(9, 50, 0),
(9, 51, 0),
(9, 52, 0),
(9, 53, 0),
(9, 54, 0),
(9, 55, 0),
(9, 56, 0),
(9, 57, 0),
(9, 58, 0),
(9, 59, 0),
(9, 60, 0),
(9, 61, 0),
(9, 62, 0),
(9, 63, 0),
(9, 64, 0);*/

/*insert into Restrictors(courseNumber,restrictorID,restrictorType)values('FORR2FA05BU','FORR1FG05AU',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('FORR2HF05CU','FORR2FA05BU',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('FORR3NÞ05DU','FORR2HF05CU',2);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('FORR2GL05DU','FORR2HF05CU',3);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('FORR2GL05DU','STÆR3RV05CT',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('FORR3FL05EU','FORR2GL05DU',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('FORR3RR05DU','FORR2HF05CU',2);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('FORR3RR05DU','STÆR3RV05CT',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('FORR3JS05DU','FORR2HF05CU',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('FORR3JS05DU','VEFÞ2VF05CU',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('FORR3FV05EU','VEFÞ2VF05CU',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('FORR3CG05DU','FORR2HF05CU',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('ROBO2RG05AU','FORR2HF05CU',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('ROBO3RF05BU','ROBO2RG05AU',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('GAGN2HS05BU','GAGN1NG05AU',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('GAGN2VG05CU','GAGN2HS05BU',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('GAGN3GS05DU','GAGN2VG05CU',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('KEST2VJ05BU','KEST1TR05AU',1);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('KEST2UN05CU','KEST2VJ05BU',2);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('KEST2CG05DU','KEST2VJ05BU',2);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('KEST3CR05EU','KEST2UN05CU',2);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('KEST3CS05FU','KEST3CR05EU',2);
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('KEST3CN05GU','KEST3CS05FU',2);*/
INSERT INTO Restrictors(courseNumber,restrictorID,restrictorType)
values
('FORK2FE02AU','FORR1FG05AU',2),
('FORK2FT02BU','FORK2FE02AU',1),
('FORK2FÞ02CU','FORK2FT02BU',1),
('FORR2FA05BU','FORR1FG05AU',1),
('FORR2HF05CU','FORR2FA05BU',1),
('FORR4CF05EU','FORR2HF05CU',1),
('FORR3RR05DU','FORR2HF05CU',1),
('FORR3RR05DU','STÆR3FM05DT',1),
('FORR2GL05DU','FORR2HF05CU',1),
('FORR3FL05EU','FORR2GL05DU',1),
('FORR3FL05EU','EÐLI2GR05BT',1),
('FORR3FL05EU','STÆR3RV05CT',1),
('FORR3JS05DU','FORR2HF05CU',1),
('FORR3JS05DU','VEFÞ2VH05BU',1),
('FORR3FV05EU','STÆR3RV05CT',1),
('FORR3FV05EU','FORR3JS05DU',1),
('FORR3NÞ05DU','FORR2HF05CU',1),
('FORR3NÞ05DU','KEST2UN05CU',1),
('ROBO2RG05AU','FORR2FA05BU',1),
('ROBO2RG05AU','KEST2VJ05BU',1),
('ROBO2RG05AU','EÐLI2GR05BT',1),
('ROBO3RF05BU','ROBO2RG05AU',1),
('VEFÞ2VF05CU','FORR2FA05BU',1),
('VEFÞ2VF05CU','VEFÞ1VG05AU',1),
('VEFÞ2VÞ05DU', 'VEFÞ2VF05CU', 1),
('VEFÞ2VÞ05DU', 'FORR2HF05CU', 1),
('VEFÞ2VÞ05DU', 'GAGN1NG05AU', 1),
('VEFÞ3VL05EU', 'VEFÞ2VÞ05DU', 1),
('VEFÞ3VL05EU', 'FORR3JS05DU', 1),
('VEFÞ2VH05BU', 'VEFÞ1VG05AU', 1),
('GAGN2HS05BU', 'GAGN1NG05AU', 1),
('GAGN2HS05BU', 'FORR2FA05BU', 1),
('GAGN2VG05CU', 'GAGN2HS05BU', 1),
('GAGN3GS05DU', 'GAGN2VG05CU', 1),
('KEST2VJ05BU', 'KEST1TR05AU', 1),
('KEST2UN05CU', 'KEST2VJ05BU', 1),
('KEST2LG05DU', 'KEST2UN05CU', 2),
('KEST3LN05EU', 'KEST2LG05DU', 1),
('KEST3LS05FU', 'KEST3LN05EU', 2),
('KEST3LS05FU', 'FORR2FA05BU', 1),
('KEST2WG05DU', 'KEST2UN05CU', 2),
('KEST2WG05DU', 'FORR2FA05BU', 1),
('KEST3WN05EU', 'KEST2WG05DU', 1),
('KEST3WS05FU', 'KEST3WN05EU', 1),
('KEST3CR05EU', 'KEST2UN05CU', 1),
('KEST3CS05FU', 'KEST3CR05EU', 1),
('KEST3CN05GU', 'KEST3CS05FU', 1);

INSERT INTO Restrictors(courseNumber,restrictorID,restrictorType)
values
('ÍÞRÓ1LA01AT', 'ÍÞRÓ1GH02AT', 3),
('ÍÞRÓ1LB01BT', 'ÍÞRÓ1LA01AT', 1),
('ÍÞRÓ1LC01CT', 'ÍÞRÓ1LB01BT', 1),
('ENSK2OF05BT', 'ENSK2AE05AT', 1),
('ÍSLE2GO05BT', 'ÍSLE2AA05AT', 1),
('ÍSLE3BF05CT', 'ÍSLE2GO05BT', 1),
('ÍSLE3NB05CT', 'ÍSLE3BF05CT', 3),
('ÍSLE3LF05CT', 'ÍSLE3NB05CT', 3),
('STÆR2AH05BT', 'STÆR2BR05AT', 1),
('EÐLI2GR05BT', 'STÆR2BR05AT', 1),
('STÆR3RV05CT', 'STÆR2AH05BT', 1),
('STÆR3FM05DT', 'STÆR3RV05CT', 1),
('STÆR3FV05ET', 'STÆR3FM05DT', 1),
('STÆR4HT05FT', 'STÆR3FV05ET', 1);

/*insert into Students(firstName,lastName,dob,email,userName,userPassword,studentTrack,registerDate)
values('Katrín','Jónsdóttir','2000-09-29','katarina@emil.com','stína-stuð',aes_encrypt('Q&dnZP78RR','xAklwzVY3Q?Jk'),9,'2017-08-01'),
	  ('Árni','Sigurbjörnsson','1998-11-07','arnisig@fakemail.ru','arnisig',aes_encrypt('9mk3#d24?xZ','xAklwzVY3Q?Jk'),9,'2015-08-01'),
      ('Guðrún','Jóhannsdóttir','1999-07-08','gudda_skrudda@nomail.is','gudrun',aes_encrypt('QwLL78$#sP','xAklwzVY3Q?Jk'),9,'2016-08-01'),
      ('Gunnar','Sigurðarson','1997-12-05','gusi@fakemail.eu','gunnsi',aes_encrypt('G!m89F&&vC','xAklwzVY3Q?Jk'),9,'2014-01-01'),
      ('Jón','Jónsson','2000-03-31','jojo@nomailatall.de','nonniboy',aes_encrypt('Ax49%x25B','xAklwzVY3Q?Jk'),9,'2017-08-01');
      
*/
/*
SELECT * FROM TrackCourses;

SELECT * FROM Students;
INSERT INTO StudentCourses(semesterTaken, studentID, trackCourseID)
VALUES
(1, 1, 29),
(1, 1, 30),
(1, 1, 48),
(1, 1, 49),
(2, 1, 44),
(2, 1, 45),
(3, 1, 61),
(3, 1, 62),
(3, 1, 64);


*/