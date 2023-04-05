# Query 1: Which team won the most matches in the 2018 World Cup?
SELECT `Home Team` AS team, COUNT(*) AS Wins
FROM fifa_worldcup.world_cup_matches
WHERE Year = 2018 AND `Home Goals` > `Away Goals`
GROUP BY `Home Team`
UNION ALL
SELECT `Away Team` AS team, COUNT(*) AS Wins
FROM fifa_worldcup.world_cup_matches
WHERE Year = 2018 AND `Away Goals` > `Home Goals`
GROUP BY `Away Team`
ORDER BY Wins DESC
LIMIT 1;

# Query 2: What is the average number of goals scored per match in the 2018 World Cup?
SELECT AVG(`Home Goals` + `Away Goals`) AS Avg_Goals
FROM fifa_worldcup.world_cup_matches;
WHERE Year = 2018;

# Count the number of matches played in each year:
SELECT Year, COUNT(*) as num_matches
FROM fifa_worldcup.world_cup_matches
GROUP BY Year
ORDER BY Year ASC;

# Calculate the average number of goals scored per match in each year:
SELECT year, AVG(`Home Goals` + `Away Goals`) as avg_goals
FROM fifa_worldcup.world_cup_matches
GROUP BY year
ORDER BY year ASC;

#Determine the team that has won the most matches in all FIFA World Cup tournaments:
SELECT `Home Team` AS Team, COUNT(*) AS Wins
FROM fifa_worldcup.world_cup_matches
WHERE `Home Goals` > `Away Goals`
GROUP BY `Home Team`
UNION
SELECT `Away Team` AS Team, COUNT(*) AS Wins
FROM fifa_worldcup.world_cup_matches
WHERE `Away Goals` > `Home Goals`
GROUP BY `Away Team`
ORDER BY Wins DESC
LIMIT 1;

#Find out which team has the highest goal difference in all FIFA World Cup tournaments:
SELECT `Home Team` AS Team, SUM(`Home Goals` - `Away Goals`) AS Goal_Diff
FROM fifa_worldcup.world_cup_matches
GROUP BY `Home Team`
UNION
SELECT `Away Team` AS Team, SUM(`Away Goals` - `Home Goals`) AS Goal_Diff
FROM fifa_worldcup.world_cup_matches
GROUP BY `Away Team`
ORDER BY Goal_Diff DESC
LIMIT 1;

# FIFA World Cup 2022 Top 15 Teams: 
SELECT Team 
FROM fifa_worldcup.2022_world_cup_groups
WHERE `FIFA Ranking` <= 15
ORDER BY `FIFA Ranking`;

# Which team has won most FIFA World Cups?
SELECT Winner, COUNT(*) AS Champions 
FROM fifa_worldcup.world_cups
GROUP BY Champions 
ORDER BY Wins DESC
LIMIT 1; 

# Which team has won most international matches since 2018? 
SELECT `Home Team` AS Team, COUNT(*) AS Wins
FROM fifa_worldcup.international_matches
WHERE Date >= "2018-01-01" AND `Home Goals` > `Away Goals`
GROUP BY `Home Team`
UNION
SELECT `Away Team` AS Team, COUNT(*) AS Wins
FROM fifa_worldcup.international_matches
WHERE Date >= "2018-01-01" AND `Away Goals` > `Home Goals`
GROUP BY `Away Team`
ORDER BY Wins DESC
LIMIT 1;

# Top 5 World Cup Goal Scores:
SELECT Player, `WC Goals` 
FROM fifa_worldcup.2022_world_cup_squads 
ORDER BY `WC Goals` DESC
LIMIT 5;

# Youngest Player of FIFA World Cup 2022:
SELECT Team, Player, Age
FROM fifa_worldcup.2022_world_cup_squads 
ORDER BY Age ASC
LIMIT 1;

# Oldest Player of FIFA World Cup 2022:
SELECT Team, Player, Age
FROM fifa_worldcup.2022_world_cup_squads 
ORDER BY Age DESC
LIMIT 1;

# Average of players in FIFA World Cup 2022:
SELECT Avg(Age)
FROM fifa_worldcup.2022_world_cup_squads; 

# Which Club has it's most players in FIFA World Cup 2022:
SELECT Club, COUNT(*) AS Num_players
FROM fifa_worldcup.2022_world_cup_squads
GROUP BY Club
ORDER BY Num_Players DESC
LIMIT 1;