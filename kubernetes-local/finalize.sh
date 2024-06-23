#! /bin/sh

namespace="progate-aws-hackason"

# move to this directory
dir="$(dirname "$0")" || exit
echo "This is put on $dir"
cd "$dir" || exit

kubectl delete -f ./app/pod-next-app.yaml -n $namespace
kubectl delete -f ./app/service-next-app.yaml -n $namespace

# create nginx service
kubectl delete -f ./nginx/pod-nginx.yaml -n $namespace
kubectl delete -f ./nginx/cm-nginx.yaml -n $namespace
kubectl delete -f ./nginx/service-nginx.yaml -n $namespace
