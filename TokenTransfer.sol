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
