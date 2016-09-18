# -*- mode: ruby -*-
# vi: set ft=ruby :

mons = [
    {
        :name => "mon1",
        :eth1 => "192.168.10.101",
    },
    {
        :name => "mon2",
        :eth1 => "192.168.10.102",
    },
    {
        :name => "mon3",
        :eth1 => "192.168.10.103",
    }
]
osds = [
    {
        :name => "osd1",
        :eth1 => "192.168.10.111",
    },
    {
        :name => "osd2",
        :eth1 => "192.168.10.112",
    },
    {
        :name => "osd3",
        :eth1 => "192.168.10.113",
    }
]

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end
  config.vm.box = "CentOS-7"
  config.vm.box_url = 'http://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-1608_01.VirtualBox.box'
  config.ssh.insert_key = false
  config.puppet_install.puppet_version = :latest

  config.vm.define "admin", primary: true do |admin|
    admin.vm.hostname = "admin"
    admin.vm.network "private_network", bridge: 'en0', ip: '192.168.10.100', :netmask => '255.255.255.0'

    admin.vm.provision :puppet do |puppet|
      puppet.environment_path = "environments"
      puppet.environment = "vagrant"
      puppet.options        = "--debug --hiera_config=/vagrant/environments/vagrant/manifests/hiera.yaml"
      puppet.facter         = { "vagrant" => "1" }
    end
  end

    mons.each do |opts|
      config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.network "private_network", bridge: 'eth1', ip: opts[:eth1], :netmask => '255.255.255.0'
      config.vm.provision :puppet do |puppet|
        puppet.environment_path = "environments"
        puppet.environment = "vagrant"
        puppet.options        = "--debug --hiera_config=/vagrant/environments/vagrant/manifests/hiera.yaml"
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
        puppet.environment_path = "environments"
        puppet.environment = "vagrant"
        puppet.options        = "--debug --hiera_config=/vagrant/environments/vagrant/manifests/hiera.yaml"
        puppet.facter         = { "vagrant" => "1" }
      end
    end
  end
end
