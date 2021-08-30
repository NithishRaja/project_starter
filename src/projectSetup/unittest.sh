#!/bin/bash

# Local Dependencies
source "./src/helpers/color.sh"
source "./src/projectSetup/initialiseProject.sh"

oneTimeSetUp() {
  # Store directory name
  test_dir="./testDir"
  # Create directory
  mkdir $test_dir
}

test_initialise_project_normal_input() {
  # Initialise test project name
  test_project="new_roject"
  # Call function to create directory
  create_project_directory $test_dir $test_project > /dev/null 2>&1
  # Check if project directory was created
  output=$(ls -la $test_dir | awk '{print $9}' | grep $test_project)
  assertEquals $output $test_project
}

test_initialise_project_bad_input() {
  # Call function to create directory
  create_project_directory > /dev/null 2>&1
  # Check exit code
  assertEquals 1 $?
}

oneTimeTearDown() {
  # Delete directory
  rm -rf $test_dir
}

# Source testing framework
source shunit2
