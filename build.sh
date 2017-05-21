#!/bin/sh

. ./build_info.ini
echo "Building an image $DOCKER_REPO:$DOCKER_TAG..."

if [[ -z $DOCKER_REPO || -z $DOCKER_TAG ]]; then
  echo "you need to set \$DOCKER_REPO and \$DOCKER_TAG in build_info"
  echo "RC=1"
  exit 1
fi

if docker images $DOCKER_REPO | awk '{print $2}' | grep -q $DOCKER_TAG; then
  echo "Image $DOCKER_REPO:$DOCKER_TAG already exists."
  echo "Please specify a different tag in build_info."
  echo "RC=1"
  exit 1
fi

docker build -t $DOCKER_REPO:$DOCKER_TAG ./$REPO
re=$?

if [[ $rc -eq 0 ]]; then
  echo "Build suceded."
  echo ""
  echo "RC=0"
  exit 0
else
  echo "Build failed."
  exho ""
  echo "RC=1"
  exit 1
fi