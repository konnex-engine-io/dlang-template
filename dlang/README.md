# Konnex Engine
### OpenFaaS Language Template for the D Programming Language (dlang)

##### NOTE: This is a full language template with project generator. It includes a working build, push and deploy template for dlang functions initally based on the dockerfile language template.

This template contains a basic Hello World function that builds to a statically linked binary executable.

The resulting binary is containerized in a Docker FROM scratch image.

Works with the `faas-cli` command line tool as you would expect.

## Usage

### Existing OpenFaaS Deployment
Add or modify the templates configuration section in your /stack.yml file to include the dlang language template.

For example:
```yaml
configuration:
  templates:
    - name: dlang
      source: https://github.com/konnex-engine-io/dlang-template.git
    - name: node12
    - name: python3
    - name: go
```
From the root folder of your FaaS project (the folder where stack.yml is located), run:
```console
faas-cli new
```

Modify the app.d file as required then either:

- Deploy on local OpenFaaS Cluster ([faasd](https://github.com/openfaas/faasd) or full OpenFaas on localhost Kubernetes):

    ```console 
    faas-cli up -f ./stack.yml
    ```

- Deploy on [production OpenFaaS](https://docs.openfaas.com/deployment/kubernetes/) cluster:

    ```console
    faas-cli up -f ./stack.yml --gateway=https://openfaas.yourdomain.com
    ```