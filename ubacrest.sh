#!/bin/bash


#################################################
# SYSTEM EXIT CODES


# ERROR CODES
ERRC_NO_DST_BASE_PATH=101

# END SYSTEM EXIT CODES
#################################################

if [ ${PRINT_DBG} == 1 ]; then

# IMPORT GLOBAL CONFIG FROM ubacrest.cfg
source ubacrest.cfg

function main() {
  
  # Silences output if defined
  check_silence
  
  # Check debug functionality
  dbg " "
  dbg " -=- dBacRest bash script -=-"
  dbg ".      DEBUG MODE ENABLED "
  dbg " "
  print_config_variables

  
  # Check destination folder existance (create if does not exist)
  check_backup_folder


}


#################################################
# Function silences all stdout by sending 
#  the stream to /dev/null if $SILENT == 1
#################################################
function check_silence() {

  if [ ${SILENT} == 1 ]; then
    exec 1>/dev/null
  fi

}

#################################################
# Function to print debug information when
#  $PRINT_DBG is set to 1
#################################################
function dbg() {
  if [ ${PRINT_DBG} == 1 ]; then echo $1; fi
}

#################################################
# Function prints the specified variables from
#  the config file. They have to be specified
#  in this function though.
#################################################
function print_config_variables() {

  # DEBUG: Print variables from config file (manually specified) 
  if [ ${PRINT_DBG} == 1 ]; then 
    echo "SILENT=${SILENT}"
    echo "PRINT_DBG=${PRINT_DBG}"
    echo "SRC_BASE_PATH=${SRC_BASE_PATH}"
    echo "DST_BASE_PATH=${DST_BASE_PATH}"
    echo ""
  fi

}


#################################################
# Function checks if the destination folder 
#  (backup folder) exists. If it doesn't the
#  function creates the folder (and subfolders)
#  The folder is defined in $DST_BASE_PATH.
#  If $DST_BASE_PATH is not defined, the 
#  script exits with defined exit code
#################################################
function check_backup_folder() {
  
  # Check if DST_BASE_PATH is defined
  if [ -z ${DST_BASE_PATH} ]; then
    error_exit 101 "DST_BASE_PATH not defined." "Define variable in ubacrest.cnf"
    echo ""
    echo "ERROR: DST_BASE_PATH not defined."
    echo "  add variable in ubacrest.cfg"
  fi

  if [ ! -d ${DST_BASE_PATH} ]; then
    echo "Directory '${DST_BASE_PATH}' does not exist"
    error_exit 2 "ERROR"
  fi
  
}

#################################################
# Function handles error which
#  causes the script to exit
#  with specified exit code
#  after error message has
#  been displayed
# 
# Arguments:
#  #1 - exit code
#  #2 - Error message
#  #3 - Additional help message
# 
# Returns:
#  Nothing
#################################################
function error_exit() {
  echo ""
  echo "ERROR: $2"
  if [ -n "$3" ]; then echo "  $3"; fi

  echo "ERROR: $2" > /dev/null
  if [ -n "$3" ]; then echo "  $3" > /dev/null; fi
  
  exit $1

}
#################################################
# CALL MAIN FUNCTION 
#
# Call last in script so that all other
#  functions are defined!

main

# EOF
