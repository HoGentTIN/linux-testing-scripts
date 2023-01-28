#! /bin/bash
#

set -o nounset
set -o errexit

# If Podman is installed (Fedora), use that instead of Docker
if [ -x /usr/bin/podman ]; then
  echo "Detected Podman"
  container_cmd=/usr/bin/podman
  # Without this mount option, the container will not have access to the
  # shared volume /app
  mount_opts=":Z"
else
  echo "Using Docker"
  container_cmd=/usr/bin/docker
  mount_opts=
fi

# Show actual commands being run
set -x

# Build the container image
${container_cmd} build --tag bash-tester \
  --file "$(pwd)"/tests/Dockerfile "$(pwd)"

# Run the tests inside the container
${container_cmd} run --rm \
  --volume "$(pwd)":/app"${mount_opts}" bash-tester \
  /app/tests/run-tests.sh

set +x