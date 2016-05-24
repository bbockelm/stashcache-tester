#!/bin/sh -xe

# This script starts docker and systemd (if el7)

 # Run tests in Container
if [ "$OS_VERSION" = "6" ]; then

sudo docker run --rm=true -v `pwd`:/osg-pki-tools:rw ${OS_TYPE}:${OS_TYPE}${OS_VERSION} /bin/bash -c "bash -xe /osg-pki-tools/tests/test_inside_docker.sh ${OS_VERSION} ${CVMFS_EXTERNAL_URL}"

elif [ "$OS_VERSION" = "7" ]; then

docker run --privileged -d -ti -e "container=docker"  -v /sys/fs/cgroup:/sys/fs/cgroup -v `pwd`:/osg-pki-tools:rw  ${OS_TYPE}:${OS_TYPE}${OS_VERSION}   /usr/sbin/init
DOCKER_CONTAINER_ID=$(docker ps | grep ${OS_TYPE} | awk '{print $1}')
docker logs $DOCKER_CONTAINER_ID
docker exec -ti $DOCKER_CONTAINER_ID /bin/bash -xec "bash -xe /osg-pki-tools/tests/test_inside_docker.sh ${OS_VERSION} ${CVMFS_EXTERNAL_URL};
  echo -ne \"------\nEND OSG-PKI-TOOLS TESTS\n\";"
docker ps -a
docker stop $DOCKER_CONTAINER_ID
docker rm -v $DOCKER_CONTAINER_ID

fi
