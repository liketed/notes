Postgresql is great, but I hate the user management so much that I prefer to use mysql for small things.
I found it hard to find this way to getting bacula to connect to mysql so lets make a note.

Switch bacula db driver to connect to mysql:

    su -c 'alternatives --config libbaccats.so'
    There are 3 programs which provide 'libbaccats.so'.

      Selection    Command
    -----------------------------------------------
       1           /usr/lib64/libbaccats-mysql.so
       2           /usr/lib64/libbaccats-sqlite3.so
    *+ 3           /usr/lib64/libbaccats-postgresql.so

    Enter to keep the current selection[+], or type selection number:


How to get Bacula to use a fixed amount of harddisks as volumes, overwrite eldest volume first when all are full, and how to not create new volumes automatically.
In this scenario we have an operating system disk, with /data/backupstorage as the default location for backups, how-ever it is not useable for storage because of the small size of the OS disk. 
We also have multiple disks on the system which are not raided in any way, but we treat them as tape drives. If one disk fails, we have others to continue with. 
We mount these disks, and create volumes in bacula console on the default /data/backupstorage, and then move the volumes away to the new storage disks, and symlink the volumes back.

Create volumes in bconsole

     for i in {6..9}; do echo label storage=BackupStor3 Device=FileStorage drive=0 slot=0 Pool=pool1 volume=Vol00${i} ;done
     label storage=BackupStor3 Device=FileStorage drive=0 slot=0 Pool=pool1 volume=Vol006
     label storage=BackupStor3 Device=FileStorage drive=0 slot=0 Pool=pool1 volume=Vol007
     label storage=BackupStor3 Device=FileStorage drive=0 slot=0 Pool=pool1 volume=Vol008
     label storage=BackupStor3 Device=FileStorage drive=0 slot=0 Pool=pool1 volume=Vol009

Move volumes to separate partitions, now the volumes are all on separate paritions, but linked to the original directory.

     for i in {6..9}; do mv /data/backupstorage/Vol00${i} /data${i}/backupstorage/; ln -s /data${i}/backupstorage/Vol00${i} /data/backupstorage/Vol00${i}; done

Disable auto creation of new volumes, and enable overwriting of oldest working volume.
Firstly: Disable autolabel, WE DO NOT WANT AUTOLABEL. it allows bacula to auto create volumes, and as these volumes will be automatically created in the default directory, and  obviously they are useless. From the docs:

"The second change that is necessary to make automatic labeling work is to give the Storage daemon permission to automatically label Volumes. Do so by adding LabelMedia = yes to the Device resource as follows"
"In the case of the Pool resource, you must provide Bacula with a label format that it will use to create new names."   Also remove this labelformat parameter.

Secondly: Auto write over volumes when none are free. We are currently not abiding by a strict backup policy of 6 months retention and so on, we dont have the hardware, or the human resources to do so. So when all volumes are full ( which is intended to be every day ), write over the oldest one. From the docs:

"Purge the oldest Volume if PurgeOldestVolume=yes (the Volume with the oldest LastWritten date and VolStatus equal to Full, Recycle, Purged, Used, or Append is chosen). We strongly recommend against the use of PurgeOldestVolume as it can quite easily lead to loss of current backup data."


One liners. You know... for lack of interaction with the console.
Typically bacula will show you what options you can add to a command if you "tabtab"

    delete "tabtab"
    jobid=   pool=    volume=  

What comes after the "tabtab" are your available options, which can be used like this:

    delete yes volume=test0001

    label storage=BackupStor Device=FileStorage drive=0 slot=0 Pool=Pool1 volume=Vol005

    delete jobid=112
    for i in {113..120}; do echo delete yes jobid=$i ;done | bconsole

    update volume=Vol002 MaxVolBytes=140000000

    update volume=Vol002 VolStatus=Append


For when oneliners do not work.. use sql

   postgres=# select mediaid from media where mediatype='Volume3' and volstatus='Error';
   -bash-3.2$ psql bacula -t -c "select mediaid from media where mediatype='Volume3' and volstatus='Error';"


Unfortunately I cannot access postgres from root account, and also cannot access bacula from postgres account, so we need some quote escaping

    su - postgres -c "psql bacula -t -c \"select volumename from media where mediatype='Volume2' and volstatus='Error';\"" | awk {'print "delete yes volume="$1'} | /usr/sbin/bconsole 

