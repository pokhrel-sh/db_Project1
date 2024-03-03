DROP TABLE IF EXISTS "PriorityLevel";
DROP TABLE IF EXISTS "Bug";
DROP TABLE IF EXISTS "Framework";
DROP TABLE IF EXISTS "Status";
DROP TABLE IF EXISTS "Project";
DROP TABLE IF EXISTS "Developer";
DROP TABLE IF EXISTS "BugAssignment";
DROP TABLE IF EXISTS "History";



CREATE TABLE "Priority" (
	"priorityID"	INTEGER NOT NULL UNIQUE,
	"priorityName"	TEXT NOT NULL,
	PRIMARY KEY("priorityID" AUTOINCREMENT)
);
CREATE TABLE "Framework" (
	"frameworkID"	INTEGER NOT NULL UNIQUE,
	"frameworkName"	TEXT,
	PRIMARY KEY("frameworkID" AUTOINCREMENT)
);
CREATE TABLE "Status" (
	"statusID"	INTEGER NOT NULL UNIQUE,
	"statusName"	TEXT,
	PRIMARY KEY("statusID" AUTOINCREMENT)
);
CREATE TABLE "Project" (
    "projectID" INTEGER NOT NULL UNIQUE,
    "projectName" TEXT,
    PRIMARY KEY("projectID" AUTOINCREMENT)
);

CREATE TABLE "Bug"(
	"bugID" INTEGER NOT NULL UNIQUE,
	"description" TEXT,
	"projectID" INTEGER NOT NULL,
	"submissionDate" INTEGER,
	"dateOpened" INTEGER,
	"frameworkID" INTEGER NOT NULL,
	PRIMARY KEY ("bugID" AUTOINCREMENT),
	FOREIGN KEY ("frameworkID") REFERENCES "Framework"("frameworkID"),
	FOREIGN KEY ("projectID") REFERENCES "Project"("projectID")
);

CREATE TABLE "History"(
	"historyID" INTEGER NOT NULL UNIQUE,
	"bugID" INTEGER NOT NULL,
	"statusID" INTEGER NOT NULL,
	"statusName" TEXT,
	"priorityName" TEXT,
    "priorityID" INTEGER NOT NULL,
	PRIMARY KEY("historyID" AUTOINCREMENT),
	FOREIGN KEY("statusID") REFERENCES "Status"("statusID"),
	FOREIGN KEY("statusName") REFERENCES "Status"("statusName"),
	FOREIGN KEY("priorityID") REFERENCES "Priority"("priorityID"),
	FOREIGN KEY("priorityName") REFERENCES "Priority"("priorityName")
);
CREATE TABLE "Developer" (
	"devID" INTEGER NOT NULL UNIQUE,
	"devName" TEXT,
	"bugID" INTEGER NOT NULL,
	PRIMARY KEY("devID" AUTOINCREMENT),
	FOREIGN KEY("bugID") REFERENCES "Bug"("bugID")
);
CREATE TABLE "BugAssignment" (
	"assignmentID" INTEGER NOT NULL UNIQUE,
	"bugID" INTEGER NOT NULL,
	"devID" INTEGER NOT NULL,
	"devName" TEXT,
	PRIMARY KEY("assignmentID" AUTOINCREMENT),
	FOREIGN KEY("devID") REFERENCES "Developer"("devID"),
	FOREIGN KEY("devName") REFERENCES "Developer"("devName")
);
