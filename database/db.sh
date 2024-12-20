#!/bin/bash
MYSQL_HOST=localhost
MYSQL_USERNAME=root
MYSQL_PASSWORD=password

echo "***---Welcome---***"
echo "Connecting to db..."
sleep 3
echo -e "Connected!\n"
sleep 1
options () {
  echo "Please choose your option..."
  echo "1 - View All"
  echo "2 - Insert"
  echo "3 - Update"
  echo "4 - Delete"
  echo "5 - Exit"
  echo -n "Enter your choice: "
  read choice;
  case $choice in
   1) mysql -h $MYSQL_HOST -u $MYSQL_USERNAME -p$MYSQL_PASSWORD -e "USE shell; SELECT * FROM student;" 2>/dev/null 
      options;;

   2) echo -e -n "\nEnter Student Name: "
      read s_name;
      echo -n "Enter Student Age: "
      read age;
      echo -n "Enter Teacher Name: "
      read t_name;
      echo -n "Enter Private/School Bus: "
      read bus;
      mysql -h $MYSQL_HOST -u $MYSQL_USERNAME -p$MYSQL_PASSWORD -e "USE shell; INSERT INTO student (s_name, age, t_name, bus) VALUES ('$s_name', '$age', '$t_name', '$bus');" 2>/dev/null
      echo -e "Inserted Successfully!\n"
      options;;

   3) echo -e -n "\nEnter the Student S.no to update: "
      read s_no;
      echo -n "Enter Student Name: "
      read s_name;
      echo -n "Enter Student Age: "
      read age;
      echo -n "Enter Teacher Name: "
      iread t_name;
      echo -n "Enter Private/School Bus: "
      read bus;
      mysql -h $MYSQL_HOST -u $MYSQL_USERNAME -p$MYSQL_PASSWORD -e "USE shell;UPDATE student SET s_name='$s_name', age='$age', t_name='$t_name', bus='$bus' WHERE s_no =$s_no;" 2>/dev/null
      echo -e "Updated Successfully!\n"
      options;;

   4) echo -e -n "\nEnter Student S.no to delete: "
      read s_no;
      mysql -h $MYSQL_HOST -u $MYSQL_USERNAME -p$MYSQL_PASSWORD -e "USE shell;DELETE FROM student WHERE s_no=$s_no;" 2>/dev/null
      echo -e "Record deleted successfully!!!\n"
	   options;;

   5) echo "Thank you.."
      sleep 3;;

   *) echo -e "Invalid choice!\n"
      options;;
  esac
}
options
