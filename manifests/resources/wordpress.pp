define nginx::resources::wordpress(
  $docroot                    = '/var/www/html/',
  $port                       = 80,
  $server_name                = $name,
  $auth_basic_user_file       = '/etc/nginx/.htpasswd',
  $fastcgi_pass               = '127.0.0.1:9000',
  $nx_allowed_ip              = '0.0.0.0/0',
  $template                   = 'nginx/wordpress.erb',
){
  include nginx

  file {"/etc/nginx/vhosts/${name}.conf":
    content => template($template),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['nginx::install'],
    notify => Class['nginx::service'],
  }

}