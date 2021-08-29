#!/bin/bash

function get_project_status {
  select project_status in new existing
  do
    case $project_status in
      new)
        break
        ;;
      existing)
        break
        ;;
      *)
        echo -e "${RED}Select between new or existing project ${RESET}"
        ;;
    esac
  done
}
