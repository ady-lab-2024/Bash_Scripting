#!/bin/bash
shopt -s nocasematch
echo "Enter the name of a month."
read month
case $month in
  February)
 
echo "There are 28/29 days in $month.";;
  April | June | September | November)
echo "There are 30 days in $month.";;
  January | March | May | July | August | October | December)
echo "There are 31 days in $month.";;
  *)
echo "Unknown month. Please check if you entered the correct month name: $month";;
esac
