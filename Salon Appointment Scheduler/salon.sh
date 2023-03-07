#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "~~ Salon Menu ~~"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  echo -e "\nWhich service would you like to book?"
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-3]$ ]]
  then
    MAIN_MENU "That isn't a valid service number."
  else

    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nWhat's your name?"
      read CUSTOMER_NAME

      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    ADJUSTED_CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/ //g')

    echo -e "\nWhat time do you want to schedule the chosen service, $ADJUSTED_CUSTOMER_NAME?"
    read SERVICE_TIME

    RETURN_APPOINTMENT_SCHEDULED=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    ADJUSTED_SERVICE_NAME=$(echo $SERVICE_NAME | sed 's/ //g')

    if [[ $RETURN_APPOINTMENT_SCHEDULED = "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a $ADJUSTED_SERVICE_NAME at $SERVICE_TIME, $ADJUSTED_CUSTOMER_NAME."
    fi
  fi
}

MAIN_MENU