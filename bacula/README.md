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



One liners. You know... for lack of interaction with the console, I wish I could figure out more..

    delete yes volume=test0001

    label storage=BackupStor Device=FileStorage drive=0 slot=0 Pool=Pool1 volume=Vol005
