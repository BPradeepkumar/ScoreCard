DROP TABLE IF EXISTS "User";
CREATE TABLE "User" (

	"Id"				SERIAL PRIMARY KEY NOT NULL,

	"Name"				VARCHAR(255) NOT NULL,

	"Password"			BYTEA NOT NULL,

	"Email"				VARCHAR(255) NULL,

	"PhoneNo"			INTEGER NULL,

	"Role"				VARCHAR(255) NOT NULL,

	"State"				VARCHAR(255) NOT NULL,

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
	"Duration"			INTEGER NULL,

	"CreatedUserId"		INTEGER NULL,

	"CreatedEpoch"		INTEGER NULL

);

DROP TABLE IF EXISTS "MatchDetails";
CREATE TABLE "MatchDetails" (

	"Id"				SERIAL PRIMARY KEY NOT NULL,

	"TournamentId"		INTEGER NULL,
	
	"TeamId"			INTEGER[] NULL,

	"NoOfOvers"			INTEGER NULL,

	"UmpireInfo"		VARCHAR(255)[] NULL,

	"CreatedUserId"		INTEGER NULL,

	"CreatedEpoch"		INTEGER NULL,

	"UpdatedUserId"		INTEGER NULL,

	"UpdatedEpoch"		INTEGER NULL

);

DROP TABLE IF EXISTS "Players";
CREATE TABLE "Players" (

	"Id"				SERIAL PRIMARY KEY NOT NULL,

	"Name"				INTEGER NOT NULL,

	-- Batsman, Bowler, AllRounder
	"Skill"				VARCHAR(255) NOT NULL,

	"TeamId"			INTEGER NOT NULL,

	-- Captain, Vice-Captain, WicketKeeper
	"Role"				VARCHAR(255) NULL,

	"CreatedUserId"		INTEGER NULL,

	"CreatedEpoch"		INTEGER NULL,

	"UpdatedUserId"		INTEGER NULL,

	"UpdatedEpoch"		INTEGER NULL

);
