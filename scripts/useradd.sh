#!/bin/bash
#dir=`pwd`
for i in `cat /tmp/userdetails12345/users/users_list`
do
id $i
if [ $? -eq 0 ]
then
echo "user already exist"
else
useradd $i
fi
mkdir /home/$i/.ssh
cp /tmp/userdetails12345/keys/$i.keys /home/$i/.ssh/authorized_keys
chmod 400 /home/$i/.ssh/authorized_keys
chmod 600 /home/$i/.ssh
chown -R $i:$i /home/$i/.ssh
done
