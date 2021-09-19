#!/bin/bash

# Local Dependencies
source "./src/helpers/color.sh"
source "./src/projectSetup/initialiseProject.sh"

oneTimeSetUp() {
  # Store directory name
  test_dir="./testDir"
  # Initialise test project name
  test_project="new_roject"
  # Create directory
  mkdir $test_dir
}

setUp() {
  # Clear test directory
  rm -rf "${test_dir}/*"
}

test_initialise_project_normal_input() {
  # Call function to create directory
  create_project_directory $test_dir $test_project > /dev/null 2>&1
  # Check if project directory was created
  output=$(ls -la $test_dir | awk '{print $9}' | grep $test_project)
  assertEquals $output $test_project
}

test_initialise_project_directory_exists() {
  # Create directory
  mkdir "${test_dir}/${test_project}" > /dev/null 2>&1
  # Call function to create directory
  create_project_directory $test_dir $test_project > /dev/null 2>&1
  # Check exit code
  assertEquals 1 $?
}

test_initialise_project_bad_input() {
  # Call function to create directory
  create_project_directory > /dev/null 2>&1
  # Check exit code
  assertEquals 1 $?
}

test_initialise_git_normal_input() {
  # Call function to create directory
  create_project_directory $test_dir $test_project > /dev/null 2>&1
  # Call function to initialise git
  initialise_repository $test_dir $test_project > /dev/null 2>&1
  # Check if git is installed
  cd "${test_dir}/${test_project}" > /dev/null 2>&1
  git status > /dev/null 2>&1
  # Check exit code
  assertEquals 0 $?
  # Go back to previous path
  cd - > /dev/null 2>&1
}

test_initialise_git_bad_input() {
  # Call function to create directory
  create_project_directory $test_dir $test_project > /dev/null 2>&1
  # Call function to initialise git
  initialise_repository > /dev/null 2>&1
  # Check exit code
  assertEquals 1 $?
}

oneTimeTearDown() {
  # Delete directory
  rm -rf $test_dir
}

# Source testing framework
source shunit2
