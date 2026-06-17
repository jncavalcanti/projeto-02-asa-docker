FROM nginx:latest

RUN apt-get update && \
    apt-get install -y iputils-ping curl && \
    rm -rf /var/lib/apt/lists/*

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

EXPOSE 8080
