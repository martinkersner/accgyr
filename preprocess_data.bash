#!/usr/bin/env bash

# Martin Kersner, m.kersner@gmail.com
# 07/09/2016

# Preprocess accelerometer and gyroscope data harvested with IMU+GPS-Stream application.

# SETTINGS
SKIP=0 # number of lines to be skipped, default value should be 0

if [ "$#" -ne 2 ]; then
  echo "Wrong number of arguments."
  echo "./preprocess_data.bash data.csv [acc|gyr]"
fi

# SCRIPT ARGUMENTS
INPUT="$1"
TYPE="$2" # acc OR gyr

ACCELEROMETER="acc"
GYROSCOPE="gyr"

# header
echo "ID, X, Y, Z"

NUM_LINE=0
while read -r LINE; do
  NUM_LINE=$((NUM_LINE+1))

  if [ "$NUM_LINE" -gt "$SKIP" ]; then
    if [ "$TYPE" == "$ACCELEROMETER" ]; then
      echo $LINE | cut -d',' -f1,3-5
    elif [ "$TYPE" == "$GYROSCOPE" ]; then
      echo $LINE | cut -d',' -f1,7-9 # TODO fill empty lines
    fi
  fi
done < "$INPUT"
