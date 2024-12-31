// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import { Test } from "forge-std/Test.sol";
import "../src/TestToken.sol";

contract TestTokenContract is Test {
    TestToken token;
    uint256 public constant INITIAL_SUPPLY = 1e6; // 1,000,000 tokens
    uint256 public constant WEI = 1e18; // 1 ether = 1e18 wei
    uint256 public constant INITIAL_SUPPLY_WEI = INITIAL_SUPPLY * WEI; // 1e24 wei
    uint256 public constant TRANSFER_AMOUNT = 100; // 100 tokens
    uint256 public constant TRANSFER_AMOUNT_WEI = TRANSFER_AMOUNT * WEI; // 1e20 wei
    uint256 public constant APPROVE_AMOUNT = 200; // 200 tokens
    uint256 public constant APPROVE_AMOUNT_WEI = APPROVE_AMOUNT * WEI; // 2e20 wei
    uint256 public constant TRANSFER_FROM_AMOUNT = 150; // 150 tokens
    uint256 public constant TRANSFER_FROM_AMOUNT_WEI = TRANSFER_FROM_AMOUNT * WEI; // 1.5e20 wei
    uint256 public constant REMAINING_ALLOWANCE = APPROVE_AMOUNT - TRANSFER_FROM_AMOUNT; // 50 tokens
    uint256 public constant REMAINING_ALLOWANCE_WEI = REMAINING_ALLOWANCE * WEI; // 0.5e20 wei

    function setUp() public {
        // Deploy the TestToken contract with an initial supply of 1,000,000 tokens (1e24 wei)
        token = new TestToken(INITIAL_SUPPLY); // 1,000,000 tokens
    }

    function testInitialSupply() public {
        // Check that the initial supply is correct (1e24 wei)
        assertEq(token.totalSupply(), INITIAL_SUPPLY_WEI);
    }

    function testBalanceOfOwner() public {
        // Check that the deployer has the initial supply (1e24 wei)
        assertEq(token.balanceOf(address(this)), INITIAL_SUPPLY_WEI);
    }

    function testTransfer() public {
        // Transfer 100 tokens (1e20 wei) to another address
        address recipient = address(0x123);
        token.transfer(recipient, TRANSFER_AMOUNT_WEI);

        // Check that the recipient received the tokens (1e20 wei)
        assertEq(token.balanceOf(recipient), TRANSFER_AMOUNT_WEI);

        // Check that the sender's balance decreased (1e24 - 1e20 wei)
        assertEq(token.balanceOf(address(this)), INITIAL_SUPPLY_WEI - TRANSFER_AMOUNT_WEI);
    }

    function testApproveAndTransferFrom() public {
        // Approve another address to spend 200 tokens (2e20 wei)
        address spender = address(0x456);
        token.approve(spender, APPROVE_AMOUNT_WEI);

        // Check the allowance (2e20 wei)
        assertEq(token.allowance(address(this), spender), APPROVE_AMOUNT_WEI);

        // Use the allowance to transfer 150 tokens (1.5e20 wei)
        vm.prank(spender);
        token.transferFrom(address(this), address(0x789), TRANSFER_FROM_AMOUNT_WEI);

        // Check balances
        assertEq(token.balanceOf(address(0x789)), TRANSFER_FROM_AMOUNT_WEI);
        assertEq(token.balanceOf(address(this)), INITIAL_SUPPLY_WEI - TRANSFER_FROM_AMOUNT_WEI);
        assertEq(token.allowance(address(this), spender), REMAINING_ALLOWANCE_WEI);
    }
}