# This is a puppet script that changes the limit of holberton user

exec { 'limits': 
     provider => shell,
     command  => 'sudo sed -i "s/holberton hard nofile 5/holberton hard nofile 50000/g" /etc/security/limits.conf
     command  => 'sudo sed -i "s/holberton soft nofile 4/holberton hard nofile 40000/g" /etc/security/limits.conf
}