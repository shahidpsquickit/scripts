#!\bin\bash

echo " ";
echo "--------------- Entering AWS S3 configuration setup ---------------";

sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock

sudo apt-get update
sudo apt-get install python3.6
sudo apt-get install python-pip

pip install -U boto
pip install awscli --upgrade --user

aws --version

echo " ";
echo "[warning] Please go to your Loggly account and click on Source setup -> S3 Sources -> click on 'Add New' ";
echo "[Info] On the Script section enter the S3 bucket name and AWS account number";

read -p "Done with the above steps? Press y and then enter to continue:" yes
if [ "$yes" = "y" ]
then
	echo " ";
	aws configure

	curl -0 https://www.loggly.com/install/SQS3script.py

	read -p "Please enter S3 bucket name" bucket
	read -p "Please senter account number" acnumber

	python SQS3script.py --s3bucket $bucket --acnumber $acnumber

	echo " ";
	echo "------------------------------";
	echo "Please enter the above displayed details in the appropriate fields on the Loggly setup page and then click on save, the setup would be completed then.......";
else 
	echo "---------------Setup Incomplete-------------";
fi
	echo " ";
	
#End of Script