sudo yum update -y ca-certificates
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
sudo yum install -y ansible
cat << EOT >> /home/vagrant/.ansible.cfg
[defaults]
host_key_checking = False
EOT
sudo chown vagrant:vagrant /home/vagrant/.ansible.cfg
cp -r /vagrant/playbook-kibana .
cd playbook-kibana
echo 'Running Ansible for kibana'
sudo -uvagrant ansible-playbook -i hosts_list -c paramiko site.yml 
