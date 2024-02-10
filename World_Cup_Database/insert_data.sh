#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Remove Data
TRUNCATE TABLE games, teams;

# While Loop
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  # Check if it is header line
  if [[ $YEAR != year ]]
  then
    # Get team ID from winner
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # if not found
    if [[ -z $WINNER_ID ]]
    then
      # Insert winner team data
      WINNER_INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $WINNER_INSERT_RESULT == "INSERT 0 1" ]] 
      then
        echo "INSERT team data, team: '$WINNER'"
      fi
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    # Get team ID from loser
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # if not found
    if [[ -z $OPPONENT_ID ]]
    then
      # Insert winner team data
      OPPONENT_INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $OPPONENT_INSERT_RESULT == "INSERT 0 1" ]] 
      then
        echo "INSERT team data, team: '$OPPONENT'"
      fi
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
    #Insert everything into games table
    GAMES_INSERT_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$W_GOALS,$O_GOALS)")
    if [[ $GAMES_INSERT_RESULT == "INSERT 0 1" ]]
    then
      echo "INSERT game data, game: $YEAR $ROUND '$WINNER' vs '$OPPONENT' score: $W_GOALS : $O_GOALS"
    fi
  fi
done
