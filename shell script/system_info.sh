Current User: <username>
Home Directory: <home>
Current Shell: <shell>
Today Date: <date>
Hostname: <hostname>


read -p "Enter your name: " name
echo $name

read -p -s "Password: " password

echo "name: $name password: $password"


read -n 1 -p "Press any key to continue: " key

echo  $key
echo $USER
echo $HOME
echo $SHELL
echo $(date)
echo $(hostname)