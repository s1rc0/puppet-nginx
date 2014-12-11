define nginx::resources::magento-wl(
  $docroot,
  $port,
  $ssl=false,
  $priority,
  $server_name,
  $auth_basic_user_file,
  $fastcgi_pass,
  $template='nginx/magento-wl.erb',
){
  include nginx

  file {"/etc/nginx/conf.d/${name}":
    content => template($template),
    owner => 'root',
    group => 'root',
    mode => '0640',
    require => Class['nginx::install'],
    notify => Class['nginx::service'],
  }

}