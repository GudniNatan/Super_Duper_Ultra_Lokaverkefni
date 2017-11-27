insert into Schools(schoolName) values('Tækniskólinn');


insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Haust2015','2015-08-01','2015-12-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Vor2016','2016-01-01','2016-05-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Haust2016','2016-08-01','2016-12-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Vor2017','2017-01-01','2017-05-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Haust2017','2017-08-01','2017-12-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Vor2018','2018-01-01','2018-05-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Haust2018','2018-08-01','2018-12-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Vor2019','2019-01-01','2019-05-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Haust2019','2019-08-01','2019-12-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Vor2020','2020-01-01','2020-05-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Haust2020','2020-08-01','2020-12-31');
insert into Semesters(semesterName,semesterStarts,semesterEnds)values('Vor2021','2021-01-01','2021-05-31');


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


insert into Courses(courseNumber,courseName,courseCredits)
values('ENSK2AE05AT','Enska',3),
	  ('ENSK2OF05BT','Enska',3),
      ('ENSK3AM05CT','Enska',3),
      ('ÍSLE2AA05AT','Íslanska',3),
      ('ÍSLE2GO05BT','Íslenska',3),
      ('ÍSLE3BF05CT','Íslenska',3),
      ('ÍSLE3NB05CT','Íslenska',3),
      ('ÍSLE3LF05CT','Íslenska',3),
      ('DANS2BM05AT','Danska',3),
      ('STÆR2BR05AT','Stærðfræði',3),
      ('STÆR2AH05BT','Stærðfræði',3),
      ('STÆR3RV05CT','Stærðfræði',3),
      ('STÆR3FM05DT','Stærðfræði',3),
      ('STÆR3FV05ET','Stærðfræði',3),
      ('STÆR4HT05FT','Stærðfræði',3),
      ('STÆR2LT05BT','Stærðfræði',3),
      ('LÍFS1GR05AT','Lífsleikni',3),
      ('MENL1AL05AT','Menningarlæsi',3),
      ('EÐLI2GR05BT','Eðlisfræði',3),
      ('EÐLI2RB05CT','Eðlisfræði',3),
      ('EÐLI3AK05DT','Eðlisfræði',3),
      ('EFNA2AE05BT','Efnafræði',3),
      ('EFNA3JA05CT','Efnafræði',3),
      ('ÍÞRÓ1LA01AT','Íþróttir',3),
      ('ÍÞRÓ1GH01AT','Íþróttir',3),
      ('ÍÞRÓ1LB01BT','Íþróttir',3),
      ('ÍÞRÓ1LC01CT','Íþróttir',3),
      ('ÍÞRÓ1LD01DT','Íþróttir',3),
	  ('FORR1FG05AU','Forritun I',3),
	  ('FORR2FA05BU','Forritun II',3),
	  ('FORR2HF05CU','Hlutbundin forritun',3),
	  ('FORR3NÞ05DU','Netforritun og þráðavinnsla',3),
      ('FORR2GL05DU','Leikjaforritun I',3),
	  ('FORR3FL05EU','Leikjaforritun II',3),
	  ('FORR3RR05DU','Reiknirit',3),
      ('FORR3JS05DU','JavaScript',3),
	  ('FORR3FV05EU','Viðmótsforritun',3),
	  ('FORR3CG05DU','C# grunnur',3),
      ('FORK2FE02AU','Forritunarkeppni I',3),
      ('FORK2FT02BU','Forritunarkeppni II',3),
      ('FORK2FÞ02CU','Forritunarkeppni III',3),
      ('ROBO2RG05AU','Vélmenni I',3), 
	  ('ROBO3RF05BU','Vélmenni II',3),
	  ('GAGN1NG05AU','Notkun gagnasafna',3),
	  ('GAGN2HS05BU','Gagnagrunnar - önnun og smíði',3),
      ('GAGN2VG05CU','Gagnagrunnar - vensluð gagnasöfn',3),
	  ('GAGN3GS05DU','Gagnagreining',3),
	  ('KEST1TR05AU','Tölvutækni - talnakerfi og rökrásir',3),
	  ('KEST2VJ05BU','Tölvutækni - vélbúnaður og jaðartæki',3),
      ('KEST2UN05CU','Tölvutækni - undirstöðuatriði netkerfa',3),
	  ('KEST2CG05DU','CCNA - netkerfisstaðlar',3),
	  ('KEST3CR05EU','CCNA - routing and switching',3),
      ('KEST3CS05FU','CCNA - scaling networks',3),
	  ('KEST3CN05GU','CCNA - Connection network',3),
	  ('KEST2LG05DU','Linux - kerfisstjórnun',3),
      ('KEST3LN05EU','Linux - netstjórnun',3),
      ('KEST3LS05FU','Linux – skriftur',3),
      ('KEST2WG05DU','Windows server - kerfisstjórnun',3),
      ('KEST3WN05EU','Windows server - netstjórnun og skriftur I',3),
      ('KEST3WS05FU','Windows server - netstjórnun og skriftur II',3), 
	  ('VEFÞ1VG05AU','Vefhönnun I',3),
      ('VEFÞ2VH05BU','Vefhönnun II',3),
      ('VEFÞ2VF05CU','Vefforritun I',3),
	  ('VEFÞ2VÞ05DU','Vefforritun II',3),
	  ('VEFÞ3VL05EU','Vefforritun III',3);
      
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
(9, 'ÍÞRÓ1GH01AT', 1),
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
(9, 'VEFÞ3VL05EU', 0);


insert into Restrictors(courseNumber,restrictorID,restrictorType)values('FORR2FA05BU','FORR1FG05AU',1);
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
insert into Restrictors(courseNumber,restrictorID,restrictorType)values('KEST3CN05GU','KEST3CS05FU',2);


/*insert into Students(firstName,lastName,dob,email,userName,userPassword,studentTrack,registerDate)
values('Katrín','Jónsdóttir','2000-09-29','katarina@emil.com','stína-stuð',aes_encrypt('Q&dnZP78RR','xAklwzVY3Q?Jk'),9,'2017-08-01'),
	  ('Árni','Sigurbjörnsson','1998-11-07','arnisig@fakemail.ru','arnisig',aes_encrypt('9mk3#d24?xZ','xAklwzVY3Q?Jk'),9,'2015-08-01'),
      ('Guðrún','Jóhannsdóttir','1999-07-08','gudda_skrudda@nomail.is','gudrun',aes_encrypt('QwLL78$#sP','xAklwzVY3Q?Jk'),9,'2016-08-01'),
      ('Gunnar','Sigurðarson','1997-12-05','gusi@fakemail.eu','gunnsi',aes_encrypt('G!m89F&&vC','xAklwzVY3Q?Jk'),9,'2014-01-01'),
      ('Jón','Jónsson','2000-03-31','jojo@nomailatall.de','nonniboy',aes_encrypt('Ax49%x25B','xAklwzVY3Q?Jk'),9,'2017-08-01');
      
*/