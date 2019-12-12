# Script that installs and configures Nginx
exec {'update':
  command  => 'apt-get -y update',
  provider => shell,
}

exec {'install':
  command  => 'apt-get -y install nginx',
  provider => shell,
}

exec {'create_html':
  command  => 'echo "Holberton School" > /var/www/html/index.nginx-debian.html',
  provider => shell,
}

exec {'sed_config':
  command  => 'sed -i "/server_name _;/ a\\\trewrite ^/redirect_me http://www.youtube.com permanent;" /etc/nginx/sites-available/default',
  provider => shell,
}

exec {'start':
  command  => 'service nginx start',
  provider => shell,
}