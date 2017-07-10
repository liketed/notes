# Document class on line 1. 
class ceph::mon{
  package { 'httpd':
    ensure => installed,
  }
  package { 'mod_wsgi':
    ensure => installed,
  }
  package { 'git':
    ensure => installed,
  }
  service {'httpd':
    ensure => running,
    enable => true,
  }
  exec {'git-checkout-ceph-dash':
    command     => '/usr/bin/git clone https://github.com/Crapworks/ceph-dash.git; /bin/chown -R apache:apache /var/www/html/ceph-dash',
    cwd         => '/var/www/html/',
    creates     => '/var/www/html/ceph-dash',
  }
  file {'/etc/httpd/conf.d/ceph-dash.conf':
    ensure  => present,
    owner   => 'ceph',
    group   => 'ceph',
    mode    => '0644',
    content => template('ceph/ceph-dash.conf.erb'),
    notify  => Service['httpd'],
  }
}
