class ceph::deploy{
  package{'ceph-deploy':
    ensure => installed,
    require => Package['ceph-release'],
  }
}
