# Usa a imagem oficial do Nginx como base.
FROM nginx:latest

# Instala ferramentas de rede para diagnóstico e validação da conectividade entre os containers.
RUN apt-get update && \
    apt-get install -y iputils-ping curl && \
    rm -rf /var/lib/apt/lists/*

# Configura o Nginx para ouvir na porta 8080 e encaminhar o tráfego para o serviço interno da aplicação na porta 80.
RUN printf 'worker_processes auto;\n\
events {}\n\
stream {\n\
    upstream wordpress_backend {\n\
        server webserver:80;\n\
    }\n\
    server {\n\
        listen 8080;\n\
        proxy_pass wordpress_backend;\n\
    }\n\
}\n' > /etc/nginx/nginx.conf

# Expõe a porta 8080 para que o host consiga acessar o serviço externamente.
EXPOSE 8080
