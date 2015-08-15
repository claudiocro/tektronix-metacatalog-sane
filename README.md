#Tektroniks Metacatalog SANE project
This is a `SANE` project for a web-app that allows to link tektroniks oscillators models to their appearances in the annual tektroniks catalogs.

This project is the container for a `Ember` client and a `Sails` server and it's used to speed up development. Release and deploy is managed by the projects themselves.

Server: https://github.com/claudiocro/tektronix-metacatalog-server
Client: https://github.com/claudiocro/tektronix-metacatalog-client

# Installation:
If you haven't read https://github.com/artificialio/sane or http://sanestack.com/ then go and do it. This project heavily depends on it.

You will need the following things properly installed on your computer.

* [Git](http://git-scm.com/)
* [Node.js](http://nodejs.org/) (with NPM)
* [Bower](http://bower.io/)
* [PhantomJS](http://phantomjs.org/)
* [Sails.js](http://sailsjs.org/)
* [Sane Stack](http://sanestack.com/)
* [Ember CLI](http://www.ember-cli.com/)

Install sane and sails if they are not already on your machine:
`npm install -g sails sane-cli`

Clone SANE repo:
 `git clone https://github.com/claudiocro/tektronix-metacatalog-sane.git`

Clone server repo:
`git clone https://github.com/claudiocro/tektronix-metacatalog-server.git server`

Clone client repo:
`git clone https://github.com/claudiocro/tektronix-metacatalog-client.git client`

Install bower and npm dependencies, run this commands from the `client` folder:
```
cd client
npm install
bower install
cd ..
```

## Server
The server can be configured to either run on your local machine without any need to install mongodb or any other sql/nosql database on your system or in a docker container.

###Server local
To start sane on your local machine:
```
cd server
npm install
cd ..
sane up
```

Visit app at: `http://localhost:4200/`
Server API is served at: `http://localhost:1337/api/v1/`

The server can be debugged with [node-debug](https://github.com/node-inspector/node-inspector):
```
cd server
node-debug app.js --save-live-edit
```

```
cd client
ember serve --proxy http://127.0.0.1:1337
```

Debug server at: `http://127.0.0.1:8080/debug?ws=127.0.0.1:8080&port=5858

###Server Docker
Make shure you have [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/) installed on your machine.

If the server is started with the `--docker` option it will launch three containers to simulate a production environment:

- `server` is where sails gets executed and the local `server` directory gets mounted into it.
- `mongodb` used to store the models 
- `redis` used to store sessions and [ember-build index-files](https://github.com/ember-cli/ember-cli-deploy)

It's important that the `server/node_modules` directory is empty before we start, so that docker will build the npm modules from scratch.

```
rm -r server/node_modules
sane up --docker
```

#Deploy a client locally to docker

...

