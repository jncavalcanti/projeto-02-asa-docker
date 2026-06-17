# Usa a imagem oficial do Nginx como base
FROM nginx:latest

# Instala os pacotes ping (iputils-ping) e curl de forma silenciosa
RUN apt-get update && apt-get install -y \
    iputils-ping \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copia a configuração customizada do Nginx para o container
COPY nginx.conf /etc/nginx/nginx.conf
