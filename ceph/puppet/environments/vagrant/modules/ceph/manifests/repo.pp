class ceph::repo{
  file {'/etc/yum.repos.d/ceph_repo.repo':
    ensure => file,
    source => 'puppet:///modules/ceph/ceph.repo',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  package {'ceph-release':
    ensure   => 'absent',
  }
}
