define nginx::resources::defaulthost (
  $port           = 80,
  $template       = 'nginx/default.conf.erb',
  $nx_allowed_ip  = '127.0.0.1',
  $fastcgi_pass   = '127.0.0.1:9000',
){
  include nginx

  file {"/etc/nginx/conf.d/default.conf":
    content => template("$template"),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['nginx::install'],
    notify => Class['nginx::service'],
  }

}
