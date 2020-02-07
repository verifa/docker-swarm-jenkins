# Docker Swarm

## Setup Docker Swarm and Secrets

```bash
# create the swarm cluster
docker swarm init

# sensitive passwords should not be stored here...
printf "example-password" | docker secret create example-password-v1 -
```

## SSH Keys

These keys are needed for the Jenkins master to communicate with the local server and make it a slave/agent.
The communication is handled using SSH keys.

1. Create keys on the agent
2. Setup private key as credentials in Jenkins using docker secret
3. Add public key to /home/jenkins/.ssh/authorized_keys on the VM as Jenkins master will try to connect as user jenkins

## Deploying & Upgrades

First time deployment, simply run

```bash
# this will build the docker image and deploy the stack
make
# check that services were created
docker service ls
# check running containers
docker ps
# check logs for service
docker service logs <service_name>
# check logs for container (nice because no history from previous containers in same service)
docker logs <container_id>
# if the service fails to start (docker servive ls shows 0/1)
docker service ps --no-trunc <service_name>
```

For upgrades, sometimes Docker swarm is not the most clever and it is good to 
'turn it off and on again'... What this means is simply remove the services

```bash
# use to be completely sure, removes the docker swarm services
make remove
# sleep a bit, takes a while to shutdown
# then start the services again
make
```
