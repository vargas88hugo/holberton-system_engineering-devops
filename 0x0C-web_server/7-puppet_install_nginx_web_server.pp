# Script that installs and configures Nginx
exec {'update':
  command  => 'apt-get -y update',
  provider => shell,
}

exec {'install':
  command  => 'sudo apt-get -y install nginx',
  provider => shell,
}

exec {'create_html':
  command  => 'sudo echo "Holberton School" | tee /var/www/html/index.nginx-debian.html',
  provider => shell,
}

exec {'sed_config':
  command  => 'sudo sed -i "/server_name _;/ a\\\trewrite ^/redirect_me http://www.youtube.com permanent;" /etc/nginx/sites-available/default',
  provider => shell,
}

exec {'start':
  command  => 'sudo service nginx start',
  provider => shell,
}