# This is a script which can help you search in periodic table
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

function GET_INFO () {
  NUMBER=$(echo $1 | sed -E 's/([0-9]*).*/\1/')
  INFO=$($PSQL "SELECT name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties FULL JOIN types USING(type_id) FULL JOIN elements USING(atomic_number) WHERE atomic_number=$NUMBER")
  echo "$INFO" | while IFS="|" read NAME SYMBOL TYPE MASS M_POINT B_POINT
  do
    echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $M_POINT celsius and a boiling point of $B_POINT celsius."
  done
}

function EXIT () {
  echo "I could not find that element in the database."
}

function SEARCH () {
  if [[ $1 ]]
  then
    # if search by atomic number
    if [[ $1 =~ ^[0-9]*$ ]]
    then
      ATOMIC_NUMBER_SEARCH_RESULT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1")
      
      # if number not found
      if [[ -z $ATOMIC_NUMBER_SEARCH_RESULT ]]
      then
        EXIT
      else
        # get INFO
        GET_INFO $ATOMIC_NUMBER_SEARCH_RESULT
      fi

    # search by symbol  
    elif [[ $1 =~ ^[A-Z][a-z]?$ ]]
    then
      
      SYMBOL_SEARCH_RESULT=$($PSQL "SELECT * FROM elements WHERE symbol='$1'")
      
      # if symbol not found
      if [[ -z $SYMBOL_SEARCH_RESULT ]] 
      then
        EXIT
      else
        # get info
        GET_INFO $SYMBOL_SEARCH_RESULT
      fi
    else

      # search by name
      NAME_SEARCH_RESULT=$($PSQL "SELECT * FROM elements WHERE name='$1'")

      # if name not found
      if [[ -z $NAME_SEARCH_RESULT ]]
      then
        EXIT
      else
        # get info
        GET_INFO $NAME_SEARCH_RESULT
      fi
    fi
  else
    echo "Please provide an element as an argument."
  fi
}

SEARCH $1
