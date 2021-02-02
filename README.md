# The Konnex Engine Framework
### OpenFaaS Language Template for the D Programming Language (DLang)

###### NOTE: This is a full language template with project generator. It includes a working build, push and deploy template for dlang functions initally based on the official Dockerfile language template.

This template contains a basic Hello World function that builds to a statically linked binary executable from inside an Aline 3.13 Docker container.

The resulting binary is containerized in a Docker FROM scratch image for deployment to OpenFaaS.

Works with the `faas-cli` command line tool as you would expect.

## Usage

### Existing OpenFaaS Deployment
Add or modify the templates configuration section in your `/stack.yml` file to include the dlang language template.

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
From the root folder of your FaaS project (the folder where `stack.yml` is located), pull the template with the command:
```console
faas-cli template pull stack --overwrite
```
This will pull the new template along with any templates available in the official OpenFaaS Template Store. The `--overwrite` flag ensures that any existing templates are overwritten with the newly downloaded templates.

Then, create a new function from the newly downloaded DLang template and append it to the function stack with the command:
```console
faas-cli new myfunc --lang dlang --append ./stack.yml
```
This creates a new folder named `myfunc` and generates a basic hello world function project inside of that folder. The folder structure is as follows:
```
myfunc
  |- source
  |     |- function
  |     |     |-hello.d
  |     |- handler.d
  |- Dockerfile
  |- dub.json
```

Modify the source folder as required.

#### NOTE: It is recommended to create your functionality in a separate file and import it into the handler as per the hello.d example. This will allow you to deploy your functions without further modification to the function Dockerfile or the global stack.yml file. You may name your folders as you choose, they need not be called `function` or any specific name to the above example. 

Then either:

- Deploy to local OpenFaaS Cluster ([faasd](https://github.com/openfaas/faasd) or full OpenFaas on localhost Kubernetes):

    ```console 
    faas-cli up -f ./stack.yml
    ```

- Deploy to [production OpenFaaS](https://docs.openfaas.com/deployment/kubernetes/) cluster:

    ```console
    faas-cli up -f ./stack.yml --gateway=https://openfaas.yourdomain.com
    ```
As per the `Dockerfile`, This will pull the `of-watchdog` binary from the official OpenFaas image, create a build container to build your statically linked executable, build the deployment container FROM scratch for you executable, and deploy your function to OpenFaaS.