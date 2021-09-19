#!/bin/bash

# Local Dependencies
source ./src/helpers/color.sh
source ./src/projectDetails/getProjectStatus.sh
source ./src/projectDetails/getProjectName.sh
source ./src/projectSetup/initialiseProject.sh

# Initialise variable to hold directory path
dir_path="temp"

# Function to check exit code
check_exit_code() {
  if [ $? -eq 1 ]; then
    # Print error message
    echo -e "${ERROR}ERROR: $1 ${RESET}"
    # Exit script
    exit 1
  fi
}

# Call function to get status of project
get_project_status
# Print project status
echo -e "${INFO}status is $project_status $RESET"

# Call function to get project name
get_project_name
# Print project name
echo -e "${INFO}name is $project_name $RESET"

if [ $project_status=="new" ]; then
  # Call function to create project directory
  create_project_directory $dir_path $project_name
  # Check exit code
  check_exit_code "Something went wrong while creating project directory"
  # Call function to initialise git repository
  initialise_repository $dir_path $project_name
  # Check exit code
  check_exit_code "Something went wrong while initialising repository"
fi
