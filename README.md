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

## Templating

## Reading values dynamically

To read in values into your k8s definition template, 

- define the key-value pair in the `values.yml` file
- use the key-value pair in your k8s definition file

To test out the chart before going live, you can run it with dry-run
flag:

```shell
helm install --debug --dry-run firstrun ./mychart

# Now release!
helm install releasedemo ./mychart

# See the manifest for the release - should contain the resolved values
helm get manifest releasedemo
```

## Runtime values resolution

There may be times when you have defined some values in your `values.yml`
file, but at runtime, you may want to override the defaults that you have set.

To do so, you can do this at install time:

```shell
helm install --dry-run --debug --set state=CA releasedemo ./mychart
```

### Built-in Objects

You can use built-in objects when using templating
in descriptor yaml files. Built-in objects are 
variables that are part of Helm that are accessible
to the yaml file without the need to create it.

e.g. `{{ .Release.Name }}` is a built-in object with variable Name

https://helm.sh/docs/chart_template_guide/builtin_objects/

```bash
helm install releasedemo ./mychart

# See the manifest for the release - should contain the resolved built-in
helm get manifest releasedemo
```