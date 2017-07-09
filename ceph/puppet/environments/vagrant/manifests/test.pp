stage {'first':
  before => Stage['main'],
}
#exec { 'yum_clean_all':
#  command => '/usr/bin/yum clean all; yum makecache',
#}   
service {'puppet':
  ensure => stopped,
  enable => false,
}
lookup('classes', Array[String], 'unique').include
