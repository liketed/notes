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
}
