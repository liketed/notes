# Install workstation related things.
class common::workstation {
  yumrepo { 'google-chrome':
    ensure   => 'present',
    baseurl  => 'http://dl.google.com/linux/chrome/rpm/stable/$basearch',
    descr    => 'google-chrome - $basearch',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'https://dl-ssl.google.com/linux/linux_signing_key.pub',
  }
  package { 'google-chrome-stable':
    ensure => 'installed',
    require => Yumrepo['google-chrome'],
  }
  package { 'terminator':
    ensure => 'installed',
  }
}
