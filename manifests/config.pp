define nginx::config(
  $user,
  $worker_processes,
  $error_log,
  $access_log,
  $pid,
  $worker_connection,

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