-- 생성자 Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   위치:        2021-04-28 16:46:43 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



CREATE TABLESPACE team5 
--  WARNING: Tablespace has no data files defined 
 LOGGING ONLINE EXTENT MANAGEMENT LOCAL AUTOALLOCATE FLASHBACK ON;

CREATE user team5se identified by account unlock 
;

CREATE TABLE bucket_list (
    bl_num          NUMBER(5) NOT NULL,
    bl_title        VARCHAR2(50),
    bl_like         NUMBER(8),
    user_tbl_u_id   VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE bucket_list ADD CONSTRAINT bucket_list_pk PRIMARY KEY ( bl_num );

CREATE TABLE comment_tbl (
    comm_num             NUMBER(5) NOT NULL,
    comm_table           VARCHAR2(10),
    comm_content         VARCHAR2(1000),
    comm_ref             NUMBER(5),
    comm_step            NUMBER(5),
    comm_level           NUMBER(5),
    user_tbl_u_id        VARCHAR2(15) NOT NULL,
    non_face_nf_num      NUMBER(5) NOT NULL,
    home_tip_ht_num      NUMBER(5) NOT NULL,
    bucket_list_bl_num   NUMBER(5) NOT NULL
)
LOGGING;

ALTER TABLE comment_tbl ADD CONSTRAINT comment_tbl_pk PRIMARY KEY ( comm_num );

CREATE TABLE home_tip (
    ht_num          NUMBER(5) NOT NULL,
    ht_title        VARCHAR2(50),
    ht_content      VARCHAR2(1000),
    ht_date         DATE,
    ht_hit          NUMBER(8),
    user_tbl_u_id   VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE home_tip ADD CONSTRAINT home_tip_pk PRIMARY KEY ( ht_num );

CREATE TABLE non_face (
    nf_num          NUMBER(5) NOT NULL,
    nf_title        VARCHAR2(50),
    nf_content      VARCHAR2(1000),
    nf_date         DATE,
    nf_hit          NUMBER(8),
    user_tbl_u_id   VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE non_face ADD CONSTRAINT non_face_pk PRIMARY KEY ( nf_num );

CREATE TABLE user_tbl (
    u_id        VARCHAR2(15) NOT NULL,
    u_pwd       VARCHAR2(15),
    u_name      VARCHAR2(20),
    u_email     VARCHAR2(40),
    u_phone     NUMBER(11),
    u_birth     NUMBER(8),
    u_sex       VARCHAR2(2),
    u_manager   NUMBER(1)
)
LOGGING;

ALTER TABLE user_tbl ADD CONSTRAINT user_tbl_pk PRIMARY KEY ( u_id );

ALTER TABLE bucket_list
    ADD CONSTRAINT bucket_list_user_tbl_fk FOREIGN KEY ( user_tbl_u_id )
        REFERENCES user_tbl ( u_id )
    NOT DEFERRABLE;

ALTER TABLE comment_tbl
    ADD CONSTRAINT comment_tbl_bucket_list_fk FOREIGN KEY ( bucket_list_bl_num )
        REFERENCES bucket_list ( bl_num )
    NOT DEFERRABLE;

ALTER TABLE comment_tbl
    ADD CONSTRAINT comment_tbl_home_tip_fk FOREIGN KEY ( home_tip_ht_num )
        REFERENCES home_tip ( ht_num )
    NOT DEFERRABLE;

ALTER TABLE comment_tbl
    ADD CONSTRAINT comment_tbl_non_face_fk FOREIGN KEY ( non_face_nf_num )
        REFERENCES non_face ( nf_num )
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

INSERT INTO user_tbl VALUES('wannabe','1234','안녕','wannabe@.com',01011111111,002244,1,0);
INSERT INTO user_tbl VALUES('manager','1111','매니저','manager@.com',01011112222,004444,2,1);

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
