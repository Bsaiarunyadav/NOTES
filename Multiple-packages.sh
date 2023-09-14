* Algorithm
Task :- 
Install multiple packages with single script 

    1)User should have root access
    2) DATE
    3)while installing store the logs
    4)implement colors for user experiecnce 
    5)Before installing check whether the packages are already installed or not 
    6)If installed skip,otherwirse proceed to installation .
    7)check sucessfully installed or not . 

Now let us implement the script .

1) User should have root access.
    USERID=$(d -u)
    Now how to check :- condition 
    If [ $USERID -ne 0 ];
        then 
            echo "ERROR:: please run this script with root access"
        exit 1 

2) DATE :- 
DATE=$(date +%F)


3) while installing store the logs
Generally while installing packages lots of logs file will be created so we have to store them.
by making a directory also by making the DATES .
We can create a own directory by using = ex :- mkdir logs 

    LOGSDIR=/home/centos/shellscript/shellscript-logs
    LOGFILE=$LOGSDIR/$0-$DATE.log

    ** our intension is that to have the logs inside :-
    /home/centos/shellscript/shellscript-logs/SCRIPT_NAME-$DATE.log ( WITH date and name) 
    Then we will give 
    LOGFILE=$LOGSDIR/$0-$DATE.log

5)Before installing check whether the packages are already installed or not .
also we are looping in and inside we are getting 1 by one so before doing installation 
** If we have a question whether it was done or not the we have to write a if condition .
---->generally we check using :- yum list installed packages <----command

HERE we are appending the log file as this may create lot of log files


for i $@
    do 
     yum list installed $i &>>LOGFILE
     ** then write a if condition 
if [ $? -ne 0 ]
    then 
        echo "$i was not installed let's installed it"
        yum install $i -y
        VALIDATE $? &>>LOGFILE
    else
        echo "$i was already installed"
    fi
done

7)check sucessfully installed or not . 
    ** as we have done the installation we need to have the validation to check whether the installation is success or not .
Here 

VALIDATE(){
    if [ $1 -ne 0 ];
    then 
        echo -e "Installing $2 ... $R FAILURE $N"
    else
        echo -e "installing $2 ... $G SUCCESS $N"
    fi
}
    





DATE=$(date +%F)
USERID=$(id -u)
SCRIPT_NAME=$0
LOGSDIR=/home/centos/shellscript/shellscript-logs
LOGFILE=$LOGSDIR/$0-$DATE.log
R="\e[31m"
N="\e[0m"
Y="\e[33m"
G="\e[32m"


if [ $USERID -ne 0 ];
    then 
        echo -e "$R ERROR:: please run this script with root access $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then 
        echo -e "Installing $2 ... $R FAILURE $N"
    else
        echo -e "installing $2 ... $G SUCCESS $N"
    fi
}



for i in $@
do
    yum list installed $i &>>LOGFILE
    if [ $? -ne 0 ]
    then   
        echo "$i is not installed, let's install it"
        yum install $i -y &>>LOGFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y $i is already installed $N"
    fi
done 










