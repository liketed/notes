## Install vagrant
class common::vagrant {
  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
  exec { 'devtools':
    unless  => '/usr/bin/yum grouplist "Development tools" | /bin/grep "^Installed Groups"',
    command => '/usr/bin/yum -y groupinstall "Development tools"',
    require => Yumrepo['virtualbox'],
  }
  $kernelPackages = [
    'kernel-devel.x86_64',
    'kernel-headers',
    'mesa-libGL.x86_64',
    'dkms',
    ]
  package { $kernelPackages:,
    ensure        => 'present',
    allow_virtual => false,
    require       => Exec['devtools'],
  }
  package {'VirtualBox-5.1':
    ensure  => present,
    require => Package['dkms'],
  }
  exec { 'vboxdrv_setup':
    command     => '/usr/lib/virtualbox/vboxdrv.sh setup',
    refreshonly => true,
    subscribe   => Package['VirtualBox-5.1'],
    require     => Package['VirtualBox-5.1'],
  }
  service {'vboxdrv':
    ensure  => running,
    require => Exec['vboxdrv_setup'],
  }
  exec{'vagrant_install':
    unless  => '/usr/bin/rpm -q vagrant',
    command => 'rpm -Uvh https://releases.hashicorp.com/vagrant/1.9.4/vagrant_1.9.4_x86_64.rpm',
    require => Service['vboxdrv'],
  }
}
