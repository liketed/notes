# Deploy chef user, ssh key, sudoers file
class ceph::common{
  package { 'epel-release':
    ensure => present,
  }
  package { 'yum-plugin-priorities':
    ensure => present,
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
