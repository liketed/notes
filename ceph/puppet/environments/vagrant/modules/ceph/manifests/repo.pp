class ceph::repo{
  package {'ceph-release':
    ensure   => 'present',
    provider => 'rpm',
    source   => 'http://download.ceph.com/rpm-jewel/el7/noarch/ceph-release-1-1.el7.noarch.rpm',
  }
}
