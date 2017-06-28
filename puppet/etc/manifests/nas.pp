stage {'first':
  before => Stage['main'],
}
Package {
      allow_virtual => true,
    }
class pre_env {
  file { '/selinux/enforce':
    ensure => absent,
  }
  file {'/etc/selinux/config':
    ensure  => file,
    content => 'SELINUX=disabled',
  }
  if $::operatingsystemmajrelease == '6' {
    notify{'OS 6': }
  }
  # Remove default repositories
#  ensure_resource('file', '/etc/yum.repos.d/CentOS-Base.repo', { 'ensure' => 'present', 'content' => '' })
#  ensure_resource('file', '/etc/yum.repos.d/CentOS-Debuginfo.repo', { 'ensure' => 'present', 'content' => '' })
#  ensure_resource('file', '/etc/yum.repos.d/CentOS-Media.repo', { 'ensure' => 'present', 'content' => '' })
#  ensure_resource('file', '/etc/yum.repos.d/CentOS-Vault.repo', { 'ensure' => 'present', 'content' => '' })

}

class {'pre_env':
  stage => first,
}

include common
include common::workstation
include common::samba
include common::plex
include common::deluge
include common::jenkin
