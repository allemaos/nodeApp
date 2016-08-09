# NodeApp: Dockerize Node.js Development

The following steps is more educational step by step setup of a node.js project from scratch using docker, docker-machine and docker-compose. I am using mac. So You should have no prob fork of make your own 

##Step 1: 
You need to run docker demon on mac.

```
./prebuild.sh
```

##Step 2: 
You will to execute mutliple times (#6) till buildstep file content is number 6. 

```
./build.sh
```

##Step3:
Run one of following:

`./run.sh`, `./run.dev.sh` or `./run.prod.sh`

And test your app using curl:
```
curl http://$(docker-machine ip dev):3000 
```
or
```
curl -Is http://$DOCKER_IP:3000 | head -n 1
```

###Notes: 
* Number 6 is the end of the setup of this devApp using node.hs (for the time being). 
* There is `rebuild.sh` file to rebuild the hole setup all over again. You can use the following command to log to log.txt file and copiy the input to standard output as well:

```
./rebuild.sh | tee -a "log_file"
```

- To clean your nodeApp and , you should run the following command to clean your machine:

```
./clean.sh
```
* When you finished with nodeApp, you should run the following command to clean your machine:

```
./clean.all.sh
```

* Happy coding.

###ToDo:
0. Mention my references links and the ppl who helped me to make this repo.
1. Confirm the full clean up of all new files for testers and Docker newbie's. 
2. Write a single file `build-all.sh` besides rebuild.sh and write donw notes about the build-all setup. 
3. Create a new repo or extend this one using Vagrant for a multiOS approach besides MacOS.

###References:
ref’s: 
mandatories:
0. [Creating the default localVM](https://docs.docker.com/machine/get-started/)
1. [Build and run an app with Compose on your localVM](https://docs.docker.com/compose/gettingstarted/)
2. [Docker installation on Mac](https://docs.docker.com/engine/installation/mac/)
3. [ngpestelos/remove-docker-containers] (https://gist.github.com/ngpestelos/4fc2e31e19f86b9cf10b)
