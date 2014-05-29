## backup my mdadm config
class common::mdadm {
  file { '/etc/mdadm.conf':
    source  => 'puppet:///modules/common/mdadm/md127.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
