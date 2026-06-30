# -*- mode: ruby -*-
# vi: set ft=ruby :

# Configura a máquina virtual com o box Debian e os parâmetros básicos do ambiente.
Vagrant.configure("2") do |config|

  # Define a imagem base da VM usada para o provisionamento.
  config.vm.box = "debian/bookworm64"

  # Mantém a chave SSH padrão do Vagrant sem sobrescrever a configuração do ambiente.
  config.ssh.insert_key = false

  # Evita atualizações automáticas do guest additions quando o plugin estiver instalado.
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  # Sincroniza o diretório do projeto dentro da VM para facilitar o desenvolvimento.
  config.vm.synced_folder ".", "/vagrant"

  # Define o nome da máquina para identificação no ambiente local.
  config.vm.hostname = "joao.jesse"

  # Cria uma rede privada com IP fixo para comunicação local entre a VM e o host.
  config.vm.network "private_network",
    ip: "192.168.56.149"

  # Ajusta os recursos do VirtualBox para a VM de desenvolvimento.
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.check_guest_additions = false
  end

  # Executa o playbook do Ansible para instalar Docker e subir a aplicação.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook_ansible.yml"
  end

end
