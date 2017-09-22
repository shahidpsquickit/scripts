#!\bin\bash

echo "###########Entering setup for MySQL configuration###########";
echo "[Info] !!Please refer to Readme.txt before proceeding!!";
read -p "Do you wish to install MySQL or want to continue with you pervious version(y/n)" yes_no
if ["$yes_no" = "y"]
then
	echo " "
	echo "########### Starting Setup ###########";
	sudo rm /var/lib/apt/lists/lock
	sudo rm /var/cache/apt/archives/lock
	sudo rm /var/lib/dpkg/lock

	sudo apt-get update
	sudo apt-get install mysql-server
	sudo mysql_secure_installation
	mysqld --initialize
	mysqladmin -p -u root version
else
	echo " ";
	echo "############# Skipping MySQL Installation###########";
fi	
	echo "###########Starting MySQL Configuration with Loggly###########";
	sudo vi /etc/mysql/my.cnf
	systemctl restart mysql.service
	echo "[Input] Enter MySQL username"; read a;
	echo "[Input] Enter MySQL password"; read b;
	mysql -h 127.0.0.1 -P 3306 -u $a -p$b -e "SET Global general_log = 1;"
	mysql -h 127.0.0.1 -P 3306 -u $a -p$b -e "SET Global general_log = 'ON';"
	mysql -h 127.0.0.1 -P 3306 -u $a -p$b -e "show databases;"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b -e "create database test;"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b -e "use test;"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "create table test (s_no int, test_name char (50));"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "show tables;"
	mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "insert into test values (01,'test1');"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "insert into test values (02,'test2');"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "insert into test values (03,'test3');"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "insert into test values (04,'test4');"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "insert into test values (05,'test5');"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "insert into test values (06,'test6');"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "insert into test values (07,'test7');"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "insert into test values (08,'test8');"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "insert into test values (09,'test9');"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "select * from test;"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "delete from test where s_no='01';"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "insert into test values (02,'test2');"
        mysql -h 127.0.0.1 -P 3306 -u $a -p$b test -e "insert into test values (01,'test1');"

echo "--------------------------Setup Completed----------------------------";
