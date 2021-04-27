# Helm Examples

Helm is a package manager for K8s; you can define your
application or service in K8s yaml definition files and publish it to K8s cluster as one Helm entity
called a 'chart'. This simplifies deploying complex
workloads that may have precise configuration needs.
Condensing the configuration into a Helm chart makes it
easy for the end-user to download and install the workload
on their cluster.

---

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