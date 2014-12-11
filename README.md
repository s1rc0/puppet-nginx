# NGINX Module

* Sergey Postument <segrey.postument@gmail.com>

This module manages NGINX configuration.

## Quick Start

### Requirements

* Puppet-2.7.0 or later
* Ruby-1.9.3 or later (Support for Ruby-1.8.7 is not guaranteed. YMMV).

### Install and bootstrap an NGINX instance

```puppet
  nginx::resources::defaulthost {'/etc/nginx/conf.d/default.conf': port => 80,}
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
  gzip_types            =>'application/vnd.ms-fontobject application/x-font-ttf font/opentype text/plain text/css',
  send_timeout          =>'3400',
  proxy_read_timeout    =>'3400',
  }
```

### Setup a new virtual host ( for magento site)

```puppet
nginx::resources::wordpress { 'example.com': }
```

### Setup a new virtual host ( for drupal site)

```puppet
nginx::resources::wordpress { 'example.com': }
```

### Setup a new virtual host ( for magento site)

```puppet
nginx::resources::magento { 'example.com': }
```
