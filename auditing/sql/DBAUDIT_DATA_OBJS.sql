--------------------------------------------------------
--  DDL for Table DB_AUDIT_PARAMETERS
--------------------------------------------------------

  CREATE TABLE "DBAUDIT_DATA"."DB_AUDIT_PARAMETERS" 
   (	"PARAMETER_NAME" VARCHAR2(50 BYTE), 
	"PARAMETER_VALUE" VARCHAR2(100 BYTE), 
	"START_DATE" DATE DEFAULT sysdate, 
	"END_DATE" DATE
   ) ;

   COMMENT ON COLUMN "DBAUDIT_DATA"."DB_AUDIT_PARAMETERS"."PARAMETER_VALUE" IS 'Parameter value';
--------------------------------------------------------
--  DDL for Table DB_AUDIT_PURGE_LOG
--------------------------------------------------------

  CREATE TABLE "DBAUDIT_DATA"."DB_AUDIT_PURGE_LOG" 
   (	"ACTION" VARCHAR2(100 BYTE), 
	"PURGE_TIMESTAMP" TIMESTAMP (6), 
	"JOB_RUN" DATE
   ) ;


REM INSERTING into DBAUDIT_DATA.DB_AUDIT_PARAMETERS
SET DEFINE OFF;
Insert into DBAUDIT_DATA.DB_AUDIT_PARAMETERS (PARAMETER_NAME,PARAMETER_VALUE,START_DATE,END_DATE) values ('NUM_OF_DAYS_AUDITLOG_IN_DB','7',to_date('2019-11-05 15:17:29','RRRR-MM-DD HH24:MI:SS'),null);
commit;
REM INSERTING into DBAUDIT_DATA.DB_AUDIT_PURGE_LOG
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index DB_AUDIT_PARAMETERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DBAUDIT_DATA"."DB_AUDIT_PARAMETERS_PK" ON "DBAUDIT_DATA"."DB_AUDIT_PARAMETERS" ("PARAMETER_NAME") 
  ;
--------------------------------------------------------
--  Constraints for Table DB_AUDIT_PURGE_LOG
--------------------------------------------------------

  ALTER TABLE "DBAUDIT_DATA"."DB_AUDIT_PURGE_LOG" MODIFY ("ACTION" NOT NULL ENABLE);
  ALTER TABLE "DBAUDIT_DATA"."DB_AUDIT_PURGE_LOG" MODIFY ("PURGE_TIMESTAMP" NOT NULL ENABLE);
  ALTER TABLE "DBAUDIT_DATA"."DB_AUDIT_PURGE_LOG" MODIFY ("JOB_RUN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DB_AUDIT_PARAMETERS
--------------------------------------------------------

  ALTER TABLE "DBAUDIT_DATA"."DB_AUDIT_PARAMETERS" MODIFY ("PARAMETER_NAME" NOT NULL ENABLE);
  ALTER TABLE "DBAUDIT_DATA"."DB_AUDIT_PARAMETERS" MODIFY ("PARAMETER_VALUE" NOT NULL ENABLE);
  ALTER TABLE "DBAUDIT_DATA"."DB_AUDIT_PARAMETERS" MODIFY ("START_DATE" NOT NULL ENABLE);
  ALTER TABLE "DBAUDIT_DATA"."DB_AUDIT_PARAMETERS" ADD CONSTRAINT "DB_AUDIT_PARAMETERS_PK" PRIMARY KEY ("PARAMETER_NAME")
  USING INDEX  ENABLE;
