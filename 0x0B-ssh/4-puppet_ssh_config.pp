# puppet ssh configuration
file_line { 'pass_auth'
    ensure => 'present',
    path   => '/etc/ssh/ssh_config',
    line   => ' PasswordAuthetification no',
}
file_line { 'conf_key'
    ensure => 'present',
    path   => '/etc/ssh/ssh_config',
    line   => ' IdentityFile ~/.ssh/holberton',
}
