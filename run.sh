#!/bin/bash

docker run --name ethereum-testbox \
  -tid -p 40303:30303 -p 9545:8545 cryptochain/ethereum-classic-docker:latest \
  --datadir=/root/.ethereum/devchain \
  --rpc \
  --rpcapi 'db,personal,eth,net,web3' \
  --rpcaddr='0.0.0.0' \
  --rpccorsdomain='*' \
  --networkid=1234 \
  init=/root/files/genesis.json \
  --mine
