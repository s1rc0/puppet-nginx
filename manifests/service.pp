class nginx::service {
  service { 'nginx.service':
    ensure    => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['nginx::install'],
  }
}
