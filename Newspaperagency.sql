CREATE TABLE LOGIN(login_username VARCHAR(20), login_password VARCHAR(20), login_id VARCHAR(20) PRIMARY KEY);
 CREATE TABLE USER(user_name VARCHAR(20), user_id VARCHAR(20) PRIMARY KEY, user_email VARCHAR(20), user_address VARCHAR(20));

CREATE TABLE ROLES (role_id VARCHAR(20) PRIMARY KEY,role_name VARCHAR(20));
CREATE TABLE PERMISSION (per_id VARCHAR(20) PRIMARY KEY);
CREATE TABLE HAS (login_id VARCHAR(20),
                  user_id VARCHAR(20),
                  role_id VARCHAR(20),
                  per_id VARCHAR(20),
                  FOREIGN KEY (login_id)
                  REFERENCES LOGIN (login_id)
                  FOREIGN KEY (user_id)
                  REFERENCES USER(user_id)
                  FOREIGN KEY (role_id)
                  REFERENCES ROLES(role_id)
                  FOREIGN KEY (per_id)
                  REFERENCES PERMISSION (per_id));

CREATE TABLE LATESTPOST (post_id VARCHAR(20) PRIMARY KEY, post_title VARCHAR(20),post_date DATE, post_desc VARCHAR(80));

CREATE TABLE CONTENTS (content_id VARCHAR(20) PRIMARY KEY, content_title VARCHAR(20), content_desc VARCHAR(80)); 
CREATE TABLE ADVERTISEMENTS (ad_title VARCHAR(20), ad_id VARCHAR(20) PRIMARY KEY, ad_discription VARCHAR(80));
CREATE TABLE MANAGE (post_id VARCHAR(20),
                     content_id VARCHAR(20),
                     ad_id VARCHAR(20),
                     user_id VARCHAR(20),
                     FOREIGN KEY (post_id)
                     REFERENCES LATESTPOST (post_id)
                     FOREIGN KEY (content_id)
                     REFERENCES CONTENTS (content_id)
                     FOREIGN KEY (ad_id)
                     REFERENCES ADVERTISEMENTS (ad_id)
                     FOREIGN KEY (user_id)
                  REFERENCES USER(user_id));
  CREATE TABLE NEWS(news_id VARCHAR(20) PRIMARY KEY,news_discription VARCHAR(80));
  CREATE TABLE IAR(content_id VARCHAR(20),
                   news_id VARCHAR(20),
                   FOREIGN KEY (content_id)
                   REFERENCES CONTENTS (content_id)
                   FOREIGN KEY (news_id)
                   REFERENCES NEWS (news_id));
 INSERT INTO LOGIN VALUES ('FIVEZERS','123456','V2MAY');
 INSERT INTO USER VALUES ('TONYSTARK','320136894','tonystark@gmail.com','45-18-36,losanggles,US');
 INSERT INTO ROLES VALUES ('43245','editor');
 INSERT INTO PERMISSION VALUES ('3345689');
 INSERT INTO HAS VALUES  ('V2MAY','320136894','43245','3345689');
 INSERT INTO LATESTPOST VALUES ('AVENGERS1234','avengers','12-MAY-2022','the avengers are the fiction team of super heroes');
 INSERT INTO CONTENTS VALUES ('MOVIE432','marvel movie','the marvel cinematic universe is an american media franchise');
 INSERT INTO ADVERTISEMENTS VALUES ('TIMEX WATCH','WATCH2386','timex watches are one of the most trusted watches in india');
 INSERT INTO MANAGE VALUES('AVENGERS1234','MOVIE432','WATCH2386','320136894');
 INSERT INTO NEWS VALUES ('9842645','news is information about curent events');
 INSERT INTO IAR VALUES ('MOVIE432','9842645');
 SELECT login_username,login_password,user_name,user_email,user_address, 
role_name,post_title,post_date,post_desc,content_title,content_desc,ad_title,ad_discription,news_discription,L.login_id,H.user_id,R.role_id,P.per_id,M.post_id,AD.ad_id,I.content_id,N.news_id
FROM LOGIN L
INNER JOIN HAS H
ON H.login_id=L.login_id
INNER JOIN USER U
ON U.user_id=H.user_id
INNER JOIN ROLES R
ON R.role_id=H.role_id
INNER JOIN PERMISSION P
ON P.per_id=H.per_id
INNER JOIN MANAGE M
ON M.user_id=U.user_id
INNER JOIN  LATESTPOST LP
ON LP.post_id=M.post_id
INNER JOIN CONTENTS C
ON C.content_id=M.content_id
INNER JOIN ADVERTISEMENTS AD
ON AD.ad_id=M.ad_id
INNER JOIN IAR I
ON I.content_id=C.content_id
INNER JOIN NEWS N
ON N.news_id=I.news_id;
