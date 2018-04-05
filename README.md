GoChain Network Intelligence API
============
[![CircleCI](https://circleci.com/gh/gochain-io/net-intelligence-api/tree/master.svg?style=svg)](https://circleci.com/gh/gochain-io/net-intelligence-api/tree/master)

This is the backend service which runs along with GoChain and tracks the network status, fetches information through JSON-RPC and connects through WebSockets to [netstats](https://github.com/gochain-io/netstats) to feed information. For full install instructions please read the [wiki](https://github.com/ethereum/wiki/wiki/Network-Status).


## Prerequisite
* gochain
* node
* npm
* docker

## Configuration

Configure the app modifying [app.json](/net-intelligence-api/blob/master/app.json).

```json
"env":
	{
		"NODE_ENV"        : "test", // tell the client we're in test environment
		"RPC_HOST"        : "localhost", // gochain JSON-RPC host
		"RPC_PORT"        : "8545", // gochain JSON-RPC port
		"LISTENING_PORT"  : "30303", // gochain listening port (only used for display)
		"INSTANCE_NAME"   : "mynode", // whatever you wish to name your node
		"CONTACT_DETAILS" : "", // add your contact details here if you wish (email/skype)
		"WS_SERVER"       : "wss://testnet-stats.gochain.io", // path to netstats WebSockets api server
		"WS_SECRET"       : "mysecret", // WebSockets api server secret used for login
		"VERBOSITY"       : 2 // Set the verbosity (0 = silent, 1 = error, warn, 2 = error, warn, info, success, 3 = all logs)
	}
```

## Run as Docker Container

Build (optional):

```sh
docker build -t gochain/net-intelligence-api:latest .
```

Run:

```sh
docker run -v <path to app.json>:/home/netintel/app.json gochain/net-intelligence-api:latest
```

*To connect to the localhost rpc of another container, just add: `--net=container:<node_container>`.
