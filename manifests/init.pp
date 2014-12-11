/*
example of use
node 'puppetclient.local' {

 nginx::resources::mainconfig { '/etc/nginx/nginx.conf':
  user                  =>'nginx',
  worker_processes      =>'4',
  error_log             =>'/var/log/nginx/error.log warn',
  pid                   =>'/var/run/nginx.pid',
  worker_connection     =>'1024',
  default_type          =>'application/octet-stream',
  access_log            =>'/var/log/nginx/access.log  main',
  client_max_body_size  =>'128M',
  sendfile              =>'on',
  autoindex             =>'off',
  tcp_nopush            =>'on',
  keepalive_timeout     =>'60',
  gzip                  =>'on',
  gzip_disable          =>'"msie6"',
  gzip_vary             =>'on',
  gzip_proxied          =>'any',
  gzip_comp_level       =>'5',
  gzip_buffers          =>'16 8k',
  gzip_http_version     =>'1.1',
  gzip_types            =>'application/vnd.ms-fontobject application/x-font-ttf font/opentype text/plain text/css appl$
  send_timeout          =>'3600',
  proxy_read_timeout    =>'3600',
 }

  nginx::resources::vhost { 'www.example.com.conf':
    port                => '80',
    docroot             => '/var/www/www.example.com',
    ssl                 => false,
    priority            => '10',
    server_name         => 'example.com www.example.com',
  }

  nginx::resources::magento { 'shopnow.com.ua.conf':
    port                => '80',
    docroot             => '/var/www/www.example.com',
    ssl                 => false,
    priority            => '10',
    server_name         => 'shopnow.com.ua *.shopnow.com.ua',
    auth_basic_user_file => '/var/www/htpsswd',
    fastcgi_pass        => 'unix:/var/run/php-fpm.sock',
  }

}
*/

class nginx {
  include nginx::install
  include nginx::service

  $default_params = [ {
  port           => 80,
  template       => 'nginx/default.conf.erb',
  nx_allowed_ip  => 'localhost',
  fastcgi_pass   => '127.0.0.1:9000',
  }]
  create_resources('nginx::resource::defaulthost', $default_params )

  file { '/etc/nginx/conf.d':
    ensure  => directory,
    force   => true,
    purge   => true,
    recurse => true,
  }

  file { '/etc/nginx/vhosts':
    ensure  => directory,
    force   => true,
    purge   => true,
    recurse => true,
  }
}