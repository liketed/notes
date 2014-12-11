# Can never remember showduplicates for some reason

    $ yum --showduplicates list packagename

# List all packages in a repo

    $ yum --disablerepo="*" --enablerepo="atrpms" list available

# Search for installed rpms from a specific repo

    $ yumdb search from_repo atrpms
    ruby-augeas-0.5.0-0.9999.el6.x86_64
    from_repo = atrpms

