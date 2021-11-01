Container with the [Sealed
Secrets](https://github.com/bitnami-labs/sealed-secrets) CLI `kubeseal` with a
Python wrapper that allows multiple secrets to be encrypted (see sealed-secredts
[issue 114](https://github.com/bitnami-labs/sealed-secrets/issues/114)).

Only YAML formatted secrets are supported.

Usage example:

```console
kubectl create secret -n default generic some-secret --from-literal=foo=bar --dry-run=client -o yaml \
    | docker run --rm -i --user $(id -u):$(id -g) -v $(pwd):/work michaelvl/kubeseal --cert sealed-secrets-public-key.crt
```
