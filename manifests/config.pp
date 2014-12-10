class nginx::config {
  file { '/etc/nginx/conf.d/default':
    ensure => present,
    source => 'puppet:///modules/nginx/default',
    require => Class['nginx::install'],
    notify => Class['nginx::service'],
  }
  file { '/etc/nginx/nginx.conf':
    ensure => present,
    content => template('nginx/nginx.conf.erb'),
    require => Class['postfix::install'],
    notify => Class['postfix::service'],
  }
}