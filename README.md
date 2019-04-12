# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* To remove all containers with all volumes, run this:
docker rm $(docker ps -a -q) ; docker volume rm $(docker volume ls -q) ; sudo chown -R [your_user]:[your_user] tmp/ ;

* To create container in development environment:
 docker-compose -f docker-compose.yml -f docker-compose-dev.yml -p test_dev up --build

This container will run under the 3000 port; So to test the application, try to lunch it via: http://localhost:3000/posts

Note: test_dev is the project name; It is necessary to identify the project name;

* To create container in production environment:
 docker-compose -f docker-compose.yml -f docker-compose-production.yml -p test_prod up --build

 This container will run under the 4000 port; So to test the application, try to lunch it via: http://localhost:4000/posts
