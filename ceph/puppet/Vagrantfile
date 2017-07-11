# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'
if File.exist?('../servers.yaml')
  servers = YAML.load_file('../servers.yaml')
else if File.exist?('servers.yaml')
  servers = YAML.load_file('servers.yaml')
end

## You need these plugins installed!!
required_plugins = %w(vagrant-vbguest vagrant-hostmanager)
plugins_to_install = required_plugins.select { |plugin| not Vagrant.has_plugin? plugin }
if not plugins_to_install.empty?
  puts "Installing plugins: #{plugins_to_install.join(' ')}"
  if system "vagrant plugin install #{plugins_to_install.join(' ')}"
    exec "vagrant #{ARGV.join(' ')}"
  else
    abort "Installation of one or more plugins has failed. Aborting."
  end
end


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = false
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end
  config.vm.box = "CentOS-7.3-puppet-virtualbox"
  config.vm.box_url = 'http://images.kilduff.de/CentOS-7.3-puppet-virtualbox.box'
  config.ssh.insert_key = false


  servers.each do |server|
    config.vm.define server['name'] do |config|
      config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
        server['ipaddr']
      end
    config.vm.hostname = server['name']
    config.vm.network :public_network, ip: server['ipaddr'],    :netmask => '255.255.255.0', bridge: server['adapter']
    config.vm.provision "shell",
      inline: "sed -ri 's/127\.0\.0\.1\s.*/127.0.0.1 localhost localhost.localdomain/' /etc/hosts"
    config.vm.provision :puppet do |puppet|
      puppet.environment_path = "environments"
      puppet.environment = "vagrant"
      puppet.module_path = "environments/vagrant/modules/"
      puppet.options        = "--hiera_config=/vagrant/environments/vagrant/manifests/hiera.yaml"
      puppet.facter         = { "vagrant" => "1" }
    end
    if server['name'].include? 'osd'
#      puts "Attaching disk to " + server['name']
      if server['vmdk'].include? 'vmdk'
        config.vm.provider :virtualbox do |vb|
          vb.customize [ 'storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 1, '--type', 'hdd', '--medium', server['name'] + '.vmdk' ]
        end
      end # end if vmdk file
    end # end if server name
  end
end
end
end
#    osds.each do |opts|
##      puts "ARGV 0 " + ARGV[0]
##      disk_file =  File.realpath( "." ).to_s + "/#{opts[:name]}.vdi"
##          config.vm.provider :virtualbox do |vb|
##            puts "Creating 1GB disk #{disk_file}."
##            vb.customize [ 'createhd', '--filename', disk_file, '--format', 'VDI', '--size', 1000 * 1024 ]
##            puts "Attaching disk #{disk_file}."
##            vb.customize [ 'storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 1, '--type', 'hdd', '--medium', disk_file ]
##          end
