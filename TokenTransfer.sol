// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenTransfer {
    mapping(address => uint256) public balances;

    constructor() {
        balances[msg.sender] = 1000;
    }

    function transfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient funds");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function balanceOf(address who) public view returns (uint256) {
        return balances[who];
    }
}


2.A – Analyze Bitcoin mining process, wallets & EVM; implement TokenTransfer 
Create TokenTransfer.sol in Remix and compile.

Deploy under “JavaScript VM.” The deployer starts with a balance of 1000.

In Deployed Contracts, enter another account address (e.g. 0xAbC…) and an amount like 200, click transfer.

Click balanceOf for your account and the recipient to see balances updated.
