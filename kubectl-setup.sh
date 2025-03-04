# RabbitMQ namespace and service

{
  kubectl create ns rabbits
} || {
  echo 'rabbits namespace is already defined'
}

kubectl apply -n rabbits -f rabbitmq/rabbit-rbac.yaml

kubectl apply -n rabbits -f rabbitmq/rabbit-secret.yaml

kubectl apply -n rabbits -f rabbitmq/rabbit-configmap.yaml

kubectl apply -n rabbits -f rabbitmq/rabbit-statefulset.yaml

kubectl rollout status -n rabbits statefulset.apps/rabbitmq

kubectl get -n rabbits pods

kubectl get -n rabbits svc

kubectl get -n rabbits pvc

# Skipper engine namespace

{
  kubectl create ns katana-skipper
} || {
  echo 'katana-skipper namespace is already defined'
}

# Skipper Logger

kubectl apply -n katana-skipper -f logger/logger-pod.yaml

kubectl rollout status -n katana-skipper deploy/skipper-logger

kubectl get -n katana-skipper pods

kubectl get -n katana-skipper svc skipper-logger

kubectl get -n katana-skipper deployments

# Skipper workflow

kubectl apply -n katana-skipper -f workflow/workflow-pod.yaml

kubectl rollout status -n katana-skipper deploy/skipper-workflow

kubectl get -n katana-skipper pods

kubectl get -n katana-skipper svc skipper-workflow

kubectl get -n katana-skipper deployments

# Skipper API

kubectl apply -n katana-skipper -f api/api-pod.yaml

kubectl rollout status -n katana-skipper deploy/skipper-api

kubectl get -n katana-skipper pods

kubectl get -n katana-skipper svc skipper-api

kubectl get -n katana-skipper deployments

# Skipper API Celery

kubectl apply -n katana-skipper -f api/api-celery-pod.yaml

kubectl rollout status -n katana-skipper deploy/skipper-api-celery

kubectl get -n katana-skipper pods

kubectl get -n katana-skipper deployments

# Skipper API Ingress

kubectl apply -n katana-skipper -f api/api-ingress.yaml
