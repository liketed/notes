## Install common packages used by all centos versions.
class common::packages {
  $removePackages = [
    'fuse-ntfs-3g-2013.1.13-2.el6.rf.x86_64',
    'emacs',
    'pico', ]
  package { $removePackages:, ensure => 'absent' }

  $defaultPackages = [
    'curl',
    'make',
    'mlocate',
    'rsync',
    'tmux',
    'strace',
    'vim-minimal',
    'vim-enhanced',
    'openssh-clients',
    'yum-utils',
    ]
    package { $defaultPackages:, ensure => 'present' }
}
