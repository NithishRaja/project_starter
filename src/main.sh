#!/bin/bash

source ./src/helpers/color.sh
source ./src/projectStatus/getProjectStatus.sh
source ./src/projectStatus/getProjectName.sh

get_project_status

echo -e "${BLUE}status is $project_status $RESET"

get_project_name

echo -e "${BLUE}name is $project_name $RESET"
