#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRET_NUMBER=$((1 + RANDOM % 1000))

echo "Enter your username:"
read USERNAME

USER_DATA=$($PSQL "SELECT * FROM users WHERE username='$USERNAME' LIMIT 1")
if [[ $USER_DATA ]]
then
  echo "$USER_DATA" | while IFS=\| read USER_ID NAME GAMES_PLAYED BEST_GAME
  do
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." 
  done
else
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  ADD_USER_RESULT=$($PSQL "INSERT INTO users(username, games_played) VALUES('$USERNAME', 0)")
fi

echo -e "\nGuess the secret number between 1 and 1000:"
read GUESSED_NUMBER
while [[ ! $GUESSED_NUMBER =~ ^-?[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read GUESSED_NUMBER
done

NUMBER_OF_TRIES=1
while [[ $GUESSED_NUMBER != $SECRET_NUMBER ]]
do
  if [[ $GUESSED_NUMBER < $SECRET_NUMBER ]]
  then
    echo -e "\nIt's higher than that, guess again:"
    read GUESSED_NUMBER
  elif [[ $GUESSED_NUMBER > $SECRET_NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
    read GUESSED_NUMBER
  fi
  NUMBER_OF_TRIES=$(($NUMBER_OF_TRIES+1))
done

echo -e "\nYou guessed it in $NUMBER_OF_TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
if [[ $NUMBER_OF_TRIES < $BEST_GAME ]]
then
  UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game=$BEST_GAME WHERE username='$USERNAME'")
elif [[ -z $BEST_GAME ]]
then
  UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_TRIES WHERE username='$USERNAME'")
fi

UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played=$(($GAMES_PLAYED+1)) WHERE username='$USERNAME'")
