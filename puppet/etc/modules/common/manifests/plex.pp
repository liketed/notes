## Install plex
class common::plex {
  package { 'plexmediaserver':
    ensure   => 'present',
    provider => 'rpm',
    source   => 'https://downloads.plex.tv/plex-media-server/1.5.5.3634-995f1dead/plexmediaserver-1.5.5.3634-995f1dead.x86_64.rpm',
  }
  service {'plexmediaserver':
    ensure  => running,
    enable  => true,
    require => Package['plexmediaserver'],
  }
}
