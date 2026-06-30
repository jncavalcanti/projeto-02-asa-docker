# Projeto 02 - ASA Docker

## Sobre o Projeto

Este projeto foi desenvolvido no contexto da disciplina de Administração de Sistemas e Ambientes (ASA) com o objetivo de demonstrar a implantação de um ambiente web completo utilizando infraestrutura virtualizada e containers. A solução combina Vagrant para criar uma máquina virtual Debian, Ansible para provisionamento automatizado e Docker para orquestrar os serviços de WordPress, banco de dados MySQL e um serviço de entrada baseado em Nginx.

O ambiente foi montado de forma a permitir a execução do projeto com poucos comandos, facilitando a reprodução e o entendimento da integração entre virtualização, automação e containers.

## Arquitetura Observada

- Vagrant cria uma máquina virtual Debian Bookworm com o nome `joao.jesse`, rede privada fixa no IP `192.168.56.149` e sincronização do diretório do projeto para `/vagrant`.
- O provisionamento com Ansible instala dependências do Docker, adiciona o repositório oficial do Docker, instala `docker-ce`, `docker-ce-cli`, `containerd.io` e `docker-compose-plugin`, inicia o serviço Docker e executa `docker compose up -d` a partir de `/opt/wordpress`.
- O arquivo `docker-compose.yml` define três serviços principais:
  - `webproxy`: imagem `jaocalheiros/nginx-custom:latest`, expõe a porta `8080:8080` e depende de `webserver`.
  - `webserver`: imagem `wordpress:latest`, recebe as variáveis de conexão com o banco e monta o volume `app` em `/var/www/html`.
  - `database`: imagem `mysql:latest`, armazena os dados em `my` e recebe as credenciais do banco.
- Os volumes nomeados `app` e `my` garantem persistência dos arquivos do WordPress e dos dados do MySQL.
- A rede `wordpress` isola a comunicação entre os containers da stack.
- O `Dockerfile` baseia-se em `nginx:latest`, instala ferramentas de diagnóstico como `curl` e `iputils-ping`, configura o Nginx para escutar na porta `8080` e encaminhar tráfego para `webserver:80`, e expõe a porta `8080`.

## Tecnologias Utilizadas

- Vagrant: criação e gerenciamento da máquina virtual.
- VirtualBox: provider utilizado pela máquina virtual.
- Ansible: automação do provisionamento da VM, incluindo a instalação do Docker.
- Docker: execução dos serviços em containers.
- Docker Compose: orquestração dos containers do projeto.
- WordPress: aplicação web principal.
- MySQL: banco de dados utilizado pelo WordPress.
- Nginx: serviço de entrada configurado para receber tráfego na porta `8080`.

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

### Verificando o funcionamento

Após a inicialização do ambiente, você pode validar rapidamente se tudo está funcionando corretamente com os comandos abaixo:

```bash
vagrant ssh
```

```bash
docker ps
```

```bash
curl -I http://192.168.56.149:8080
```

Esses comandos ajudam a confirmar que a máquina virtual está acessível, que os containers do WordPress, MySQL e Nginx estão ativos e que a porta `8080` está respondendo conforme a configuração do ambiente.

## Autores

- Jessé Alves
- João Calheiros