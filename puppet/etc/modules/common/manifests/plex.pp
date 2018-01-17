## Install plex
class common::plex {
  package { 'plexmediaserver':
    ensure   => 'present',
    provider => 'rpm',
    source   => 'https://downloads.plex.tv/plex-media-server/1.10.1.4602-f54242b6b/plexmediaserver-1.10.1.4602-f54242b6b.x86_64.rpm',
  }
  service {'plexmediaserver':
    ensure  => running,
    enable  => true,
    require => Package['plexmediaserver'],
  }
}
