# Script that installs and configures Nginx

exec {'install':
  command  => 'sudo apt-get -y install nginx',
  provider => shell,
  path     => '/usr/bin/env bash',
}

exec {'sed_config':
  command  => 'sudo sed -i "/server_name _;/ a\\\trewrite ^/redirect_me http://www.youtube.com permanent;" /etc/nginx/sites-available/default',
  provider => shell,
  path     => '/usr/bin/env bash',
}

exec {'start':
  command  => 'sudo service nginx start',
  provider => shell,
  path     => '/usr/bin/env bash',
}