## deluge
class common::deluge{
  yumrepo{'nux-dextop':
    name     => 'nux-dextop',
    descr    => 'nux-dextop',
    baseurl  => 'http://li.nux.ro/download/nux/dextop/el7/$basearch/ http://mirror.li.nux.ro/li.nux.ro/nux/dextop/el7/$basearch/',
    gpgkey   => 'http://mirror.li.nux.ro/li.nux.ro/nux/RPM-GPG-KEY-nux.ro',
    enabled  => true,
    gpgcheck => true,
  }
  package{'deluge':
    ensure => installed,
  }
  # I dont ever want this running automatically
  service{'deluge-web':
    enable => true,
    ensure => running,
  }
  service{'deluge-daemon':
    enable => false,
    ensure => stopped,
  }
}
