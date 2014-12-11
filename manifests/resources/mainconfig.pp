define nginx::resources::mainconfig(
  $user,                  # omnic
  $worker_processes,      # number of CPU
  $error_log,             # /var/log/nginx/error.log warn
  $pid,                   # /var/run/nginx.pid
  $worker_connection,     # 1024
  $default_type,          # application/octet-stream
  $access_log,            # /var/log/nginx/access.log  main
  $client_max_body_size,  # 128M
  $sendfile,              # on
  $autoindex,             # off
  $tcp_nopush,            # on
  $keepalive_timeout,     # 60
  #$gzip,                  # on
  $gzip_disable,          # "msie6"
  $gzip_vary,             # on
  $gzip_proxied,          # any
  $gzip_comp_level,       # 5
  $gzip_buffers,          # 16 8k
  $gzip_http_version,     # 1.1
  $gzip_types,            # application/vnd.ms-fontobject application/x-font-ttf font/opentype text/plain text/css application/javascript application/x-javascript text/xml application/xml application/xml+rss text/javascript
  $send_timeout,          # 3600
  $proxy_read_timeout,    # 3600

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