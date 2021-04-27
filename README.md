# Helm Examples

An example ConfigMap was created in `templates/` directory.
It contains only a single static key-value pair, and can
safely be deployed to a k8s cluster via Helm.

```bash
helm install helm-demo-config-map ./mychart
helm ls

# Verify it was created in cluster
kubectl describe configmaps mychart-configmap

# To remove the chart
helm uninstall helm-demo-config-map
```