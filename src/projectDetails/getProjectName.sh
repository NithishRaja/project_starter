#!/bin/bash

function get_project_name {
  # Initialise variable for project name
  project_name=""
  # Iterate till success
  while [ -z $project_name ];
  do
    # Read in project name
    read -p "Enter project name: "
    # Check if project name is empty
    if [ -z $REPLY ]; then
      echo -e "${ERROR}Project name should not be empty $RESET"
    else
      project_name=$REPLY
    fi
  done
}
