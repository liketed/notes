# Deploy chef user, ssh key, sudoers file
class ceph::common{
  package { 'yum-plugin-priorities':
    ensure => present,
  }
  package { 'epel-release':
    ensure => present,
    notify => Exec['import-epel-gpg'],
  }
  exec {'import-epel-gpg':
    command     => '/usr/bin/rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7',
    refreshonly => true,
  }
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }
  file {'/data':
    ensure => directory,
    owner  => 'ceph',
    group  => 'ceph',
  }
  file {'/data1':
    ensure => directory,
    owner  => 'ceph',
    group  => 'ceph',
  }
  file {'/data2':
    ensure => directory,
    owner  => 'ceph',
    group  => 'ceph',
  }
  file {'/data3':
    ensure => directory,
    owner  => 'ceph',
    group  => 'ceph',
  }
}
