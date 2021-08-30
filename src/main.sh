#!/bin/bash

# Local Dependencies
source ./src/helpers/color.sh
source ./src/projectDetails/getProjectStatus.sh
source ./src/projectDetails/getProjectName.sh
source ./src/projectSetup/initialiseProject.sh

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
  create_project_directory "temp" $project_name
  # Check exit code
  if [ $? -eq 1 ]; then
    exit 1
  fi
fi
