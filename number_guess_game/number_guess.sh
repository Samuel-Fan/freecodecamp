#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=game -t --no-align -c"

function FIND_USER_INFO () {
  echo -e "Enter your username:"
  read NAME

  # get user info
  SEARCH_USER_RESULT=$($PSQL "SELECT games_played,best_game FROM users WHERE name='$NAME'")

  # if not exsit
  if [[ -z $SEARCH_USER_RESULT ]] 
  then
    # insert into database and output intro
    INSERT_RESULT=$($PSQL "INSERT INTO users(name,games_played,best_game) VALUES('$NAME',0,0)")

    echo "Welcome, $NAME! It looks like this is your first time here."

  else
    # split user info into variable and output intro
    echo $SEARCH_USER_RESULT | while IFS="|" read GAME_PLAYED BEST_GAME
    do
      echo "Welcome back, $NAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi
  GUESS_NUMBER $NAME
}

function GUESS_NUMBER () {

  # Generate random number
  (( SECRET_NUMBER = $RANDOM % 1000 + 1 ))
  
  # Count guess times ( I think var COUNT should start at 0, but the test 1-8 don't think so. )
  COUNT=1

  # Ask player to guess a number
  echo "Guess the secret number between 1 and 1000:" $SECRET_NUMBER

  # Guess number loop
  until [[ $NUMBER == $SECRET_NUMBER ]]
  do
    read NUMBER
    (( COUNT ++ ))

    # check if input is a valid interger
    until [[ $NUMBER =~ ^[0-9]*$ ]]
    do
      echo "That is not an integer, guess again:"
      read NUMBER
    done
    
    # if higher than random number
    if [[ $NUMBER > $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"

    # if lower than random number
    elif [[ $NUMBER < $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    fi
  done

  echo "You guessed it in $(( $COUNT - 1 )) tries. The secret number was $SECRET_NUMBER. Nice job!"  

  # $1 = user name
  GAMES_PLAY=$($PSQL "SELECT games_played FROM users WHERE name='$1'")
  BEST_PLAY=$($PSQL "SELECT best_game FROM users WHERE name='$1'")

  (( GAMES_PLAY ++ ))

  # Insert new record
  if [[ $BEST_PLAY == 0 || $COUNT < $BEST_PLAY ]]
  then
  echo $GAMES_PLAY $BEST_PLAY
    INSERT_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAY, best_game=$COUNT  WHERE name='$1'")
  fi
}

echo -e "\n~~ Welcome to number guessing game! ~~\n"
FIND_USER_INFO
