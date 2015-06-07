# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "yoheiW/centos66_min-ja"

  config.vm.define "kibana01" do |server|
    server.vm.network "private_network", ip: "192.168.33.10"
    server.vm.hostname = "kibana01.local"
    server.vm.provision "shell", path: "setup_ansible.sh"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end
end
