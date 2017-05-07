## 
class common::jenkin {
  class {'jenkins':
#    executors => 1,
  }

  jenkins::plugin { 'display-url-api': }
  jenkins::plugin { 'git': }
  jenkins::plugin { 'git-client': }
  jenkins::plugin { 'junit': }
  jenkins::plugin { 'mailer': }
  jenkins::plugin { 'matrix-project': }
  jenkins::plugin { 'scm-api': }
  jenkins::plugin { 'script-security': }
  jenkins::plugin { 'ssh-credentials': }
  jenkins::plugin { 'structs': }
  jenkins::plugin { 'workflow-scm-step': }
  jenkins::plugin { 'workflow-step-api': }

  file {'/var/lib/jenkins/puppet':
    ensure => directory,
    owner  => 'jenkins',
    group  => 'jenkins',
  }
  vcsrepo { '/var/lib/jenkins/puppet/packer':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/liketed/packer.git',
  }
  common::packer { 'CentOS-6.9-puppet-virtualbox': }
  common::packer { 'CentOS-7.3-puppet-virtualbox': }
  common::packer { 'CentOS-7.3-kernel4-puppet-virtualbox': }
}
