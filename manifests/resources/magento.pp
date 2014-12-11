define nginx::resources::magento(
  $docroot                    = '/var/www/html/',
  $port                       = 80,
  $server_name                = $name,
  $auth_basic_user_file       = '/etc/nginx/.htpasswd',
  $fastcgi_pass               = '127.0.0.1:9000',
  $template                   = 'nginx/magento.erb',
){
  include nginx

  file {"/etc/nginx/conf.d/${name}.conf":
    content => template($template),
    owner => 'root',
    group => 'root',
    mode => '0640',
    require => Class['nginx::install'],
    notify => Class['nginx::service'],
  }

}