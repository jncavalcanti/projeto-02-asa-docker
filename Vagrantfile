# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "debian/bookworm64"

  config.ssh.insert_key = false

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  config.vm.synced_folder ".", "/vagrant"

  config.vm.hostname = "joao.jesse"

  config.vm.network "private_network",
    ip: "192.168.56.149"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.check_guest_additions = false
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook_ansible.yml"
  end

end
