## Get a list of packages installed

    rpm -qa
    rpm -qa | grep release


## Verify if package is installed

    rpm -q yum; echo $?
    rpm -q xorg-x11; echo $?
    package xorg-x11 os not installed
    1
   
