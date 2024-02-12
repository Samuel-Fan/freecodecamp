#!/bin/bash
PSQL="psql -t --username=freecodecamp --dbname=salon -c  "

echo -e "\n ~~ Welcome to Samuel's Special Salon ~~\n"

function MAIN_MENU () {
  # Introduction
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  else
    echo -e "We offter services as list below , please choose one:\n"
  fi
  
  SERVICES_SEARCH_RESULT=$($PSQL "SELECT * FROM SERVICES ORDER BY service_id")
  echo "$SERVICES_SEARCH_RESULT" | while read SERVICE_ID BAR name
  do
  echo "$SERVICE_ID) $name"
  done

  # Choose a service
  read SERVICE_ID_SELECTED
  SERVICE_ID_SELECTED=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  # if not exist
  if [[ -z $SERVICE_ID_SELECTED ]]
  then
    # redirect to menu
    MAIN_MENU "You should choose the number in the list."
  
  else
    # get customer info
    echo -e "\nPlease input your phone number."
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # if not exist
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nPlease input your name."
      read CUSTOMER_NAME
      echo $CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    fi

    # Reservation
    echo -e "\nHi, $CUSTOMER_NAME! Choose a serivce_time next week"
    read SERVICE_TIME
    RESERVE_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    
    # Tell customer they have make a reservation
    echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
    echo "We look forward to seeing you!"
    
    
  fi

}

MAIN_MENU