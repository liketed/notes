# Configure noip on home machine
class common::noip {
  package{'noip':
    ensure => installed,
    source => 'ftp://fr2.rpmfind.net/linux/fedora/linux/development/rawhide/x86_64/os/Packages/n/noip-2.1.9-15.fc22.x86_64.rpm',
  }
  notify {'Please create noip config file and enable chkconfig: noip2 -C; :}
}
