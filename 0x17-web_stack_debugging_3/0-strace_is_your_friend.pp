# Fix 500 error in wordpress

exec { 'wp-settings.php':
   provider => 'shell',
   command => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php'
}