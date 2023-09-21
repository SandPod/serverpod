BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "citizen" ADD COLUMN "_company_employees_companyId" integer;
ALTER TABLE ONLY "citizen"
    ADD CONSTRAINT "citizen_fk_2"
    FOREIGN KEY("_company_employees_companyId")
    REFERENCES "company"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR serverpod_test
--
INSERT INTO "serverpod_migrations" ("module", "version", "priority", "timestamp")
    VALUES ('serverpod_test', '20230921094758', 2, now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20230921094758', "priority" = 2;


COMMIT;
