#!/bin/bash
#create swarm cluster, change the --swarm-discovery to google or AWS
docker-machine create -d virtualbox local
eval "$(docker-machine env local)"
id=$(docker run swarm create)
docker-machine create -d virtualbox --swarm --swarm-master --swarm-discovery token://$id swarm-master
docker-machine create -d virtualbox --swarm   --swarm-discovery token://$id node1
docker-machine create -d virtualbox --swarm   --swarm-discovery token://$id node2
docker-machine create -d virtualbox --swarm   --swarm-discovery token://$id node3
docker-machine create -d virtualbox --swarm   --swarm-discovery token://$id node4
eval  $(docker-machine env --swarm swarm-master)
