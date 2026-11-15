# cleanup.ps1 - Delete deployed Kubernetes resources
Write-Host "=== Deleting Service ===" -ForegroundColor Yellow
kubectl delete service nginx-service --ignore-not-found

Write-Host "=== Deleting Deployment ===" -ForegroundColor Yellow
kubectl delete deployment resource-demo --ignore-not-found

Write-Host "=== Verifying Cleanup ===" -ForegroundColor Green
kubectl get pods
kubectl get services
