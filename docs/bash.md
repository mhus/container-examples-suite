---
sidebar_position: 4
title: Bash
---

# Bash Example Container

This example demonstrates how to create a simple container that runs a Bash script. By default the container will
print the current time and a message until the container is stopped.

## Environment variables:

- `SLEEP`: The duration to sleep in seconds between the output. (default: 10)
- `MESSAGE`: Additional message. (default: empty)

## Run with other commands

It's possible to overwrite the command and run other commands. For example, to run `ls -l`.

## Show Events

To show events in the log overwrite the command with

```bash
  CMD ["-c", "while true; do /usr/bin/kubectl get events --watch ${OPTIONS} ; sleep ${SLEEP:-10}; done"]
```

To run it in Kubernetes you should create service account with rights to read events:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  # "namespace" omitted since ClusterRoles are not namespaced
  name: events-cluster-role
rules:
  - apiGroups: ["","events.k8s.io"]
    resources: ["events"]
    verbs: ["*"]
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: events-service-account
  namespace: default
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: events-cluster-role-binding
roleRef:
    apiGroup: rbac.authorization.k8s.io
    kind: ClusterRole
    name: events-cluster-role
subjects:
    - kind: ServiceAccount
      name: events-service-account
      namespace: default
---
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: events
  name: events
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: events
  template:
    metadata:
      labels:
        app: events
    spec:
      serviceAccountName: events-service-account
      containers:
        - image: mhus/example-bash:latest
          imagePullPolicy: Always
          name: events
          command: ["-c", "while true; do /usr/bin/kubectl get events --watch -A ; done"]
```

## Installed packages:

- `bash coreutils procps util-linux findutils curl wget jq ngrep vim nano tcpdump bind-tools iproute2 iputils`
- `kubectl`

## Bash root image

There is also a root image available. To run the container as root use the image `mhus/example-bash-root:latest`.
In this image the user is `root`. Use this image with caution.

## Running with docker

```bash
# infinite loop
docker run -it --rm mhus/example-bash:latest 

# bash
docker run -it --rm mhus/example-bash:latest --

# bash and root user
docker run -it --rm --user root mhus/example-bash:latest --
```

## Running with kubernetes

```bash
# Run infinite loop
kubectl run bash --image=mhus/example-bash:latest --env="SLEEP=10" --restart=Never

# Connect to the container with bash
kubectl exec -it bash -- /bin/bash
```
