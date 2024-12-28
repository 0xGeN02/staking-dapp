// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Script.sol";
import "../src/TestToken.sol";

contract DeployTestToken is Script {
    function run() external {
        vm.startBroadcast();
        new TestToken(1000000); // Deploy with an initial supply of 1,000,000 tokens
        vm.stopBroadcast();
    }
}