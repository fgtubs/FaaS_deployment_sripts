# Prerequirements: install docker with script, log into dockerhub, with command 'docker login'

docker run --rm -it --name functions -v ${PWD}/data:/app/data -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 iron/functions
curl -LSs git.io/ironfn | sh
