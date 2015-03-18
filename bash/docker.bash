export DOCKER_CERT_PATH=/Users/zhichao/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

rmallcontainers() {
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
}
