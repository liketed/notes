Check yaml file for syntax errors, a syntax error can really break puppet badly, especially errors like
Error 400 on SERVER: undefined method empty? 

Typical problem is whitespace related, like tab characters instead of spaces

    ruby -e "require 'yaml'; YAML.load_file('hostname.yaml')"


Run puppet master in verbose mode, without apache / passenger hiding logs, very good for debugging issues.
    
    puppet master --no-daemonize --debug


