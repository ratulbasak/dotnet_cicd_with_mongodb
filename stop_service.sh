#!/bin/bash

echo "Stopping and removing the running container"
set -eo pipefail

main() {
  local release_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
  local docker_compose_file="$release_dir/docker-compose.yml"

  echo $docker_compose_file
  sudo docker-compose -f $docker_compose_file stop -t 20
  sudo docker-compose -f $docker_compose_file rm -f
}

main "$@"
