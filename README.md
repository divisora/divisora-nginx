## Divisora: Private, Automatic and Dynamic portal to other security zones
### Description
Verifies and redirects traffic to the correct end-point. Each authenticated user gets redirected to their own noVNC / VNC instance.

### Build / Run
```
podman build -t divisora/nginx .
podman network create --subnet 192.168.66.0/24 --gateway 192.168.66.1 divisora_front
podman run --name divisora_nginx --network divisora_front -d -p 80:80 -p 443:443 divisora/nginx:latest
```