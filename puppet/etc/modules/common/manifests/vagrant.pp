## Install vagrant
class common::vagrant {
  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
  $kernelPackages = [
    'kernel-devel.x86_64',
    'kernel-headers',
    'mesa-libGL.x86_64',
    'dkms',
    ]
  package { $kernelPackages:,
    ensure        => 'present',
    allow_virtual => false,
  }
  package {'VirtualBox-5.2':
    ensure  => present,
    require => Package['dkms'],
  }
  exec { 'vboxdrv_setup':
    command     => '/usr/lib/virtualbox/vboxdrv.sh setup',
    refreshonly => true,
    subscribe   => Package['VirtualBox-5.2'],
    require     => Package['VirtualBox-5.2'],
  }
  service {'vboxdrv':
    ensure  => running,
    require => Exec['vboxdrv_setup'],
  }
  exec{'vagrant_install':
    unless  => '/usr/bin/rpm -q vagrant',
    command => 'rpm -Uvh https://releases.hashicorp.com/vagrant/2.0.1/vagrant_2.0.1_x86_64.rpm',
    require => Service['vboxdrv'],
  }
  package {'unzip':
    ensure  => present,
  }->
  exec{'packer_download':
    command => 'wget https://releases.hashicorp.com/packer/1.1.3/packer_1.1.3_linux_amd64.zip; unzip packer_1.1.3_linux_amd64.zip; mv packer /usr/local/bin/',
    cwd     => '/tmp',
    creates => '/usr/local/bin/packer',
    require => Service['vboxdrv'],
  }
}
