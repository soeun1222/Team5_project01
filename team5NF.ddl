-- 생성자 Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   위치:        2021-04-28 16:46:43 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- 기존 테이블 제거

drop table user_tbl cascade constraints;
drop table comment_tbl cascade constraints;
drop table non_face cascade constraints;
drop table home_tip cascade constraints;
drop table bucket_list cascade constraints;


commit;


-- 테이블 생성 시작

CREATE TABLE user_tbl (
    u_id        VARCHAR2(15) PRIMARY KEY,
    u_pwd       VARCHAR2(15),
    u_name      VARCHAR2(20),
    u_email     VARCHAR2(40),
    u_phone     NUMBER(11),
    u_birth     NUMBER(8),
    u_sex       VARCHAR2(3),
    u_manager   NUMBER(1),
    u_like      NUMBER(5)
)
LOGGING;

CREATE TABLE comment_tbl (
    comm_num             NUMBER(5) PRIMARY KEY,
    comm_table           VARCHAR2(10),
    comm_content         VARCHAR2(1000),
    comm_ref             NUMBER(5),
    comm_step            NUMBER(5),
    comm_level           NUMBER(5),
    table_num            NUMBER(5),
    user_tbl_u_id        VARCHAR2(15) NOT NULL
)
LOGGING;

CREATE TABLE LIKE_LIST (
    LIKE_NUM        NUMBER(5),
    USER_TBL_U_ID   VARCHAR2(15)
)
LOGGING;

CREATE TABLE non_face (
    nf_num          NUMBER(5) PRIMARY KEY,
    nf_title        VARCHAR2(500),
    nf_content      VARCHAR2(1000),
    nf_date         DATE,
    nf_hit          NUMBER(8) default 0,
    user_tbl_u_id   VARCHAR2(15) NOT NULL
)
LOGGING;

CREATE TABLE home_tip (
    ht_num          NUMBER(5) PRIMARY KEY,
    ht_title        VARCHAR2(500),
    ht_content      VARCHAR2(1000),
    ht_date         DATE,
    ht_hit          NUMBER(8) default 0,
    user_tbl_u_id   VARCHAR2(15) NOT NULL
)
LOGGING;


CREATE TABLE bucket_list (
    bl_num          NUMBER(5) PRIMARY KEY,
    bl_title        VARCHAR2(500),
    bl_like         NUMBER(8) default 0,
    user_tbl_u_id   VARCHAR2(15) NOT NULL
)
LOGGING;



ALTER TABLE bucket_list
    ADD CONSTRAINT bucket_list_user_tbl_fk FOREIGN KEY ( user_tbl_u_id )
        REFERENCES user_tbl ( u_id )
    NOT DEFERRABLE;

ALTER TABLE comment_tbl
    ADD CONSTRAINT comment_tbl_user_tbl_fk FOREIGN KEY ( user_tbl_u_id )
        REFERENCES user_tbl ( u_id )
    NOT DEFERRABLE;

ALTER TABLE home_tip
    ADD CONSTRAINT home_tip_user_tbl_fk FOREIGN KEY ( user_tbl_u_id )
        REFERENCES user_tbl ( u_id )
    NOT DEFERRABLE;

ALTER TABLE non_face
    ADD CONSTRAINT non_face_user_tbl_fk FOREIGN KEY ( user_tbl_u_id )
        REFERENCES user_tbl ( u_id )
    NOT DEFERRABLE;

-- USER_TBL
INSERT INTO user_tbl VALUES('wannabe','1234','안녕','wannabe@.com',01011111111,002244,'w',0,0);
INSERT INTO user_tbl VALUES('manager','1111','매니저','manager@.com',01011112222,004444,'f',1,0);

--NON_FACE
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (1,'[ 공지사항 ] non_face_title1','non_face_content1',to_date('21/04/30','RR/MM/DD'),0,'manager');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (2,'[ 공지사항 ] non_face_title2','non_face_content2',to_date('21/05/01','RR/MM/DD'),1,'manager');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (3,'[ 공지사항 ] non_face_title3','non_face_content3',to_date('21/05/02','RR/MM/DD'),0,'manager');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (4,'[ 공지사항 ] non_face_title4','non_face_content4',to_date('21/05/03','RR/MM/DD'),0,'manager');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (5,'[ 공지사항 ] non_face_title5','non_face_content5',to_date('21/05/04','RR/MM/DD'),3,'manager');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (6,'non_face_title6','non_face_content6',to_date('21/05/05','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (7,'non_face_title7','non_face_content7',to_date('21/05/06','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (8,'non_face_title8','non_face_content8',to_date('21/05/07','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (9,'non_face_title9','non_face_content9',to_date('21/05/08','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (10,'non_face_title10','non_face_content10',to_date('21/05/09','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (11,'non_face_title11','non_face_content11',to_date('21/05/10','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (12,'non_face_title12','non_face_content12',to_date('21/05/11','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (13,'non_face_title13','non_face_content13',to_date('21/05/12','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (14,'non_face_title14','non_face_content14',to_date('21/05/13','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (15,'non_face_title15','non_face_content15',to_date('21/05/14','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (16,'non_face_title16','non_face_content16',to_date('21/05/15','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (17,'non_face_title17','non_face_content17',to_date('21/05/16','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (18,'non_face_title18','non_face_content18',to_date('21/05/17','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (19,'non_face_title19','non_face_content19',to_date('21/05/18','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (20,'non_face_title20','non_face_content20',to_date('21/05/19','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (21,'non_face_title21','non_face_content21',to_date('21/05/20','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (22,'non_face_title22','non_face_content22',to_date('21/05/21','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (23,'non_face_title23','non_face_content23',to_date('21/05/22','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (24,'non_face_title24','non_face_content24',to_date('21/05/23','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (25,'non_face_title25','non_face_content25',to_date('21/05/24','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (26,'non_face_title26','non_face_content26',to_date('21/05/25','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (27,'non_face_title27','non_face_content27',to_date('21/05/26','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (28,'non_face_title28','non_face_content28',to_date('21/05/27','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (29,'non_face_title29','non_face_content29',to_date('21/05/28','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (30,'non_face_title30','non_face_content30',to_date('21/05/29','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (31,'non_face_title31','non_face_content31',to_date('21/05/30','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (32,'non_face_title32','non_face_content32',to_date('21/05/31','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (33,'non_face_title33','non_face_content33',to_date('21/06/01','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (34,'non_face_title34','non_face_content34',to_date('21/06/02','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (35,'non_face_title35','non_face_content35',to_date('21/06/03','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (36,'non_face_title36','non_face_content36',to_date('21/06/04','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (37,'non_face_title37','non_face_content37',to_date('21/06/05','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (38,'non_face_title38','non_face_content38',to_date('21/06/06','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (39,'non_face_title39','non_face_content39',to_date('21/06/07','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (40,'non_face_title40','non_face_content40',to_date('21/06/08','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (41,'non_face_title41','non_face_content41',to_date('21/06/09','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (42,'non_face_title42','non_face_content42',to_date('21/06/10','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (43,'non_face_title43','non_face_content43',to_date('21/06/11','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (44,'non_face_title44','non_face_content44',to_date('21/06/12','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (45,'non_face_title45','non_face_content45',to_date('21/06/13','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (46,'non_face_title46','non_face_content46',to_date('21/06/14','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (47,'non_face_title47','non_face_content47',to_date('21/06/15','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (48,'non_face_title48','non_face_content48',to_date('21/06/16','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (49,'non_face_title49','non_face_content49',to_date('21/06/17','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (50,'non_face_title50','non_face_content50',to_date('21/06/18','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (51,'non_face_title51','non_face_content51',to_date('21/06/19','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (52,'non_face_title52','non_face_content52',to_date('21/06/20','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (53,'non_face_title53','non_face_content53',to_date('21/06/21','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (54,'non_face_title54','non_face_content54',to_date('21/06/22','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (55,'non_face_title55','non_face_content55',to_date('21/06/23','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (56,'non_face_title56','non_face_content56',to_date('21/06/24','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (57,'non_face_title57','non_face_content57',to_date('21/06/25','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (58,'non_face_title58','non_face_content58',to_date('21/06/26','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (59,'non_face_title59','non_face_content59',to_date('21/06/27','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (60,'non_face_title60','non_face_content60',to_date('21/06/28','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (61,'non_face_title61','non_face_content61',to_date('21/06/29','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (62,'non_face_title62','non_face_content62',to_date('21/06/30','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (63,'non_face_title63','non_face_content63',to_date('21/07/01','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (64,'non_face_title64','non_face_content64',to_date('21/07/02','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (65,'non_face_title65','non_face_content65',to_date('21/07/03','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (66,'non_face_title66','non_face_content66',to_date('21/07/04','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (67,'non_face_title67','non_face_content67',to_date('21/07/05','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (68,'non_face_title68','non_face_content68',to_date('21/07/06','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (69,'non_face_title69','non_face_content69',to_date('21/07/07','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (70,'non_face_title70','non_face_content70',to_date('21/07/08','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (71,'non_face_title71','non_face_content71',to_date('21/07/09','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (72,'non_face_title72','non_face_content72',to_date('21/07/10','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (73,'non_face_title73','non_face_content73',to_date('21/07/11','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (74,'non_face_title74','non_face_content74',to_date('21/07/12','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (75,'non_face_title75','non_face_content75',to_date('21/07/13','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (76,'non_face_title76','non_face_content76',to_date('21/07/14','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (77,'non_face_title77','non_face_content77',to_date('21/07/15','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (78,'non_face_title78','non_face_content78',to_date('21/07/16','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (79,'non_face_title79','non_face_content79',to_date('21/07/17','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (80,'non_face_title80','non_face_content80',to_date('21/07/18','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (81,'non_face_title81','non_face_content81',to_date('21/07/19','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (82,'non_face_title82','non_face_content82',to_date('21/07/20','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (83,'non_face_title83','non_face_content83',to_date('21/07/21','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (84,'non_face_title84','non_face_content84',to_date('21/07/22','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (85,'non_face_title85','non_face_content85',to_date('21/07/23','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (86,'non_face_title86','non_face_content86',to_date('21/07/24','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (87,'non_face_title87','non_face_content87',to_date('21/07/25','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (88,'non_face_title88','non_face_content88',to_date('21/07/26','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (89,'non_face_title89','non_face_content89',to_date('21/07/27','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (90,'non_face_title90','non_face_content90',to_date('21/07/28','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (91,'non_face_title91','non_face_content91',to_date('21/07/29','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (92,'non_face_title92','non_face_content92',to_date('21/07/30','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (93,'non_face_title93','non_face_content93',to_date('21/07/31','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (94,'non_face_title94','non_face_content94',to_date('21/08/01','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (95,'non_face_title95','non_face_content95',to_date('21/08/02','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (96,'non_face_title96','non_face_content96',to_date('21/08/03','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (97,'non_face_title97','non_face_content97',to_date('21/08/04','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (98,'non_face_title98','non_face_content98',to_date('21/08/05','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (99,'non_face_title99','non_face_content99',to_date('21/08/06','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (100,'non_face_title100','non_face_content100',to_date('21/08/07','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (101,'non_face_title101','non_face_content101',to_date('21/08/08','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (102,'non_face_title102','non_face_content102',to_date('21/08/09','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (103,'non_face_title103','non_face_content103',to_date('21/08/10','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (104,'non_face_title104','non_face_content104',to_date('21/08/11','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (105,'non_face_title105','non_face_content105',to_date('21/08/12','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (106,'non_face_title106','non_face_content106',to_date('21/08/13','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (107,'non_face_title107','non_face_content107',to_date('21/08/14','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (108,'non_face_title108','non_face_content108',to_date('21/08/15','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (109,'non_face_title109','non_face_content109',to_date('21/08/16','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (110,'non_face_title110','non_face_content110',to_date('21/08/17','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (111,'non_face_title111','non_face_content111',to_date('21/08/18','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (112,'non_face_title112','non_face_content112',to_date('21/08/19','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (113,'non_face_title113','non_face_content113',to_date('21/08/20','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (114,'non_face_title114','non_face_content114',to_date('21/08/21','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (115,'non_face_title115','non_face_content115',to_date('21/08/22','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (116,'non_face_title116','non_face_content116',to_date('21/08/23','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (117,'non_face_title117','non_face_content117',to_date('21/08/24','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (118,'non_face_title118','non_face_content118',to_date('21/08/25','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (119,'non_face_title119','non_face_content119',to_date('21/08/26','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (120,'non_face_title120','non_face_content120',to_date('21/08/27','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (121,'non_face_title121','non_face_content121',to_date('21/08/28','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (122,'non_face_title122','non_face_content122',to_date('21/08/29','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (123,'non_face_title123','non_face_content123',to_date('21/08/30','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (124,'non_face_title124','non_face_content124',to_date('21/08/31','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (125,'non_face_title125','non_face_content125',to_date('21/09/01','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (126,'non_face_title126','non_face_content126',to_date('21/09/02','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (127,'non_face_title127','non_face_content127',to_date('21/09/03','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (128,'non_face_title128','non_face_content128',to_date('21/09/04','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (129,'non_face_title129','non_face_content129',to_date('21/09/05','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (130,'non_face_title130','non_face_content130',to_date('21/09/06','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (131,'non_face_title131','non_face_content131',to_date('21/09/07','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (132,'non_face_title132','non_face_content132',to_date('21/09/08','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (133,'non_face_title133','non_face_content133',to_date('21/09/09','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (134,'non_face_title134','non_face_content134',to_date('21/09/10','RR/MM/DD'),0,'wannabe');
Insert into NON_FACE (NF_NUM,NF_TITLE,NF_CONTENT,NF_DATE,NF_HIT,USER_TBL_U_ID) values (135,'non_face_title135','non_face_content135',to_date('21/09/11','RR/MM/DD'),28,'wannabe');

--HOME_TIP
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (1,'[ 공지사항 ] home_tip_title1','home_tip_content1',to_date('21/04/30','RR/MM/DD'),0,'manager');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (2,'[ 공지사항 ] home_tip_title2','home_tip_content2',to_date('21/05/01','RR/MM/DD'),1,'manager');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (3,'[ 공지사항 ] home_tip_title3','home_tip_content3',to_date('21/05/02','RR/MM/DD'),0,'manager');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (4,'[ 공지사항 ] home_tip_title4','home_tip_content4',to_date('21/05/03','RR/MM/DD'),0,'manager');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (5,'[ 공지사항 ] home_tip_title5','home_tip_content5',to_date('21/05/04','RR/MM/DD'),1,'manager');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (6,'home_tip_title6','home_tip_content6',to_date('21/05/05','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (7,'home_tip_title7','home_tip_content7',to_date('21/05/06','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (8,'home_tip_title8','home_tip_content8',to_date('21/05/07','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (9,'home_tip_title9','home_tip_content9',to_date('21/05/08','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (10,'home_tip_title10','home_tip_content10',to_date('21/05/09','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (11,'home_tip_title11','home_tip_content11',to_date('21/05/10','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (12,'home_tip_title12','home_tip_content12',to_date('21/05/11','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (13,'home_tip_title13','home_tip_content13',to_date('21/05/12','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (14,'home_tip_title14','home_tip_content14',to_date('21/05/13','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (15,'home_tip_title15','home_tip_content15',to_date('21/05/14','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (16,'home_tip_title16','home_tip_content16',to_date('21/05/15','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (17,'home_tip_title17','home_tip_content17',to_date('21/05/16','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (18,'home_tip_title18','home_tip_content18',to_date('21/05/17','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (19,'home_tip_title19','home_tip_content19',to_date('21/05/18','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (20,'home_tip_title20','home_tip_content20',to_date('21/05/19','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (21,'home_tip_title21','home_tip_content21',to_date('21/05/20','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (22,'home_tip_title22','home_tip_content22',to_date('21/05/21','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (23,'home_tip_title23','home_tip_content23',to_date('21/05/22','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (24,'home_tip_title24','home_tip_content24',to_date('21/05/23','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (25,'home_tip_title25','home_tip_content25',to_date('21/05/24','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (26,'home_tip_title26','home_tip_content26',to_date('21/05/25','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (27,'home_tip_title27','home_tip_content27',to_date('21/05/26','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (28,'home_tip_title28','home_tip_content28',to_date('21/05/27','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (29,'home_tip_title29','home_tip_content29',to_date('21/05/28','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (30,'home_tip_title30','home_tip_content30',to_date('21/05/29','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (31,'home_tip_title31','home_tip_content31',to_date('21/05/30','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (32,'home_tip_title32','home_tip_content32',to_date('21/05/31','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (33,'home_tip_title33','home_tip_content33',to_date('21/06/01','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (34,'home_tip_title34','home_tip_content34',to_date('21/06/02','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (35,'home_tip_title35','home_tip_content35',to_date('21/06/03','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (36,'home_tip_title36','home_tip_content36',to_date('21/06/04','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (37,'home_tip_title37','home_tip_content37',to_date('21/06/05','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (38,'home_tip_title38','home_tip_content38',to_date('21/06/06','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (39,'home_tip_title39','home_tip_content39',to_date('21/06/07','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (40,'home_tip_title40','home_tip_content40',to_date('21/06/08','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (41,'home_tip_title41','home_tip_content41',to_date('21/06/09','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (42,'home_tip_title42','home_tip_content42',to_date('21/06/10','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (43,'home_tip_title43','home_tip_content43',to_date('21/06/11','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (44,'home_tip_title44','home_tip_content44',to_date('21/06/12','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (45,'home_tip_title45','home_tip_content45',to_date('21/06/13','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (46,'home_tip_title46','home_tip_content46',to_date('21/06/14','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (47,'home_tip_title47','home_tip_content47',to_date('21/06/15','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (48,'home_tip_title48','home_tip_content48',to_date('21/06/16','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (49,'home_tip_title49','home_tip_content49',to_date('21/06/17','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (50,'home_tip_title50','home_tip_content50',to_date('21/06/18','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (51,'home_tip_title51','home_tip_content51',to_date('21/06/19','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (52,'home_tip_title52','home_tip_content52',to_date('21/06/20','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (53,'home_tip_title53','home_tip_content53',to_date('21/06/21','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (54,'home_tip_title54','home_tip_content54',to_date('21/06/22','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (55,'home_tip_title55','home_tip_content55',to_date('21/06/23','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (56,'home_tip_title56','home_tip_content56',to_date('21/06/24','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (57,'home_tip_title57','home_tip_content57',to_date('21/06/25','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (58,'home_tip_title58','home_tip_content58',to_date('21/06/26','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (59,'home_tip_title59','home_tip_content59',to_date('21/06/27','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (60,'home_tip_title60','home_tip_content60',to_date('21/06/28','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (61,'home_tip_title61','home_tip_content61',to_date('21/06/29','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (62,'home_tip_title62','home_tip_content62',to_date('21/06/30','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (63,'home_tip_title63','home_tip_content63',to_date('21/07/01','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (64,'home_tip_title64','home_tip_content64',to_date('21/07/02','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (65,'home_tip_title65','home_tip_content65',to_date('21/07/03','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (66,'home_tip_title66','home_tip_content66',to_date('21/07/04','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (67,'home_tip_title67','home_tip_content67',to_date('21/07/05','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (68,'home_tip_title68','home_tip_content68',to_date('21/07/06','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (69,'home_tip_title69','home_tip_content69',to_date('21/07/07','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (70,'home_tip_title70','home_tip_content70',to_date('21/07/08','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (71,'home_tip_title71','home_tip_content71',to_date('21/07/09','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (72,'home_tip_title72','home_tip_content72',to_date('21/07/10','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (73,'home_tip_title73','home_tip_content73',to_date('21/07/11','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (74,'home_tip_title74','home_tip_content74',to_date('21/07/12','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (75,'home_tip_title75','home_tip_content75',to_date('21/07/13','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (76,'home_tip_title76','home_tip_content76',to_date('21/07/14','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (77,'home_tip_title77','home_tip_content77',to_date('21/07/15','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (78,'home_tip_title78','home_tip_content78',to_date('21/07/16','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (79,'home_tip_title79','home_tip_content79',to_date('21/07/17','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (80,'home_tip_title80','home_tip_content80',to_date('21/07/18','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (81,'home_tip_title81','home_tip_content81',to_date('21/07/19','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (82,'home_tip_title82','home_tip_content82',to_date('21/07/20','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (83,'home_tip_title83','home_tip_content83',to_date('21/07/21','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (84,'home_tip_title84','home_tip_content84',to_date('21/07/22','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (85,'home_tip_title85','home_tip_content85',to_date('21/07/23','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (86,'home_tip_title86','home_tip_content86',to_date('21/07/24','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (87,'home_tip_title87','home_tip_content87',to_date('21/07/25','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (88,'home_tip_title88','home_tip_content88',to_date('21/07/26','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (89,'home_tip_title89','home_tip_content89',to_date('21/07/27','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (90,'home_tip_title90','home_tip_content90',to_date('21/07/28','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (91,'home_tip_title91','home_tip_content91',to_date('21/07/29','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (92,'home_tip_title92','home_tip_content92',to_date('21/07/30','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (93,'home_tip_title93','home_tip_content93',to_date('21/07/31','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (94,'home_tip_title94','home_tip_content94',to_date('21/08/01','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (95,'home_tip_title95','home_tip_content95',to_date('21/08/02','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (96,'home_tip_title96','home_tip_content96',to_date('21/08/03','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (97,'home_tip_title97','home_tip_content97',to_date('21/08/04','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (98,'home_tip_title98','home_tip_content98',to_date('21/08/05','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (99,'home_tip_title99','home_tip_content99',to_date('21/08/06','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (100,'home_tip_title100','home_tip_content100',to_date('21/08/07','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (101,'home_tip_title101','home_tip_content101',to_date('21/08/08','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (102,'home_tip_title102','home_tip_content102',to_date('21/08/09','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (103,'home_tip_title103','home_tip_content103',to_date('21/08/10','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (104,'home_tip_title104','home_tip_content104',to_date('21/08/11','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (105,'home_tip_title105','home_tip_content105',to_date('21/08/12','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (106,'home_tip_title106','home_tip_content106',to_date('21/08/13','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (107,'home_tip_title107','home_tip_content107',to_date('21/08/14','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (108,'home_tip_title108','home_tip_content108',to_date('21/08/15','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (109,'home_tip_title109','home_tip_content109',to_date('21/08/16','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (110,'home_tip_title110','home_tip_content110',to_date('21/08/17','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (111,'home_tip_title111','home_tip_content111',to_date('21/08/18','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (112,'home_tip_title112','home_tip_content112',to_date('21/08/19','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (113,'home_tip_title113','home_tip_content113',to_date('21/08/20','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (114,'home_tip_title114','home_tip_content114',to_date('21/08/21','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (115,'home_tip_title115','home_tip_content115',to_date('21/08/22','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (116,'home_tip_title116','home_tip_content116',to_date('21/08/23','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (117,'home_tip_title117','home_tip_content117',to_date('21/08/24','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (118,'home_tip_title118','home_tip_content118',to_date('21/08/25','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (119,'home_tip_title119','home_tip_content119',to_date('21/08/26','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (120,'home_tip_title120','home_tip_content120',to_date('21/08/27','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (121,'home_tip_title121','home_tip_content121',to_date('21/08/28','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (122,'home_tip_title122','home_tip_content122',to_date('21/08/29','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (123,'home_tip_title123','home_tip_content123',to_date('21/08/30','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (124,'home_tip_title124','home_tip_content124',to_date('21/08/31','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (125,'home_tip_title125','home_tip_content125',to_date('21/09/01','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (126,'home_tip_title126','home_tip_content126',to_date('21/09/02','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (127,'home_tip_title127','home_tip_content127',to_date('21/09/03','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (128,'home_tip_title128','home_tip_content128',to_date('21/09/04','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (129,'home_tip_title129','home_tip_content129',to_date('21/09/05','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (130,'home_tip_title130','home_tip_content130',to_date('21/09/06','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (131,'home_tip_title131','home_tip_content131',to_date('21/09/07','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (132,'home_tip_title132','home_tip_content132',to_date('21/09/08','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (133,'home_tip_title133','home_tip_content133',to_date('21/09/09','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (134,'home_tip_title134','home_tip_content134',to_date('21/09/10','RR/MM/DD'),0,'wannabe');
Insert into HOME_TIP (HT_NUM,HT_TITLE,HT_CONTENT,HT_DATE,HT_HIT,USER_TBL_U_ID) values (135,'home_tip_title135','home_tip_content135',to_date('21/09/11','RR/MM/DD'),8,'wannabe');

--BUCKET_LIST
insert into bucket_list values(1	,'세계여행',107,'wannabe');
insert into bucket_list values(2	,'다이어트 성공',103,'wannabe');
insert into bucket_list values(3	,'제주 한달살기',98,'wannabe');
insert into bucket_list values(4	,'보컬배우기',91,'wannabe');
insert into bucket_list values(5	,'번지점프',84,'wannabe');
insert into bucket_list values(6	,'아프리카 여행',77,'wannabe');
insert into bucket_list values(7	,'스쿠버다이빙',65,'wannabe');
insert into bucket_list values(8	,'유투브 영상 제작',53,'wannabe');
insert into bucket_list values(9	,'코딩배우기',46,'wannabe');
insert into bucket_list values(10	,'저축/재테크',27,'wannabe');



--FK제거
alter table comment_tbl drop constraint comment_tbl_user_tbl_fk;
alter table non_face drop constraint non_face_user_tbl_fk;
alter table bucket_list drop constraint bucket_list_user_tbl_fk;
alter table home_tip drop constraint home_tip_user_tbl_fk;


commit;

--확정
select * from user_tbl;
select * from comment_tbl;
select * from non_face;
select * from home_tip;
select * from bucket_list;
select * from like_list;

commit;










-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             12
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        1
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 1
