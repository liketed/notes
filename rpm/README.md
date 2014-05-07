# Get a list of packages installed

    rpm -qa
    rpm -qa | grep release


Verify if package is installed

    rpm -q yum; echo $?
    rpm -q xorg-x11; echo $?
    package xorg-x11 os not installed
    1


List file of a package

    rpm -ql centos-release
    /etc/centos-release
    /etc/issue
    /etc/issue.net
    .
    .
    .

Adding v will make it more verbose.

    rpm -qlv centos-release
    -rw-r--r--    1 root    root                       27 Dec  1 01:07 /etc/centos-release
    -rw-r--r--    1 root    root                       47 Dec  1 01:07 /etc/issue
    -rw-r--r--    1 root    root                       46 Dec  1 01:07 /etc/issue.net

Adding p for a package not installed

    rpm -qlvp ftp://ftp.heanet.ie/mirrors/centos/6.5/os/x86_64/Packages/atk-1.30.0-1.el6.x86_64.rpm

List the configuration files

    rpm -qc centos-release

Owner of file

    rpm -qf /etc/yum.repos.d/CentOS-Base.repo
    centos-release-6-5.el6.centos.11.2.x86_64


