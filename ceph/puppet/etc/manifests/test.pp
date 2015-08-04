stage {'first':
  before => Stage['main'],
}
if versioncmp($::puppetversion,'3.6.1') >= 0 {
  Package {
    allow_virtual => false,
  }
}
#exec { 'yum_clean_all':
#  command => '/usr/bin/yum clean all; yum makecache',
#}   
service {'puppet':
  ensure => stopped,
  enable => false,
}
hiera_include('classes')
