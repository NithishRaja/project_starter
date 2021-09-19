#!/bin/bash

# Local Dependencies
source "./src/helpers/color.sh"

function create_project_directory {
  # Check input parameters
  if [ $# -eq 2 ]; then
    # Initialise variable for base path
    base_path=$1
    # Initialise variable for project name
    project_dir=$2
    # Check if directory exists
    if [ -d "${base_path}/${project_dir}" ]; then
      # Print error message
      echo -e "${ERROR}Project directory exists already${RESET}"
      # Exit with exit code 1
      return 1
    else
      # Create directory
      mkdir "${base_path}/${project_dir}"
      # Print success message
      echo -e "${SUCCESS}Project directory created${RESET}"
    fi
  else
    # Print error message
    echo -e "${ERROR}Function takes exactly 2 arguments${RESET}"
    # Exit with exit code 1
    return 1
  fi
}

function initialise_repository {
  # Check input parameters
  if [ $# -eq 2 ]; then
    # Initialise variable for base path
    base_path=$1
    # Initialise variable for project name
    project_dir=$2
    # Move to project path
    cd "${base_path}/${project_dir}" > /dev/null 2>&1
    # Initialise git
    git init > /dev/null 2>&1
    # Move back
    cd - > /dev/null 2>&1
    # Print message
    echo -e "${SUCCESS}GIT initialised successfully${RESET}"
  else
    # Print error message
    echo -e "${ERROR}Function takes exactly 2 arguments${RESET}"
    # Exit with exit code 1
    return 1
  fi
}
