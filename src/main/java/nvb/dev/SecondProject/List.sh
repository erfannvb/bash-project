#! /bin/bash

while [ true ]; do
  select option in create print replace
  do
    case $option in

      "create")
        for i in {1..5}; do
          echo >> "File${i}.txt"
        done
        ;;

      "print")
        for i in {1..5}; do
          echo "Hello World" >> "File${i}.txt"
        done
        ;;

      "replace")
        for i in {1..5}; do
          sed -i 's/World/Bash/g' File${i}.txt
        done
        ;;

    esac
  done
done
