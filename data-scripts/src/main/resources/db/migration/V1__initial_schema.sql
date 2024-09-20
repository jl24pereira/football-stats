-- V1__initial_schema.sql

CREATE TABLE IF NOT EXISTS teams
(
    id     SERIAL PRIMARY KEY,
    name   VARCHAR(100) NOT NULL,
    league VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS matches
(
    id              SERIAL PRIMARY KEY,
    home_team_id    INT REFERENCES teams (id),
    away_team_id    INT REFERENCES teams (id),
    home_team_score INT  NOT NULL,
    away_team_score INT  NOT NULL,
    match_date      DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS standings
(
    id              SERIAL PRIMARY KEY,
    team_id         INT REFERENCES teams (id),
    points          INT DEFAULT 0,
    matches_played  INT DEFAULT 0,
    wins            INT DEFAULT 0,
    draws           INT DEFAULT 0,
    losses          INT DEFAULT 0,
    goals_for       INT DEFAULT 0,
    goals_against   INT DEFAULT 0,
    goal_difference INT DEFAULT 0
);