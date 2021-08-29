#!/bin/bash

# Initialise base path
base_path="./src/projectStatus/"

# Local Dependencies
source "${base_path}getProjectStatus.sh"

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

# Source testing framework
source shunit2
