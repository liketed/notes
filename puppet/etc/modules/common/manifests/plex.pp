## Install plex
class common::plex {
  package { 'plexmediaserver':
    ensure   => 'present',
    provider => 'rpm',
    source   => 'https://downloads.plex.tv/plex-media-server/1.9.2.4285-9f65b88ae/plexmediaserver-1.9.2.4285-9f65b88ae.x86_64.rpm',
  }
  service {'plexmediaserver':
    ensure  => running,
    enable  => true,
    require => Package['plexmediaserver'],
  }
}
