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


Create volumes in bconsole
     for i in {6..9}; do echo label storage=BackupStor3 Device=FileStorage drive=0 slot=0 Pool=leo236-4 volume=Vol00${i} ;done
     label storage=BackupStor3 Device=FileStorage drive=0 slot=0 Pool=leo236-4 volume=Vol006
     label storage=BackupStor3 Device=FileStorage drive=0 slot=0 Pool=leo236-4 volume=Vol007
     label storage=BackupStor3 Device=FileStorage drive=0 slot=0 Pool=leo236-4 volume=Vol008
     label storage=BackupStor3 Device=FileStorage drive=0 slot=0 Pool=leo236-4 volume=Vol009

Move storages to separate partitions, now the volumes are all on separate paritions.

     for i in {5..9}; do mv /data/backupstorage/Vol00${i} /data${i}/backupstorage/; ln -s /data${i}/backupstorage/Vol00${i} /data/backupstorage/Vol00${i}; done


One liners. You know... for lack of interaction with the console.

    delete yes volume=test0001

    label storage=BackupStor Device=FileStorage drive=0 slot=0 Pool=Pool1 volume=Vol005

    delete jobid=14

    update volume=Vol002 MaxVolBytes=140000000

    update volume=Vol002 VolStatus=Append

