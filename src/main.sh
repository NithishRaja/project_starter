#!/bin/bash

source ./src/projectStatus/getProjectStatus.sh
source ./src/helpers/color.sh

get_project_status

echo -e "${BLUE}status is $project_status $RESET"
