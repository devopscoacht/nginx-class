# Use Alpine Linux as the base image
FROM alpine:latest

# Add metadata to the image
LABEL maintainer="coacht" <devopstrainingwitcoacht@gmail.com>
LABEL description="This example Dockerfile installs NGINX."

# Install NGINX and set up the environment
RUN apk add --update nginx && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /tmp/nginx/

# Copy configuration files from the host to the container
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/default.conf /etc/nginx/conf.d/default.conf

# Add and extract the HTML content to the web root
ADD files/html.tar.gz /usr/share/nginx/

# Expose port 80
EXPOSE 80/tcp

# Set NGINX as the entry point
ENTRYPOINT ["nginx"]

# Keep NGINX running in the foreground
CMD ["-g", "daemon off;"]
