--------------------------------------------------------
--  File created - Sunday-February-22-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CATEGORY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MENU"."CATEGORY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "MENU"."CATEGORY" 
   (	"ID" NUMBER(*,0), 
	"PARENT" NUMBER(*,0), 
	"NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MENU_SPACE" ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "MENU"."PRODUCT" 
   (	"ID" NUMBER, 
	"CATEGORY_ID" NUMBER, 
	"NAME" NVARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "MENU_SPACE" ;
REM INSERTING into MENU.CATEGORY
SET DEFINE OFF;
REM INSERTING into MENU.PRODUCT
SET DEFINE OFF;
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "MENU"."PRODUCT" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MENU"."PRODUCT" MODIFY ("CATEGORY_ID" NOT NULL ENABLE);
  ALTER TABLE "MENU"."PRODUCT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "MENU"."CATEGORY" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MENU"."CATEGORY" MODIFY ("PARENT" NOT NULL ENABLE);
  ALTER TABLE "MENU"."CATEGORY" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  DDL for Trigger CATEGORY_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MENU"."CATEGORY_TRG" 
BEFORE INSERT ON MENU.CATEGORY 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT CATEGORY_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "MENU"."CATEGORY_TRG" ENABLE;
