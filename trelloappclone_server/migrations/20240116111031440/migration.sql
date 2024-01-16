BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "activity" (
    "id" serial PRIMARY KEY,
    "boardId" integer,
    "userId" integer NOT NULL,
    "cardId" integer,
    "description" text NOT NULL,
    "dateCreated" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "attachment" (
    "id" serial PRIMARY KEY,
    "userId" integer NOT NULL,
    "cardId" integer NOT NULL,
    "attachment" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "board" (
    "id" serial PRIMARY KEY,
    "workspaceId" integer NOT NULL,
    "userId" integer NOT NULL,
    "name" text NOT NULL,
    "description" text,
    "visibility" text NOT NULL,
    "background" text NOT NULL,
    "starred" boolean,
    "enableCover" boolean,
    "watch" boolean,
    "availableOffline" boolean,
    "label" text NOT NULL,
    "emailAddress" text NOT NULL,
    "commenting" integer,
    "memberType" integer,
    "pinned" boolean,
    "selfJoin" boolean,
    "close" boolean
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "card" (
    "id" serial PRIMARY KEY,
    "listId" integer NOT NULL,
    "userId" integer NOT NULL,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "startDate" timestamp without time zone,
    "dueDate" timestamp without time zone,
    "attachment" boolean,
    "archived" boolean,
    "checklist" boolean,
    "comments" boolean
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "checklist" (
    "id" serial PRIMARY KEY,
    "cardId" integer NOT NULL,
    "name" text NOT NULL,
    "status" boolean NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "comment" (
    "id" serial PRIMARY KEY,
    "cardId" integer NOT NULL,
    "userId" integer NOT NULL,
    "description" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "listboard" (
    "id" serial PRIMARY KEY,
    "boardId" integer NOT NULL,
    "userId" integer NOT NULL,
    "name" text NOT NULL,
    "archive" boolean
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "member" (
    "id" serial PRIMARY KEY,
    "workspaceId" integer NOT NULL,
    "userId" integer NOT NULL,
    "name" text NOT NULL,
    "role" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "email" text NOT NULL,
    "password" text NOT NULL,
    "handle" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "workspace" (
    "id" serial PRIMARY KEY,
    "userId" integer NOT NULL,
    "name" text NOT NULL,
    "handle" text NOT NULL,
    "description" text NOT NULL,
    "visibility" text NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "activity"
    ADD CONSTRAINT "activity_fk_0"
    FOREIGN KEY("boardId")
    REFERENCES "board"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "activity"
    ADD CONSTRAINT "activity_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "activity"
    ADD CONSTRAINT "activity_fk_2"
    FOREIGN KEY("cardId")
    REFERENCES "card"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "attachment"
    ADD CONSTRAINT "attachment_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "attachment"
    ADD CONSTRAINT "attachment_fk_1"
    FOREIGN KEY("cardId")
    REFERENCES "card"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "board"
    ADD CONSTRAINT "board_fk_0"
    FOREIGN KEY("workspaceId")
    REFERENCES "workspace"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "board"
    ADD CONSTRAINT "board_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "card"
    ADD CONSTRAINT "card_fk_0"
    FOREIGN KEY("listId")
    REFERENCES "listboard"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "card"
    ADD CONSTRAINT "card_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "checklist"
    ADD CONSTRAINT "checklist_fk_0"
    FOREIGN KEY("cardId")
    REFERENCES "card"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "comment"
    ADD CONSTRAINT "comment_fk_0"
    FOREIGN KEY("cardId")
    REFERENCES "card"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "comment"
    ADD CONSTRAINT "comment_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "listboard"
    ADD CONSTRAINT "listboard_fk_0"
    FOREIGN KEY("boardId")
    REFERENCES "board"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "listboard"
    ADD CONSTRAINT "listboard_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "member"
    ADD CONSTRAINT "member_fk_0"
    FOREIGN KEY("workspaceId")
    REFERENCES "workspace"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "member"
    ADD CONSTRAINT "member_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "workspace"
    ADD CONSTRAINT "workspace_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR trelloappclone
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('trelloappclone', '20240116111031440', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240116111031440', "timestamp" = now();


COMMIT;
