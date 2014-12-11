class nginx::redhat (
  $manage_repo    = true,
  $package_ensure = 'present',
  $package_name   = 'nginx',
) {

  if $::lsbmajdistrelease {
    $major_dist_release = $::lsbmajdistrelease
  }
  else {
    $major_dist_release = $::operatingsystemmajrelease
  }

  case $::operatingsystem {
    'fedora': {
      if $::lsbmajdistrelease and $::lsbmajdistrelease < 19 {
        notice("${::operatingsystem} ${::lsbmajdistrelease} does not supply nginx >= 1.4 packages")
      }
    }
    default: {
      case $major_dist_release {
        5, 6, 7: {
          $os_rel = $major_dist_release
        }
        default: {
          $os_rel = 6
        }
      }
      if $manage_repo {
        yumrepo { 'nginx-release':
          baseurl  => "http://nginx.org/packages/rhel/${os_rel}/\$basearch/",
          descr    => 'nginx repo',
          enabled  => '1',
          gpgcheck => '1',
          priority => '1',
          gpgkey   => 'http://nginx.org/keys/nginx_signing.key',
          before   => Package[$package_name],
        }

        file { '/etc/yum.repos.d/nginx-release.repo':
          ensure  => present,
          require => Yumrepo['nginx-release'],
        }
      }
    }
  }

  package { $package_name:
    ensure  => $package_ensure,
  }

}
