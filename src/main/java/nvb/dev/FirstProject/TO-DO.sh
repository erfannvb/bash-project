#! /bin/bash

while [ true ]; do

  echo "-------------------"
  echo "1. Add Task"
  echo "2. Add to Completed Tasks"
  echo "3. Show Unfinished Tasks"
  echo "4. Show Completed Tasks"
  echo "5. Show Removed Tasks"
  echo "6. Search"
  echo "7. Exit"
  echo "-------------------"

  echo "Choose an option"
  read choose

  case $choose in

  1)
    echo "Enter a task: "
    read addTask
    if [ -f taskList.txt ]; then
      echo "$addTask" >> taskList.txt
    else
      touch taskList.txt
      echo "$addTask" >> taskList.txt
    fi
    ;;

  2)
    echo "Enter the task that is completed: "
    read comTask
    if grep -Fxq "$comTask" taskList.txt; then
      echo "$comTask" >> completedTask.txt
      echo "$comTask" >> removedTask.txt
      sed -i "/$comTask/d" taskList.txt
    else
      echo "Not Found in taskList.txt"
    fi
    ;;

  3)
    if [[ -n $(cat taskList.txt) ]]; then
      cat taskList.txt
    else
      echo "file is empty!"
    fi
    ;;

    4)
      if [[ -n $(cat completedTask.txt) ]]; then
        cat completedTask.txt
      else
        echo "file is empty!"
      fi
      ;;

    5)
      if [[ -n $(cat removedTask.txt) ]]; then
        cat removedTask.txt
      else
        echo "file is empty!"
      fi
      ;;

    6)
      echo "What are you looking for: "
      read userSearch
      if grep -Fxq "$userSearch" taskList.txt; then
        grep "$userSearch" taskList.txt
        echo "Found in taskList.txt"
      elif grep -Fxq "$userSearch" completedTask.txt; then
        grep "$userSearch" completedTask.txt
        echo "Found in completedTask.txt"
      elif grep -Fxq "$userSearch" removedTask.txt; then
        grep "$userSearch" removedTask.txt
        echo "Found in removedTask.txt"
      else
        echo "Not Found!!!"
      fi
      ;;

    7)
      exit
      ;;

  esac
done

