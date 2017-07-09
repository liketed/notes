# Deploy chef user, ssh key, sudoers file
class ceph::user{
  group { 'ceph':
    ensure => present,
    gid    => 4001
  }
  user { 'ceph':
    ensure   => present,
    gid      => 'ceph',
    uid      => '4001',
    password => '$1$mGibfXM2$KBnzLb2KihTr3nEiN8TcO/',
    comment  => 'Manage ceph services',
    home     => '/home/ceph',
    shell    => '/bin/bash',
    groups   => ['wheel'],
    require  => Group['ceph'],
  }
  file { '/home/ceph':
    ensure  => directory,
    owner   => 'ceph',
    group   => 'ceph',
    mode    => '0755',
    require => User['ceph'],
  }
  file { '/home/ceph/.bashrc':
    ensure  => file,
    source  => 'puppet:///modules/ceph/bashrc',
    owner   => 'ceph',
    group   => 'ceph',
    mode    => '0644',
    require => File['/home/ceph'],
  }
  file { '/home/ceph/.bash_profile':
    ensure  => file,
    source  => 'puppet:///modules/ceph/bash_profile',
    owner   => 'ceph',
    group   => 'ceph',
    mode    => '0644',
    require => File['/home/ceph'],
  }

  file { '/etc/sudoers.d/ceph' :
    ensure   => file,
    mode     => '0440',
    owner    => 'root',
    group    => 'root',
    content  => 'ceph ALL=(ALL) NOPASSWD: ALL',
  }
  file { '/home/ceph/.ssh':
    ensure  => directory,
    recurse => true,
    source  => 'puppet:///modules/ceph/ssh',
    owner   => 'ceph',
    group   => 'ceph',
    mode    => '0700',
    require  => File['/home/ceph'],
  }
}
