# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Base config
  config.vm.box = "cedricblondeau/ubuntu-xenial64-docker"
  config.vm.hostname = "docker-letsencrypt-webroot-devbox"
  config.vm.network "private_network", ip: "192.168.33.10"

  # Virtual box config
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "512"
    vb.cpus = 1
    vb.customize ["modifyvm", :id, "--name", "docker-letsencrypt-webroot-devbox"]
  end

  # NFS share
  config.vm.synced_folder ".", "/vagrant"

  # Provisioning
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.verbose = "vvvv"
  end
end
