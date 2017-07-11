# Deploy chef user, ssh key, sudoers file
class ceph::common{
  $subnet = $facts['networking']['interfaces']['eth1']['network'][0,-3]
  package { 'yum-plugin-priorities':
    ensure => present,
  }->
  package {'ceph-release':
    ensure   => 'present',
    provider => 'rpm',
    source   => 'http://download.ceph.com/rpm-jewel/el7/noarch/ceph-release-1-1.el7.noarch.rpm',
  }->
  package { 'epel-release':
    ensure => present,
    notify => Exec['import-epel-gpg'],
  }->
  exec {'import-epel-gpg':
    command     => '/usr/bin/rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7',
    refreshonly => true,
  }->
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }->
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
  file {'/etc/ceph':
    ensure => directory,
    owner  => 'ceph',
    group  => 'ceph',
    mode   => '0755',
  }->
  file {'/etc/ceph/ceph.client.admin.keyring':
    ensure => present,
    owner  => 'ceph',
    group  => 'ceph',
    mode   => '0644',
  }
  host { 'client':
    ip => "${subnet}.200",
  }
  host { 'osd4':
    ip => "${subnet}.114",
  }
  host { 'osd5':
    ip => "${subnet}.115",
  }
}
