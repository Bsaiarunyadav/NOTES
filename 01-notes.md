# shell script
#!/bin/bash

# inshell script when we start any thing we should give the statement as "SHEBANG" .
**#!/bin/bash**
.   why we should use that? To inform the linux server through shebang how to excute the script.
.   in shell scripting always we use "echo" for printing and keep the content in the "" i.e echo "hi world" .

echo "Hello my name is B.sai arun yadav"

As we know every coding and scriting consits only 5 types of concepts :-  

    1. Variables 
    2. Datatypes 
    3. conditions 
    4. loops
    5. Functions

# Variables 


    echo "Ramesh:hi suresh"
    echo "suresh:hi ramesh"
    echo "Ramesh :asked suresh"
    echo "Suresh :replyed to it yes ramesh"
    echo "Ramesh :said to suresh"

.   In the given excutions if we want to make any changes in furture it is not possible to change each and every single line 
.   So in variables ------> it follows a principle called "DRY principle."

##### DRY means **Dont repeat your self** .

.   if You feel any thing repeating again and again then create a variable and assign a to  value to it.

.   When ever you want use instead of value , replace it with variable name .

   COMMAND:- < variable-name > = < Value >

    PERSON1=arun
    PERSON2=abhinay

    echo "$PERSON1:hi $PERSON2"
    echo "$PERSON2:hi $PERSON1"
    echo "$PERSON1 :asked $PERSON2"
    echo "$PERSON2 :replyed to it yes $PERSON1"
    echo "$PERSON2 :said to $PERSON1"

.We have multiple types of variables :- 
    1. Declaring inside the script ( as shown in above )
    2. Another types is DATE 

# DATE

.   Normaly DATE is the command that it used for knowing the "DATE" and time of the command excuted.
.   How To know when we excuted inside the script ? 
.   Now we need to get date & time inside the script to know at what time it was excuted at.

    COMMAND :- DATE=$(date)

 #### Here shell script will run the command in side the **$()** and stores the output  into variable called "DATE".

.   Now excute command

.   echo "Hello ,this command was excuted at the time stamp:$DATE".

.   Above line  will show the date and time at what time the command is excuted at .
.   * First give the variable :-  DATE=$(date)

.   EX :- echo "hello ,This script is excuted at time stamp:$DATE"

.   Now try once the above line it will show the time excuted at .

   ## you can always get the values of variables from command line .

**Here instead of hard coding the values just give as $1 and $2**
. in previous one we assigned names to person1 and person2 instead of this 

#### Just give the value as 

. In the below command we are editing the file from outside but not from inside .

>>>Note:- coding is the best practice to avoid the making changes inside the file try to make the changes from outside like shown below .

# ASSIGNING VALUES

    PERSON1=$1
    PERSON2=$2

        echo "$PERSON1:hi $PERSON2"
        echo "$PERSON2:hi $PERSON1"
        echo "$PERSON1 :asked $PERSON2"
        echo "$PERSON2 :replyed to it yes $PERSON1"
        echo "$PERSON2 :said to $PERSON1"

. For checking the above command 
-----> sh <FILENAME> ramesh suresh .

# Add Variables :- 

i want to add any two nummber instead of add number inside the file .

. This is the comment , we need to develop a program that can do addition of 2 number 

. so firstly i will create a variable as 

    NUMBER1=$1
    NUMBER2=$2

. I need to run this command inside the shell to add 2 number now 
#### COMMAND
    SUM=$((NUMBER1+NUMBER2))

. Rember this is an arthematic equation.
. By running the command it will not show the result as we not printed any thing so .

    echo "Additon of 2 number is: $SUM"

#### How to give the command ? 
    print :-    sh 05-addvariables.sh 10 20 
    Answer :-    Additon of 2 number is: 30

# prompting for USERNAME AND PASSWORD

I'm going to connect to a DATABASE ,So i need password .

. U rememer when we try to login into the server it keeps username & password hide even iif we type it so how it was happening ?

. There is some thing called "READ COMMAND" This will take the input from the terminal now if you print .

    echo "Please enter user name"

    read USERNAME 
    #this is the variable where the value of the one user entered .

"Echo"  will be printed and the shell will wait till the user enter his username ?

### Now just excute 
    echo "username entered is:$USERNAME".

#### similarly ask for password 
    echo "Please enter user password"
    read PASSWORD
    echo "password entered is:$PASSWORD".

. In previous command we done that by prompting But there is a command called .

    read -s USERNAME 
    read -s PASSWORD 

. HERE (-s) is the command to HIDE THE entered password and username .

# DATA TYPES :-

Dont worry about data types ,shell script can intelligently understand .
#1 Number is a general Data type 
#2 boolean 0 & 1
---> 0 means - faliure 
---> 1 means - sucess
---> SIMILARLY we have Another Datatype called  "array" It mean that hold multiple values .

    PERSONS=("Ramesh" "suresh" "harish") 

. This is called array , Instead single values it can hold multiple values .
. NOTE :- Inside array we always refers values with index and it starts from "0"

    echo "first person:${PERSONS[0]}" 
    --> this will show only 1 member that means RAMESH as index i.e "0"

. Now for getting all the persons just add "@" symbol in echo i.e 

    echo "first person:${PERSONS[@]}"     #(@-----MEANS ALL)

# CONDITIONS

Why we should use the conditions in shell script ?
. When you want to install any packages we should run it as a root user if not error will be shown to get the root access to install package 
. So here it was showing the error through the "conditions"
. it is an simple algorithm
. sytanx of alogorithm in shell scripting

    if [Expression]
        then 
          These command will run if expression is (True)
        else 
          This command will run if expression is  (flase)

. --> Lets see a simple condition .. Now the the goal of "Number=$1" is to check if the number is greater than 10 or not .

    NUMBER=$1"
    if [ $NUMBER -gt 10 ]
    then 
        echo "$NUMBER is greater than 10"
    else
        echo "$NUMBER is not greater than 10"
    fi 

#### "fi" is the command to end a print in shell scripting .

## Now we will try to install a package using the CONDITIONS!

#### Our program goal is to install the MYSQL :-

. Let us think in general way :-
 . For installing the package we need to follow some steps :-

    1 .check whether user is root or not
    2 .If not root user exit the program and inform to run this command with root axis.
    3 .if root user then install the package .
. NOTE :-

    id -u (this will give you id of the user )
    If Id -u --> 0 then root user 
    If Id -u --> Not 0 Then normal user .

    USERID=$(id -u)

    if [ $USERID -ne 0 ]
    then 
        echo "ERROR:: run this script with root axis"
        exit 1
    fi  

. If there are 100 statements and there is a mistake in 10th line so we will stop the process .
. But in the shell script the negative point is that it proceeds forward if even there is a mistake that is default nature in shell script .
. So , How a programme understand the error ? So in shell there is "EXIT STATUS ($?)" .

    1) $? stores the previous command status
    2) IF $? is 0 then the command was success 
    3) If $? is not 0 then the command was failure.
 
Now we try to install mysql
---> Again it is our responsibity to check weather the installation was success or not .

---> If we give

     yum install mysqll -y

     if [ $? -ne 0 ]
         then 
            echo "Installation of mysql is error"
            exit 2 
         else
            echo "Installation of mysql is success"
    fi

The above statement will show error as "MYsqll" is wrong it will show error and exit if .

--> And when we give "mysql" correctly it will run successfully .

    yum install mysql -y

        if [ $? -ne 0 ]
        then 
            echo "Installation of mysql is error"
            exit 2 
        else
            echo "Installation of mysql is success"
        fi

----> NOTE :- when ever we are running a command it is our responsibility to validate it correctly . 

    yum install postfix -y

        if [ $? -ne 0 ]
        then 
            echo "Installation of postfix is error"
            exit 2 
        else
            echo "Installation of postfix is success"
        fi

**So now check the above lines just for 2 packages we printed 30 lines of script ??**
#### Don't we think it was a long script 
1) Always remember less lines code work more .
2) When as you know those lines are repeating again we know we have a principle called as  "DRY" .
3) For this there is a priciple called "FUNCTIONS" .

# FUNCTIONS:-
HERE you will keep the code inside the functions which is more often repeated ,And call when ever you require .

>> Functions will do some work on behalf of us and it will update what happend .

### In shell scripting the syntax of functions will be like .

     FUNCTION-NAME(){
           here you write the your statement & call when ever you want 
     }


--> This function should validate the previous command and inform the user it is success or not .

    USERID=$(id -u)
    VALIDATE(){
    #$1--> It will receive the argument 1 
    if [ $1 -ne 0 ];
       then 
            echo "installation...failure"
            exit 2
       else     
            echo "Installation...success"
    fi
    }
    if [ $USERID -ne 0 ]
    then 
        echo "ERROR:: please run this with root access"
        exit 2

    . else
    echo "Info :: you are root user"
    (else statement was not required here as it will show error if we are not root user)
    --> It is our responsibility again to check weather the instalation is sucess or not 

    yum install mysql -y

    VALIDATE $?

    yum install postfix -y

    VALIDATE $? 

## Here we add the "$2" argument as "Installing postfix and mysql" .   

    USERID=$(id -u)

    VALIDATE(){
        #$1--> It will receive the argument 1 
    if [ $1 -ne 0 ]
        then 
            echo "$2...failure"
            exit 2
        else     
            echo "$2...success"
    fi
    }

    if [ $USERID -ne 0 ]
    then 
        echo "ERROR:: please run this with root access"
        exit 2
    fi
#### It is our responsibility again to check weather the installation is "success or not" 

    yum install mysql -y

    VALIDATE $? "installing mysql"

    yum install postfix -y

    VALIDATE $? "installing postfix"

>> This shows us how to decrease the no .of lines in code .












