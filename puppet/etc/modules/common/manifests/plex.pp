## Install plex
class common::plex {
  package { 'plexmediaserver':
    ensure   => 'present',
    provider => 'rpm',
    source   => 'https://downloads.plex.tv/plex-media-server/1.8.4.4249-3497d6779/plexmediaserver-1.8.4.4249-3497d6779.x86_64.rpm',
  }
  service {'plexmediaserver':
    ensure  => running,
    enable  => true,
    require => Package['plexmediaserver'],
  }
}
