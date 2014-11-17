vagrant up centos65
sleep 1
vagrant ssh centos65 -c 'sudo yum update -y'
#vagrant ssh centos65 -c 'sudo reboot'
#sleep 60
#vagrant ssh centos65 -c 'sudo wget http://download.virtualbox.org/virtualbox/4.3.18/VBoxGuestAdditions_4.3.18.iso'
#vagrant ssh centos65 -c 'sudo mount -o loop VBoxGuestAdditions_4.3.18.iso /media/'
#vagrant ssh centos65 -c 'sudo /media/VBoxLinuxAdditions.run'
#vagrant ssh centos65 -c 'sudo hostname'
vagrant ssh centos65 -c 'sudo hostname'


vmid=`/usr/bin/VBoxManage list vms |grep centos65 |awk -F\" {'print $2'}`
echo $vmid

vagrant package --base $vmid
vagrant box remove centos65_uptd --force
vagrant box add centos65_uptd /Users/sk/Vagrant/centos-rails/package.box
rm /Users/sk/Vagrant/centos-rails/package.box # Cleanup disk space
