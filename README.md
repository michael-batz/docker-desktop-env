# Docker Desktop Environment

Just a small project to play around with having a KDE desktop environment in a Docker container.

Build the image:
```
docker-compose build
```

Start the image:
```
docker-compose up -d
```

If you want to use the image from Docker Hub, use the following docker-compose.yml
```
version: "2.1"

services:
    desktop:
        image: michaelbatz/desktop-env
        ports:
        - "3389:3389"
        environment:
            ROOT_PASSWORD: "root"
            USER_USERNAME: "desktop"
            USER_PASSWORD: "dektop"
        volumes:
        - home:/home

volumes:
    home:
```


A xrdp server will be started. You can connect to the RDP port (3389) and login with root/root or desktop/desktop.

