# Ethereum Classic Docker

Get started creating Ethereum development and test single and multi-node clusters
rapidly using Docker.

We provide full Ethereum test nodes (using the [Ethereum Classic Go client](https://github.com/ethereumproject/go-ethereum) with all APIs enabled by default.

# Getting started

## 1. Installing

### 1.1. Standalone Ethereum node

#### Prerequisites

Docker Toolbox installed.
> To download and install Docker Toolbox for your environment please
follow [the Docker Toolbox instructions](https://www.docker.com/products/docker-toolbox).

After Docker Toolbox has been installed, create a ```default``` machine to run Docker against.

#### Lets go

To run a single test Ethereum node run the following:

```
$ ./build.sh
```

If using docker-machine you should be able to get to the JSON RPC client by doing:

### 1.2. Ethereum Cluster with netstats monitoring

To run an Ethereum Classic Docker container run the following:

```
$ ./run.sh
```

By default this will create:

* 1 Ethereum Bootstrapped container
* 1 Ethereum container (which connects to the bootstrapped container on launch)

To access the Netstats Web UI:

### 1.3. Test accounts ready for use

As part of the bootstrapping process we bootstrap 10 Ethereum accounts for use
pre-filled with 20 Ether for use in transactions by default.

If you want to change the amount of Ether for those accounts
See ```files/genesis.json```.

## 2. Interact with geth

If you want to start mining or stop mining you need to connect to the node via:
```
docker exec -it ethereumdocker_eth_1 geth attach ipc://root/.ethereum/devchain/geth.ipc
```
Replace ethereumdocker_geth_1 with the container name you wish to connect to.

### 2.1 Use existing DAG

To speed up the process, you can use a pre-generated DAG. All you need to do is add something like this
```
ADD dag/full-R23-0000000000000000 /root/.ethash/full-R23-0000000000000000
```
to the monitored-geth-client Dockerfile.
