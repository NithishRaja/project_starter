#!/bin/bash

# Local Dependencies
source "./src/helpers/color.sh"
source "./src/projectDetails/getProjectStatus.sh"
source "./src/projectDetails/getProjectName.sh"

# Test new project status
test_project_status_getter_new_case() {
  # Call get project status function
  get_project_status >/dev/null 2>&1 << EOF
1
EOF

  # Check project status
  assertEquals $project_status "new"
}

# Test existing project status
test_project_status_getter_existing_case() {
  # Call get project status function
  get_project_status >/dev/null 2>&1 << EOF
2
EOF
  
  # Check project status
  assertEquals $project_status "existing"
}

test_project_name_normal_response() {
  # Initialise variable with test name
  test_name="testproject"
  # Call function to get project name
  get_project_name > /dev/null 2>&1 << EOF
$test_name
EOF
  
  # Check project name
  assertEquals $project_name $test_name
}

test_project_name_empty_response() {
  # Initialise variable with test name
  test_name="testproject"
  # Call function to get project name
  get_project_name > /dev/null 2>&1 << EOF


$test_name
EOF
  
  # Check project name
  assertEquals $project_name $test_name
}

# Source testing framework
source shunit2
