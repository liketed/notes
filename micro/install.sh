rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum update -y 
yum install -y puppet rubygem-puppet-lint
yum install -y git vim 
cd /opt/
git clone git@github.com:liketed/notes.git
puppet apply --debug --modulepath=/opt/notes/puppet/etc/modules/ --hiera_config=/opt/notes/puppet/etc/manifests/hiera.yaml /opt/notes/puppet/etc/manifests/run.pp
