class common {
  # Install needed packages
  class { common::packages :}
  # Restore mdadm config
  class { common::mdadm :}
  # 
  #class { common::something :}
}
