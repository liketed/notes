# Configure repos on home machine
class common::repo {
  case $::operatingsystem {
      'Fedora': { $atrpms='http://dl.atrpms.net/f$releasever-$basearch/atrpms/stable'
                  $vbrpms='http://download.virtualbox.org/virtualbox/rpm/fedora/$releasever/$basearch' }
      'CentOS': { $atrpms='http://dl.atrpms.net/el$releasever-$basearch/atrpms/stable'
                  $vbrpms='http://download.virtualbox.org/virtualbox/rpm/el/$releasever/$basearch' }
    }
  yumrepo{'atrpms':
    name     => 'atrpms',
    descr    => 'atrpms repo',
    baseurl  => $atrpms,
    gpgkey   => 'http://ATrpms.net/RPM-GPG-KEY.atrpms',
    enabled  => true,
    gpgcheck => true,
  }
  yumrepo{'virtualbox':
    name     => 'virtualbox',
    descr    => 'virtualbox repo',
    baseurl  => $vbrpms,
    gpgkey   => 'https://www.virtualbox.org/download/oracle_vbox.asc',
    enabled  => true,
    gpgcheck => true,
  }
  package{'ius-release':
    ensure   => 'present',
    provider => 'rpm',
    source   => 'https://centos7.iuscommunity.org/ius-release.rpm',
  }
}
