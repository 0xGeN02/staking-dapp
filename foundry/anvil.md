# Anvil Usage Guide

## Introduction

Anvil is a powerful tool for local Ethereum development. This guide will cover the basic usage of Anvil, including starting Anvil with a specific mnemonic, deploying a contract, and retrieving data from the blockchain.

## Starting Anvil with a Specific Mnemonic

To start Anvil with a specific mnemonic, use the following command:

```sh
anvil --mnemonic ${SEED_PHRASE}
```

This will start Anvil and generate accounts based on the provided mnemonic.

## Deploying a Contract with Foundry

To deploy a contract using Foundry, follow these steps:
   Compile your smart contract using Foundry:

```sh
forge build
```

   Deploy the contract using a script:

```sh
forge script ${SCRIPT_PATH} --rpc-url http://localhost:8545 --private-key ${PRIVATE_KEY}
```

## Retrieving Data from the Blockchain

You can interact with your deployed contract and retrieve data using ethers.js. Below is an example using ethers.js:

```javascript
const { ethers } = require("ethers");

async function main() {
    const provider = new ethers.providers.JsonRpcProvider("http://localhost:8545");
    const contractAddress = "your_contract_address_here";
    const abi = [ /* your contract ABI here */ ];
    const contract = new ethers.Contract(contractAddress, abi, provider);

    const data = await contract.yourContractMethod();
    console.log(data);
}

main();
```

## Conclusion

This guide covered the basics of using Anvil for local Ethereum development with Foundry. You learned how to start Anvil with a specific mnemonic, deploy a contract, and retrieve data from the blockchain. For more advanced usage, refer to the Anvil and Foundry documentation.

### Default Anvil

```sh
anvil --mnemonic "test test test test test test test test test test test junk"


                             _   _
                            (_) | |
      __ _   _ __   __   __  _  | |
     / _` | | '_ \  \ \ / / | | | |
    | (_| | | | | |  \ V /  | | | |
     \__,_| |_| |_|   \_/   |_| |_|

    0.3.0 (5a8bd89 2024-12-20T08:46:21.565569027Z)
    https://github.com/foundry-rs/foundry

Available Accounts
==================

(0) 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 (10000.000000000000000000 ETH)
(1) 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 (10000.000000000000000000 ETH)
(2) 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC (10000.000000000000000000 ETH)
(3) 0x90F79bf6EB2c4f870365E785982E1f101E93b906 (10000.000000000000000000 ETH)
(4) 0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65 (10000.000000000000000000 ETH)
(5) 0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc (10000.000000000000000000 ETH)
(6) 0x976EA74026E726554dB657fA54763abd0C3a0aa9 (10000.000000000000000000 ETH)
(7) 0x14dC79964da2C08b23698B3D3cc7Ca32193d9955 (10000.000000000000000000 ETH)
(8) 0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f (10000.000000000000000000 ETH)
(9) 0xa0Ee7A142d267C1f36714E4a8F75612F20a79720 (10000.000000000000000000 ETH)

Private Keys
==================

(0) 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
(1) 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d
(2) 0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a
(3) 0x7c852118294e51e653712a81e05800f419141751be58f605c371e15141b007a6
(4) 0x47e179ec197488593b187f80a00eb0da91f1b9d0b13f8733639f19c30a34926a
(5) 0x8b3a350cf5c34c9194ca85829a2df0ec3153be0318b5e2d3348e872092edffba
(6) 0x92db14e403b83dfe3df233f83dfa3a0d7096f21ca9b0d6d6b8d88b2b4ec1564e
(7) 0x4bbbf85ce3377467afe5d46f804f221813b2bb87f24d81f60f1fcdbf7cbf4356
(8) 0xdbda1821b80551c9d65939329250298aa3472ba22feea921c0cf5d620ea67b97
(9) 0x2a871d0798f97d79848a013d4936a73bf4cc922c825d33c1cf7073dff6d409c6

Wallet
==================
Mnemonic:          test test test test test test test test test test test junk
Derivation path:   m/44'/60'/0'/0/


Chain ID
==================

31337

Base Fee
==================

1000000000

Gas Limit
==================

30000000

Genesis Timestamp
==================

1735477838

Listening on 127.0.0.1:8545
```