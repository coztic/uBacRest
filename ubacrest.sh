#!/bin/bash

# IMPORT GLOBAL CONFIG FROM ubacrest.cfg
source ubacrest.cfg

function main() {
  
  # Test debug functionality
  dbg "Hello debug world"

}

# DEBUG: Print variables from config file (manually specified) 
if [ ${PRINT_DBG} -eq 1 ]; then 
  echo ${SRC_BASE_PATH}
  echo ${DST_BASE_PATH}
  echo ${SRC_BASE_PATH}
fi


# Function to print debug information when $PRINT_DBG is set to 1
function dbg() {
  if [ ${PRINT_DBG} -eq 1 ]; then echo $#; fi
}

function check_backup_folder() {
  
  if [ -d $DST_BASE_PATH ]; then
    return    
  fi
  
}

# CALL MAIN FUNCTION 
#
# Call last in script so that all other functions are defined!

main
