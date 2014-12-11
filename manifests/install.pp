class nginx::install {
  package { "nginx":
    ensure => present,
    allow_virtual => false,
  }
}