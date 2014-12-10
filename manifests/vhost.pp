define nginx::vhost(
  $docroot,
  $port,
  $ssl=false,
  $priority,
  $serveraliases = '',
  $template='nginx/vhost.conf.erb',
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