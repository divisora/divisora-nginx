FROM docker.io/library/nginx:latest

# Name/DNS/Alias for the core-manager container
ARG CORE_MANAGER_NAME="core-manager"
ARG CORE_MANAGER_PORT=5000

COPY default.conf /etc/nginx/conf.d/default.conf
RUN sed -i 's/CORE_MANAGER_NAME/'"${CORE_MANAGER_NAME}"'/g' /etc/nginx/conf.d/default.conf
RUN sed -i 's/CORE_MANAGER_PORT/'"${CORE_MANAGER_PORT}"'/g' /etc/nginx/conf.d/default.conf

COPY encode_url.js /etc/nginx/encode_url.js
RUN sed -i '1iload_module "modules/ngx_http_js_module.so";' /etc/nginx/nginx.conf
