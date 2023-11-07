#!/bin/bash

if [ -z "$1" ]; then
  echo "image tidak diisi. Masukkan nilai untuk parameter pertama."
  echo "cara pakai: $0 image tag"
  exit 1
fi

if [ -z "$2" ]; then
  echo "tag tidak diisi. Masukkan nilai untuk parameter kedua."
  echo "cara pakai: $0 image tag"
  exit 1
fi

image=$1
tag=$2

praisindo_repo="praisindo.azurecr.io/"
cimb_repo="asia-southeast2-docker.pkg.dev/wms-uat/dashboard-uat/"

docker pull $praisindo_repo$image:$tag &&
docker tag $praisindo_repo$image:$tag $praisindo_repo$image:latest &&
docker tag $praisindo_repo$image:$tag $cimb_repo$image:$tag &&
docker tag $praisindo_repo$image:$tag $cimb_repo$image:latest &&

docker push $cimb_repo$image:$tag &&
docker push $cimb_repo$image:$latest