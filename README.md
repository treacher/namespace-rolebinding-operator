# Namespace Rolebinding Operator

This repository contains an example of a Kubernetes operator that
listens for changes on namespaces and creates a rolebinding with
cluster edit access within that namespace. This example would be
useful for when using OIDC in a Kubernetes cluster.

For example: You might have a group in your AD with the name:
`ad-kubernetes-kube-system` when the `kube-system` namespace is created,
this operator would create the required RoleBinding so that when a user
with the group `ad-kubernetes-kube-system` logs in via OIDC they'll have
access to edit things in the `kube-system` namespace

## Usage
`--run-outside-cluster # Uses ~/.kube/config rather than in cluster configuration`

## Development

### Build from source
1. `make install_deps`
2. `make build`
3. `./bin/namespace-rolebinding-operator --run-outside-cluster 1`
