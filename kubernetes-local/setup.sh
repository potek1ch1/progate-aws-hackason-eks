#! /bin/sh

namespace="progate-aws-hackason"

# move to this directory
dir="$(dirname "$0")" || exit
echo "This is put on $dir"
cd "$dir" || exit

# create next-app service
kubectl apply -f ./app/pod-next-app.yaml -n $namespace
kubectl apply -f ./app/service-next-app.yaml -n $namespace

# create nginx service
kubectl apply -f nginx/pod-nginx.yaml -n $namespace
kubectl apply -f nginx/cm-nginx.yaml -n $namespace
kubectl apply -f ./nginx/service-nginx.yaml -n $namespace
kubectl port-forward svc/nginx-pod  8080:80 -n $namespace

