# NGINX Module

* Sergey Postument <segrey.postument@gmail.com>

This module manages NGINX configuration.

## Quick Start

### Requirements

* Puppet-2.7.0 or later
* Ruby-1.9.3 or later (Support for Ruby-1.8.7 is not guaranteed. YMMV).

### Install and bootstrap an NGINX instance

```puppet
class { 'nginx': }
```

### Setup a new virtual host

```puppet
  nginx::resources::vhost { 'www.example.com.conf':
    port => '80',
    docroot => '/var/www/www.example.com',
    ssl => false,
    priority => '10',
    server_name => 'example.com www.example.com',
  }
```
