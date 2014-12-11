define nginx::resources::mainconfig(
  $user                   = 'nginx',
  $worker_processes       = 2,
  $error_log              = '/var/log/nginx/error.log warn',
  $pid                    = '/var/run/nginx.pid',
  $worker_connection      = 1024,
  $default_type           = 'application/octet-stream',
  $access_log             = '/var/log/nginx/access.log  main',
  $client_max_body_size   = '12M',
  $sendfile               = 'on',
  $autoindex              = 'off',
  $tcp_nopush             = 'on',
  $keepalive_timeout      = 10,
  $gzip                   = undef,
  $gzip_disable           = undef,
  $gzip_vary              = undef,
  $gzip_proxied           = undef,
  $gzip_comp_level        = undef,
  $gzip_buffers           = undef,
  $gzip_http_version      = undef,
  $gzip_types             = undef,
  $send_timeout           = undef,
  $proxy_read_timeout     = undef,

  $template='nginx/nginx.conf.erb',
){

  include nginx

  file {"/etc/nginx/nginx.conf":
    content => template("$template"),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['nginx::install'],
    notify => Class['nginx::service'],
  }

}