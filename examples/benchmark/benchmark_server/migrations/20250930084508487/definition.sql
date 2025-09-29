BEGIN;

--
-- Function: gen_random_uuid_v7()
-- Source: https://gist.github.com/kjmph/5bd772b2c2df145aa645b837da7eca74
-- License: MIT (copyright notice included on the generator source code).
--
create or replace function gen_random_uuid_v7()
returns uuid
as $$
begin
  -- use random v4 uuid as starting point (which has the same variant we need)
  -- then overlay timestamp
  -- then set version 7 by flipping the 2 and 1 bit in the version 4 string
  return encode(
    set_bit(
      set_bit(
        overlay(uuid_send(gen_random_uuid())
                placing substring(int8send(floor(extract(epoch from clock_timestamp()) * 1000)::bigint) from 3)
                from 1 for 6
        ),
        52, 1
      ),
      53, 1
    ),
    'hex')::uuid;
end
$$
language plpgsql
volatile;

--
-- Class LargeMessage as table large_message
--
CREATE TABLE "large_message" (
    "id" bigserial PRIMARY KEY,
    "nextId" bigint,
    "uuidDefaultRandom" uuid NOT NULL DEFAULT gen_random_uuid(),
    "uuidDefaultRandomV7" uuid NOT NULL DEFAULT gen_random_uuid_v7(),
    "uuidDefaultRandomNull" uuid DEFAULT gen_random_uuid(),
    "uuidDefaultStr" uuid NOT NULL DEFAULT '550e8400-e29b-41d4-a716-446655440000'::uuid,
    "uuidDefaultStrNull" uuid DEFAULT '3f2504e0-4f89-11d3-9a0c-0305e82c3301'::uuid,
    "uriDefault" text NOT NULL DEFAULT 'https://serverpod.dev/default'::text,
    "uriDefaultNull" text DEFAULT 'https://serverpod.dev/default'::text,
    "stringDefault" text NOT NULL DEFAULT 'This is a default value'::text,
    "stringDefaultNull" text DEFAULT 'This is a default null value'::text,
    "intDefault" bigint NOT NULL DEFAULT 10,
    "intDefaultNull" bigint DEFAULT 20,
    "durationDefault" bigint NOT NULL DEFAULT 94230100,
    "durationDefaultNull" bigint DEFAULT 177640100,
    "doubleDefault" double precision NOT NULL DEFAULT 10.5,
    "doubleDefaultNull" double precision DEFAULT 20.5,
    "dateTimeDefaultNow" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateTimeDefaultStr" timestamp without time zone NOT NULL DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "dateTimeDefaultStrNull" timestamp without time zone DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "boolDefaultTrue" boolean NOT NULL DEFAULT true,
    "boolDefaultFalse" boolean NOT NULL DEFAULT false,
    "boolDefaultNullFalse" boolean DEFAULT false,
    "bigintDefaultStr" text NOT NULL DEFAULT '-1234567890123456789099999999'::text,
    "bigintDefaultStrNull" text DEFAULT '1234567890123456789099999999'::text,
    "uuidDefaultRandom2" uuid NOT NULL DEFAULT gen_random_uuid(),
    "uuidDefaultRandomV72" uuid NOT NULL DEFAULT gen_random_uuid_v7(),
    "uuidDefaultRandomNull2" uuid DEFAULT gen_random_uuid(),
    "uuidDefaultStr2" uuid NOT NULL DEFAULT '550e8400-e29b-41d4-a716-446655440000'::uuid,
    "uuidDefaultStrNull2" uuid DEFAULT '3f2504e0-4f89-11d3-9a0c-0305e82c3301'::uuid,
    "uriDefault2" text NOT NULL DEFAULT 'https://serverpod.dev/default'::text,
    "uriDefaultNull2" text DEFAULT 'https://serverpod.dev/default'::text,
    "stringDefault2" text NOT NULL DEFAULT 'This is a default value'::text,
    "stringDefaultNull2" text DEFAULT 'This is a default null value'::text,
    "intDefault2" bigint NOT NULL DEFAULT 10,
    "intDefaultNull2" bigint DEFAULT 20,
    "durationDefault2" bigint NOT NULL DEFAULT 94230100,
    "durationDefaultNull2" bigint DEFAULT 177640100,
    "doubleDefault2" double precision NOT NULL DEFAULT 10.5,
    "doubleDefaultNull2" double precision DEFAULT 20.5,
    "dateTimeDefaultNow2" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateTimeDefaultStr2" timestamp without time zone NOT NULL DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "dateTimeDefaultStrNull2" timestamp without time zone DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "boolDefaultTrue2" boolean NOT NULL DEFAULT true,
    "boolDefaultFalse2" boolean NOT NULL DEFAULT false,
    "boolDefaultNullFalse2" boolean DEFAULT false,
    "bigintDefaultStr2" text NOT NULL DEFAULT '-1234567890123456789099999999'::text,
    "bigintDefaultStrNull2" text DEFAULT '1234567890123456789099999999'::text,
    "uuidDefaultRandom3" uuid NOT NULL DEFAULT gen_random_uuid(),
    "uuidDefaultRandomV73" uuid NOT NULL DEFAULT gen_random_uuid_v7(),
    "uuidDefaultRandomNull3" uuid DEFAULT gen_random_uuid(),
    "uuidDefaultStr3" uuid NOT NULL DEFAULT '550e8400-e29b-41d4-a716-446655440000'::uuid,
    "uuidDefaultStrNull3" uuid DEFAULT '3f2504e0-4f89-11d3-9a0c-0305e82c3301'::uuid,
    "uriDefault3" text NOT NULL DEFAULT 'https://serverpod.dev/default'::text,
    "uriDefaultNull3" text DEFAULT 'https://serverpod.dev/default'::text,
    "stringDefault3" text NOT NULL DEFAULT 'This is a default value'::text,
    "stringDefaultNull3" text DEFAULT 'This is a default null value'::text,
    "intDefault3" bigint NOT NULL DEFAULT 10,
    "intDefaultNull3" bigint DEFAULT 20,
    "durationDefault3" bigint NOT NULL DEFAULT 94230100,
    "durationDefaultNull3" bigint DEFAULT 177640100,
    "doubleDefault3" double precision NOT NULL DEFAULT 10.5,
    "doubleDefaultNull3" double precision DEFAULT 20.5,
    "dateTimeDefaultNow3" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateTimeDefaultStr3" timestamp without time zone NOT NULL DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "dateTimeDefaultStrNull3" timestamp without time zone DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "boolDefaultTrue3" boolean NOT NULL DEFAULT true,
    "boolDefaultFalse3" boolean NOT NULL DEFAULT false,
    "boolDefaultNullFalse3" boolean DEFAULT false,
    "bigintDefaultStr3" text NOT NULL DEFAULT '-1234567890123456789099999999'::text,
    "bigintDefaultStrNull3" text DEFAULT '1234567890123456789099999999'::text,
    "uuidDefaultRandom4" uuid NOT NULL DEFAULT gen_random_uuid(),
    "uuidDefaultRandomV74" uuid NOT NULL DEFAULT gen_random_uuid_v7(),
    "uuidDefaultRandomNull4" uuid DEFAULT gen_random_uuid(),
    "uuidDefaultStr4" uuid NOT NULL DEFAULT '550e8400-e29b-41d4-a716-446655440000'::uuid,
    "uuidDefaultStrNull4" uuid DEFAULT '3f2504e0-4f89-11d3-9a0c-0305e82c3301'::uuid,
    "uriDefault4" text NOT NULL DEFAULT 'https://serverpod.dev/default'::text,
    "uriDefaultNull4" text DEFAULT 'https://serverpod.dev/default'::text,
    "stringDefault4" text NOT NULL DEFAULT 'This is a default value'::text,
    "stringDefaultNull4" text DEFAULT 'This is a default null value'::text,
    "intDefault4" bigint NOT NULL DEFAULT 10,
    "intDefaultNull4" bigint DEFAULT 20,
    "durationDefault4" bigint NOT NULL DEFAULT 94230100,
    "durationDefaultNull4" bigint DEFAULT 177640100,
    "doubleDefault4" double precision NOT NULL DEFAULT 10.5,
    "doubleDefaultNull4" double precision DEFAULT 20.5,
    "dateTimeDefaultNow4" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateTimeDefaultStr4" timestamp without time zone NOT NULL DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "dateTimeDefaultStrNull4" timestamp without time zone DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "boolDefaultTrue4" boolean NOT NULL DEFAULT true,
    "boolDefaultFalse4" boolean NOT NULL DEFAULT false,
    "boolDefaultNullFalse4" boolean DEFAULT false,
    "bigintDefaultStr4" text NOT NULL DEFAULT '-1234567890123456789099999999'::text,
    "bigintDefaultStrNull4" text DEFAULT '1234567890123456789099999999'::text,
    "uuidDefaultRandom5" uuid NOT NULL DEFAULT gen_random_uuid(),
    "uuidDefaultRandomV75" uuid NOT NULL DEFAULT gen_random_uuid_v7(),
    "uuidDefaultRandomNull5" uuid DEFAULT gen_random_uuid(),
    "uuidDefaultStr5" uuid NOT NULL DEFAULT '550e8400-e29b-41d4-a716-446655440000'::uuid,
    "uuidDefaultStrNull5" uuid DEFAULT '3f2504e0-4f89-11d3-9a0c-0305e82c3301'::uuid,
    "uriDefault5" text NOT NULL DEFAULT 'https://serverpod.dev/default'::text,
    "uriDefaultNull5" text DEFAULT 'https://serverpod.dev/default'::text,
    "stringDefault5" text NOT NULL DEFAULT 'This is a default value'::text,
    "stringDefaultNull5" text DEFAULT 'This is a default null value'::text,
    "intDefault5" bigint NOT NULL DEFAULT 10,
    "intDefaultNull5" bigint DEFAULT 20,
    "durationDefault5" bigint NOT NULL DEFAULT 94230100,
    "durationDefaultNull5" bigint DEFAULT 177640100,
    "doubleDefault5" double precision NOT NULL DEFAULT 10.5,
    "doubleDefaultNull5" double precision DEFAULT 20.5,
    "dateTimeDefaultNow5" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateTimeDefaultStr5" timestamp without time zone NOT NULL DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "dateTimeDefaultStrNull5" timestamp without time zone DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "boolDefaultTrue5" boolean NOT NULL DEFAULT true,
    "boolDefaultFalse5" boolean NOT NULL DEFAULT false,
    "boolDefaultNullFalse5" boolean DEFAULT false,
    "bigintDefaultStr5" text NOT NULL DEFAULT '-1234567890123456789099999999'::text,
    "bigintDefaultStrNull5" text DEFAULT '1234567890123456789099999999'::text,
    "uuidDefaultRandom6" uuid NOT NULL DEFAULT gen_random_uuid(),
    "uuidDefaultRandomV76" uuid NOT NULL DEFAULT gen_random_uuid_v7(),
    "uuidDefaultRandomNull6" uuid DEFAULT gen_random_uuid(),
    "uuidDefaultStr6" uuid NOT NULL DEFAULT '550e8400-e29b-41d4-a716-446655440000'::uuid,
    "uuidDefaultStrNull6" uuid DEFAULT '3f2504e0-4f89-11d3-9a0c-0305e82c3301'::uuid,
    "uriDefault6" text NOT NULL DEFAULT 'https://serverpod.dev/default'::text,
    "uriDefaultNull6" text DEFAULT 'https://serverpod.dev/default'::text,
    "stringDefault6" text NOT NULL DEFAULT 'This is a default value'::text,
    "stringDefaultNull6" text DEFAULT 'This is a default null value'::text,
    "intDefault6" bigint NOT NULL DEFAULT 10,
    "intDefaultNull6" bigint DEFAULT 20,
    "durationDefault6" bigint NOT NULL DEFAULT 94230100,
    "durationDefaultNull6" bigint DEFAULT 177640100,
    "doubleDefault6" double precision NOT NULL DEFAULT 10.5,
    "doubleDefaultNull6" double precision DEFAULT 20.5,
    "dateTimeDefaultNow6" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateTimeDefaultStr6" timestamp without time zone NOT NULL DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "dateTimeDefaultStrNull6" timestamp without time zone DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "boolDefaultTrue6" boolean NOT NULL DEFAULT true,
    "boolDefaultFalse6" boolean NOT NULL DEFAULT false,
    "boolDefaultNullFalse6" boolean DEFAULT false,
    "bigintDefaultStr6" text NOT NULL DEFAULT '-1234567890123456789099999999'::text,
    "bigintDefaultStrNull6" text DEFAULT '1234567890123456789099999999'::text,
    "uuidDefaultRandom7" uuid NOT NULL DEFAULT gen_random_uuid(),
    "uuidDefaultRandomV77" uuid NOT NULL DEFAULT gen_random_uuid_v7(),
    "uuidDefaultRandomNull7" uuid DEFAULT gen_random_uuid(),
    "uuidDefaultStr7" uuid NOT NULL DEFAULT '550e8400-e29b-41d4-a716-446655440000'::uuid,
    "uuidDefaultStrNull7" uuid DEFAULT '3f2504e0-4f89-11d3-9a0c-0305e82c3301'::uuid,
    "uriDefault7" text NOT NULL DEFAULT 'https://serverpod.dev/default'::text,
    "uriDefaultNull7" text DEFAULT 'https://serverpod.dev/default'::text,
    "stringDefault7" text NOT NULL DEFAULT 'This is a default value'::text,
    "stringDefaultNull7" text DEFAULT 'This is a default null value'::text,
    "intDefault7" bigint NOT NULL DEFAULT 10,
    "intDefaultNull7" bigint DEFAULT 20,
    "durationDefault7" bigint NOT NULL DEFAULT 94230100,
    "durationDefaultNull7" bigint DEFAULT 177640100,
    "doubleDefault7" double precision NOT NULL DEFAULT 10.5,
    "doubleDefaultNull7" double precision DEFAULT 20.5,
    "dateTimeDefaultNow7" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateTimeDefaultStr7" timestamp without time zone NOT NULL DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "dateTimeDefaultStrNull7" timestamp without time zone DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "boolDefaultTrue7" boolean NOT NULL DEFAULT true,
    "boolDefaultFalse7" boolean NOT NULL DEFAULT false,
    "boolDefaultNullFalse7" boolean DEFAULT false,
    "bigintDefaultStr7" text NOT NULL DEFAULT '-1234567890123456789099999999'::text,
    "bigintDefaultStrNull7" text DEFAULT '1234567890123456789099999999'::text,
    "uuidDefaultRandom8" uuid NOT NULL DEFAULT gen_random_uuid(),
    "uuidDefaultRandomV78" uuid NOT NULL DEFAULT gen_random_uuid_v7(),
    "uuidDefaultRandomNull8" uuid DEFAULT gen_random_uuid(),
    "uuidDefaultStr8" uuid NOT NULL DEFAULT '550e8400-e29b-41d4-a716-446655440000'::uuid,
    "uuidDefaultStrNull8" uuid DEFAULT '3f2504e0-4f89-11d3-9a0c-0305e82c3301'::uuid,
    "uriDefault8" text NOT NULL DEFAULT 'https://serverpod.dev/default'::text,
    "uriDefaultNull8" text DEFAULT 'https://serverpod.dev/default'::text,
    "stringDefault8" text NOT NULL DEFAULT 'This is a default value'::text,
    "stringDefaultNull8" text DEFAULT 'This is a default null value'::text,
    "intDefault8" bigint NOT NULL DEFAULT 10,
    "intDefaultNull8" bigint DEFAULT 20,
    "durationDefault8" bigint NOT NULL DEFAULT 94230100,
    "durationDefaultNull8" bigint DEFAULT 177640100,
    "doubleDefault8" double precision NOT NULL DEFAULT 10.5,
    "doubleDefaultNull8" double precision DEFAULT 20.5,
    "dateTimeDefaultNow8" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateTimeDefaultStr8" timestamp without time zone NOT NULL DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "dateTimeDefaultStrNull8" timestamp without time zone DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "boolDefaultTrue8" boolean NOT NULL DEFAULT true,
    "boolDefaultFalse8" boolean NOT NULL DEFAULT false,
    "boolDefaultNullFalse8" boolean DEFAULT false,
    "bigintDefaultStr8" text NOT NULL DEFAULT '-1234567890123456789099999999'::text,
    "bigintDefaultStrNull8" text DEFAULT '1234567890123456789099999999'::text,
    "uuidDefaultRandom9" uuid NOT NULL DEFAULT gen_random_uuid(),
    "uuidDefaultRandomV79" uuid NOT NULL DEFAULT gen_random_uuid_v7(),
    "uuidDefaultRandomNull9" uuid DEFAULT gen_random_uuid(),
    "uuidDefaultStr9" uuid NOT NULL DEFAULT '550e8400-e29b-41d4-a716-446655440000'::uuid,
    "uuidDefaultStrNull9" uuid DEFAULT '3f2504e0-4f89-11d3-9a0c-0305e82c3301'::uuid,
    "uriDefault9" text NOT NULL DEFAULT 'https://serverpod.dev/default'::text,
    "uriDefaultNull9" text DEFAULT 'https://serverpod.dev/default'::text,
    "stringDefault9" text NOT NULL DEFAULT 'This is a default value'::text,
    "stringDefaultNull9" text DEFAULT 'This is a default null value'::text,
    "intDefault9" bigint NOT NULL DEFAULT 10,
    "intDefaultNull9" bigint DEFAULT 20,
    "durationDefault9" bigint NOT NULL DEFAULT 94230100,
    "durationDefaultNull9" bigint DEFAULT 177640100,
    "doubleDefault9" double precision NOT NULL DEFAULT 10.5,
    "doubleDefaultNull9" double precision DEFAULT 20.5,
    "dateTimeDefaultNow9" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateTimeDefaultStr9" timestamp without time zone NOT NULL DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "dateTimeDefaultStrNull9" timestamp without time zone DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "boolDefaultTrue9" boolean NOT NULL DEFAULT true,
    "boolDefaultFalse9" boolean NOT NULL DEFAULT false,
    "boolDefaultNullFalse9" boolean DEFAULT false,
    "bigintDefaultStr9" text NOT NULL DEFAULT '-1234567890123456789099999999'::text,
    "bigintDefaultStrNull9" text DEFAULT '1234567890123456789099999999'::text,
    "uuidDefaultRandom10" uuid NOT NULL DEFAULT gen_random_uuid(),
    "uuidDefaultRandomV710" uuid NOT NULL DEFAULT gen_random_uuid_v7(),
    "uuidDefaultRandomNull10" uuid DEFAULT gen_random_uuid(),
    "uuidDefaultStr10" uuid NOT NULL DEFAULT '550e8400-e29b-41d4-a716-446655440000'::uuid,
    "uuidDefaultStrNull10" uuid DEFAULT '3f2504e0-4f89-11d3-9a0c-0305e82c3301'::uuid,
    "uriDefault10" text NOT NULL DEFAULT 'https://serverpod.dev/default'::text,
    "uriDefaultNull10" text DEFAULT 'https://serverpod.dev/default'::text,
    "stringDefault10" text NOT NULL DEFAULT 'This is a default value'::text,
    "stringDefaultNull10" text DEFAULT 'This is a default null value'::text,
    "intDefault10" bigint NOT NULL DEFAULT 10,
    "intDefaultNull10" bigint DEFAULT 20,
    "durationDefault10" bigint NOT NULL DEFAULT 94230100,
    "durationDefaultNull10" bigint DEFAULT 177640100,
    "doubleDefault10" double precision NOT NULL DEFAULT 10.5,
    "doubleDefaultNull10" double precision DEFAULT 20.5,
    "dateTimeDefaultNow10" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateTimeDefaultStr10" timestamp without time zone NOT NULL DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "dateTimeDefaultStrNull10" timestamp without time zone DEFAULT '2024-05-24 22:00:00'::timestamp without time zone,
    "boolDefaultTrue10" boolean NOT NULL DEFAULT true,
    "boolDefaultFalse10" boolean NOT NULL DEFAULT false,
    "boolDefaultNullFalse10" boolean DEFAULT false,
    "bigintDefaultStr10" text NOT NULL DEFAULT '-1234567890123456789099999999'::text,
    "bigintDefaultStrNull10" text DEFAULT '1234567890123456789099999999'::text
);

-- Indexes
CREATE UNIQUE INDEX "large_next_unique_idx" ON "large_message" USING btree ("nextId");

--
-- Class SmallMessage as table small_message
--
CREATE TABLE "small_message" (
    "id" bigserial PRIMARY KEY,
    "message" text NOT NULL DEFAULT 'This is the default message value'::text,
    "nextId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "small_next_unique_idx" ON "small_message" USING btree ("nextId");

--
-- Class CloudStorageEntry as table serverpod_cloud_storage
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- Class CloudStorageDirectUploadEntry as table serverpod_cloud_storage_direct_upload
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- Class FutureCallEntry as table serverpod_future_call
--
CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- Class ServerHealthConnectionInfo as table serverpod_health_connection_info
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- Class ServerHealthMetric as table serverpod_health_metric
--
CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- Class LogEntry as table serverpod_log
--
CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId");

--
-- Class MessageLogEntry as table serverpod_message_log
--
CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

--
-- Class MethodInfo as table serverpod_method
--
CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- Class DatabaseMigrationVersion as table serverpod_migrations
--
CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- Class QueryLogEntry as table serverpod_query_log
--
CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId");

--
-- Class ReadWriteTestEntry as table serverpod_readwrite_test
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

--
-- Class RuntimeSettings as table serverpod_runtime_settings
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- Class SessionLogEntry as table serverpod_session_log
--
CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "userId" text,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- Foreign relations for "large_message" table
--
ALTER TABLE ONLY "large_message"
    ADD CONSTRAINT "large_message_fk_0"
    FOREIGN KEY("nextId")
    REFERENCES "large_message"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "small_message" table
--
ALTER TABLE ONLY "small_message"
    ADD CONSTRAINT "small_message_fk_0"
    FOREIGN KEY("nextId")
    REFERENCES "small_message"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_log" table
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_message_log" table
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_query_log" table
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR benchmark
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('benchmark', '20250930084508487', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250930084508487', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20250825102336032-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250825102336032-v3-0-0', "timestamp" = now();


COMMIT;
