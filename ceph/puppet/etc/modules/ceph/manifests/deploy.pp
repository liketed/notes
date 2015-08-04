class ceph::deploy{
  package{'ceph-deploy':
    ensure => installed,
    require => File ['/etc/yum.repos.d/ceph_repo.repo'],
  }
}
