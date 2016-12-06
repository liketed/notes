# Install workstation related things.
class common::workstation {
  yumrepo { 'google-chrome':
    ensure   => 'present',
    baseurl  => 'http://dl.google.com/linux/chrome/rpm/stable/x86_64',
    descr    => 'google-chrome',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'https://dl.google.com/linux/linux_signing_key.pub',
  }
  package { 'google-chrome-stable':
    ensure => 'installed',
    require => Yumrepo['google-chrome'],
  }
  package { 'terminator':
    ensure => '0.98-4.fc25',
  }
}
