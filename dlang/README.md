# Konnex Engine OpenFaaS Function Template for the D Programming Language (dlang)

#### NOTE: This is not a full language template with project generator, but a working build, push and deploy template for dlang functions based on the dockerfile language template.

This template contains a basic Hello World function that builds to a statically linked binary executable.

The resulting binary is containerized in a Docker FROM scratch image.

Works with `faas-cli up`, `faas-cli build`, `faas-cli push`, `faas-cli deploy`, as you would expect.

## Usage

Modily the app.d file as required then either:

- Deploy on local OpenFaaS Cluster ([faasd](https://github.com/openfaas/faasd) or full OpenFaas on localhost Kubernetes):

    `faas-cli up -f ./stack.yml`

- Deploy on [production OpenFaaS](https://docs.openfaas.com/deployment/kubernetes/) cluster:

    `faas-cli up -f ./stack.yml --gateway=https://openfaas.example.com`