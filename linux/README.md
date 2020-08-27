# Check if module is loaded from running process, i.e. omohiredis module loaded by redis daemon

    [root@centos7 rpmbuild-new]# grep -r omhiredis /proc/`pidof rsyslogd`/maps
    7f0d5da24000-7f0d5da27000 r-xp 00000000 fd:00 67303609                   /usr/lib64/rsyslog/omhiredis.so
    7f0d5da27000-7f0d5dc26000 ---p 00003000 fd:00 67303609                   /usr/lib64/rsyslog/omhiredis.so
    7f0d5dc26000-7f0d5dc27000 r--p 00002000 fd:00 67303609                   /usr/lib64/rsyslog/omhiredis.so
    7f0d5dc27000-7f0d5dc28000 rw-p 00003000 fd:00 67303609                   /usr/lib64/rsyslog/omhiredis.so
