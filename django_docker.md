## Ability to run Django app in Docker

For this project, you need to create a Dockerfile, a Python dependencies file, and a docker-compose.yml file. (You can use either a .yml or .yaml extension for this file.)


1. ### Create a new file called **Dockerfile** in your project directory.

    The Dockerfile defines an application’s image content via one or more build commands that configure that image. Once built, you can run the image in a container. For more information on Dockerfile, see the Docker user guide and the Dockerfile reference. 
      eg: mysite/dockerfile/Dockerfile


3. ### Add the following content to the (**Dockerfile** .)
 ```
FROM python:3.9-alpine3.15
WORKDIR /mysite
COPY ./dockerfiles/requirements.pip /requirements.pip
RUN apk update \
    && apk upgrade busybox zlib \
    && apk add libpq libpq-dev gcc musl-dev make expat-dev\
    && pip3 install -r /requirements.pip\
    && apk del gcc musl-dev make libpq-dev expat-dev\
    && rm -rf /var/cache/apk/*  /root/.cache/*
COPY /mysite /mysite

```
    This Dockerfile starts with a Python 3 parent image. The parent image is modified by adding a new code directory. The parent image is further modified by installing the Python requirements defined in the requirements.pip file.
4. ### Save and close the Dockerfile.
5. ### Create a dockerfiles/requirements.pip in your project directory.

    This file is used by the RUN pip install -r requirements.pip command in your Dockerfile.
6. ### Add the required software in the file.
 ```
Django>=3.0,<4.0
 psycopg2>=2.8
```
7. ### Save and close the requirements.pip file.
8. ### Create a file called docker-compose.yml in your project directory.
    The docker-compose.yml file describes the services that make your app. In this example those services are a web server and database. The compose file also describes which Docker images these services use, how they link together, any volumes they might need to be mounted inside the containers. Finally, the docker-compose.yml file describes which ports these services expose. See the docker-compose.yml reference for more information on how this file works.
9. ### Add the following configuration to the file.
   mysite/docker-compose.yaml
 ```
version: "3.3"
services:
  db:
     container_name: 'database-postgres'
     image: postgres:14-alpine
     volumes:
       - ./data/db:/var/lib/postgresql/data
     environment:
       - POSTGRES_DB=postgres
       - POSTGRES_USER=postgres
       - POSTGRES_PASSWORD=postgres
  web:
     container_name: 'mysite-web'
     build: .
     command: /bin/sh -c -- "while true; do sleep 300; done;"
     volumes:
       - .:/mysite
     ports:
       - "8000:8000"
     environment:
       - POSTGRES_NAME=postgres
       - POSTGRES_USER=postgres
       - POSTGRES_PASSWORD=postgres

   ```
    This file defines two services: The db service and the web service.
10. ### Save and close the docker-compose.yml file.

11. ### Run the docker-compose up command from the top level directory for your project. 
```
$ docker-compose up
```
[`Next`](excersise.md)