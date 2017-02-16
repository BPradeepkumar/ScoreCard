DROP TABLE IF EXISTS "User";
CREATE TABLE "User" (
	"Id"				SERIAL PRIMARY KEY NOT NULL,

	"Name"				VARCHAR(255) NOT NULL,

	"Password"			BYTEA NOT NULL,

	"Email"				VARCHAR(255) NULL,

	"PhoneNo"			INTEGER NULL,

	"CreatedUserId"		INTEGER NULL,

	"CreatedEpoch"		INTEGER NULL
);


DROP TABLE IF EXISTS "Team";
CREATE TABLE "Team" (
	"Id"				SERIAL PRIMARY KEY NOT NULL,

	"Name"				VARCHAR(255) NOT NULL,

	"NoOfPlayers"		INTEGER NULL,

	"CreatedUserId"		INTEGER NULL,

	"CreatedEpoch"		INTEGER NULL
);

DROP TABLE IF EXISTS "Tournament";
CREATE TABLE "Tournament" (
	"Id"				SERIAL PRIMARY KEY NOT NULL,

	"Name"				VARCHAR(255) NOT NULL,

	"NoOfMatches"		INTEGER NULL,
	
	--In days
	"Duration"			INTEGER NULL
);
