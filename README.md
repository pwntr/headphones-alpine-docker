# headphones-alpine
A simple and super lightweight headphones docker container, based on the latest Alpine Linux base image 🐧🐋💻.

Always shipped with the latest stable headphones version! Providing a path to your own config is optional.

Quick start:
```shell
docker run -d -p 8181:8181 -v /path/to/downloads:/downloads -v /path/to/music:/music --name headphones pwntr/headphones-alpine
```

With your own config (make sure to adjust the paths and your logging preferences inside your config file):
```shell
docker run -d -p 8181:8181 -v /path/to/config:/config -v /path/to/downloads:/downloads -v /path/to/music:/music --name headphones pwntr/headphones-alpine
```

To have the container start when the host boots, add docker's restart policy:
```shell
docker run -d --restart=always -p 8181:8181 -v /path/to/config:/config -v /path/to/downloads:/downloads -v /path/to/music:/music --name headphones pwntr/headphones-alpine
```
