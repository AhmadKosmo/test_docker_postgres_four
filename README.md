# README

In this project, we dockerized an existing rails application running with postgresql database.

First of all, we declared the dockerfile (dockerfile). This file is necessary to prepare the application environment.

Then, we created three docker-composer yml files:

-- docker-compose.yml:
In this composer we declared two containers (services): db & app, and we have been specified there volumes.

-- docker-compose-dev.yml & docker-compose-production.yml:
In this files, we added/modified the environments params necessary to lunch instances of the app container in a development and a production environment respectively.

* To create container in development environment:
 $ docker-compose -f docker-compose.yml -f docker-compose-dev.yml -p test_dev up --build

This container will run under the 3000 port; So to test the application, try to lunch it via: http://localhost:3000/posts

Note: test_dev is the project name; It is necessary to identify the project name;

* To create container in production environment:
 $ docker-compose -f docker-compose.yml -f docker-compose-production.yml -p test_prod up --build

 This container will run under the 4000 port; So to test the application, try to lunch it via: http://localhost:4000/posts

* Some usuful commands:
* To remove all containers with all volumes, run this:
$ docker rm $(docker ps -a -q) ; docker volume rm $(docker volume ls -q) ; sudo chown -R [your_user]:[your_user] tmp/ ;

-- To run n number of clients on the same container:
$ docker-compose up -d --scale [container_name]=[n]

-- To execut command on a container:
$ docker exec -it [container_name] [the_command]

For example, if we want to get a bash into the container called app_container:
$ docker exec -it app_container /bin/bash

* To clean the entire docker, that's mean to delete all images, containers, volumes, drivers... Try this:
$ docker container stop $(docker container ls -a -q) && docker system prune -a -f --volumes

* If you can not access to the log instructions, try this:
$ tail -f log/production.log
