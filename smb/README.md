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
    

Sometimes on windows, security authentication protocol has not been specified, I suppose it depends on which version of windows, or which domain/group policies have been applied on your system, I think this fixed smb mounting problems for me, but I dont want to roll back the change because it took so long so get it working I do not want to change it!

http://lifeonubuntu.com/windows-7-cant-connect-to-default-administrative-share/

The Fix: Tweak the Local Security Policy

I finally found the answer. You need to properly set the Local Security Policy, which annoying comes with no default value set. Here’s how:
Windows 7 Can't Connect to Shared Network Drives.

By default, Windows 7 can't connect to network shares. Fix this with a Local Security Policy Change. (Click image to enlarge.)
    Click on the start button
    type secpol.msc to run the Local Security Policy manager
    In the left pane, navigate your way to Local Policies –> Security Options and click on Security Options.
    In the right pane, find “Network security: LAN Manager authentication level” and double-click it.
    In the drop down box, choose “Send LM & NTLM – use NTLMv2 session if negotiated”
    Click apply.

    BINGO! You should now be all set to connect to the default administrative share on your network drives.
