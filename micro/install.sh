rpm -q puppetlabs-release-pc1 || yum install -y https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
rpm -q ius-release            || yum install -y https://centos7.iuscommunity.org/ius-release.rpm
yum update -y 
rpm -q puppet-agent           || yum install -y puppet
rpm -q rubygem-puppet-lint    || yum install -y rubygem-puppet-lint
rpm -q git2u                  || yum install -y git2u
rpm -q vim                    || yum install -y vim
/opt/puppetlabs/bin/puppet module install rtyler-jenkins --version 1.7.0
/opt/puppetlabs/bin/puppet module install puppetlabs-vcsrepo --version 1.5.0
cd /opt/
git clone https://github.com/liketed/notes.git
/opt/puppetlabs/bin/puppet apply --debug --modulepath=/opt/notes/puppet/etc/modules/ --hiera_config=/opt/notes/puppet/etc/manifests/hiera.yaml /opt/notes/puppet/etc/manifests/workstation.pp
