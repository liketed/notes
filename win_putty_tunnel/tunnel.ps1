# Dell dracs have been such a pain through the years.
# The latest incarnation it seems is simplest to use on windows with ie 10.
# Of course dracs are never connect directly to the net you maintain them with.
# Tunnel through host and create a new adapter to connect to, launch IE
$target = Read-Host "server to tunnel to"
$login = Read-Host "username"
$tunnelhost= Read-Host "host to jump through"

$arg = "-ssh -2 -v -L 127.0.0.4:22:" + $target + ":22 -L 127.0.0.4:23:" + $target + ":23 -L 127.0.0.4:80:" + $target + ":80 -L 127.0.0.4:443:" + $target + ":443 -L 127.0.0.4:623:" + $target + ":623 -L 127.0.0.4:3668:" + $target + ":3668 -L 127.0.0.4:3669:" + $target + ":3669 -L 127.0.0.4:3770:" + $target + ":3770 -L 127.0.0.4:3771:" + $target + ":3771 -L 127.0.0.4:5900:" + $target + ":5900  -L 127.0.0.4:5901:" + $target + ":5901 -l " + $login + " " + $tunnelhost 

Start-Process -FilePath "c:\Program Files (x86)\PuTTY\plink.exe" -ArgumentList $arg -WindowStyle Normal

Start-Sleep -s 5
Start-Process -FilePath "iexplore.exe" -ArgumentList "https://127.0.0.4/"
