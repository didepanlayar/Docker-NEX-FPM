<div align="center">
    <img src="https://res.cloudinary.com/rexcuni/image/upload/v1688969225/favicon_oxddqi.png" width="80px">
    <br>
    <h1>Docker NEX-FPM</h1>
</div>
<p align="center">
    <a href="https://didepanlayar.com" target="_blank"><img alt="" src="https://img.shields.io/badge/Website-1DA1F2?style=normal&logo=dribbble&logoColor=white" style="vertical-align: center" /></a>
    <a href="https://instagram.com/didepanlayar" target="_blank"><img alt="" src="https://img.shields.io/badge/Instagram-DD2A7B?style=normal&logo=instagram&logoColor=white" style="vertical-align: center" /></a>
    <a href="https://www.youtube.com/@didepanlayar" target="_blank"><img alt="" src="https://img.shields.io/badge/YouTube-CD201F?style=normal&logo=youtube&logoColor=white" style="vertical-align: center" /></a>
</p>

## Description
Docker Environment for Development or Production using Nginx, PHP-FPM, NodeJS and Composer.

## Install Prerequisites
All requisites should be available for your distribution. The most important are:
1. [Git](https://git-scm.com/downloads)
2. [Docker](https://docs.docker.com/engine/installation)
3. [Docker Compose](https://docs.docker.com/compose/install)

## Overview
All images are used:
| Name                                            | Tag               |
| ----------------------------------------------- | ----------------- |
| [PHP](https://hub.docker.com/_/php)             | 7.4.33-fpm-alpine |
| [MariaDB](https://hub.docker.com/_/mariadb)     | 10.11.5           |

## Project Tree

```sh
├── Dockerfile
├── Makefile
├── README.md
├── config
│   ├── config.sh
│   └── supervisord.conf
├── data
├── docker-compose-production.yml
├── docker-compose.yml
├── logs
│   ├── clear-log.sh
│   ├── nginx
│   ├── read-log.sh
│   └── supervisor
│       └── supervisord.log
├── nginx
│   ├── sites
│   │   ├── default-production.conf.example
│   │   ├── default.conf
│   │   └── domain.com.conf.example
│   └── ssl
│       ├── certs
│       └── private
└── php-fpm
    └── php.ini
```

Place your Project outside this folder.

```sh
.
├── Docker
├── Project A
├── Project B
├── Project C
└── Etc
```

Then you can add or change the nginx configuration in `nginx/sites/default.conf` and add your local domain to `/etc/hosts`.

## Environment
To run this project you need to add following environment variables to your `.env` file.

```
# Application
COMPOSE_PROJECT_NAME=docker

# MariaDB
MARIADB_USER=default
MARIADB_PASSWORD=secret
MARIADB_ROOT_PASSWORD=root
```

## Run
This command is for running a service without a build image, such as pulling from Docker Hub for the [didepanlayar/nex-fpm](https://hub.docker.com/r/didepanlayar/nex-fpm) repository.

1. Copy and modify the `.env` file.

    ```sh
    cp .env.example .env
    ```

    Modify the `.env` file with the following [Environment](#environment) above.

2. Start services.

    ```sh
    docker-compose -f docker-compose-production.yml up -d
    ```

3. Stop services.

    ```sh
    docker-compose -f docker-compose-production.yml stop
    ```

4. Clear services.

    ```sh
    docker-compose -f docker-compose-production.yml down -v
    ```

## Build
Build image with `Dockerfile`.

1. Copy and modify the `.env` file.

    ```sh
    cp .env.example .env
    ```

    Modify the `.env` file with the following [Environment](#environment) above.

2. Build image.

    ```sh
    docker-compose build --no-cache --force-rm
    ```

3. Start services.

    ```sh
    docker-compose up -d
    ```

4. Create or clone your Project.

    Accessing the containers.

    ```sh
    docker exec -it nex-fpm /bin/sh
    ```

5. Stop and clear services.

    ```sh
    docker-compose down -v
    ```

Or, you can use a Makefile to run the service.

```sh
make help
```

## Tech Stack
- Git
- Docker
- Docker Compose
- Visual Studio Code
