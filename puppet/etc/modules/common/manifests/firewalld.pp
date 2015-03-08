# Configure firewalld on home machine
class common::firewalld {
  service {'firewalld':
    ensure  => stopped,
    enable  => false,
  }
}
