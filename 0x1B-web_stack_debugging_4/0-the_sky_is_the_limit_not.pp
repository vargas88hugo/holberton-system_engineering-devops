# This is a puppet script that changes the limits of the files in nginx

exec {
  provider => shell,
  command  => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
}

exec {
  provider => shell,
  command  => 'sudo service nginx restart'
}