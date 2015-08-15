FROM artificial/docker-sails:stable-pm2

MAINTAINER Claudio Romano <claudiocro@gmail.com>

RUN apt-get update && apt-get install -y \
	build-essential \
	python \
	git
