# Configure repos on home machine
class common::repo {
  yumrepo{'atrpms':
    name     => 'atrpms',
    descr    => 'atrpms repo',
    baseurl  => 'http://dl.atrpms.net/el$releasever-$basearch/atrpms/stable',
    gpgkey   => 'http://ATrpms.net/RPM-GPG-KEY.atrpms',
    enabled  => true,
    gpgcheck => true,
  }
  yumrepo{'virtualbox':
    name     => 'virtualbox',
    descr    => 'virtualbox repo',
    baseurl  => 'http://download.virtualbox.org/virtualbox/rpm/el/$releasever/$basearch',
    gpgkey   => 'https://www.virtualbox.org/download/oracle_vbox.asc',
    enabled  => true,
    gpgcheck => true,
  }
}
