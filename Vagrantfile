Vagrant.configure("2") do |config|
  # Box e Provider definidos
  config.vm.box = "debian/bookworm64"
  
  # Nome do Host com os nomes da dupla
  config.vm.hostname = "joao.jesse"

  # Configuração de IP estático utilizando a regra solicitada
  config.vm.network "private_network", ip: "192.168.56.134"

  # Desativa a geração automática de chaves SSH
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    # Desabilita a verificação automática de Guest Additions
    vb.check_guest_additions = false
  end

  # Provisionamento automático via Ansible Playbook
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook_ansible.yml"
  end
end
