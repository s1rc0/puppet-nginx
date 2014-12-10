class nginx::service {
  service { 'nginx':
    lensure    => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['nginx::config'],
  }
}