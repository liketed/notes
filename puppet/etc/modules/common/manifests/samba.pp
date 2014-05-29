class common::samba {
 $sambaPackages = [
    'samba',
    'samba-client',
    'samba-common',
    ]
    package { $sambaPackages:, ensure => 'present',allow_virtual => false, }
  group {'smbgrp':
    name  => 'smbgrp',
    ensure => present,
    gid    => 600
  } 
  service {'smb':
    ensure => running
  }
  service {'nmb':
    ensure => running
  }
  file {'/etc/samba/smb.conf':
    ensure => present,
    source  => 'puppet:///modules/common/samba/smb.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
