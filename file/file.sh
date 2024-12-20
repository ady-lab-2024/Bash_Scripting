#!/bin/bash
clear
echo "***----Welcome---***"
options () {
  echo "Please choose your option..."
  echo "1 - View All"
  echo "2 - Insert"
  echo "3 - Update by student name " 
  echo "4 - Update by Sno " 
  echo "5 - Delete by student name "
  echo "6 - Delete by Sno "
  echo "7 - View by Sno "
  echo "8 - Exit"
  echo -n "Enter your choice: "
  read choice;
  echo ""
  case $choice in
	  1)cat data.txt
	    echo ""
	    options;;
	  
          2)echo -n "Enter S_no : "
            read s_no;
            echo -n "Enter the student name : "
	    read s_name;
	    echo -n "Enter age : " 
	    read age;
            echo -n "Enter the teacher name : "
	    read t_name; 
            echo -n "Enter a private/school bus: "
 	    read bus;
	    echo "$s_no : $s_name : $age : $t_name : $bus " >> data.txt
            echo -e "Record created successfully!!!\n"
            options;;

	   3)echo -n "Enter the student name to update: "
             read s_name;
	     echo -n "Enter the new student name : "
	     read s_new_name;
             echo -n "Enter the new S.no: "
             read s_no;
             echo -n "Enter the new student age: "
             read age;
             echo -n "Enter the new teacher name: "
             read t_name;
             echo -n "Enter the new private/school bus: "
             read bus;
	     grep -v "$s_name :" data.txt > tmpFile && mv tmpFile data.txt
	     echo "$s_no : $s_new_name : $age : $t_name : $bus " >> data.txt
	     echo -e "Record updated successfully!\n"
	     options;;

	   4)echo -n "Enter the Sno to update: "
             read s_no;
	     echo -n "Enter the new student name : "
	     read s_name;
             echo -n "Enter the new student age: "
             read age;
             echo -n "Enter the new teacher name: "
             read t_name;
             echo -n "Enter the new private/school bus: "
             read bus;
	     grep -v "^$s_no :" data.txt > tmpFile && mv tmpFile data.txt
	     echo "$s_no : $s_name : $age : $t_name : $bus " >> data.txt
	     echo -e "Record updated successfully!\n"
	     options;;

	   5)echo -n "Enter student student name to delete: "
             read s_name;
	     grep -v "$s_name :" data.txt > tmpFile && mv tmpFile data.txt
	     echo -e "Record deleted successfully!!!\n"
	     options;;
	
           6)echo -n "Enter the S_no to delete: "
	     read s_no;
    	     grep -v "^$s_no : " data.txt > tmpFile && mv tmpFile data.txt
	     echo -e "Record deleted successfully!\n"
	     options;;	    
		   
	   7)echo -n "Please enter the S_no to view: "
             read s_no;		 
             grep "^$s_no :" data.txt
	     echo ""
             options;;
    	   
     	   8)echo "***---Thank You---***"
	     sleep 3
	     clear;;
             
	   *)echo -e "Invalid choice!\n"
             options;;
	    
  esac
}
options

