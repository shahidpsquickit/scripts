#!/bin/bash

echo "####################Entering the setup and Configuration of MongoDB#######################";
echo "[Info] Please refer to Readme.txt before proceeding!!";
echo "[Info] You can continue with you previous MongoDB or You can install it through this setup";
read -p "Do you wish to install MongoDB in your system?(y/n)" yn
if [ "$yn" = "y" ]
then
    echo " ";
    echo "############################Starting Setup#######################################";
    echo "[Info] Getting gpg key from the server";
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
    echo "[Info] Got the gpg key!!";
    echo "[Info] Getting the repository";
    echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
    sudo rm /var/lib/apt/lists/lock
    sudo rm /var/cache/apt/archives/lock
    sudo rm /var/lib/dpkg/lock
    echo "[Info] Updating Repository";
    sudo apt-get update
    echo "[Info] Installing MongoDB";
    sudo apt-get install -y mongodb-org
    cd /lib/systemd/system/
    sudo vim mongod.service
    systemctl daemon-reload
    echo "[Info] Starting MongoDB Service";
    systemctl start mongod
    systemctl enable mongod
    echo "[Info] Checking whether MongoDB is working or not";
    netstat -plntu
else
    echo " "; 
    echo "######################################Skipping MongoDB Installation#################################################";

fi
    echo " ";
    echo "######################################Starting MongoDB Configuration with Loggly##################################################";
    curl -O https://www.loggly.com/install/configure-file-monitoring.sh
    echo "[Input] Enter Loggly Sub-Domain :"; read a;
    echo "[Input] Enter Loggly User-name : "; read b;
    sudo bash configure-file-monitoring.sh -a $a -u $b -f /var/log/mongodb/mongod.log -l mongodb -tag MongoDB
    systemctl start mongod
    systemctl enable mongod
read -p "Is your MongoDB Password protected?(y/n)" ny
if [ "$ny" = "y" ]
then 
    echo "[Input] Enter MonoDB Username :"; read c;
    echo "[Input] Enter MongoDB Password :"; read d;
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.setProfilingLevel(1);'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.setLogLevel(1,"accessControl");'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.setLogLevel(1,"command");'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.setLogLevel(1,"control");'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.setLogLevel(1,"geo");'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.setLogLevel(1,"index");'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.setLogLevel(1,"network");'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.setLogLevel(1,"query");'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.setLogLevel(1,"replication");'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.setLogLevel(1,"sharding");'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.setLogLevel(1,"storage");'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.setLogLevel(1,"storage.journal");'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.setLogLevel(1,"write");'
    mongo -u $c -p $d --authenticationDatabase admin --eval "db.createCollection('customers');"
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.insert({first_name:"test1", last_name:"test1"});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.insert({first_name:"test2", last_name:"test2"});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.insert({first_name:"test3", last_name:"test3"});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.insert({first_name:"test4", last_name:"test4"});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.insert({first_name:"test5", last_name:"test5"});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.insert({first_name:"test6", last_name:"test6"});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.insert({first_name:"test7", last_name:"test7"});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.insert({first_name:"test8", last_name:"test8"});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.find();'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.find().pretty();'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.update({first_name:"test1"},{first_name:"test1",first_name:"test1",age:"23"});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.update({first_name:"test2"}{$set:{gender:"male"}});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.update({first_name:"test2"}{$unset:{gender:"male"}})'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.update({first_name:"test3"},{first_name:"test3", last_name:"test3"},{upsert:true});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.remove({first_name:"test8"});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.remove({first_name:"test8"});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.remove({first_name:"test8"});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.remove({first_name:"test8"});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.remove({first_name:"test8"});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.find();'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.find.pretty();'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.find().sort({last_name:1});'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.find().count();'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.find().limit(4);'
    mongo -u $c -p $d --authenticationDatabase admin --eval 'db.customers.find().forEach(function(doc){print("name:"+doc.first_name)});'

else
    mongo --eval 'db.setProfilingLevel(1);'
    mongo --eval 'db.setLogLevel(1,"accessControl");'
    mongo --eval 'db.setLogLevel(1,"command");'
    mongo --eval 'db.setLogLevel(1,"control");'
    mongo --eval 'db.setLogLevel(1,"geo");'
    mongo --eval 'db.setLogLevel(1,"index");'
    mongo --eval 'db.setLogLevel(1,"network");'
    mongo --eval 'db.setLogLevel(1,"query");'
    mongo --eval 'db.setLogLevel(1,"replication");'
    mongo --eval 'db.setLogLevel(1,"sharding");'
    mongo --eval 'db.setLogLevel(1,"storage");'
    mongo --eval 'db.setLogLevel(1,"storage.journal");'
    mongo --eval 'db.setLogLevel(1,"write");'
    mongo --eval "db.createCollection('customers');"
    mongo --eval 'db.customers.insert({first_name:"test1", last_name:"test1"});'
    mongo --eval 'db.customers.insert({first_name:"test2", last_name:"test2"});'
    mongo --eval 'db.customers.insert({first_name:"test3", last_name:"test3"});'
    mongo --eval 'db.customers.insert({first_name:"test4", last_name:"test4"});'
    mongo --eval 'db.customers.insert({first_name:"test5", last_name:"test5"});'
    mongo --eval 'db.customers.insert({first_name:"test6", last_name:"test6"});'
    mongo --eval 'db.customers.insert({first_name:"test7", last_name:"test7"});'
    mongo --eval 'db.customers.insert({first_name:"test8", last_name:"test8"});'
    mongo --eval 'db.customers.find();'
    mongo --eval 'db.customers.find().pretty();'
    mongo --eval 'db.customers.update({first_name:"test1"},{first_name:"test1",first_name:"test1",age:"23"});'
    mongo --eval 'db.customers.update({first_name:"test2"}{$set:{gender:"male"}});'
    mongo --eval 'db.customers.update({first_name:"test2"}{$unset:{gender:"male"}})'
    mongo --eval 'db.customers.update({first_name:"test3"},{first_name:"test3", last_name:"test3"},{upsert:true});'
    mongo --eval 'db.customers.remove({first_name:"test8"});'
    mongo --eval 'db.customers.remove({first_name:"test8"});'
    mongo --eval 'db.customers.remove({first_name:"test8"});'
    mongo --eval 'db.customers.remove({first_name:"test8"});'
    mongo --eval 'db.customers.remove({first_name:"test8"});'
    mongo --eval 'db.customers.find();'
    mongo --eval 'db.customers.find.pretty();'
    mongo --eval 'db.customers.find().sort({last_name:1});'
    mongo --eval 'db.customers.find().count();'
    mongo --eval 'db.customers.find().limit(4);'
    mongo --eval 'db.customers.find().forEach(function(doc){print("name:"+doc.first_name)});'

fi
    echo " ";
    echo " ";
    echo "----------------------Setup Completed-----------------------"
    echo " ";
    echo "MongoDB Logs Successfully sent to your Loggly account"
    
