Useful commands for troubleshooting samba..

osx, view available shares:

    smbutil view -g //user@192.168.x.x

mount the share it:

    mount_smbfs //user:pass@192.168.x.x/data /Volumes/data

linux list shares:

    smbclient -L 127.0.0.1
    smbclient -L 192.168.1.1

list active connections:
    
    smbstatus --shares -L 127.0.0.1 -Uusername


Problems mounting samba on osx? The error when mounting may look like this in the logs:

    tail /var/log/system.log
    my-MacBook-Air.local mount_smbfs[508]: checkForDfsReferral: mounting dfs url failed, syserr = Input/output error
    my-MacBook-Air.local mount_smbfs[508]: smb_mount: mount failed to 192.168.2.100/data3, syserr = Input/output error
    my-MacBook-Air kernel[0]: smb_ntstatus_error_to_errno: Couldn't map ntstatus (0xc0000225) to errno returning EIO

A lot of threads on the internet I read wrote about changning X Y and Z config on osx, but none of that stuff worked, or was needed. After following a few tutorials I ended up with a pretty default looking smb.conf, but that is where the problem lies. My broken smb.conf on centos looks like this:

    [root@micro ~]# cat /etc/samba/smb.conf
    #======================= Global Settings =====================================
    [global]
    workgroup = WORKGROUP
    security = share
    map to guest = Never
    
My working smb.conf, I changed "security = share" to "security = user"

    [root@micro ~]# cat /etc/samba/smb.conf
    #======================= Global Settings =====================================
    [global]
    workgroup = WORKGROUP
    security = user
    map to guest = Never
    
