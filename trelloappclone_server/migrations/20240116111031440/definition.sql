BEGIN;

--
-- Class Activity as table activity
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
-- Class Attachment as table attachment
--
CREATE TABLE "attachment" (
    "id" serial PRIMARY KEY,
    "userId" integer NOT NULL,
    "cardId" integer NOT NULL,
    "attachment" text NOT NULL
);

--
-- Class Board as table board
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
-- Class Card as table card
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
-- Class Checklist as table checklist
--
CREATE TABLE "checklist" (
    "id" serial PRIMARY KEY,
    "cardId" integer NOT NULL,
    "name" text NOT NULL,
    "status" boolean NOT NULL
);

--
-- Class Comment as table comment
--
CREATE TABLE "comment" (
    "id" serial PRIMARY KEY,
    "cardId" integer NOT NULL,
    "userId" integer NOT NULL,
    "description" text NOT NULL
);

--
-- Class Listboard as table listboard
--
CREATE TABLE "listboard" (
    "id" serial PRIMARY KEY,
    "boardId" integer NOT NULL,
    "userId" integer NOT NULL,
    "name" text NOT NULL,
    "archive" boolean
);

--
-- Class Member as table member
--
CREATE TABLE "member" (
    "id" serial PRIMARY KEY,
    "workspaceId" integer NOT NULL,
    "userId" integer NOT NULL,
    "name" text NOT NULL,
    "role" text NOT NULL
);

--
-- Class User as table user
--
CREATE TABLE "user" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "email" text NOT NULL,
    "password" text NOT NULL,
    "handle" text NOT NULL
);

--
-- Class Workspace as table workspace
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
-- Foreign relations for "activity" table
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
-- Foreign relations for "attachment" table
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
-- Foreign relations for "board" table
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
-- Foreign relations for "card" table
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
-- Foreign relations for "checklist" table
--
ALTER TABLE ONLY "checklist"
    ADD CONSTRAINT "checklist_fk_0"
    FOREIGN KEY("cardId")
    REFERENCES "card"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "comment" table
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
-- Foreign relations for "listboard" table
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
-- Foreign relations for "member" table
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
-- Foreign relations for "workspace" table
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
