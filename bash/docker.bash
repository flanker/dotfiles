export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/zhichao/.docker/machine/machines/dev"
export DOCKER_MACHINE_NAME="dev"

rmallcontainers() {
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
}

dmenv() {
  eval "$(docker-machine env dev)"
}
