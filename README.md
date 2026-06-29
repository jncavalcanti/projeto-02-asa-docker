# Projeto 02 - ASA Docker

## Sobre o Projeto

Este projeto foi desenvolvido no contexto da disciplina de Administração de Sistemas e Ambientes (ASA) com o objetivo de demonstrar a implantação de um ambiente web completo utilizando infraestrutura virtualizada e containers. A solução combina Vagrant para criar uma máquina virtual Debian, Ansible para provisionamento automatizado e Docker para orquestrar os serviços de WordPress, banco de dados MySQL e um proxy Nginx.

O ambiente foi montado de forma a permitir a execução do projeto com poucos comandos, facilitando a reprodução e o entendimento da integração entre virtualização e containers.

## Tecnologias Utilizadas

- Vagrant: criação e gerenciamento da máquina virtual.
- VirtualBox: provider utilizado pela máquina virtual.
- Ansible: automação do provisionamento da VM, incluindo a instalação do Docker.
- Docker: execução dos serviços em containers.
- Docker Compose: orquestração dos containers do projeto.
- WordPress: aplicação web principal.
- MySQL: banco de dados utilizado pelo WordPress.
- Nginx: servidor proxy customizado para encaminhar o tráfego para o WordPress.

## Passo a Passo / Como Executar

Antes de iniciar, certifique-se de que as ferramentas abaixo estejam instaladas no host:

- VirtualBox
- Vagrant
- Ansible

A partir da pasta do repositório, execute os comandos abaixo:

```bash
cd c:\Projetos_faculdade\ASA\projeto-02-asa-docker
vagrant up
```

O comando `vagrant up` cria a máquina virtual, aplica o provisionamento com Ansible e inicia automaticamente os containers do ambiente via Docker Compose.

Após a conclusão do processo, o projeto pode ser acessado no navegador em:

```text
http://192.168.56.149:8080
```

Se desejar entrar na máquina virtual para inspecionar os containers, utilize:

```bash
vagrant ssh
```

Para encerrar a máquina virtual, utilize:

```bash
vagrant halt
```

Se quiser remover completamente a máquina virtual e os recursos criados, execute:

```bash
vagrant destroy -f
```

## Autores

- Jessé Alves
- João Calheiros