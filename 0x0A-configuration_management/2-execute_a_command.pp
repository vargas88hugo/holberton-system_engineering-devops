# Killing the process
exec { 'killmenow':
  command => '/usr/bin/pkill killmenow'
}