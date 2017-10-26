#!/usr/local/bin/bash

function change_computer_name {
  read -p "Computer name: " computer_name
  read -p "Host name: " host_name

  sudo scutil --set ComputerName $computer_name
  sudo scutil --set HostName $host_name
  sudo scutil --set LocalHostName $host_name
}

sudo -v 
change_computer_name
