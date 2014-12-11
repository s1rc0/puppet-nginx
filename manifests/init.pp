/*
example of use
node '' {

class { 'nginx': }



 nginx::vhost { 'www.example.com':
 port => '80',
 docroot => '/var/www/www.example.com',
 ssl => false,
 priority => '10',
 server_name => 'home.example.com',
 }

}
*/

class nginx {
  include nginx::install
  #include nginx::service
}