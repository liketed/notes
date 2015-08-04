# -*- mode: ruby -*-
# vi: set ft=ruby :

mons = [
    {
        :name => "mon1",
        :eth1 => "192.168.2.101",
    },
    {
        :name => "mon2",
        :eth1 => "192.168.2.102",
    },
    {
        :name => "mon3",
        :eth1 => "192.168.2.103",
    }
]
osds = [
    {
        :name => "osd1",
        :eth1 => "192.168.2.111",
    },
    {
        :name => "osd2",
        :eth1 => "192.168.2.112",
    },
    {
        :name => "osd3",
        :eth1 => "192.168.2.113",
    }
]

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end
  config.vm.box = "http://leob223.be.tng.ciao/vagrant/centos71.box"



  config.vm.define "admin", primary: true do |admin|
    admin.vm.hostname = "admin"
    admin.vm.network "private_network", bridge: 'eth1', ip: '192.168.2.100', :netmask => '255.255.255.0'

    admin.vm.provision :puppet do |puppet|
      puppet.manifests_path = "etc/manifests"
      puppet.module_path    = "etc/modules"
      puppet.manifest_file  = "test.pp"
      puppet.options        = "--debug --hiera_config=/vagrant/etc/manifests/hiera.yaml"
      puppet.facter         = { "vagrant" => "1" }
    end
  end

    mons.each do |opts|
      config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.network "private_network", bridge: 'eth1', ip: opts[:eth1], :netmask => '255.255.255.0'
      config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "etc/manifests"
        puppet.module_path    = "etc/modules"
        puppet.manifest_file  = "test.pp"
        puppet.options        = "--debug --hiera_config=/vagrant/etc/manifests/hiera.yaml"
        puppet.facter         = { "vagrant" => "1" }
      end
    end
  end
    osds.each do |opts|
#      puts "ARGV 0 " + ARGV[0]
#      disk_file =  File.realpath( "." ).to_s + "/#{opts[:name]}.vdi"
#          config.vm.provider :virtualbox do |vb|
#            puts "Creating 1GB disk #{disk_file}."
#            vb.customize [ 'createhd', '--filename', disk_file, '--format', 'VDI', '--size', 1000 * 1024 ]
#            puts "Attaching disk #{disk_file}."
#            vb.customize [ 'storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 1, '--type', 'hdd', '--medium', disk_file ]
#          end

      config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.network "private_network", bridge: 'eth1', ip: opts[:eth1], :netmask => '255.255.255.0'
      config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "etc/manifests"
        puppet.module_path    = "etc/modules"
        puppet.manifest_file  = "test.pp"
        puppet.options        = "--debug --hiera_config=/vagrant/etc/manifests/hiera.yaml"
        puppet.facter         = { "vagrant" => "1" }
      end
    end
  end
end
