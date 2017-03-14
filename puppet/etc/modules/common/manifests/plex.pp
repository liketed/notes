## Install plex
class common::plex {
  package { 'plexmediaserver':
    provider => 'rpm',
    source   => 'https://downloads.plex.tv/plex-media-server/1.4.3.3433-03e4cfa35/plexmediaserver-1.4.3.3433-03e4cfa35.x86_64.rpm',
    ensure   => 'present',
  }
  service {'plexmediaserver':
    ensure => running,
    enable => true,
  }
}
