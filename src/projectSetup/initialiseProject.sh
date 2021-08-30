#!/bin/bash

function create_project_directory {
  # Check input parameters
  if [ $# -eq 2 ]; then
    # Initialise variable for base path
    base_path=$1
    # Initialise variable for project name
    project_dir=$2
    # Create directory
    mkdir "${base_path}/${project_dir}"
    # Print message
    echo -e "${SUCCESS}project directory created${RESET}"
  else
    # Print error message
    echo -e "${ERROR}Function takes exactly 2 arguments${RESET}"
    # Exit with exit code 1
    return 1
  fi
}
