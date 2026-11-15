# deploy.ps1 - Automate deployment of resource-demo and service
Write-Host "=== Applying Deployment (6 Replicas) ===" -ForegroundColor Cyan
kubectl apply -f ../manifests/deployment.yaml

Write-Host "=== Waiting for Deployment Rollout ===" -ForegroundColor Cyan
kubectl rollout status deployment/resource-demo --timeout=180s

Write-Host "=== Pod Distribution Across Nodes ===" -ForegroundColor Cyan
kubectl get pods -o wide

Write-Host "=== Applying NodePort Service ===" -ForegroundColor Cyan
kubectl apply -f ../manifests/service.yaml

Write-Host "=== Verifying Service and Endpoints ===" -ForegroundColor Cyan
kubectl get services
kubectl get endpoints nginx-service
kubectl get endpointslices -l kubernetes.io/service-name=nginx-service
