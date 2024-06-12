---
sidebar_position: 8
title: Kubernetes Events
---

# Kubernetes Events Example Container

This example prints kubernetes events into the log output.

## Environment variables:

- `SLEEP`: The duration to sleep in seconds between the output. (default: 10)
- `OPTIONS`: Additional options for the events command, e.g. `-A`

## Running with kubernetes

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
        - image: mhus/example-events:latest
          imagePullPolicy: Always
          name: events
          env:
            - name: SLEEP
              value: 0
            - name: OPTIONS
              value: '-A'
```

Run with access rights to listen to all events.
